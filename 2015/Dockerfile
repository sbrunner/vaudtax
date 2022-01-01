FROM ubuntu:xenial-20210416

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
  libgtk2.0-0 libgtk-3-0 openjdk-8-jre libwebkitgtk-1.0-0 evince firefox language-pack-fr && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /app
ADD VaudTax_2015.tar.gz /app/
RUN mv /app/*/* /app
COPY run .
WORKDIR /home/vaudtax

ENV LC_ALL=fr_CH.UTF-8 \
  LANG=fr_CH.UTF-8 \
  LANGUAGE=fr_CH

ENTRYPOINT [ "/app/run" ]
CMD [ "/app/vaudtax-2015" ]
