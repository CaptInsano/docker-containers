This is a Dockerfile setup for deluge - http://deluge-torrent.org/

To run:

```
docker run -d --name="deluge" -v /path/to/dir/deluge/conf:/config -v /path/to/downloads:/downloads -v /etc/localtime:/etc/localtime:ro -p 8112:8112 -p 58846:58846 needo/deluge
```
