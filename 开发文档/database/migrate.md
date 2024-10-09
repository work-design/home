# 迁移数据库数据

## 导出
1. pg_dump -Ox dbname -f out.sql
  * -O 不导出 owner
  * -x 不导出 grant

## 导入
1. `psql dbname`
2. `\i ./out.sql`


## 逻辑复制

### 在发布者数据库上

* 创建发布者：`CREATE PUBLICATION pub_name FOR ALL TABLES;`
* 查询：`SELECT * FROM pg_publication;`


### 在订阅者数据库上
* 创建订阅者：

```
CREATE SUBSCRIPTION sub_name CONNECTION 'host=shu.ren port=5432 dbname=sanbao_production user=postgres password=postgres' PUBLICATION pub_name;
```