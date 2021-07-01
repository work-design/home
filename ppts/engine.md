---
theme: gaia
class:
- lead
- invert
paginate: true
marp: true
---
# Work Design 技术体系
覃明圆

---
* PPT 使用 markdown 编写
* https://github.com/marp-team

---
# Work Design 开源地址
## https://github.com/work-design

---
# Work Design 的追求

* 降低开发成本
  * 代码量尽可能少
  * 少用库
* 降低开发门槛
  * 技术栈尽可能少
  * 需要开发人员掌握的知识尽可能少
* 提升开发效率
  * 自动化工具（约定优于配置，工具优于约定）

<!--
只有提升开发效率，提升生产力，才能赚更多的钱。
-->

---
# 长桶理论
* 让你的长处足够长，就会忽略掉你的短处

<!--
当马云足够有钱的时候，就觉得马云就很帅
-->

---
# 分而治之
* 微服务：通过 Api 通信，可以是不同的技术栈；
* 模块化：同一套技术栈，Rails Engine：
* 组件化：
  * UI 组件化
  * 业务组件化

---
# 业务组件化
* 业务层面的 DRY
* 在发展中：不断完善、不断成熟
如 RailsAuth 中登陆基于 auth_token，相对于 user_id 更安全和支持更多功能


---
# 如何减少代码量
* DRY(Dont Repeat Yourself)

---
# 业务组件化的追求

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

* 如何 Override

---
## Model
采用 include 架构

---
## 定义模型

```text
rails_auth
  app
    models
      auth
        user.rb
      user.rb
```

---
# 定义 Model 里的方法
```ruby
# rails_auth/app/models/auth/model/user.rb

module Auth
  module Model::Account
  extend ActiveSupport::Concern

    included do
      attribute :identity, :string
      belongs_to :user
    end

    def send_token
      puts 'implement this in main Application'
    end

  end
end
```

---
# 在 Engine 中定义 Model
```ruby
# rails_auth/app/models/auth/account.rb
module Auth
  class Account < ApplicationRecord
    include Model::Account
  end
end
```

---

# 在 Main App 中 Override
```ruby
module Auth
  class Account < ApplicationRecord
    include RailsAuth::Account
    
    attribute :identity, :integer

    def send_token
      SmsHelper.send(self.identity, '666666')
    end
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
# 工具
* 不需要写 Migration：实现了 Django 引以为傲的自动迁移功能
  * 如何使用：`bin/rails g rails_com:migrations`
  * 好处:
    1. 只需要在一个地方定义 model 的属性，顺便干了 annotate 的事
    2. 方便开发，不用 install migrations，可以放心大胆的去调整 Model

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
# Controller

---
# Controller

```ruby
module Auth
  class Admin::UsersController < Admin::BaseController

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
end
```

---
# 软件工程 团队治理
* 全栈技术框架下的：前后端分离
* 写 Model 的 Ruby 程序员
* 写 View 的 程序员

---
# 对 Controller 进行优化
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
# View 层程序员
* local_variables
* 实例变量：instance_variables - _protected_ivars
* 条件判断和循环
* 可使用的 helper 方法：link_to，等常用方法
* Form Builder: default_form

<!--
谁知道怎么获取自定义的实例变量；
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

* viter：https://github.com/qinmingyuan/viter
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
# 为什么推崇 Engine 按照业务组织代码？

* 一定要分：把关联性更大的代码放到一起；
* 当业务复杂，代码快速增长时：
  * 不用 engine：代码全部扔到 models 目录下
  * 用 engine: 不知道去哪找相关的定义的代码

---
# 解决方案

* 使用 RubyMine
  * 看源码的功能
  * 把多个项目放到同一个工作区

---
# Make Rails Great Again!
### 18571856813（微信同号）

# Q & A
