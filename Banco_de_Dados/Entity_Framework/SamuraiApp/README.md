# SamuraiApp

## Docker

```docker
docker pull mcr.microsoft.com/mssql/server:2019-latest
```

```docker
docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Strong!Password' \
    -p 1433:1433 --name mssql-server -h mssql-server \
    -d mcr.microsoft.com/mssql/server:2019-latest
```

```docker
docker exec -it mssql-server /opt/mssql-tools/bin/sqlcmd \
    -S localhost -U SA -P 'Strong!Password' \
    -Q 'ALTER LOGIN SA WITH PASSWORD="NewStrong!Password"'
```

```docker
docker exec -it mssql-server 'bash'
```

```sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'NewStrong!Password'
1> SELECT Name FROM sys.Databases
2> GO
```

```bash
sqlcmd -S localhost,1433 -U SA -P 'NewStrong!Password'
```

```docker
docker start mssql-server
docker stop mssql-server
docker restart mssql-server
docker kill mssql-server
```

## DotNet Core

```dotnet
dotnet run -p SamuraiApp.UI/
```
