# Docker 指南


## 安装 Docker

以下二选一
* 桌面客户端
  * [docker 桌面客户端](https://www.docker.com/products/docker-desktop)
* 终端
  * `brew install docker`

## 安装 docker compose

* `brew install docker-compose`

## 启动开发环境

* 第一次使用：`docker-compose build`

```bash
docker-compose up
```

注意：数据库实例化数据会被保存到 `.persistence` 目录。如果需要完全恢复初始状态，请删除该目录。

由于映射了整个开发目录到 Docker 中，如果遇到无法启动的问题，建议清空 `tmp` 目录。


## 参考
* [Docker 入门教程（阮一峰）](https://www.ruanyifeng.com/blog/2018/02/docker-tutorial.html)