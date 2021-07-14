# 迁移数据库数据

## 导出
1. pg_dump -Ox dbname -f out.sql
  * -O 不导出 owner
  * -x 不导出 grant

## 导入
1. `psql dbname`
2. `\i ./out.sql`
