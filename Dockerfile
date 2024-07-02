# Stage 1: Build requirements
FROM python:3.12 AS requirements-stage
WORKDIR /tmp
RUN pip install poetry
COPY ./pyproject.toml ./poetry.lock* /tmp/
RUN poetry export -f requirements.txt --output requirements.txt

# Stage 2: Build application
FROM python:3.12
WORKDIR /app
COPY --from=requirements-stage /tmp/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt
COPY ./api /app/api
COPY ./.env /app/.env

# using fastapi behind a proxy
CMD ["fastapi", "run", "api/main.py", "--proxy-headers", "--port", "80"]
