FROM debian:bullseye-slim
MAINTAINER Christian Raoulis "CRaoulis@gmail.com"

RUN useradd -ms /bin/bash container
USER container
WORKDIR /home/container
ENV USER=containter HOME=/home/container

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install git nodejs npm -y

RUN git clone https://github.com/Davoleo/curse-updates.git

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]