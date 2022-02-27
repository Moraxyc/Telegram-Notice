# Telegram-Notice

这是Telegram上一个专用于通知的BOT，没有设置响应交互功能。

现阶段只有SSH Login 的提醒。仅需配置好通知BOT的token及对应的用户ID即可轻松使用。

# 安装方式

## SSH Login Notice

Telegram user id 可以在[@userinfobot](https://t.me/userinfobot)获取

[@BotFather](https://t.me/botfather)处根据提示注册BOT,获取BOT Token，形如`1234567890:AJZIBSHXJNSHXBISSBBDIJDHDJS`

将下方代码框内的`<bot token>`替换为机器人token。

将`<telegram user id>`替换为个人账号ID。

``` bash
wget -P /etc/profile.d https://raw.githubusercontent.com/Morax-xyc/Telegram-Notice/main/ssh_login.sh
mkdir /etc/tgnotice
cat > /etc/tgnotice/config <<EOF
TOKEN=<bot token>
TELEGRAMUSERID=<telegram user id>
EOF 
```

# 实现方式

## SSH Login Notice

将脚本文件放置于`etc/profile.d`下，每次用户登录时，与目录耦合的`etc/profile`文件都将自动执行目录下shell

# Features

## SSH Login Notice

服务器SSH登录时通过telegram bot通知用户

# To Do List

- [x] SSH Login Notice
- [ ] Manage 一键管理脚本，图形化配置，无需手动操作，体验一键梭哈的感觉
- [ ] 定时自定义内容提醒
- [ ] 网站守护 - 定时检测网站可访问性，若失联则立刻提醒
- [ ] 进程守护 - 定时检测服务器进程运行状态，若发生error立刻提醒
