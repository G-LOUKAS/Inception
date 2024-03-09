#!/bin/bash
# create a self-signed certificate
openssl req -x509 -nodes -out $CERT_PATH -keyout $KEY_PATH -subj "/"
echo "server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name $WP_URL;

    ssl_certificate $CERT_PATH;
    ssl_certificate_key $KEY_PATH;

    ssl_protocols TLSv1.2 TLSv1.3;

    
    ">/etc/nginx/sites-available/default

echo 'index index.php;
      root /var/www/html;
    
    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass wordpress:9000;
    }
}'>>/etc/nginx/sites-available/default

# start nginx server in the foreground 
nginx -g "daemon off;"