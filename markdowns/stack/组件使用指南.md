# engine安装使用指南

假设engine 的名称为 rails_xxx

## 安装gem
将 gem 添加到应用里的 Gemfile 文件中

```ruby
gem 'rails_xxx'
```

然后在应用目录下执行：

```sh
bundle
```

## 运行migration

每个engine里都会有migrate 文件，运行

```sh
rake rails_xxx_engine:install:migrations
```

会将engine里的migrate 文件 复制到应用的 db/migrate 目录下。

## 添加配置文件

所有 Gem 采用Rails内置的 `ActiveSupport::Configurable` 模块，统一配置语法如下：

```ruby
RailsXxx.configure do |config|
  config.admin_controller = 'PanelController'
end
```

通用的配置项有：
* admin_controller
* my_controller
* app_controller


