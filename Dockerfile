FROM ubuntu:latest
MAINTAINER Mahrach Mahrach, Mohammed <mmahrach@outlook.com>

# retrieves information about what packages can be installed, including currently packages are available, from Internet sources.
RUN apt-get update
RUN apt-get upgrade -y

# Install packages (apache2, PHP, php-mysql, supervisor, ..)
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install \
	apache2 \
	libapache2-mod-php \
	php-mcrypt \
	php-intl \
	php-mbstring \
	php-zip \
	php-mysql \
  curl \
  supervisor

# Download and install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# This command downloads the Slim Framework and its third-party dependencies into my project’s vendor/ directory.
RUN cd /var/www/html && composer require slim/slim "^3.0"

RUN rm -rf /var/www/html/index.html

# Enable Apache modules
RUN a2enmod rewrite

# Copy files from host into the container
ADD files/.htaccess /var/www/html/.htaccess
ADD files/index.php /var/www/html/index.php
ADD files/slim-apache.conf /etc/apache2/sites-available/000-default.conf
# supervisor.conf (Run multiple services in a container)
ADD files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# private and public mapping
#EXPOSE 80:8080

# private only
EXPOSE 80
# Start supervisord when running the container
CMD ["/usr/bin/supervisord"]
