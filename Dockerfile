FROM eclipse-temurin:25.0.2_10-jdk-alpine

WORKDIR /app
COPY target/*.jar app.jar

FROM alpine:3.18
COPY --from=0 /app/app.jar .
CMD ["java", "-jar", "app.jar"]
