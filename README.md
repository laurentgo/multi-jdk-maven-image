Multi-JDK Apache Maven docker image
===================================


This is a small project to create a Apache Maven docker image based on 
`maven:3.9.6-eclipse-temurin-22` (https://github.com/carlossg/docker-maven)
which embeds the following JDKs:

* Eclipse Temurin 22 (main JDK)
* Eclipse Temurin 21
* Eclipse Temurin 17
* Eclipse Temurin 11
* Eclipse Temurin 8

All JDK home directories are discoverable using the corresponding `JAVAx_HOME`
environment variables where `x` is the Java major version number.
