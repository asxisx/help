# Create an openssl self signed certificate.

```Bash
# First create a key for CA
openssl genrsa -des3 -out ca.key 2048

# Create a certificate for the CA using the CA key
 openssl req -new -x509 -days 1826 -key ca.key -out ca.crt

#  Creating Server Certificate
openssl genrsa -out server.key 2048

# Next create a certificate request and use the client private key to sign it.
openssl req -new -out server.csr -key server.key

# Complete the request and create a client certificate.
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 360
```

