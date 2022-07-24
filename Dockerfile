FROM debian:bullseye-slim
MAINTAINER Christian Raoulis "CRaoulis@gmail.com"
WORKDIR /home/container
CMD ["adduser","--disabled-password","--home /home/containter containter"]
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install git nodejs npm -y
USER container
ENV USER=containter HOME=/home/container
RUN git clone https://github.com/Davoleo/curse-updates.git

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]