# README

## Install Step

* install ui

```
# install
yarn install

# upgrade
yarn upgrade yougexiangfa_ui
```

## 设置sidekiq

假设用户为 webuser

1. 将用户的服务常驻：`sudo loginctl enable-linger username`；
2. 在 `~/.config/systemd/user` 目录下创建 `sidekiq.service`；
3. 启用 `sidekiq.service`：`systemctl --user enable sidekiq.service`；
4. 使用：`systemctl --user status|start|stop sidekiq`
5. 查看日志：`journalctl -n -f -u sidekiq`

