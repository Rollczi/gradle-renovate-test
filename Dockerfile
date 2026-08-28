FROM eclipse-temurin:17-jdk-alpine@sha256:0bd5d65efad5c8d9f8d8e6573aa5c8851237550605ff18ff78fee5810c2ebe25

WORKDIR /app
COPY target/*.jar app.jar

FROM alpine:3.24@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b
COPY --from=0 /app/app.jar .
CMD ["java", "-jar", "app.jar"]
