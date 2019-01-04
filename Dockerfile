FROM php:5.6

RUN apt-get update && \
    apt-get install -y git && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer

RUN git clone https://github.com/cvsgit/php-client.git cvsgit && \
    cd cvsgit && \
    composer install && \
    ln -f -s $(realpath bin/cvsgit) /usr/local/bin/

RUN apt-get install cvs 

ENTRYPOINT ["/bin/bash"]
