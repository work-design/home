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
    * database_user
    * secret_key_base
3. 非加密个性化配置：`config.x`
4. 新增 engine 后：
  * `bin/rails g rails_com:migrations`
  * 重启 应用


## 前端技术栈
* [技术栈及文档](html.md)
* [配色](color.md)

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
* [内网穿透](frp.md)

### Docker
* [Docker 指南](docker.md)
