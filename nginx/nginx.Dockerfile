#--------------------------------------------------------
# My Dockerfile: build Docker Image Nginx v.1
#--------------------------------------------------------
 
# Базовая платформа для запуска Nginx
FROM ubuntu:22.04
 
# Стандартный апдейт репозитория
RUN apt-get -y update
# Установка Nginx
RUN apt-get install -y nginx
 
# Указываем Nginx запускаться на переднем плане (daemon off)
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
# Копируем конфигурацию nginx
COPY sites.conf /etc/nginx/conf.d/sites.conf 
# Копируем папку с сайтами
COPY sites/ /usr/share/nginx/html
# Копируем кастомный index.html
COPY my_index.html /usr/share/nginx/html/index.html
# Запускаем Nginx. CMD указывает, какую команду необходимо запустить, когда контейнер запущен.
CMD [ "nginx" ]

