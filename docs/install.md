# README

## 项目初始化

* 安装 ruby gems：`bundle install`;

* 安装 ui: `yarn install`;

* config 目录
  * `cp database.yml.example database.yml`;
  * 获得：`master.key`

* 数据库准备：`bin/rails rails_com:migrations`
* 数据库迁移：`bin/rails db:migrate`


## 设置sidekiq

假设用户为 webuser

1. 将用户的服务常驻：`sudo loginctl enable-linger username`；
2. 在 `~/.config/systemd/user` 目录下创建 `sidekiq.service`；
3. 启用 `sidekiq.service`：`systemctl --user enable sidekiq.service`；
4. 使用：`systemctl --user status|start|stop sidekiq`
5. 查看日志：`journalctl -r -f -u sidekiq`

