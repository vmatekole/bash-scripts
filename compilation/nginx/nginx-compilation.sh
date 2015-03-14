#!/bin/bash
apt-get install  -y libpcre3-dev  
apt-get install -y libssl-dev
wget http://nginx.org/download/nginx-1.7.10.tar.gz
wget https://github.com/nbs-system/naxsi/archive/0.54rc0.tar.gz
tar xvzf nginx-1.7.10.tar.gz 
tar xvzf 0.54rc0.tar.gz
cd nginx-1.7.10/
./configure --add-module=../naxsi-0.54rc0/naxsi_src/ \
 --conf-path=/etc/nginx/nginx.conf --add-module=../naxsi-0.54rc0/naxsi_src \
 --error-log-path=/var/log/nginx/error.log --http-client-body-temp-path=/var/lib/nginx/body \
 --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-log-path=/var/log/nginx/access.log \
 --http-proxy-temp-path=/var/lib/nginx/proxy --lock-path=/var/lock/nginx.lock \
 --pid-path=/var/run/nginx.pid --with-http_ssl_module \
 --without-mail_pop3_module --without-mail_smtp_module \
 --without-mail_imap_module --without-http_uwsgi_module \
 --without-http_scgi_module --with-ipv6 --prefix=/usr
make
make install
