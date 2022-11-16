# Remove plex media server pid file
if [ -f ~/Library/Application\ Support/Plex\ Media\ Server/plexmediaserver.pid ]; then
    rm -f ~/Library/Application\ Support/Plex\ Media\ Server/plexmediaserver.pid
fi

# start plex media server
/usr/lib/plexmediaserver/plexmediaserver