FROM debian:bookworm-slim
RUN apt-get update &&\
	apt-get upgrade -y &&\
	apt-get install -y locales python3-pip python3.11-venv apache2 &&\
	locale-gen ja_JP.UTF-8 &&\
	echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc &&\
    python3 -m venv venv &&\
    . venv/bin/activate &&\
    pip install --upgrade pip &&\
    pip install django
CMD ["apachectl", "-D", "FOREGROUND"]