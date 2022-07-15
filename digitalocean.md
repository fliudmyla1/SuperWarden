
# It would be Faster if you change node version on digital ocean. STONE HEAD
baseURL: "http://164.92.118.10"
64.227.108.139
* you can ask your client for what you can't to post but you can actually and Retrive money more.
## deploying node.js app
sudo apt install nodejs
https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04  (node install with version)

sudo apt-get install npm
sudo npm install -g pm2

/var/www/digitalocean
	rm -rf digitalocean
	cd digitalocean
	ls



https://ipfs.io/images/meet-builders-thumbnail-pinata.png


git clone https://github.com/fliudmyla1/digitalocean.git
git pull https://github.com/fliudmyla1/digitalocean.git

pm2 start server.js
pm2 stop server.js
pm2 startup


curl http://localhost:5000

## setting for ngix

sudo apt update
sudo apt install nginx
systemctl status nginx
nano /etc/nginx/sites-available/default




server {
	listen 80 default_server;
	listen [::]:80 default_server;

...
    location /app2 {
        proxy_pass http://localhost:3001;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
...
}

sudo nginx -t
sudo systemctl restart nginx

## db uri
mongodb+srv://doadmin:yh631728AJQZS9I5@superwarden-db-00429b97.mongo.ondigitalocean.com/admin?tls=true&authSource=admin

username = doadmin
password = yh631728AJQZS9I5 hide
host = mongodb+srv://private-superwarden-db-46e4b03f.mongo.ondigitalocean.com
database = admin









location /download {
        proxy_pass http://localhost:5000;
    }



curl -is localhost:80




server {
	listen 80;
	listen [::]:80;
	server_name reallycrypto.com www.reallycrypto.com;
	return 301 https://$host$request_uri;
}

// seting https

sudo ufw enable
sudo ufw allow 'Nginx Full'
sudo ufw status

sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt install python3-certbot-nginx
sudo certbot --nginx -d superwarden.org -d www.superwarden.org

sudo certbot renew --dry-run


	# listen 443 ssl default_server;
	# listen [::]:443 ssl default_server;


server {
	listen 443 ssl;
	listen [::]:443 ssl;

	root /home/reallycrypto.com/public;

	index index.html;

	server_name reallycrypto.com www.reallycrypto.com;

	location / {
		proxy_http_version 1.1;
		proxy_cache_bypass $http_upgrade;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection 'upgrade';
		proxy_set_header Host $host;
	
		proxy_pass http://localhost:3000;
	}

	ssl on;
	ssl_certificate /etc/letsencrypt/live/reallycrypto.com/fullchain.pem; # managed by Certbot;
	ssl_certificate_key /etc/letsencrypt/live/reallycrypto.com/privkey.pem; # managed by Certbot;
}