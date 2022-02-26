# Telegram-Notice

这是Telegram上一个专用于通知的BOT，没有设置响应交互功能。

现阶段只有SSH Login 的提醒。仅需配置好通知BOT的token及对应的TELEGRAMUSERID即可。

# 安装方式

## SSH Login Notice

下载脚本后，在[@userinfobot](t.me/userinfobot)处得知账户id，填入脚本`TELEGRAMUSERID`后的双引号内。再在[@BotFather](t.me/botfather)处根据提示注册BOT，获取BOT Token，形如`1234567890:AJZIBSHXJNSHXBISSBBDIJDHDJS`，填入脚本`TOKEN`处。

将填完信息的sh脚本放入`etc/profile.d`目录下，即可实现登录自动提醒。

# 实现方式

## SSH Login Notice

将脚本文件放置于`etc/profile.d`下，每次用户登录时，与目录高度耦合的`etc/profile`文件都将
自动执行目录下shell

# Features

## SSH Login Notice

服务器SSH登录时通过telegram bot通知用户

# To Do List

- [x] SSH Login Notice
- [ ] Manage 一键管理脚本，图形化配置，无需手动操作
- [ ] 定时自定义内容提醒
- [ ] 网站守护 - 检测网站可访问性
- [ ] 进程守护 - 检测服务器进程运行状态
