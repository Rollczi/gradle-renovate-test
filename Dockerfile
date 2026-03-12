FROM eclipse-temurin:17.0.18_8-jdk-alpine@sha256:903e865ecd125a01759fd156d042b998aa86957262f6dec4745125a47bd4f882

WORKDIR /app
COPY target/*.jar app.jar

FROM alpine:3.23@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659
COPY --from=0 /app/app.jar .
CMD ["java", "-jar", "app.jar"]
