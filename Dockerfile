FROM eclipse-temurin:21-jre
WORKDIR /app
COPY target/*.jar .
CMD [ "java", "-jar", "jb-hello-world-maven.jar" ]
