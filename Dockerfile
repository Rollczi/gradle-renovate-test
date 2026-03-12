FROM eclipse-temurin:25.0.2_10-jdk-alpine@sha256:da683f4f02f9427597d8fa162b73b8222fe08596dcebaf23e4399576ff8b037e

WORKDIR /app
COPY target/*.jar app.jar

FROM alpine:3.18
COPY --from=0 /app/app.jar .
CMD ["java", "-jar", "app.jar"]
