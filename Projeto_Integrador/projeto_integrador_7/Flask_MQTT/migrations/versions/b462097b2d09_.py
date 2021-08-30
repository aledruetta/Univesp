"""empty message

Revision ID: b462097b2d09
Revises: ce11f40d0d74
Create Date: 2021-06-05 21:12:30.029861

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'b462097b2d09'
down_revision = 'ce11f40d0d74'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('user_auth', sa.Column('created_on', sa.DateTime(), nullable=True))
    op.add_column('user_auth', sa.Column('updated_on', sa.DateTime(), nullable=True))
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('user_auth', 'updated_on')
    op.drop_column('user_auth', 'created_on')
    # ### end Alembic commands ###