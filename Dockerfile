FROM            ubuntu:14.04
MAINTAINER      Allan Lei <allanlei@helveticode.com>

RUN             apt-get update && \
                apt-get install -y mono-fastcgi-server4 && \
                apt-get autoremove -y && \
                apt-get autoclean -y && \
                mkdir /var/www

VOLUME          ["/var/www"]
EXPOSE          8000/tcp
CMD             ["fastcgi-mono-server4", "/printlog=True", "/applications=/:/var/www", "/socket=tcp:0.0.0.0:8000"]