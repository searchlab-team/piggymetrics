FROM openjdk:8-jre
MAINTAINER Alexander Lukyanchikov <sqshq@sqshq.com>

ADD ./target/gateway.jar /app/
ADD ./target/classes/cert_config.pem /tmp/
RUN keytool -import -noprompt -trustcacerts -alias springboot -file /tmp/cert_config.pem -keystore /usr/local/openjdk-8/lib/security/cacerts -storepass changeit
ADD ./target/classes/cert_statistics.pem /tmp/
RUN keytool -import -noprompt -trustcacerts -alias statistics -file /tmp/cert_statistics.pem -keystore /usr/local/openjdk-8/lib/security/cacerts -storepass changeit
ADD ./target/classes/cert_auth.pem /tmp/
RUN keytool -import -noprompt -trustcacerts -alias auth -file /tmp/cert_auth.pem -keystore /usr/local/openjdk-8/lib/security/cacerts -storepass changeit
ADD ./target/classes/cert_account.pem /tmp/
RUN keytool -import -noprompt -trustcacerts -alias account -file /tmp/cert_account.pem -keystore /usr/local/openjdk-8/lib/security/cacerts -storepass changeit
ADD ./target/classes/cert_notification.pem /tmp/
RUN keytool -import -noprompt -trustcacerts -alias notification -file /tmp/cert_notification.pem -keystore /usr/local/openjdk-8/lib/security/cacerts -storepass changeit
ADD ./target/classes/cert_registry.pem /tmp/
RUN keytool -import -noprompt -trustcacerts -alias registry -file /tmp/cert_registry.pem -keystore /usr/local/openjdk-8/lib/security/cacerts -storepass changeit
CMD ["java", "-Xmx200m", "-jar", "/app/gateway.jar"]

EXPOSE 4000