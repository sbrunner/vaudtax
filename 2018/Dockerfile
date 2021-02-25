FROM ubuntu:18.04

RUN apt update 
# libwebkit2gtk-4.0-37
RUN apt install --yes \
  libgtk2.0-0 libgtk-3-0 openjdk-8-jre libwebkitgtk-1.0-0 evince

WORKDIR /app
ADD VaudTax_2018.tar.gz /app/
RUN mv /app/*/* /app
CMD ./vaudtax-2018

RUN adduser vaudtax 
USER vaudtax 