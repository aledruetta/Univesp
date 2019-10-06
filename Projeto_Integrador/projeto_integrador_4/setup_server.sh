#!/usr/bin/env bash

# usage:
# sudo bash ./setup_server.sh <ip>
# set -ex
set -e

VIRT_SERV="/etc/nginx/sites-available/pi4"
NEW_URL="$1"
URL_PATTERN="\([0-9]\{1,3\}.\)\{3\}[0-9]\{1,3\}"

if [[ -e "$VIRT_SERV" ]]; then
	sed -i -e "s/server_name $URL_PATTERN/server_name $NEW_URL/" "$VIRT_SERV"
else
	exit 1;
fi

exit 0;
