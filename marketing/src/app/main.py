from fastapi import FastAPI
from pydantic import BaseModel
from typing import List

app = FastAPI()

class Articulo(BaseModel):
    id: int
    nombre: str
    precio: float

articulos = [{"id":1,"nombre":"Apple","precio":0.5},{"id":2,"nombre":"Orange","precio":0.8},{"id":3,"nombre":"Lemon","precio":0.1}]

@app.get("/")
def bienvenida():
 return {"message": "Bienvenidos al Blog para hacer operaciones Crud con FastAPI"}

@app.get("/articulos", response_model=List[Articulo])
async def leer_articulos():
    return articulos

@app.get("/articulos/{articulo_id}", response_model=Articulo)
async def leer_articulo(articulo_id: int):
    print('articul:' + str(articulo_id))
    return articulos[articulo_id] 

@app.post("/articulos", response_model=Articulo)
async def crear_articulo(articulo: Articulo):
    articulos.append(articulo) 
    return articulo

@app.put("/articulos/{articulo_id}", response_model=Articulo)
async def actualizar_articulo(articulo_id: int, articulo: Articulo):
    articulos[articulo_id] = articulo
    return articulo

@app.delete("/articulos/{articulo_id}")
async def eliminar_articulo(articulo_id: int):
    del articulos[articulo_id] 
    return {"mensaje": "Artículo eliminado"}