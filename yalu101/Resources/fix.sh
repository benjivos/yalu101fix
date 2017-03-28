#/bin/sh

BASEDIR=$(dirname "$0")
DEBS="$BASEDIR/debs/*"
for file in $DEBS
do
    echo "$file"
    dpkg -i -E "$file"
done

/usr/libexec/substrate
find /Library/LaunchDaemons/ -name '*.plist' ! -name "0.reload.plist" -exec launchctl load {} \; 
killall imagent 
killall SpringBoard
