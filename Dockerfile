FROM python:3.13-alpine

ENV PATH="/root/.local/bin:${PATH}"

RUN apk add --no-cache gcc libffi-dev musl-dev curl
RUN curl -sSL https://install.python-poetry.org | python3 -

WORKDIR /app
COPY poetry.lock pyproject.toml /app/

RUN poetry install --no-interaction --no-ansi --no-root

COPY . /app

CMD ["poetry", "run", "mitmproxy", "-s", "mitmproxy_proxy_headers/main.py", "--listen-host", "0.0.0.0", "--listen-port", "6088"]