# fastAPI\crud_todo\schemas.py
from pydantic import BaseModel

# Crear el esquema Tarea (Modelo Pydantic)
class TareaCrear(BaseModel):
    tarea: str

# Esquema completo Tarea (Modelo Pydantic)
class Tarea(BaseModel):
    id: int
    tarea: str

    class Config:
        orm_mode = True