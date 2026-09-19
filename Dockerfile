FROM eclipse-temurin:17-jdk-alpine@sha256:27914526e62114707ca237c837bfda43277f182934db5c484281894163101c2c

WORKDIR /app
COPY target/*.jar app.jar

FROM alpine:3.24@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6
COPY --from=0 /app/app.jar .
CMD ["java", "-jar", "app.jar"]
