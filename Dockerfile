FROM maven:3.9.6-eclipse-temurin-22 AS base

COPY --from=maven:3.9.6-eclipse-temurin-8 /opt/java/openjdk /opt/java/openjdk8
COPY --from=maven:3.9.6-eclipse-temurin-11 /opt/java/openjdk /opt/java/openjdk11
COPY --from=maven:3.9.6-eclipse-temurin-17 /opt/java/openjdk /opt/java/openjdk17
COPY --from=maven:3.9.6-eclipse-temurin-21 /opt/java/openjdk /opt/java/openjdk21

env JAVA8_HOME /opt/java/openjdk8
env JAVA11_HOME /opt/java/openjdk11
env JAVA17_HOME /opt/java/openjdk17
env JAVA21_HOME /opt/java/openjdk21
env JAVA22_HOME /opt/java/openjdk

RUN find "$JAVA8_HOME/lib" "$JAVA11_HOME/lib" "$JAVA17_HOME/lib" "$JAVA21_HOME/lib" "$JAVA22_HOME/lib" -name '*.so' -exec dirname '{}' ';' | sort -u > /etc/ld.so.conf.d/docker-openjdk.conf; \
    ldconfig;

COPY toolchains.xml /usr/share/maven/conf/toolchains.xml

CMD ["mvn"]
