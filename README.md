# BiliTool - B站学习工具

这是一个基于Django开发的B站视频学习管理工具，帮助用户更好地管理和跟踪B站视频的学习进度。

## 功能特性

- 🔍 **视频搜索**：搜索B站视频并添加到学习列表
- 📚 **课程管理**：管理个人学习课程，支持自定义课程名称
- 📊 **学习进度**：跟踪每个视频的学习进度
- 📅 **学习计划**：制定个性化学习计划，设置学习目标
- 📝 **学习记录**：记录每日学习时长和学习备忘
- 🤖 **AI助手**：集成AI助手，提供学习建议和内容分析
- 👤 **用户管理**：用户注册、登录、个人信息管理
- 🎨 **主题切换**：支持明暗主题切换

## 技术栈

- **后端**：Django 4.2+
- **前端**：Bootstrap 5 + jQuery
- **数据库**：MySQL
- **缓存**：Redis（可选）
- **部署**：Nginx + Gunicorn

## 快速开始

### 开发环境

1. 克隆项目
```bash
git clone <repository-url>
cd bilibili-study-tool
```

2. 创建虚拟环境
```bash
python -m venv venv
source venv/bin/activate  # Linux/Mac
# 或
venv\Scripts\activate  # Windows
```

3. 安装依赖
```bash
pip install -r requirements.txt
```

4. 配置环境变量
```bash
cp .env.example .env
# 编辑 .env 文件，配置数据库等信息
```

5. 数据库迁移
```bash
python manage.py migrate
```

6. 创建超级用户
```bash
python manage.py createsuperuser
```

7. 运行开发服务器
```bash
python manage.py runserver
```

### 生产环境部署

详细的生产环境部署指南请参考 [DEPLOYMENT.md](DEPLOYMENT.md)

## 项目结构

```
biliTool/
├── biliTool/                 # Django项目配置
│   ├── settings.py          # 开发环境配置
│   ├── settings_prod.py     # 生产环境配置
│   ├── urls.py              # 主URL配置
│   └── wsgi.py              # WSGI配置
├── bilistudy/               # 主应用
│   ├── models.py            # 数据模型
│   ├── views.py             # 视图函数
│   ├── urls.py              # URL路由
│   ├── admin.py             # 管理后台
│   └── templatetags/        # 自定义模板标签
├── templates/               # 模板文件
│   └── bilistudy/
├── static/                  # 静态文件
│   └── bilistudy/
├── media/                   # 媒体文件
├── requirements.txt         # Python依赖
├── .env.example            # 环境变量示例
├── deploy.sh               # 部署脚本
├── nginx_config.conf       # Nginx配置
├── bilitool.service        # Systemd服务文件
└── DEPLOYMENT.md           # 部署指南
```

## 环境变量配置

项目使用环境变量进行配置，主要变量包括：

- `SECRET_KEY`：Django密钥
- `DEBUG`：调试模式
- `DB_NAME`：数据库名称
- `DB_USER`：数据库用户名
- `DB_PASSWORD`：数据库密码
- `EMAIL_HOST_USER`：邮箱用户名
- `EMAIL_HOST_PASSWORD`：邮箱授权码
- `DOMAIN_NAME`：域名

## 贡献指南

1. Fork 项目
2. 创建功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

## 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情

## 支持

如果您在使用过程中遇到问题，请：

1. 查看 [DEPLOYMENT.md](DEPLOYMENT.md) 部署指南
2. 检查日志文件获取错误信息
3. 在 GitHub Issues 中提交问题

## 更新日志

### v1.0.0
- 初始版本发布
- 基础功能实现
- 用户管理系统
- 学习进度跟踪
- AI助手集成
