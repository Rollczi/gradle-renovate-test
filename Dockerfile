FROM eclipse-temurin:17-jdk-alpine@sha256:b455964e5e139d42554cc33981435aec8b6dfa4c1c528bdc5c27973e8b28ca05

WORKDIR /app
COPY target/*.jar app.jar

FROM alpine:3.24@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6
COPY --from=0 /app/app.jar .
CMD ["java", "-jar", "app.jar"]
