FROM ubuntu:12.04

RUN apt-get update 
RUN apt-get install --yes \
  libgtk2.0-0 libgtk-3-0 openjdk-7-jre libwebkitgtk-1.0-0 evince firefox unzip

WORKDIR /app
ADD VaudTax_2012.tar.gz /app/
RUN mv /app/*/* /app
CMD ./vaudtax-2012

RUN adduser vaudtax 
USER vaudtax 