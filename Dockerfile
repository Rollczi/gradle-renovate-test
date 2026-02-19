FROM eclipse-temurin:17.0.18_8-jdk-alpine

WORKDIR /app
COPY target/*.jar app.jar

FROM alpine:3.23
COPY --from=0 /app/app.jar .
CMD ["java", "-jar", "app.jar"]
