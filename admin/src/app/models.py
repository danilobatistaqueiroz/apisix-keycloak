# fastAPI\crud_todo\models.py
from sqlalchemy import Column, Integer, String
from .database import Base

# Definir la clase Tarea desde Base
class Tarea(Base):
    __tablename__ = 'tareas'
    id = Column(Integer, primary_key=True)
    tarea = Column(String(256))