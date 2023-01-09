FROM openjdk:8-jre
MAINTAINER Chi Dov <d.chiproeng@gmail.com>

ADD ./target/turbine-stream-service.jar /app/
ADD ./target/classes/cert_config.pem /tmp/
RUN keytool -import -noprompt -trustcacerts -alias springboot -file /tmp/cert_config.pem -keystore /usr/local/openjdk-8/lib/security/cacerts -storepass changeit
ADD ./target/classes/cert_registry.pem /tmp/
RUN keytool -import -noprompt -trustcacerts -alias registry -file /tmp/cert_registry.pem -keystore /usr/local/openjdk-8/lib/security/cacerts -storepass changeit
ADD ./target/classes/cert_monitoring.pem /tmp/
RUN keytool -import -noprompt -trustcacerts -alias monitoring -file /tmp/cert_monitoring.pem -keystore /usr/local/openjdk-8/lib/security/cacerts -storepass changeit
CMD ["java", "-Xmx200m", "-jar", "/app/turbine-stream-service.jar"]

EXPOSE 8989