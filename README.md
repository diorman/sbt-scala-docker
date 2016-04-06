# sbt-scala-docker

Base docker image to work with sbt and scala

## How to use

### Build a sbt project

Run from the directory containing your `build.sbt`

    docker run --name sbt  -v $(pwd):/tmp/scala/ diorman/sbt-scala-docker sbt package


### Interactive console

    docker run --name sbt-console -it diorman/sbt-scala-docker sbt console