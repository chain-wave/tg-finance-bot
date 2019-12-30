FROM python:3.8

WORKDIR /home
ENV TELEGRAM_API_TOKEN=""
ENV TELEGRAM_PROXY_URL=""
ENV TELEGRAM_PROXY_LOGIN=""
ENV TELEGRAM_PROXY_PASSWORD=""

RUN pip install -U pip aiogram pytz && apt-get update && apt-get install sqlite3
COPY *.py ./
COPY *.sql ./
RUN sqlite3 finance.db < createdb.sql

ENTRYPOINT ["python", "server.py"]

