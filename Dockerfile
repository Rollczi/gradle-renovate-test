FROM eclipse-temurin:25-jdk-alpine@sha256:425f0b733cb23843bd78dbe5552513976d0cf12b9722752c48a5161cf5cd2f32

WORKDIR /app
COPY target/*.jar app.jar

FROM alpine:3.18
COPY --from=0 /app/app.jar .
CMD ["java", "-jar", "app.jar"]
