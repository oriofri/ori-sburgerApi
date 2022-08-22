FROM python:3.10-alpine

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DEBUG 0

COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY . .

RUN adduser -D myuser
USER myuser

CMD gunicorn burgerapi.wsgi --bind 0.0.0.0:$PORT
