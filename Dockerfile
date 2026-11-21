FROM eclipse-temurin:17-jdk-alpine@sha256:c4ca466f9ff25bdb4d28ff87199655c027d37b00226469e61d53f5fa11aae873

WORKDIR /app
COPY target/*.jar app.jar

FROM alpine:3.24@sha256:f59abe656b692d901e184be3445e084786602108599d2a51d229c0f5a48c71bf
COPY --from=0 /app/app.jar .
CMD ["java", "-jar", "app.jar"]
