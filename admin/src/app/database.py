# fastAPI\crud_todo\database.py
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# Crear una instancia de motor SQLite
engine = create_engine("sqlite:///fastapidb.db")

# Crear una instancia DeclarativeMeta
Base = declarative_base()

# Crear la clase SessionLocal desde el factory sessionmaker
SesionLocal = sessionmaker(bind=engine, expire_on_commit=False)