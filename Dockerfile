FROM debian:bookworm-slim
RUN apt-get update &&\
	apt-get upgrade -y &&\
	apt-get install -y locales python3-django apache2 &&\
	locale-gen ja_JP.UTF-8 &&\
	echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc
COPY startup.sh /startup.sh
RUN chmod 744 /startup.sh
CMD ["/startup.sh"]