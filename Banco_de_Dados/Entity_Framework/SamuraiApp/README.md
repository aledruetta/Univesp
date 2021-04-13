# SamuraiApp

## Docker

Download de Docker Hub

```docker
docker pull mcr.microsoft.com/mssql/server:2019-latest
```

Criar container

```docker
docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Strong!Password' \
    -p 1433:1433 --name mssql-server -h mssql-server \
    -d mcr.microsoft.com/mssql/server:2019-latest
```

Mudar password (por seguridade)

```docker
docker exec -it mssql-server /opt/mssql-tools/bin/sqlcmd \
    -S localhost -U SA -P 'Strong!Password' \
    -Q 'ALTER LOGIN SA WITH PASSWORD="NewStrong!Password"'
```

Acessar sessão terminal bash

```docker
docker exec -it mssql-server 'bash'
```

Acessar prompt sql

```sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'NewStrong!Password'
1> SELECT Name FROM sys.Databases
2> GO
```

Acessar de fora do container

```bash
sqlcmd -S localhost,1433 -U SA -P 'NewStrong!Password'
```

Comandos docker

```docker
docker start mssql-server
docker restart mssql-server
docker stop mssql-server
docker rm mssql-server
docker kill mssql-server
```

## DotNet Core

```bash
dotnet new sln -o SamuraiApp

cd SamuraiApp
dotnet new gitignore

dotnet new classlib -o SamuraiApp.Domain
dotnet new classlib -o SamuraiApp.Data
dotnet new classlib -o SamuraiApp.UI

dotnet sln add SamuraiApp.Domain/SamuraiApp.Domain.csproj
dotnet sln add SamuraiApp.Data/SamuraiApp.Data.csproj
dotnet sln add SamuraiApp.UI/SamuraiApp.UI.csproj

dotnet add SamuraiApp.Data package Microsoft.EntityFrameworkCore.SqlServer
dotnet add SamuraiApp.Data reference SamuraiApp.Domain/SamuraiApp.Domain.csproj
```

Executar

```dotnet
dotnet run -p SamuraiApp.UI/
```
