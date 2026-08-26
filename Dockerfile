FROM eclipse-temurin:25-jdk-alpine@sha256:09349d79941fd53bb3d487b393ca118d8853c08c09193f416fe6a8718df9e732

WORKDIR /app
COPY target/*.jar app.jar

FROM alpine:3.18
COPY --from=0 /app/app.jar .
CMD ["java", "-jar", "app.jar"]
