# 使用 Systemd 启动对应服务

## 用 systemd 启动 good_job 和 puma 

假设用户为 webuser

1. 将用户的服务常驻：`sudo loginctl enable-linger webuser`
  * 查看用户： `sudo loginctl list-users`
2. 在 `~/.config/systemd/user` 目录下创建 `sidekiq.service`
3. 启用 `sidekiq.service`：`systemctl --user enable sidekiq.service`
  * 这一步将会将 `<name>.service` 文件复制至 `wants` 目录下
  * 如果要移除，执行`systemctl --user disable <name>.service`

4. 使用：`systemctl --user status|start|stop sidekiq`
5. 查看日志：`journalctl -n -f -u sidekiq`

说明：如果 service 文件改变之后，执行：`systemctl --user daemon-reload`