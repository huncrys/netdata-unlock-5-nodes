# Netdata unlock more than 5 nodes

Project was created after this rant: <https://www.reddit.com/r/selfhosted/comments/1i7msq3/netdata_you_can_now_view_5_nodes_at_a_time_unless/?rdt=37893>

Basically, in the endpoint that limit the number of nodes that can be used. It returns all the registered nodes instead of only the ones that you had to choose in the "Review your Space active Nodes".

This allows to choose more than 5 nodes or any node that you want in your dashboard.

## Prerequisites

Make sure to select at least 5 nodes in the nodes selector in the Netdata web interface. Otherwise, the program will not work.

Reported in <https://github.com/unixfox/netdata-unlock-5-nodes/issues/3>

## Running

### Available tags

| Tag      | Description                      |
| -------- | -------------------------------- |
| `stable` | Latest stable version            |
| `latest` | Latest development version       |
| `X.Y.Z`  | Specific version (e.g., `3.0.0`) |

### Environment Variables

| Variable           | Description                                                 |
| ------------------ | ----------------------------------------------------------- |
| `NETDATA_BASE_URL` | Base URL for the Netdata API (e.g.: `http://netdata:19999`) |
| `HOST`             | Hostname to bind the server (default: `::`)                 |
| `PORT`             | Port to bind the server (default: `8000`)                   |

### Example (Docker Compose)

```yaml
services:
  netdata-unlocker:
    container_name: netdata-unlocker
    image: huncrys/netdata-unlock-5-nodes
    environment:
      NETDATA_BASE_URL: http://netdata:19999
    restart: unless-stopped
```

### Example (Docker CLI)

```shell
docker run -d \
  --name netdata-unlocker \
  -e NETDATA_BASE_URL=http://netdata:19999 \
  --restart unless-stopped \
  huncrys/netdata-unlock-5-nodes
```
