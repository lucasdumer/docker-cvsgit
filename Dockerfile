FROM dockette/php:5.6

WORKDIR lib

RUN apt-get update && \
    apt-get install -y cvs && \
    apt-get install -y git && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer 

RUN git clone https://github.com/cvsgit/php-client.git cvsgit && \
    cd cvsgit && \
    composer install && \
    ln -f -s $(realpath bin/cvsgit) /usr/local/bin/

ENTRYPOINT ["/bin/bash"]
