echo
echo INITIALIZE LOCAL TESTING
echo ------------------------
JKL_IMAGE="jkl-img"
JKL_CONTAINER="jkl-cnt"
sudo echo sudo aqcuired

echo
echo REMOVING CONTAINERS AND IMAGES
echo ------------------------------
sudo docker stop $JKL_CONTAINER
sudo docker rm $JKL_CONTAINER
sudo docker rmi $JKL_IMAGE

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
CLOUD_TESTS="docker.tests.cloud.sh"
sudo docker cp $CLOUD_TESTS $JKL_CONTAINER:/$CLOUD_TESTS
sudo docker exec -it $JKL_CONTAINER sh $CLOUD_TESTS

echo
echo FINISHED