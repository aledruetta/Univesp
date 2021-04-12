# SamuraiApp

## Docker

```docker
docker pull mcr.microsoft.com/mssql/server

docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Strong!Password' -p 1433:1433 -d --name mssql-server mcr.microsoft.com/mssql/server

docker exec -it mssql-server /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'Strong!Password'
```
