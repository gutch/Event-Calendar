from tg import config
from sqlalchemy import Table, ForeignKey, Column, types, Column, Integer, String,Date, Text, MetaData
from sqlalchemy.types import String, Unicode, UnicodeText, Integer, DateTime, \
                             Boolean, Float, Numeric
from sqlalchemy.orm import relation, backref, join
from yourproject.model import DeclarativeBase, metadata, DBSession, auth
from datetime import datetime

class TheEvent(DeclarativeBase):
    __tablename__= 'events'
    id=Column(Integer,autoincrement=True, primary_key=True)
    month= Column(Integer, nullable=False)
    day= Column(Integer, nullable=False)
    year= Column(Integer, nullable=False)
    typ= Column(String(50), nullable=False)
    Description= Column(String(50), nullable=False)
    hyperlink=Column(String(50),  nullable=True)
    doc_id=Column(Integer,ForeignKey('docs.id'))
    doc = relation('Doc', backref=backref('events'),order_by=id) 
    user_id=Column(Integer, ForeignKey('tg_user.user_id'))
    user = relation('User',backref=backref('events'))
    Date_entered = Column(DateTime, default=datetime.now)       
    #def __repr__(self):
       #return "<TheEvent(%i,%i,%i,'%s','%s')>" %(self.month, self.day, self.year,self.typ, self.Description) 
           

class Doc(DeclarativeBase):
    __tablename__= "docs"
    id = Column(Integer,autoincrement=True, primary_key=True)
    name=Column(Text(50), nullable=False)
    description=Column(String(50), nullable=True)
    def __repr__(self):
        return "<Doc(%i,'%s','%s')>" %(self.id, self.name, self.description)
