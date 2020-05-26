# 部署

## 编译静态资源
由于 webpack 的编译比较消耗资源，在服务端编译很容易引起内存紧张，故在本地编译完成之后上传服务端

* 编译：`env RAILS_ENV=staging rake webpacker:compile`
* 上传编译后的静态文件：`scp -rv public/packs webuser@one.work:/var/www/one_work/shared/public`



## 设置sidekiq

假设用户为 webuser

1. 将用户的服务常驻：`sudo loginctl enable-linger username`；
2. 在 `~/.config/systemd/user` 目录下创建 `sidekiq.service`；
3. 启用 `sidekiq.service`：`systemctl --user enable sidekiq.service`；
4. 使用：`systemctl --user status|start|stop sidekiq`
5. 查看日志：`journalctl -n -f -u sidekiq`

