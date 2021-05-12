FROM debian:buster

MAINTAINER Ruben van Schaik <rvan-sch@student.codam.nl>

# Installing
RUN apt -y update
RUN apt upgrade -y
RUN apt -y install nginx
RUN apt -y install mariadb-server
RUN apt install -y php php-common php-cli php-fpm php-mysql php7.3-fpm php-mbstring
RUN apt install -y php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip
RUN apt -y install wget
RUN apt install -y unzip

# Make directories
RUN mkdir /var/www/html/wordpress
RUN mkdir /var/www/html/wordpress/phpmyadmin

# Copy all srcs files
COPY /srcs/wp-config.php /var/www/html/wordpress/
COPY /srcs/default /etc/nginx/sites-enabled/
COPY /srcs/wp-config.php .
COPY /srcs/config.inc.php /var/www/html/wordpress/phpmyadmin/
COPY /srcs/switch_index.sh .

# Download phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.4/phpMyAdmin-4.9.4-english.tar.gz
RUN tar -xzf phpMyAdmin-4.9.4-english.tar.gz -C /var/www/html/wordpress/phpmyadmin/ --strip-components=1
COPY /srcs/config.inc.php /var/www/html/wordpress/phpmyadmin/config.inc.php
RUN chown -R www-data:www-data /var/www/*

# Install SSL certifier
RUN wget -O mkcert https://github.com/FiloSottile/mkcert/releases/download/v1.3.0/mkcert-v1.3.0-linux-amd64
RUN chmod +x mkcert
RUN mv mkcert /usr/local/bin
RUN mkcert -install

# Get SSL certificatels
RUN mkcert localhost
RUN mv localhost.pem /etc/nginx/
RUN mv localhost-key.pem /etc/nginx/

# Download wordpress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz --strip-components=1 -C /var/www/html/wordpress/
RUN chown -R www-data:www-data /var/www/* && chmod -R 755 /var/www/*

# Create database wordpress
RUN service mysql start && \
	mysql -u root -e "create user 'ruben'@'localhost' identified by '123412341234';" && \
	mysql -u root -e "CREATE DATABASE wordpress;" && \
	mysql -u root -e "CREATE DATABASE phpmyadmin;" && \
	mysql -u root -e "GRANT ALL PRIVILEGES on *.* to 'ruben'@'localhost';" && \
	mysql -u root -e "FLUSH PRIVILEGES;"

# Create login wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar  && \
	mv wp-cli.phar /usr/local/bin/wp && \
	wp core download --allow-root && \
	service mysql restart && \
	mysql < var/www/html/wordpress/phpmyadmin/sql/create_tables.sql && \
    wp core install --allow-root --url=localhost --title=wordpress_ruben --admin_user=ruben --admin_password=123412341234 \ 
	--admin_email=rvan-sch@student.codam.nl --skip-email
RUN chown -R www-data:www-data /var/www/* && chmod 755 /var/www/html/wordpress
RUN chown -R www-data /var/www/html/wordpress/wp-content

# Change upload space wordpress 
RUN cd /etc/php/7.3/fpm && sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 10M/g' php.ini && \
    sed -i 's/post_max_size = 8M/post_max_size = 20M/g' php.ini

ENV AUTO_INDEX=1

COPY srcs/entrypoint.sh ./entrypoint.sh

RUN chmod +x ./entrypoint.sh

EXPOSE 80 443

ENTRYPOINT "./entrypoint.sh"
