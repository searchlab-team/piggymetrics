FROM openjdk:8-jre
MAINTAINER Alexander Lukyanchikov <sqshq@sqshq.com>

ADD ./target/notification-service.jar /app/
ADD ./target/classes/cert_config.pem /tmp/
RUN keytool -import -noprompt -trustcacerts -alias springboot -file /tmp/cert_config.pem -keystore /usr/local/openjdk-8/lib/security/cacerts -storepass changeit
ADD ./target/classes/ca_certificate_mongodb.pem /tmp/
ADD ./target/classes/notification-mongodb.p12 /tmp/
RUN keytool -import -noprompt -trustcacerts -alias mongodb_ca -file /tmp/ca_certificate_mongodb.pem  -keystore /usr/local/openjdk-8/lib/security/cacerts -storepass changeit
CMD ["java", "-Xmx200m", "-Djavax.net.ssl.trustStore=/usr/local/openjdk-8/lib/security/cacerts", "-Djavax.net.ssl.trustStorePassword=changeit", "-Djavax.net.ssl.keyStoreType=pkcs12", "-Djavax.net.ssl.keyStore=/tmp/notification-mongodb.p12", "-Djavax.net.ssl.keyStorePassword=piggymetrics", "-jar", "/app/notification-service.jar"]

EXPOSE 8000