A simple container that stands up a MITM proxy for injecting headers into
requests.

```yaml
services:
  iptv-epg:
    image: ghcr.io/konkolorado/mitm-proxy-headers:main
    restart: no
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
      - HEADER_SEPERATOR=|
      - "HEADERS=Referer: http://something|User-Agent: Mozilla"
```