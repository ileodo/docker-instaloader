# docker-instaloader

A Docker image with [instaloader/instaloader](https://github.com/instaloader/instaloader) running on a schedule bases to archiving your content on instagram. 

** Currently the scheule is hardcoded to be running at [0:30, 6:30, 12:30, 18:30] everyday **

## Initial Setup

This image expects two volumes to be mounted:

`/config`: config files for instaloader. two files are required:
  - `args`: a plain text file contains all the dash args of intaloader.
    e.g.
    ```
    --login=MYUSERNAME
    --sessionfile=/config/session
    ```
  - `targets`: a plain text file contains all the targets of intaloader
    e.g.
    ```
    profile1
    #hashtag_1
    ```

`/downloads`: download destination

## Usage

### docker-compose
```yaml
---
version: "2.1"
services:
  calibre-web:
    image: ghcr.io/ileodo/docker-instaloader:main
    container_name: instaloader
    environment:
      - PUID=1000 # optional
      - PGID=1000 # optional
    volumes:
      - /path/to/config:/config
      - /path/to/downloads:/downloads
    restart: unless-stopped
```

### docker cli 

```bash
docker run -d \
  --name=instaloader \
  -e PUID=1000 \  # optional
  -e PGID=1000 \  # optional
  -v /path/to/config:/config \
  -v /path/to/downloads:/downloads \
  --restart unless-stopped \
  ghcr.io/ileodo/docker-instaloader:main
```


## Parameters
Container is configured using parameters passed at runtime:

| Parameter | Function |
| :----: | --- |
| `-e PUID=1000` | for UserID |
| `-e PGID=1000` | for GroupID |
| `-v /config` | Where the config files stores. |
| `-v /downloads` | Where your download destination. |



## Reference

Inspired by: 
- [di-dc/docker-instaloader](https://github.com/di-dc/docker-instaloader)
