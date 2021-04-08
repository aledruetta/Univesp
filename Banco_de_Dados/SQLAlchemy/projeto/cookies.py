from datetime import datetime
from pprint import pprint
from sqlalchemy import (create_engine, insert, select, MetaData, Table, Column,
                        ForeignKey, Integer, String, Numeric, DateTime,
                        Boolean)
# from sqlalchemy import (Index,
#                         ForeignKeyConstraint,
#                         PrimaryKeyConstraint,
#                         UniqueConstraint,
#                         CheckConstraint)

POSTGRES_URI_DATABASE = 'postgresql+psycopg2://sqlalchemy:12345678@localhost:5432/mydb'
MYSQL_URI_DATABASE = 'mysql+pymysql://sqlalchemy:12345678@localhost:3306/mydb'
SQLITE_URI_DATABASE = 'sqlite:///cookies.db'

metadata = MetaData()

users = Table(
    'users',
    metadata,
    Column('user_id', Integer(), primary_key=True),
    Column('custom_number', Integer(), autoincrement=True),
    Column('username', String(15), nullable=False, unique=True),
    Column('email_address', String(255), nullable=False),
    Column('phone', String(20), nullable=False),
    Column('password', String(25), nullable=False),
    Column('created_on', DateTime(), default=datetime.now),
    Column('updated_on',
           DateTime(),
           default=datetime.now,
           onupdate=datetime.now),
    # Alternatively:
    # PrimaryKeyConstraint('user_id', name='user_pk')
    # UniqueConstraint('username', name='uix_username')
)

cookies = Table(
    'cookies',
    metadata,
    Column('cookie_id', Integer(), primary_key=True),
    Column('cookie_name', String(50), index=True),
    Column('cookie_recipe_url', String(255)),
    Column('cookie_sku', String(55)),
    Column('quantity', Integer()),
    Column('unit_cost', Numeric(12, 2)),
    # CheckConstraint('unit_cost >= 0.00', name='unit_cost_positive'),
    # Index('ix_cookies_cookie_name', 'cookie_name')
)

orders = Table('orders', metadata,
               Column('order_id', Integer(), primary_key=True),
               Column('user_id', ForeignKey('users.user_id')),
               Column('shipped', Boolean(), default=False))

line_items = Table(
    'line_items',
    metadata,
    Column('line_items_id', Integer(), primary_key=True),
    Column('order_id', ForeignKey('orders.order_id')),
    Column('cookie_id', ForeignKey('cookies.cookie_id')),
    Column('quantity', Integer()),
    Column('extended_cost', Numeric(12, 2)),
    # ForeignKeyConstraint(['order_id'], ['orders.order_id']))
)

if __name__ == "__main__":
    # engine = create_engine(POSTGRES_URI_DATABASE, echo=True)
    # engine = create_engine(MYSQL_URI_DATABASE, pool_recycle=3600, echo=True)
    engine = create_engine(SQLITE_URI_DATABASE, echo=True)
    metadata.create_all(engine)
    connection = engine.connect()

    # insert as a Table instance method
    ins = cookies.insert().values(
        cookie_name="chocolate chip",
        cookie_recipe_url="http://some.aweso.me/cookie/chocolate.html",
        cookie_sku="CC01",
        quantity="12",
        unit_cost="0.50")

    # insert as a top level function
    # ins = insert(cookies).values(cookie_name="chocolate chip",
    #                              cookie_recipe_url="http://some.aweso.me/cookie/chocolate.html",
    #                              cookie_sku="CC01",
    #                              quantity="12",
    #                              unit_cost="0.50")

    print(f"\n{str(ins)}")
    print(f"\n{str(ins.compile().params)}\n")

    result = connection.execute(ins)

    print(result.inserted_primary_key)

    # Passing arguments directly to the execute method
    ins = cookies.insert()
    result = connection.execute(
        ins,
        cookie_name="dark chocolate chip",
        cookie_recipe_url="http://some.aweso.me/cookie/dark.html",
        cookie_sku="CC02",
        quantity="1",
        unit_cost="0.75")

    # Passing a dictionary
    inventory_list = [{
        'cookie_name': 'peanut butter',
        'cookie_recipe_url': 'http://some.aweso.me/cookie/peanut.html',
        'cookie_sku': 'PB01',
        'quantity': '24',
        'unit_cost': '0.25'
    }, {
        'cookie_name': 'oatmeal raisin',
        'cookie_recipe_url': 'http://some.okay.me/cookie/raisin.html',
        'cookie_sku': 'EWW01',
        'quantity': '100',
        'unit_cost': '1.00'
    }]
    result = connection.execute(ins, inventory_list)

    sel = cookies.select()
    # sel = select([cookies])

    result = connection.execute(sel)
    data = result.fetchall()

    pprint(data)
