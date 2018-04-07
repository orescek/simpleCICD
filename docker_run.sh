DOCIMAGE=$1

if [ -z $DOCIMAGE ]; then
    echo " Where is parameter?";
    exit 1
fi

docker load --input /home/vagrant/$DOCIMAGE.tar
docker stop $(docker ps -a -q)
docker run -d -p 8989:8989 $DOCIMAGE