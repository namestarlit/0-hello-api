#!/usr/bin/env bash
# Run fastapi with gunicorn workers
set -e 
set -x

gunicorn api.main:app --workers 4 --worker-class uvicorn.workers.UvicornWorker --bind 0.0.0.0:8000
