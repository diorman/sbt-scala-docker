FROM java:8

# Install basic packages
RUN apt-get update && apt-get install make

ENV SBT_VERSION 0.13.9

# Install SBT
RUN wget https://bintray.com/artifact/download/sbt/debian/sbt-${SBT_VERSION}.deb
RUN dpkg -i sbt-${SBT_VERSION}.deb
RUN rm sbt-${SBT_VERSION}.deb

ENV SCALA_VERSION 2.11.7

# Hack for forcing SBT to install scala
WORKDIR /tmp/scala
RUN echo "scalaVersion := \"${SCALA_VERSION}\"" > build.sbt
RUN sbt compile

# Remove directory for scala hack
RUN rm -rf /tmp/scala
