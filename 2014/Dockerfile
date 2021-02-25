FROM ubuntu:14.04

RUN apt update 
RUN apt install --yes \
  libgtk2.0-0 libgtk-3-0 openjdk-7-jre libwebkitgtk-1.0-0 evince firefox

WORKDIR /app
ADD VaudTax_2014.tar.gz /app/
RUN mv /app/*/* /app
CMD ./vaudtax-2014

ENV MOZILLA_FIVE_HOME=/usr/lib/firefox 

RUN adduser vaudtax 
USER vaudtax 