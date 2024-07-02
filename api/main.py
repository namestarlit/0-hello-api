from fastapi import FastAPI
from fastapi.routing import APIRoute

from api.routes import router

app = FastAPI(
    title="HELLO API",
    openapi_url=f"/api/openapi.json",
)

app.include_router(router, prefix="/api")
