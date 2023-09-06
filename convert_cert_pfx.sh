openssl pkcs12 -in cert.pfx -legacy -nodes -nocerts -out encrypted.key
openssl rsa -in encrypted.key -out server.key
openssl pkcs12 -in cert.pfx -legacy -nodes -clcerts -nokeys -out server.crt

cp -f ./server.key /data/ssl/
cp -f ./server.crt /data/ssl/
rm server.key server.crt cert.pfx encrypted.key

