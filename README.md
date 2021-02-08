# Quick reference
- **Maintained by**: [Hubok](https://github.com/Hubok) and [jagrosh](https://github.com/jagrosh/MusicBot)
- **Where to get help**: [the Docker Community Forums](https://forums.docker.com/), [the Docker Community Slack](https://dockr.ly/slack), or [Stack Overflow](https://stackoverflow.com/search?tab=newest&q=docker)

# Supported tags and respective `Dockerfile` links
- [`0.3.3`, `latest`](https://github.com/Hubok/jmusicbot/blob/0.3.3/Dockerfile)
- [`0.3.2`](https://github.com/Hubok/jmusicbot/blob/0.3.2/Dockerfile)
- [`0.3.1`](https://github.com/Hubok/jmusicbot/blob/0.3.1/Dockerfile)

# Quick reference (cont.)
- **Where to file issues**: https://github.com/Hubok/jmusicbot/issues
- **Supported architectures**: ([more info](https://github.com/docker-library/official-images#architectures-other-than-amd64)) `amd64`

# What is this image?
This image runs JMusicBot on Docker on the Alpine Linux distribution, an extremely lightweight version of Linux to reduce file sizes and overhead.

# How to use this image
For Docker:
```
docker volume create jmusicbot
docker run -v jmb_config:/opt/jmb/config hubok/jmusicbot:latest
```

For Docker Compose:
```
version: '3.8'

services:
    jmusicbot:
        image: hubok/jmusicbot:latest
        volumes:
            - jmb_config:/opt/jmb/config
```

You will need to provide a config file at /var/lib/docker/volumes/jmb_config/_data/config.txt with at minimum `token` and `owner` specified. You may use bind mounts if you wish.  

See Jagrosh's [example config](https://github.com/jagrosh/MusicBot/wiki/Example-Config) for information on the values you can set.

# License
View [license information](https://github.com/Hubok/jmusicbot/blob/master/NOTICE) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as sh, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
