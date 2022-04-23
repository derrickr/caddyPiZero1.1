#!      /bin/bash

# download the Linux Arm6 caddy file & save as caddy
curl -o caddy "https://caddyserver.com/api/download?os=linux&arch=arm&arm=6&idempotency=83882779422945"

#procedure from: https://caddyserver.com/docs/build#package-support-files-for-custom-builds-for-debianubunturaspbian
sudo dpkg-divert --divert /usr/bin/caddy.default --rename /usr/bin/caddy
sudo mv ./caddy /usr/bin/caddy.custom
sudo update-alternatives --install /usr/bin/caddy caddy /usr/bin/caddy.default 10
sudo update-alternatives --install /usr/bin/caddy caddy /usr/bin/caddy.custom 50

#needs execure permission
sudo chmod +x /usr/bin/caddy.custom

#Ensure /etc/caddy/caddyfile
echo "Ensure /etc/caddy/caddyfile is configured"
sleep 3
#start caddy
echo "Use this to start caddy:    sudo systemctl start caddy"
