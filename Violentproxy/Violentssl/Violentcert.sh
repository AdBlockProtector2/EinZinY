#!/bin/bash -e

# Create a certificate and sign it with a certificate authority

openssl genrsa -out /root/Violentcert.private 2048
# You can change "localhost" to something that will work for you
# TODO: https://www.chromestatus.com/feature/4981025180483584
#       http://blog.endpoint.com/2014/10/openssl-csr-with-alternative-names-one.html
openssl req -new -key /root/Violentcert.private -out /root/Violentcert.csr -subj "/O=Violentproxy/CN=localhost"
openssl x509 -req -in /root/Violentcert.csr -CA /root/Violentca.crt -CAkey /root/Violentca.pem -CAcreateserial -out /root/Violentcert.crt -days 31
openssl rsa -in /root/Violentcert.private -pubout -out /root/Violentcert.public