#!/bin/bash

# 部署脚本 - 用于阿里云服务器部署

echo "开始部署 B站学习工具..."

# 1. 备份当前版本（如果存在）
if [ -d "/var/www/bilitool_backup" ]; then
    rm -rf /var/www/bilitool_backup
fi

if [ -d "/var/www/bilitool" ]; then
    echo "备份当前版本..."
    cp -r /var/www/bilitool /var/www/bilitool_backup
fi

# 2. 创建项目目录
sudo mkdir -p /var/www/bilitool
sudo mkdir -p /var/log/bilitool

# 3. 复制项目文件
echo "复制项目文件..."
sudo cp -r . /var/www/bilitool/

# 4. 设置权限
sudo chown -R www-data:www-data /var/www/bilitool
sudo chmod -R 755 /var/www/bilitool
sudo chown -R www-data:www-data /var/log/bilitool

# 5. 创建虚拟环境
cd /var/www/bilitool
python3 -m venv venv
source venv/bin/activate

# 6. 安装依赖
echo "安装Python依赖..."
pip install -r requirements.txt
pip install gunicorn

# 7. 配置环境变量
if [ ! -f ".env" ]; then
    echo "请配置 .env 文件..."
    cp .env.example .env
    echo "请编辑 /var/www/bilitool/.env 文件，配置正确的环境变量"
    exit 1
fi

# 8. 数据库迁移
echo "执行数据库迁移..."
python manage.py migrate --settings=biliTool.settings_prod

# 9. 收集静态文件
echo "收集静态文件..."
python manage.py collectstatic --noinput --settings=biliTool.settings_prod

# 10. 创建超级用户（可选）
echo "创建超级用户..."
python manage.py createsuperuser --settings=biliTool.settings_prod

echo "部署完成！"
echo "请配置 Nginx 和 Gunicorn 服务"
