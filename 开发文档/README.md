# 开发文档

## 开发准备
1. Git clone 当前项目
  * `git clone git@github.com:work-design/dummy.git`
2. 完成 clone 后，进入项目目录
  * 初始化子模块：`git submodule update --init`
  * 将子模块的分支切换至 main 分支：`git submodule foreach git checkout main`
2. 安装依赖：
  * 安装 Ruby Gems: `bundle`
  * 安装前端依赖：`npm install`
3. 个性化配置：
  * 修改 development 配置文件：`bin/rails credentials:edit -e development`
  * 设置选项：

```
secret_key_base: 128位字符
database_user:
database_password:
active_record_encryption:
  primary_key: 32位字符
  deterministic_key: 32位字符
  key_derivation_salt: 32位字符
```

系统提供了快速生成密钥的命令：`bin/secret`, 默认为 32 位字符，如需指定字符位数，将位数作为参数传入即可：`bin/secret 128`

4. 初始化数据库



## Rails 服务器（Linux）部署

### 安装环境

#### MacOS
* [环境准备](mac/env.md)

#### Linux
* [用户](linux/user.md)
* [安装软件](linux/env.md)

### 部署
* [部署](deploy.md)
* [SSH 相关配置](ssh.md)

### 其他
* [内网穿透](frp.md)：用于本地开发，将集成服务的请求转发至开发机器用作调试

### Docker
* [Docker 指南](docker.md)

## 前端技术栈
* [技术栈及文档](html.md)
* [配色](color.md)
