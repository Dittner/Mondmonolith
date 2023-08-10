FROM eclipse-temurin:18-jdk-alpine
WORKDIR usr/scr/app
COPY MondmonolithApi/target/*.jar api.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","api.jar"]