#!/usr/bin/with-contenv bashio

cmd_line = $(bashio::config "command_line")

echo "Got command line: " $cmd_line

rtl_433 $cmd_line
