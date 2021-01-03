---
theme: gaia
class:
- lead
- invert
paginate: true
marp: true
---
# Work Design 开发体系
覃明圆

---
* PPT 使用 markdown 编写
* https://github.com/marp-team

---
# 分而治之
* 微服务
* 模块化

---
# Rails Engine（模块化）

* Model
* Controller
* View

---
# 业务组件化
* 业务层面的 DRY
* 更完善、更成熟的业务逻辑
如 RailsAuth 中登陆基于 auth_token，相对于 user_id 更安全和支持更多功能

---
## https://github.com/work-design
* 3年
* 30 个

---
# 如何衡量技术体系的优劣

* 开发成本低
  * 代码量尽可能少
  * 技术栈尽可能少
  * 需要开发人员掌握的知识尽可能少（门槛低）
* 开发效率高
  * 自动化工具

<!--
只有提升开发效率，提升生产力，才能赚更多的钱。
-->

---
# 如何减少代码量
* DRY(Dont Repeat Yourself)

---
# 如何衡量组件的优劣

* 容易 Override
* 容易配置
* 容易迁移：在项目中引入时，尽量避免改动祖传代码
* 容易移除：尽可能减少沉没成本
* 集成简单：安装后即可直接使用
* 尽可能减少 DSL：DSL 即是学习成本

<!--
反面例子 Devise
SimpleForm
ActionAdmin
集成：如路由不必 mount
-->

---
# 业务组件化要面对的主要问题

* 如何覆写 Override

---
## Model

---
## 定义模型

```text
rails_auth
  app
    models
      rails_auth
        user.rb
      user.rb
```

---
# 定义 Model 里的方法
```ruby
# rails_auth/app/models/rails_auth/user.rb

module RailsAuth::Account
  extend ActiveSupport::Concern

  included do
    attribute :identity, :string
    belongs_to :user
  end

  def send_token
    puts 'implement this in project'
  end
end
```

---
# 在 Engine 中定义 Model
```ruby
# rails_auth/app/models/account.rb
class Account < ApplicationRecord
  include RailsAuth::Account
end unless defined? Account
```

---

# 在 Rails 中 Override
```ruby
class Account < ApplicationRecord
  include RailsAuth::Account
  
  attribute :identity, :integer

  def send_token
    SmsHelper.send(self.identity, '666666')
  end
end
```

<!--
易用：什么都不用干，即可使用现成的 Model
易扩展：易 Override
也提供了一种组织大 model 代码的规范
易理解：很容易知道相应的 model 在哪些 engine 里有定义（`Account.ancestors`）
-->

---
# 不需要写 Migration

实现了 Django 引以为傲的 自动迁移功能

---
* 如何使用：`bin/rails g rails_com:migrations`
* 好处:
  * 只需要在一个地方定义 model 的属性，顺便干了 annotate 的事
  * 方便开发，不用 install migrations，可以放心大胆的去调整 Model

---
应用示例

```ruby
class Adminer < ApplicationRecord
  include RailsAuth::User
end
```
```shell
bin/rails g rails_com:migrations
```
---
使用 rails_com:migrations 后

```ruby
class RailsComMigration < ActiveRecord::Migration[6.0]
  def change
    create_table :adminers do |t|
      t.string :name
      t.timestamps
    end
  end
end
```

---
# Controller / View

---
# Controller

```ruby
class Auth::Admin::UsersController < Auth::Admin::BaseController
  def index
    q_params = {}
    q_params.merge! params.permit(:name)

    @users = User.default_where(q_params).page(params[:page])
  end

  def create
    @user = User.new(user_params)
    unless @user.join(params)
      render :new, locals: { model: @user }, status: :unprocessable_entity
    end
  end
end
```

---
# 跟常见的 Controller 有什么区别？
* 没有 redirect_to
* 没有 respond_to
* 几乎没有逻辑

<!--
1. 互动：redirect_to 怎么实现的
2. 在 turbolinks 下是如何实现的
-->

---
## 尽可能将控制能力转移到 View 层

* 模板语言的学习成本更低：erb, jbulder
* View 层 Override 更灵活，更强大
* 极大的减少了 View 层代码量

---
## 尽可能将业务逻辑转移到 Model 层
* 易测试

---
# Write View
* local_variables
* 实例变量：instance_variables - _protected_ivars
* 条件判断和循环
* 可使用的 helper 方法：link_to，等常用方法
* form_build: default_form

<!--
1. 谁知道怎么获取自定义的示例变量；
-->

---

# RailsDoc 即将完成

* 将 controller 的对象 的属性进行输出

---
# Override View
---
# view 查找路径

```ruby
Auth::Panel::UsersController.ancestors

[
  Auth::Panel::UsersController,
  Auth::Panel::BaseController,
  PanelController,
  ApplicationController
]
```

---
```ruby
Auth::Panel::UsersController._prefixes

[
  'auth/panel/users',
  'auth/panel/base', 
  'panel', 
  'application'
]

```
---
```ruby
class Auth::Panel::UsersController < Auth::Panel::BaseController

  def self.local_prefixes
    [controller_path, 'auth/admin/base']
  end
end
```

---
# 我们的改造
* 改造前：
模板文件的正则匹配
依据搜索路径匹配到 模板名 符合要求即渲染
如 html 请求，view 目录下没有 index.html.erb，会渲染 index.jbuilder 
* 改造后：
提升了 format 格式的优先级
匹配到 模板名+ format 才进行渲染

---
# View 提供的默认模板
https://github.com/work-design/rails_com/tree/master/app/views/application

<!--
https://github.com/work-design/rails_com/tree/master/app/views/application
-->

---
# Turbo Stream 示例
```erb
# create.turbo_stream.erb
<%= turbo_stream.prepend 'tbody', partial: 'index_tbody', layout: 'index_tr', locals: { model: instance_variable_get("@#{controller_name.singularize}") } %>
<%= turbo_stream.update 'modal' %>
```
---
# Jbuilder 示例
```ruby
# new.json.jbuider / edit.json.jbuilder
json.error model.errors.as_json(full_messages: true)
json.message model.error_text
```
---
# 常规只涉及到增删改查
```ruby
# html 
_filter_form.html.erb  # 搜索
_form.html.erb  # 表单
_new_form.html.erb
_edit_form.html.erb
_index_thead.html.erb
_index_table.html.erb
_show_table.html.erb
index.html.erb
```
---
# Override Controller
---
# 重新定义路由
* override url
* override helper 方法

<!--
1. 直白的说明白路由是干嘛的；
-->
---
```ruby
Rails.application.routes.draw do
  scope :my, module: 'agency/my', as: :my do
    resources :agencies
  end
end
```
---

```ruby
# In Project
Rails.application.routes.draw do
  scope :my, module: 'my', as: :my do
    resources :agencies, only: [] do
      collection do
        get :search
      end
    end
  end
end
```

---
# Assets

* webpacker 支持 Engine
* js / css: 

```
# app/views/auth/panel/users
panel.html.erb
panel.js
```

---
# Override Assets
项目中同路径

---
# Override I18n

* 项目中同路径
* enum 支持

---

# Q & A

---

# Rails Engine 为什么不用 namespace 隔离

* 意义：
  * 可以从各个层次，各个姿势进行复用
  * 懒：不用每个 model 都带 namespace
* 解决：
  * 路由 _path / _url helper 方法冲突，忍忍吧，override一下
  * model 冲突，已解决，自己定义model, engine里自动失效
  * controller 已有 namespace，不会冲突
---
# 代码分布在各个 engine 里，是否加大了读代码的难度；

---

* 用 engine:
我不知道去哪找相关的定义的代码

* 不用 engine:
如果一个 model 进行了拆分，你可能也不知道去哪读代码

--- 
# 解决方案

* 使用 RubyMine
  * 看源码的功能
  * 把多个项目放到同一个工作区

---
# 入坑指南

* 三无产品！
  * 无测试
  * 无文档
  * 无备注

## 这是我们接下来的工作重点
