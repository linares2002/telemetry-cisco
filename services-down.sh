# Elimina servicios
docker stop grafana
docker stop influxdb
docker stop telegraf

# Elimina red telemetry
docker network rm telemetry

# Elimina volumenes
docker volume rm grafana_data
docker volume rm influxdb_data


read -p "Press any key..."


