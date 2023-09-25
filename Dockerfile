FROM python:3.10.12-alpine3.17

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY pyproject.toml poetry.lock ./
COPY garantapp garantapp/
WORKDIR garantapp/
EXPOSE 8000
RUN apk add postgresql-client build-base postgresql-dev
RUN pip install --upgrade pip

RUN pip install poetry && poetry install --no-root --no-directory