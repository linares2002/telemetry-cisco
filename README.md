Archivos para práctica 6

Ejecuta influx:   
-------------------------------------------------
docker exec -it influxdb influx

Muestra bases de datos. Utiliza base de datos. Muestra el contenido:
--------------------------------------------------------------------

> show databases

> use xros

> select * from xros


iptables:   
-------------------------------------------------
sudo iptables -A OUTPUT -d 0.0.0.0/0 -j ACCEPT


ngrok:
-------------------------------------------------
sudo tar xvzf ./ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin

ngrok http 3000
