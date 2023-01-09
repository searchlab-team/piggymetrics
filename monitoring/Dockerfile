FROM openjdk:8-jre
MAINTAINER Alexander Lukyanchikov <sqshq@sqshq.com>

ADD ./target/monitoring.jar /app/
ADD ./target/classes/cert_config.pem /tmp/
RUN keytool -import -noprompt -trustcacerts -alias springboot -file /tmp/cert_config.pem -keystore /usr/local/openjdk-8/lib/security/cacerts -storepass changeit
ADD ./target/classes/cert_registry.pem /tmp/
RUN keytool -import -noprompt -trustcacerts -alias registry -file /tmp/cert_registry.pem -keystore /usr/local/openjdk-8/lib/security/cacerts -storepass changeit
ADD ./target/classes/cert_turbine.pem /tmp/
RUN keytool -import -noprompt -trustcacerts -alias turbine -file /tmp/cert_turbine.pem -keystore /usr/local/openjdk-8/lib/security/cacerts -storepass changeit
CMD ["java", "-Xmx200m", "-jar", "/app/monitoring.jar"]

EXPOSE 8080