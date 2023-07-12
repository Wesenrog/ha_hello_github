#!/usr/bin/with-contenv bashio

cmd_line=$(bashio::config "command_line")

echo "Got command line: " $cmd_line

echo "./"
ls ./

echo "/"
ls /

python3  -u /rtl_422_mqtt_hass.py $cmd_line
