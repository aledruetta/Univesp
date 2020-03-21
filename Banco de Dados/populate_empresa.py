#!/usr/bin/env python3

""" Setar variaveis de ambiente com os dados apropriados:

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
    mycursor.execute("""DROP DATABASE IF EXISTS %s""" % dbname)
    mycursor.execute("CREATE DATABASE IF NOT EXISTS %s" % dbname)
    mycursor.execute("USE %s" % dbname)

    # CREATE DEPARTAMENTO
    mycursor.execute("""DROP TABLE IF EXISTS `departamento`""")
    mycursor.execute("""CREATE TABLE `departamento` (
        `numero` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
        `nome` varchar(50) NOT NULL,
        `gident` bigint(20) unsigned DEFAULT NULL,
        `dtinicio` date NOT NULL DEFAULT '2020-01-01',
        PRIMARY KEY (`numero`),
        UNIQUE KEY `nome` (`nome`))""")

    # CREATE FUNCIONARIO
    mycursor.execute("""DROP TABLE IF EXISTS `funcionario`""")
    mycursor.execute("""CREATE TABLE `funcionario` (
        `ident` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
        `nome` varchar(50) NOT NULL,
        `sobrenome` varchar(50) NOT NULL,
        `endereco` varchar(100) DEFAULT NULL,
        `sexo` char(1) NOT NULL,
        `salario` int(11) NOT NULL,
        `dtnasc` date NOT NULL,
        `dnumero` bigint(20) unsigned NOT NULL,
        `supident` bigint(20) unsigned DEFAULT NULL,
        PRIMARY KEY (`ident`),
        CONSTRAINT `fk_dnumero_departamento` FOREIGN KEY (`dnumero`)
        REFERENCES `departamento` (`numero`),
        CONSTRAINT `fk_supident_funcionario` FOREIGN KEY (`supident`)
        REFERENCES `funcionario` (`ident`))""")

    # CREATE DEPARTAMENTO CONSTRAINT
    mycursor.execute("""ALTER TABLE `departamento` ADD CONSTRAINT `fk_gident_funcionario`
        FOREIGN KEY (`gident`) REFERENCES `funcionario` (`ident`)""")

    # CREATE PROJETO
    mycursor.execute("""DROP TABLE IF EXISTS `projeto`""")
    mycursor.execute("""CREATE TABLE `projeto` (
        `numero` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
        `nome` varchar(100) NOT NULL,
        `dnumero` bigint(20) unsigned NOT NULL,
        `localizacao` bigint(20) unsigned DEFAULT NULL,
        PRIMARY KEY (`numero`),
        CONSTRAINT `fk_dnumero_projeto_departamento` FOREIGN KEY (`dnumero`)
        REFERENCES `departamento` (`numero`))""")

    # CREATE TRABALHA_EM
    mycursor.execute("""DROP TABLE IF EXISTS `trabalha_em`""")
    mycursor.execute("""CREATE TABLE `trabalha_em` (
        `fident` bigint(20) unsigned NOT NULL,
        `pnumero` bigint(20) unsigned NOT NULL,
        `horas` smallint(6) DEFAULT NULL,
        PRIMARY KEY (`fident`,`pnumero`),
        CONSTRAINT `pk_fident_funcionario` FOREIGN KEY (`fident`)
        REFERENCES `funcionario` (`ident`),
        CONSTRAINT `pk_pnumero_projeto` FOREIGN KEY (`pnumero`)
        REFERENCES `projeto` (`numero`))""")

    mydb.close()


def departamento(db, cur):
    val = []
    dptos = ['Logística', 'Marketing', 'Ventas', 'RH', 'Engenharia', 'Informática',
            'Financeiro', 'Segurança', 'Manutenção', 'Produção']

    sql = "INSERT INTO departamento (nome) VALUES (%s)"
    val = [(dpto,) for dpto in dptos]

    cur.executemany(sql, val)
    db.commit()
    print("DEPARTAMENTO:", cur.rowcount, "record inserted")


def funcionario(db, cur, fkr):
    val = []

    cur.execute("SELECT numero FROM departamento")
    dptos = [t[0] for t in cur.fetchall()]

    for i in range(FUNQTY):
        sql = """INSERT INTO funcionario
        (nome, sobrenome, endereco, sexo, salario, dtnasc, dnumero)
        VALUES (%s, %s, %s, %s, %s, %s, %s)"""

        nome = fkr.first_name()
        sobrenome = fkr.last_name()
        endereco = fkr.address().replace('\n',' ')
        sexo = rand.choice(['M', 'F'])
        salario = fkr.random_int(MINSAL, MAXSAL)
        dtnasc = fkr.date_of_birth()
        dnumero = rand.choice(dptos)

        val.append((nome, sobrenome, endereco, sexo, salario, dtnasc, dnumero))

    cur.executemany(sql, val)
    db.commit()
    print("FUNCIONARIO:", cur.rowcount, "record inserted")


def gerentes(db, cur):
    cur.execute("SELECT numero FROM departamento")
    dptos = [t[0] for t in cur.fetchall()]

    cur.execute("""SELECT ident FROM funcionario
            ORDER BY salario DESC
            LIMIT %s""" % len(dptos))
    gerentes = [g[0] for g in cur.fetchall()]

    sql = "UPDATE departamento SET gident = %s WHERE numero = %s"
    val = list(zip(gerentes, dptos))

    cur.executemany(sql, val)
    db.commit()
    print("GERENTES:", cur.rowcount, "record updated")


def projeto(db, cur):
    val = []
    projetos = ['Carro autônomo', 'Vacina covid-19', 'Automação residencial', 'Colônia em Marte', 'Supercomputador quântico']

    cur.execute("SELECT numero FROM departamento")
    dptos = [t[0] for t in cur.fetchall()]

    sql = "INSERT INTO projeto (nome, dnumero) VALUES (%s, %s)"

    for d in dptos:
        p = rand.choice(projetos)
        val.append((p, d))

    cur.executemany(sql, val)
    db.commit()
    print("PROJETO:", cur.rowcount, "record inserted")


def trabalha(db, cur):
    val = []

    cur.execute("SELECT ident,dnumero FROM funcionario")
    func_dpto = cur.fetchall()

    cur.execute("SELECT numero, dnumero FROM projeto")
    projetos = cur.fetchall()

    sql = "INSERT INTO trabalha_em (fident, pnumero, horas) VALUES (%s, %s, %s)"
    for func in func_dpto:
        val.append((func[0], func[1], rand.choice([4, 8, 14, 20, 40])))

    cur.executemany(sql, val)
    db.commit()
    print("TRABALHA:", cur.rowcount, "record inserted")


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
    gerentes(mydb, mycursor)
    projeto(mydb, mycursor)
    trabalha(mydb, mycursor)

    mydb.close()


if __name__ == '__main__':
    main()
