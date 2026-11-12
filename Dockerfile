FROM eclipse-temurin:17-jdk-alpine@sha256:efefbce46b0d79073a3a676d91ac6c4bf370d348af18e388bbf7482543d7866a

WORKDIR /app
COPY target/*.jar app.jar

FROM alpine:3.24@sha256:f59abe656b692d901e184be3445e084786602108599d2a51d229c0f5a48c71bf
COPY --from=0 /app/app.jar .
CMD ["java", "-jar", "app.jar"]
