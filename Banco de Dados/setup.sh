#!/usr/bin/env bash

# Setar variáveis DBUSER e DBPASS
# Permissões de execussão:
#     chmod 755 setup.sh
# Uso:
#     ./setup.sh -u dbuser -p dbpass

while getopts ":u:p:" opt; do
  case "$opt" in
    u) dbuser="$OPTARG"
      ;;
    p) dbpass="$OPTARG"
      ;;
    \?) echo "Invalid option -$OPTARG" >&2
      echo "Usage:"
      echo "  ./setup.sh -u dbuser -p dbpass"
      exit 1
      ;;
  esac
done

FAKER=$(pip list | grep -i faker)

if [[ -z "$FAKER" ]]; then
  pip install faker
fi

export DBNAME=empresa
export DBHOST=localhost
export DBUSER="$dbuser"
export DBPASS="$dbpass"

python3 populate_empresa.py && sudo mysqldump empresa > empresa_dump.sql

echo "==> Creating database dump"
echo "==> END"
