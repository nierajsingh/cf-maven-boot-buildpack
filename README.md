Custom CloudFoundry BuildPack to Deploy a Maven Spring Boot App
===============================================================

Deploys a maven spring-boot app like the ones created by Spring Initializer
to CF. The app is compiled on CF by running maven 'in the cloud' rather 
than locally on your own machine.

WARNING: This build pack is highly experimental.

How it Works
============

There are only three bash scripts in this build pack:

  - detect: detects whether project contains a pom.xml in the root folder. Fails otherwise
  - compile: does the following
      - download and unpack JDK
      - download and unpack maven
      - run mvn package on the project
      - create a 'start.sh' script that runs `java -Dserver.port=${VCAP_APP_PORT} -jar <the-jar-maven-built>`
  - release: tells CF to run start.sh

Using This Buildpack
====================

You can add the buildpack URL in your `manfifest.yml` file. For example:

