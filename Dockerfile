FROM eclipse-temurin:17-jdk-alpine@sha256:83bb7084d2cdfa954fc34616f91cf971012e2a50d6cfd1edacad06f2e1fff496

WORKDIR /app
COPY target/*.jar app.jar

FROM alpine:3.24@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6
COPY --from=0 /app/app.jar .
CMD ["java", "-jar", "app.jar"]
