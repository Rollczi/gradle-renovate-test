FROM eclipse-temurin:17-jdk-alpine@sha256:efefbce46b0d79073a3a676d91ac6c4bf370d348af18e388bbf7482543d7866a

WORKDIR /app
COPY target/*.jar app.jar

FROM alpine:3.24@sha256:3f4d6b32e26703c6082839234f43769d5046b3ac7c910033911d1e71d8cd630a
COPY --from=0 /app/app.jar .
CMD ["java", "-jar", "app.jar"]
