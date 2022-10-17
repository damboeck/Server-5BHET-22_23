FROM openjdk:8-jdk-oracle
MAINTAINER 5bhet.sj22.htlstp.ac.at
COPY target/Server5b22-1.0.jar server.jar
EXPOSE 8080
WORKDIR /
ENTRYPOINT ["java","-jar","server.jar"]