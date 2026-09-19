FROM eclipse-temurin:25-jdk-alpine@sha256:541729c21f9308a68cebbe5a0627e4cd465dfe8980fc03bac0b2feaee57daafd

WORKDIR /app
COPY target/*.jar app.jar

FROM alpine:3.18
COPY --from=0 /app/app.jar .
CMD ["java", "-jar", "app.jar"]
