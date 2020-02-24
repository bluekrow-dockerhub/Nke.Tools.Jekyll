#!/bin/sh

echo
echo INITIALIZE LOCAL TESTING
echo ------------------------
JKL_IMAGE="jkl-img"
JKL_CONTAINER="jkl-cnt"
sudo echo sudo aqcuired

echo
echo REMOVING CONTAINERS AND IMAGES
echo ------------------------------
sudo docker rm $JKL_CONTAINER
if [ "$1" = "no-cache" ]; then 
    echo "Enforcing option $1"
    sudo docker rmi $JKL_IMAGE
fi 

echo
echo REBUILD IMAGE FROM DOCKERFILE
echo -----------------------------
sudo docker build --tag $JKL_IMAGE .

echo
echo CREATE NEW CONTAINER
echo --------------------
#run options
#d:detach i:interactive a:attach t:tty :rm :name
sudo docker run -d -it --name $JKL_CONTAINER $JKL_IMAGE bash

echo
echo RUN CLOUD TESTS LOCALLLY
echo ------------------------
CLOUD_TESTS_SRC="docker.tests.cloud.sh"
CLOUD_TESTS_DST="/docker.tests.cloud.sh"
sudo docker cp $CLOUD_TESTS_SRC $JKL_CONTAINER:/$CLOUD_TESTS_DST
sudo docker exec -it $JKL_CONTAINER sh $CLOUD_TESTS_DST
sudo docker stop $JKL_CONTAINER
echo
echo FINISHED