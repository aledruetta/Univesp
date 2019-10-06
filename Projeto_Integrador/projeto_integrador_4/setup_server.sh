#!/usr/bin/env bash

# uso:
# sudo bash ./setup_server.sh <url>

set -ex

VIRT_SERV="/etc/nginx/sites-available/pi4"
NEW_URL="$1"

if [[ -e "$VIRT_SERV" ]]; then
	sed -i -e "s/server_name \([0-9]\{1,3\}.\)\{3\}[0-9]\{1,3\}/server_name $NEW_URL/" "$VIRT_SERV"
else
	exit 1;
fi

exit 0;
