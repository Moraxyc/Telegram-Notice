#!/usr/bin/env bash
#由Morax-xyc修改，原作者为英文母语者，已不可考。
#中文化，更改api接口，增加IP地址，增加网络供应商提示，优化优化账户及Token储存逻辑以兼容其余脚本。

source /etc/tgnotice/config

for i in "${TELEGRAMUSERID[@]}"
do
URL="https://api.telegram.org/bot${TOKEN}/sendMessage"
DATE="$(date "+%Y-%m-%d %H:%M:%S")"

if [ -n "$SSH_CLIENT" ]; then
	CLIENT_IP=$(echo $SSH_CLIENT | awk '{print $1}')

	SRV_HOSTNAME=$(hostname -f)
	SRV_IP=$(hostname -I | awk '{print $1}')

        IPCOUNTRY=$(curl -s --request GET "http://ip-api.com/line/${CLIENT_IP}?lang=zh-CN&fields=country")
        IPCITY=$(curl -s --request GET "http://ip-api.com/line/${CLIENT_IP}?lang=zh-CN&fields=city")
        IPREGION=$(curl -s --request GET "http://ip-api.com/line/${CLIENT_IP}?lang=zh-CN&fields=regionName")
        IPSERVICE=$(curl -s --request GET "http://ip-api.com/line/${CLIENT_IP}?lang=zh-CN&fields=isp")

TEXT="*SSH 登录提醒-${SRV_IP}*
  主机: ${SRV_HOSTNAME}
  用户: ${USER}
  时间: ${DATE}
  IP地址: ${CLIENT_IP}
  网络服务商: ${IPSERVICE} 
  位置: ${IPCITY}, ${IPREGION}, ${IPCOUNTRY}"

	curl -s -d "chat_id=$i&text=${TEXT}&disable_web_page_preview=true&parse_mode=markdown" $URL > /dev/null
fi
done
