# 安装指南

## 项目初始化

* 安装 Ruby 依赖（Gems）：`bundle install`
* 安装 Javascript 依赖: `yarn install`
* 初始化配置文件，复制以 `.example` 结尾的文件，并重新命名，新文件名去除 `.example`
  * `config/database.yml`
  * `config/credentials/development.yml.enc`
  * `config/credentials/test.yml.enc`
* 数据库生成：`bin/rails db:setup`
* 数据库迁移（以下任选一种）
  * 方式一：生成迁移：`bin/rails rails_extend:migrations` + 迁移：`bin/rails db:migrate`
  * 方式二：加载数据库 Schema 定义：`bin/rails db:schema:load`

## 项目依赖的配置

配置方法：`bin/rails credentials:edit --environment development`

配置内容：
* mailer: 邮箱，用于发送邮件，推荐使用腾讯企业邮箱，每日 500 封免费额度
* wechat: 微信公众号 Oauth 登陆
