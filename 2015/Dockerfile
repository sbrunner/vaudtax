FROM ubuntu:16.04

RUN apt update 
RUN apt install --yes \
  libgtk2.0-0 libgtk-3-0 openjdk-8-jre libwebkitgtk-1.0-0 evince firefox

WORKDIR /app
ADD VaudTax_2015.tar.gz /app/
RUN mv /app/*/* /app
CMD ./vaudtax-2015

ENV MOZILLA_FIVE_HOME=/usr/lib/firefox 

RUN adduser vaudtax 
USER vaudtax 