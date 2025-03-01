# 使用官方 Nginx 镜像
FROM nginx:alpine

# 安装 envsubst 工具
RUN apk add --no-cache gettext

# 复制 Nginx 配置模板
COPY nginx.conf.template /etc/nginx/nginx.conf.template

# 启动脚本：替换环境变量并启动 Nginx
CMD envsubst '${TARGET_HOST} ${TARGET_PORT}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'
