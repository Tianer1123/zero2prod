#!/usr/bin/env bash
set -x
set -eo pipefail

# 检查是否设置自定义数据库名。如果未设置，则默认是“postgres”
DB_NAME=${POSTGRES_DB:=postgres}
# 检查是否设置自定义密码。如果未设置，则默认是“password”
DB_PASSWORD="${POSTGRES_PASSWORD:=password}"
# 检查是否设置自定义数据库名称。如果未设置，则默认是“newsletter”
DB_NAME=${POSTGRES_USER:=newsletter}
# 检查是否设置自定义端口。如果未设置，则默认是“5432”
DB_PORT=${POSTGRES_PORT:=5432}


# 使用docker启动Postgres
docker run \
    -e POSTGRES_USER=${DB_USER} \
    -e POSTGRES_PASSWORD=${DB_PASSWORD} \
    -e POSTGRES_DB=${DB_NAME} \
    -p "${DB_PORT}":5432 \
    -d postgres \
    postgres -N 1000

# ^ 为了进行测试增加了最大连接数的限制