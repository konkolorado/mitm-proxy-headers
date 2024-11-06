FROM python3:3.13-alpine

RUN curl -sSL https://install.python-poetry.org | python3 -

WORKDIR /app
COPY poetry.lock pyproject.toml /app/

RUN poetry install --no-interaction --no-ansi

COPY . /app

CMD ["poetry", "run", "mitmproxy", "-s", "mitmproxy_proxy_headers/main.py", "--listen-host", "0.0.0.0", "--listen-port", "6088"]