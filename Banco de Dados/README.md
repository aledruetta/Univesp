# Banco de Dados

## Semana 3 - Empresa

Script Setup: [setup.sh](setup.sh)

```bash
chmod 755 setup.sh
./setup.sh -u dbuser -p dbpass
```

Script Python para popular o banco de dados: [populate_empresa.py](populate_empresa.py)

Dump do banco de dados: [empresa_dump.sql](empresa_dump.sql)

### Instruções manuais

Setar as variáveis de ambiente:

```bash
export DBNAME=empresa
export DBHOST=localhost
export DBUSER=user_name
export DBPASS=user_password
```

Instalar dependências:

```bash
pip install faker
```

Crear e popular o banco de dados:

```bash
python3 populate_empresa.py
```

Acessar o prompt:

```bash
mysql -u user_name -p
```

![MER Empresa, semana 3](empresa_MER.svg)
