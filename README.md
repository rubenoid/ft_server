# ft_server
 This server will run multiples services: Wordpress, phpMyAdmin, and a SQL database.

## How to run
with autoindexing:

`docker run -it -p 80:80 -p 443:443 [name]`

for autoindexing off, compile with `-e AUTO_INDEX=0`

(Container can only be run in interactive mode)

## Subject
- You can’t use docker-compose.
- You must set up a web server with Nginx, in only one docker container. The
container OS must be debian buster.
- Your web server must be able to run several services at the same time. The services
will be a WordPress website, phpMyAdmin and MySQL. You will need to make
sure your SQL database works with the WordPress and phpMyAdmin.
- Your server should be able to use the SSL protocol.
- You will have to make sure that, depending on the url, your server redirects to the
correct website.
- You will also need to make sure your server is running with an autoindex that must
be able to be disabled.
