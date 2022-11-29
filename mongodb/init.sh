#!/bin/bash
if test -z "$MONGODB_PASSWORD"; then
    echo "MONGODB_PASSWORD not defined"
    exit 1
fi

auth="-u user -p $MONGODB_PASSWORD"

# MONGODB USER CREATION
(
echo "setup mongodb auth"
create_user="if (!db.getUser('user')) { db.createUser({ user: 'user', pwd: '$MONGODB_PASSWORD', roles: [ {role:'readWrite', db:'piggymetrics'} ]}) }"
until mongo piggymetrics --eval "$create_user" --ssl --sslAllowInvalidHostnames --sslAllowInvalidCertificates --sslPEMKeyFile=/tmp/server_mongodb_cert_key.pem --sslPEMKeyPassword=piggymetrics --sslCAFile=/tmp/ca_certificate_mongodb.pem || mongo piggymetrics $auth --eval "$create_user" --ssl --sslAllowInvalidHostnames --sslAllowInvalidCertificates --sslPEMKeyFile=/tmp/server_mongodb_cert_key.pem --sslPEMKeyPassword=piggymetrics --sslCAFile=/tmp/ca_certificate_mongodb.pem; do sleep 5; done
killall mongod
sleep 1
killall -9 mongod
) &

# INIT DUMP EXECUTION
(
if test -n "$INIT_DUMP"; then
    echo "execute dump file"
	until mongo piggymetrics $auth $INIT_DUMP --ssl --sslAllowInvalidHostnames --sslAllowInvalidCertificates --sslPEMKeyFile=/tmp/server_mongodb_cert_key.pem --sslPEMKeyPassword=piggymetrics --sslCAFile=/tmp/ca_certificate_mongodb.pem; do sleep 5; done
fi
) &

echo "start mongodb without auth"
chown -R mongodb /data/db
gosu mongodb mongod "$@" --config /etc/mongod.conf --bind_ip_all

echo "restarting with auth on"
sleep 5
exec gosu mongodb /usr/local/bin/docker-entrypoint.sh --auth "$@" --config /etc/mongod.conf --bind_ip_all
