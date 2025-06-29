FROM debian:bookworm-slim
RUN apt-get update &&\
	apt-get upgrade -y &&\
	apt-get install -y locales python3-django apache2 &&\
	locale-gen ja_JP.UTF-8 &&\
	echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc
RUN apt-get install -y python3-pip
RUN apt-get install -y apache2-dev
RUN apt-get install -y libapache2-mod-wsgi-py3
RUN apt-get install -y rsyslog
COPY startup.sh /startup.sh
RUN chmod 744 /startup.sh
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
WORKDIR /var/log/apache2
CMD ["/startup.sh"]