# SSH 相关设置

### 通过ssh连接至服务器

- 将你本机`~/.ssh/id_rsa.pub`文件添加到服务器`~/.ssh/authorized_keys`

### 设置ssh代理连接, 即让服务器可以通过ssh连接以你的ssh配置使用git等服务

- 配置本机ssh, 配置文件为 `~/.ssh/config`, 如果没有则新建这个文件, 配置内容如下;

```
Host 123.123.123.123 114.114.114.114
  ForwardAgent yes
```

其中, Host是你允许使用你本机ssh连接的服务器,如果有多个,用空格隔开

* 确保你本机的 ssh-agent服务已经启动

```bash
echo $SSH_AUTH_SOCK
```

* 允许 ssh-agent 使用你的ssh key

```bash
ssh-add ~/.ssh/id_rsa # 临时, 在mac中, 重启之后就失效了
ssh-add -K ~/.ssh/id_rsa # 永久, for mac
ssh-add -l # 检测是否添加成功
```

### 远程服务器, test

* 登陆到服务器, 测试ssh连接, 这一步很重要,否则将无法正常使用ssh agent，这步将会将你测试的地址添加到服务器的 known_hosts 文件中

```bash
ssh -T git@github.com
```

#### 参考资料

[SSH agent forward](https://developer.github.com/guides/using-ssh-agent-forwarding/)
