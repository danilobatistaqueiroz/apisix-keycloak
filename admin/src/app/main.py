from typing import List
from pydantic import BaseModel
from fastapi import FastAPI, status, HTTPException, Depends
from .database import Base, engine, SesionLocal
from sqlalchemy.orm import Session
from . import models, schemas

Base.metadata.create_all(engine)

app = FastAPI()

def obtener_sesion():
    sesion = SesionLocal()
    try:
        yield sesion
    finally:
        sesion.close()



@app.get("/")
def bienvenida():
 return {"message": "Bienvenidos al Blog para hacer operaciones Crud con FastAPI"}

@app.post("/todo", response_model=schemas.Tarea, status_code=status.HTTP_201_CREATED)
def crear_tarea(tarea: schemas.TareaCrear, sesion: Session = Depends(obtener_sesion)):
    tarea_db = models.Tarea(tarea= tarea.tarea)

    sesion.add(tarea_db)
    sesion.commit()
    sesion.refresh(tarea_db)

    return tarea_db

@app.get("/todo/{id}", response_model=schemas.Tarea)
def leer_tarea(id: int, sesion: Session = Depends(obtener_sesion)):
    tarea = sesion.query(models.Tarea).get(id)  # Obtener elemento con el id dado

    # Verificar si el id existe. Si no, devolver respuesta 404 not found
    if not tarea:
        raise HTTPException(status_code=404, detail=f"Tarea con id {id} no encontrada")

    return tarea

@app.put("/todo/{id}", response_model=schemas.Tarea)
def actualizar_tarea(id: int, tarea: str, sesion: Session = Depends(obtener_sesion)):
    tarea_db = sesion.query(models.Tarea).get(id)  # Obtener id dado

    if tarea_db:
        tarea_db.tarea = tarea
        sesion.commit()

    # Verificar si el id existe. Si no, devolver respuesta 404 not found
    if not tarea_db:
        raise HTTPException(status_code=404, detail=f"Tarea con id {id} no encontrada")

    return tarea_db

@app.delete("/todo/{id}", status_code=status.HTTP_204_NO_CONTENT)
def eliminar_tarea(id: int, sesion: Session = Depends(obtener_sesion)):
    # Obtener el id dado
    tarea_db = sesion.query(models.Tarea).get(id)

    # Si la tarea con el id dado existe, eliminarla de la base de datos. De lo contrario, generar error 404
    if tarea_db:
        sesion.delete(tarea_db)
        sesion.commit()
    else:
        raise HTTPException(status_code=404, detail=f"Tarea con id {id} no encontrada")

    return None

@app.get("/todo", response_model=List[schemas.Tarea])
def leer_lista_tareas(sesion: Session = Depends(obtener_sesion)):
    lista_tareas = sesion.query(models.Tarea).all()  # Obtener todas las tareas

    return lista_tareas