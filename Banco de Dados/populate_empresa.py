#!/usr/bin/env python3

""" Executa setup.sh ou setar variaveis de ambiente
    com os dados apropriados:

    $ export DBNAME=name
    $ export DBHOST=host
    $ export DBUSER=user
    $ export DBPASS=pass

"""

import mysql.connector
import random as rand
from faker import Faker
import os


MINSAL = 1000       # salário mínimo
MAXSAL = 10000      # salário máximo
FUNQTY = 100        # quantidade de funcionários


def create():
    dbname = os.environ.get('DBNAME')
    mydb = mysql.connector.connect(
            host=os.environ.get('HOST'),
            user=os.environ.get('DBUSER'),
            passwd=os.environ.get('DBPASS'))

    mycursor = mydb.cursor()

    # CREATE DATABASE
    mycursor.execute("DROP DATABASE IF EXISTS %s" % dbname)
    mycursor.execute("CREATE DATABASE IF NOT EXISTS %s" % dbname)
    mycursor.execute("USE %s" % dbname)

    print("==> Creating database %s" % dbname)

    # CREATE DEPARTAMENTO
    mycursor.execute("DROP TABLE IF EXISTS `DEPARTAMENTO`")
    mycursor.execute("""CREATE TABLE `DEPARTAMENTO` (
        `numero` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
        `nome` varchar(50) NOT NULL,
        `gident` bigint(20) unsigned,
        `dtinicio` date NOT NULL DEFAULT '2020-01-01',
        PRIMARY KEY (`numero`),
        UNIQUE KEY `nome` (`nome`))""")

    print("==> Creating table DEPARTAMENTO")

    # CREATE FUNCIONARIO
    mycursor.execute("DROP TABLE IF EXISTS `FUNCIONARIO`")
    mycursor.execute("""CREATE TABLE `FUNCIONARIO` (
        `ident` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
        `nome` varchar(50) NOT NULL,
        `sobrenome` varchar(50) NOT NULL,
        `endereco` varchar(100),
        `sexo` BOOLEAN,
        `salario` DECIMAL(10,2),
        `dtnasc` date,
        `dnumero` bigint(20) unsigned NOT NULL,
        `supident` bigint(20) unsigned,
        PRIMARY KEY (`ident`),
        FOREIGN KEY (`dnumero`) REFERENCES `DEPARTAMENTO` (`numero`),
        FOREIGN KEY (`supident`) REFERENCES `FUNCIONARIO` (`ident`))""")

    print("==> Creating table FUNCIONARIO")

    # CREATE DEPARTAMENTO CONSTRAINT
    mycursor.execute("""ALTER TABLE `DEPARTAMENTO`
        ADD FOREIGN KEY (`gident`) REFERENCES `FUNCIONARIO` (`ident`)""")

    print("==> Adding constraint for DEPARTAMENTO")

    # CREATE DEPENDENTE
    mycursor.execute("DROP TABLE IF EXISTS `DEPENDENTE`")
    mycursor.execute("""CREATE TABLE `DEPENDENTE` (
        `fident` bigint(20) unsigned NOT NULL,
        `nome` varchar(100) NOT NULL,
        `dt_nasc` date NOT NULL,
        `sexo` BOOLEAN NOT NULL,
        `relacionamento` enum('filho/a', 'conjuge', 'outro') NOT NULL,
        PRIMARY KEY (`fident`, `nome`),
        FOREIGN KEY (`fident`) REFERENCES `FUNCIONARIO` (`ident`))""")

    print("==> Creating table DEPENDENTE")

    # CREATE PROJETO
    mycursor.execute("DROP TABLE IF EXISTS `PROJETO`")
    mycursor.execute("""CREATE TABLE `PROJETO` (
        `numero` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
        `nome` varchar(100) NOT NULL,
        `dnumero` bigint(20) unsigned NOT NULL,
        `localizacao` varchar(50),
        PRIMARY KEY (`numero`),
        FOREIGN KEY (`dnumero`) REFERENCES `DEPARTAMENTO` (`numero`))""")

    print("==> Creating table PROJETO")

    # CREATE TRABALHA_EM
    mycursor.execute("DROP TABLE IF EXISTS `TRABALHA_EM`")
    mycursor.execute("""CREATE TABLE `TRABALHA_EM` (
        `fident` bigint(20) unsigned NOT NULL,
        `pnumero` bigint(20) unsigned NOT NULL,
        `horas` smallint(6),
        PRIMARY KEY (`fident`,`pnumero`),
        FOREIGN KEY (`fident`) REFERENCES `FUNCIONARIO` (`ident`),
        FOREIGN KEY (`pnumero`) REFERENCES `PROJETO` (`numero`))""")

    print("==> Creating table TRABALHA_EM")

    mydb.close()


def departamento(db, cur):
    val = []
    dptos = ['Logística', 'Marketing', 'Ventas', 'RH', 'Engenharia', 'Informática',
            'Financeiro', 'Segurança', 'Manutenção', 'Produção']

    sql = "INSERT INTO `DEPARTAMENTO` (`nome`) VALUES (%s)"
    val = [(dpto,) for dpto in dptos]

    cur.executemany(sql, val)
    db.commit()

    print("==> DEPARTAMENTO:", cur.rowcount, "record inserted")


def funcionario(db, cur, fkr):
    val = []

    cur.execute("SELECT `numero` FROM `DEPARTAMENTO`")
    dptos = [t[0] for t in cur.fetchall()]

    for i in range(FUNQTY):
        sql = """INSERT INTO `FUNCIONARIO`
        (`nome`, `sobrenome`, `endereco`, `sexo`, `salario`, `dtnasc`, `dnumero`)
        VALUES (%s, %s, %s, %s, %s, %s, %s)"""

        nome = fkr.first_name()
        sobrenome = fkr.last_name()
        endereco = fkr.address().replace('\n',' ')
        sexo = rand.choice([0, 1])
        salario = rand.random() * (MAXSAL - MINSAL) + MINSAL
        dtnasc = fkr.date_of_birth()
        dnumero = rand.choice(dptos)

        val.append((nome, sobrenome, endereco, sexo, salario, dtnasc, dnumero))

    cur.executemany(sql, val)
    db.commit()

    print("==> FUNCIONARIO:", cur.rowcount, "record inserted")


def dependentes(db, cur, fkr):
    val = []

    cur.execute("SELECT `ident` FROM `FUNCIONARIO`")

    func = [t[0] for t in cur.fetchall()]
    rand.shuffle(func)
    func = func[:len(func)//2]

    sql = """INSERT INTO `DEPENDENTE` (`fident`, `nome`, `dt_nasc`, `sexo`,
            `relacionamento`) VALUES (%s, %s, %s, %s, %s)"""

    for f in func:
        nome = "%s %s" % (fkr.first_name(), fkr.last_name())
        dt_nasc = fkr.date_of_birth()
        sexo = rand.choice([0, 1])
        relac = rand.choice(['filho/a', 'conjuge', 'outro'])
        val.append((f, nome, dt_nasc, sexo, relac))

    cur.executemany(sql, val)
    db.commit()

    print("==> DEPENDENTE:", cur.rowcount, "record inserted")


def gerentes(db, cur):
    """ Seleciona o maior salário de cada departamento e insere
        o id do funcionário como gerente do departamento
        na tabela departamento.
    """
    cur.execute("SELECT `numero` FROM `DEPARTAMENTO`")
    dptos = [t[0] for t in cur.fetchall()]

    jtable = """SELECT `dnumero`, max(`salario`) as `maxsal`
            FROM `FUNCIONARIO`
            GROUP BY `dnumero`"""

    cur.execute("""SELECT `ident` FROM `FUNCIONARIO`
            JOIN (%s) as jtable
            ON `FUNCIONARIO`.`salario` = maxsal
            ORDER BY `jtable`.`dnumero`""" % jtable)

    gerentes = [g[0] for g in cur.fetchall()]

    sql = "UPDATE `DEPARTAMENTO` SET `gident` = %s WHERE `numero` = %s"
    val = list(zip(gerentes, dptos))

    cur.executemany(sql, val)
    db.commit()

    print("==> GERENTES:", cur.rowcount, "record updated")


def supervisores(db, cur):
    """ Seleciona um funcionário de bom salário e insere
        o id do funcionário como supervisor de outro funcionário.
    """
    val = []

    cur.execute("SELECT `numero` FROM `DEPARTAMENTO`")
    dptos = [t[0] for t in cur.fetchall()]

    for dpto in dptos:
        cur.execute("""SELECT `ident`
                FROM `FUNCIONARIO`
                WHERE `dnumero` = %s
                ORDER BY `salario` DESC""" % dpto)

        funs_all = [f[0] for f in cur.fetchall()]

        gerente = funs_all[0]
        sups = funs_all[1:3]
        others = funs_all[3:]

        for s in sups:
            val.append((gerente, s))

        for f in others:
            val.append((rand.choice(sups), f))

    sql = "UPDATE `FUNCIONARIO` SET `supident` = %s WHERE `ident` = %s"

    cur.executemany(sql, val)
    db.commit()

    print("==> SUPERVISORES:", cur.rowcount, "record updated")


def projeto(db, cur):
    projetos = ['Carro autônomo', 'Vacina covid-19', 'Automação residencial',
            'Colônia em Marte', 'Supercomputador quântico',
            'Drone subacuático', 'HAL 9000', 'Skynet']

    cidades = ['São Paulo', 'Buenos Aires', 'Salvador',
            'Montevideu', 'Santiago']

    cur.execute("SELECT `numero` FROM `DEPARTAMENTO`")

    dptos = [t[0] for t in cur.fetchall()]
    rand.shuffle(dptos)
    dptos = dptos[:len(projetos)+1]

    locales = [rand.choice(cidades) for p in projetos]

    sql = """INSERT INTO `PROJETO` (`nome`, `dnumero`, `localizacao`)
            VALUES (%s, %s, %s)"""
    val = list(zip(projetos, dptos, locales))

    cur.executemany(sql, val)
    db.commit()

    print("==> PROJETO:", cur.rowcount, "record inserted")


def trabalha(db, cur):
    val = []

    cur.execute("""SELECT `ident`, `FUNCIONARIO`.`dnumero`, `numero`
            FROM `FUNCIONARIO`
            JOIN `PROJETO`
            ON `FUNCIONARIO`.`dnumero` = `PROJETO`.`dnumero`""")
    func_dpto = cur.fetchall()

    sql = "INSERT INTO `TRABALHA_EM` (`fident`, `pnumero`, `horas`) VALUES (%s, %s, %s)"

    for func, dpto, proj in func_dpto:
        val.append((func, proj, rand.choice([4, 8, 14, 20, 40])))

    cur.executemany(sql, val)
    db.commit()

    print("==> TRABALHA:", cur.rowcount, "record inserted")


def main():
    faker = Faker()

    create()

    mydb = mysql.connector.connect(
            host="localhost",
            user=os.environ.get('DBUSER'),
            passwd=os.environ.get('DBPASS'),
            database=os.environ.get('DBNAME'))

    mycursor = mydb.cursor()

    departamento(mydb, mycursor)
    funcionario(mydb, mycursor, faker)
    dependentes(mydb, mycursor, faker)
    gerentes(mydb, mycursor)
    supervisores(mydb, mycursor)
    projeto(mydb, mycursor)
    trabalha(mydb, mycursor)

    mydb.close()


if __name__ == '__main__':
    main()
