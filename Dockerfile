FROM eclipse-temurin:17-jdk-alpine@sha256:5a7fe9fcd65085bbf218a4060f08f1346b8bfd13d9f9942e2db6719cc8a11e22

WORKDIR /app
COPY target/*.jar app.jar

FROM alpine:3.24@sha256:be2656061b536c1883c4034790e21d0a09c5aaaf51968b89368a3c0371ea2c9a
COPY --from=0 /app/app.jar .
CMD ["java", "-jar", "app.jar"]
