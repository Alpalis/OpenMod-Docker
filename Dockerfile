FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt update
RUN apt upgrade -y
RUN apt install -y curl wget jq screen htop unzip lib32gcc1 tzdata lib32stdc++6 libc6 libgdiplus libgl1-mesa-glx libxcursor1 libxrandr2 libc6-dev libgcc-4.8-dev 
RUN useradd -d /home/container -m container

ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN dpkg-reconfigure --frontend noninteractive tzdata

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]