FROM java:8-alpine

# Install basic packages
RUN apk add --update bash && rm -rf /var/cache/apk/*

ENV SBT_VERSION 0.13.11

# Install SBT
WORKDIR /opt/
ADD https://dl.bintray.com/sbt/native-packages/sbt/${SBT_VERSION}/sbt-${SBT_VERSION}.tgz .
RUN tar xvfz sbt-${SBT_VERSION}.tgz && rm  sbt-${SBT_VERSION}.tgz
RUN ln -s /opt/sbt/bin/sbt /usr/bin/

ENV SCALA_VERSION 2.11.8

# Hack for forcing SBT to install scala
WORKDIR /tmp/scala
RUN echo "scalaVersion := \"${SCALA_VERSION}\"" > build.sbt
RUN sbt compile

# Remove directory for scala hack
RUN rm -rf /tmp/scala
