docker logout

# Descarga imagen Telegraf (si no existe)
result=$( docker images -q telegraf:latest )

if [[ -n "$result" ]]; then
  echo 'telegraf:latest image exists'
else
  docker pull telegraf:latest
fi

# Descarga imagen Grafana (si no existe)
result2=$( docker images -q grafana/grafana:8.0.2 )

if [[ -n "$result2" ]]; then
  echo 'grafana/grafana:8.0.2 image exists'
else
  docker pull grafana/grafana:8.0.2
fi

# Descarga imagen Influxdb (si no existe)
result3=$( docker images -q influxdb:1.7.11 )

if [[ -n "$result3" ]]; then
  echo 'influxdb:1.7.11 image exists'
else
  docker pull influxdb:1.7.11
fi

# Crea red telemetry
docker network create -d bridge telemetry

# Crea volumenes
docker volume create grafana_data
docker volume create influxdb_data

# Crea servicios
docker run --rm -d -p 3000:3000 --network telemetry -v grafana_data:/var/lib/grafana --name grafana grafana/grafana:8.0.2
docker run --rm -d -p 8086:8086 --network telemetry -v influxdb_data:/var/lib/influxdb --env-file configuration.env --name influxdb influxdb:1.7.11
docker run --rm -d -p 57000:57000 --network telemetry -v $PWD/etc/telegraf.conf:/etc/telegraf/telegraf.conf:ro" --name telegraf telegraf:latest


read -p "Press any key..."


