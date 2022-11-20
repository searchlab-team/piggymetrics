FROM openjdk:8-jre
MAINTAINER Chi Dov <d.chiproeng@gmail.com>

FROM rabbitmq:3-management
ADD ./ca_certificate.pem /tmp/
ADD ./server_rabbitmq_certificate.pem /tmp/
ADD ./server_rabbitmq_key.pem /tmp/
ADD ./client_rabbitmq_certificate.pem /tmp/
ADD ./client_rabbitmq_key.pem /tmp/
ADD ./rabbitmq.conf /etc/rabbitmq/