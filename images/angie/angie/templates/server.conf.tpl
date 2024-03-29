upstream php-upstream {
	server ${FASTCGI_PASS};
}

server {
	listen 80;
	listen 8080;
	return 301 https://$host$request_uri; # 301 -> 308 after accepted
}

server {
	server_name _;
	listen 8000;
	listen 443 ssl;

	include conf.d/ssl.conf;

	root /app/public;
	index  index.php;

	error_log /var/log/angie/error.log;
	access_log /var/log/angie/access.log;

	include conf.d/locations.conf;
}
