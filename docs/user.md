# linux 用户

当 linux 初始化之后为 root 用户的时候，以 root 用户登录后先初始化普通用户。

## 用户

### 新建用户
```bash
# 新建一个用户
useradd -m webuser

# 设置密码
passwd webuser
```

### 将用户放到sudoers列表

编辑文件 `/etc/sudoers` 文件, 增加`webuser ALL=(ALL:ALL) ALL`

### 设置 ssh 登录

复制你的公玥（通常位于本机：`.ssh/id_rsa.pub`），添加至服务器 `.ssh/authorized_keys`
