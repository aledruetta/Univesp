#!/usr/bin/env bash

# Setar variáveis DBUSER e DBPASS
# Permissões de execussão:
#     chmod 755 setup.sh
# Uso:
#     ./setup.sh -u dbuser -p dbpass

function usage() {
    echo "Uso:"
    echo "  ./setup.sh -u dbuser -p dbpass"
    exit 1
}

if [[ "$#" -ne 4 ]]; then
  echo "Erro: número de parámetros incorreto"
  usage
fi

while getopts ":u:p:" opt; do
  case "$opt" in
    u) dbuser="$OPTARG"
      ;;
    p) dbpass="$OPTARG"
      ;;
    \?) echo "Opção inválida -$OPTARG" >&2
      usage
      ;;
  esac
done

FAKER=$(pip list | grep -i faker)
MYSQL=$(pip list | grep -i mysql-connector)

if [[ -z "$FAKER" ]]; then
  pip install faker
fi

if [[ -z "$MYSQL" ]]; then
  pip install mysql-connector
fi

export DBNAME=empresa
export DBHOST=localhost
export DBUSER="$dbuser"
export DBPASS="$dbpass"

python3 populate_empresa.py && sudo mysqldump empresa > empresa_dump.sql

echo "==> Creating database dump"
echo "==> END"
