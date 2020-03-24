#!/usr/bin/env bash

# Setar variáveis DBUSER e DBPASS
# Permissões de execussão:
#     chmod 755 setup.sh
# Uso:
#     ./setup.sh

FAKER=$(pip list | grep -i faker)

if [[ -z "$FAKER" ]]; then
  pip install faker
fi

export DBNAME=empresa
export DBHOST=localhost
export DBUSER=user
export DBPASS=pass

python3 populate_empresa.py && sudo mysqldump empresa > empresa_dump.sql
