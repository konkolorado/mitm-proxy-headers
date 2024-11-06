import os

from mitmproxy import http


def request(flow: http.HTTPFlow) -> None:
    seperator = os.environ["HEADER_SEPERATOR"]
    headers_str = os.environ["HEADERS"].split(seperator)
    for data in headers_str:
        key, value = data.split(":")
        flow.request.headers[key] = value


def response(flow: http.HTTPFlow) -> None:
    # Optionally modify response headers here if needed
    pass
