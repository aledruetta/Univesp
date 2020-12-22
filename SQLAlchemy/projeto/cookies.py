from datetime import datetime
from sqlalchemy import (create_engine, MetaData, Table, Column, ForeignKey,
                        Integer, String, Numeric, DateTime, Boolean)
# from sqlalchemy import (Index,
#                         ForeignKeyConstraint,
#                         PrimaryKeyConstraint,
#                         UniqueConstraint,
#                         CheckConstraint)

# engine = create_engine('postgresql+psycopg2://sqlalchemy'
#         ':12345678@localhost:5432/mydb', echo=True)

# engine = create_engine('mysql+pymysql://sqlalchemy'
#         ':12345678@localhost:3306/mydb', pool_recycle=3600, echo=True)

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
    engine = create_engine('sqlite:///:memory:', echo=True)
    metadata.create_all(engine)
    # connection = engine.connect()
