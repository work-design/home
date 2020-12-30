---
title: Rails 应用模块化之 Rails Engines
category: about
layout: post
---


## 关于Rails Engine

Rails Engine 是来自于官方 Rails 应用模块化的最佳方案。
* [了解Rails Engine](https://guides.rubyonrails.org/engines.html)

## 业务分块
Engine 是对业务强相关的代码的一个组织。

## 统一UI
传统的模块化，大都只涉及Model层功能，主要是因为UI很难满足使用群体（程序员）群体的个性化需求。不过我们的目的是提供一套现成的方案，从而尽可能降低门槛和成本。至于现有的UI，能满足需求的话就用即可，如果不能满足需求，也可以很方便的取override。

UI统一采用[Fomantic-UI](https://github.com/fomantic/Fomantic-UI)，Fomantic-UI 是[Semantic-UI](https://github.com/Semantic-Org/Semantic-UI)的社区版本。
  
## 如何使用
1. engines 提供了大量的针对Model层和Controller层的通用方法，我们尽可能采用Ruby中的 include(prepend)/extend 方式去引用。
  * include: 实例方法
  * prepend: 实例方法
  * extend: 类方法

  * 针对model和controller 提供的module, 统一放在各个应用 concerns 文件夹下面；

  如`rails_auth`中在module `RailsAuth::User` 提供了针对User的鉴权方法，使用时，在User模型中include即可。

```ruby
class User < ApplicationRecord
  include RailsAuth::User
end
```

2. engines 预定义了大量model, 直接使用model看上去没有 include module 的方案灵活，实则不然。
  * ruby中对于预先定义过的class, 可直接使用class 关键字打开类，打开类的时候注意，继承的父类须保持一致, 或者省略继承。我们所提供的预定义的model,都是继承于类`ApplicationRecord`。
  * 在开发环境下(cache_classes设置为false)，应用里定义的model 会默认优先于 engines 里的 model加载，需要在model定义之前 require engine里的model, 这并非副作用，可认为相当于使用 include 引入实例方法;
    
  ```ruby
  # 假设在engine the_trade 已定义 order model
  
  class Order < ApplicationRecord
    include RailsTrade::Order
  end
  ```

当在应用里定义了跟engine里已存在的同名的Model，则engine里的定义会自动失效。

以model User为例，这个模型实际我们已经在 RailsAuth 这个Engine中预定义了，不过预定义的代码非常简单。
```ruby
class User < ApplicationRecord
  include RailsAuth::User
end unless defined? User
```

这个定义做了两件事：
1. include 当前engine 中定义的模型相关代码；
2. `unless defined?`判断如果该 Model 在应用中已定义，这些代码则不会生效。

对于一些常用的模型，比如`User`, 我们会在多个 engine 中定义相关功能，所以我们在应用里定义一个 User 模型，把所用到的Engine里User相关模块 include 进来即可。如下例：

```ruby
class User < IneeRecord
  include RailsRole::User
  include RailsAuth::User
  include RailsTrade::User
  include RailsNotice::Receiver
  include RailsOrg::User
  include RailsProfile::User
  include RailsTutela::User

  attribute :timezone, :string, default: 'Beijing'
```

include 的顺序也决定了方法继承的逻辑，可以做到很灵活的进行override。


3. Engines里的代码可以从各个层面去override;
  * model 层： 无论是include进来的module中的方法，还是重新打开类，定义同名方法即可，区别是include module引入的方法可以通过super去调用，而打开类只是被覆盖；
  * view 层： 以同样的路径覆盖位于engine中的文件即可。
  * controller/routes 层：在routes定义同路径路由覆盖; 

