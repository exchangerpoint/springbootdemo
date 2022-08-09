FROM openjdk:8-jdk-alpine
ADD ./target/spring-boot-complete-0.0.1-SNAPSHOT.jar spring-boot-complete-0.0.1-SNAPSHOT.jar: 
ENTRYPOINT ["java","-jar","/spring-boot-complete-0.0.1-SNAPSHOT.jar"]
