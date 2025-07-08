# 使用官方 PHP 镜像
FROM php:8.2-apache

# 设置工作目录
WORKDIR /var/www/html

# 复制项目文件到容器中
COPY . .

# 启用 Apache 的 mod_rewrite 模块
RUN a2enmod rewrite \
    && sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# 设置保存目录的权限
RUN chmod -R 777 _tmp

# 暴露端口
EXPOSE 80
