if [ $AUTO_INDEX -eq 0 ]
then
	sed -i '/autoindex/c autoindex off;' /etc/nginx/sites-enabled/default;
else
	echo "AUTO_INDEX is set automaticaly set to on, turn off with -e AUTO_INDEX=0";
fi

echo AUTO_INDEX="$AUTO_INDEX";

service nginx start;
service php7.3-fpm start;
service mysql start;
bash

