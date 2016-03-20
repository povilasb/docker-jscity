FROM node:5.9.0-slim

MAINTAINER Povilas Balciunas <balciunas90@gmail.com>

RUN bash -c "debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'"
RUN bash -c "debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'"

RUN apt-get update -qy
RUN apt-get install -y git mysql-server-5.5 mysql-client-5.5 supervisor

RUN git clone https://github.com/aserg-ufmg/JSCity.git /opt/jscity

RUN /etc/init.d/mysql start && \
	mysql --user=root --password=root < /opt/jscity/sql/schema.sql && \
	echo "create user 'jscity'@'localhost'; \
		grant all privileges on jscity.* to 'jscity'@'localhost';" | \
	mysql --user=root --password=root

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD /usr/bin/supervisord
