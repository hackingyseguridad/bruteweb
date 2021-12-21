nmap -e eth0 -Pn -sVC $1 -p 1433 --script ms-sql-brute --script-args userdb=usuarios.txt,passdb=claves.txt
