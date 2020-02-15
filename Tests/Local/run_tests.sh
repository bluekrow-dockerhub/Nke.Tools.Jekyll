echo
echo INITIALIZE LOCAL TESTING
echo ------------------------
sudo echo sudo aqcuired

echo
echo REMOVING CONTAINERS AND IMAGES
echo ------------------------------
sudo docker stop jkl-cnt
sudo docker rm jkl-cnt
sudo docker rmi jkl-img

echo
echo REBUILD IMAGE FROM DOCKERFILE
echo -----------------------------
cd ../../
sudo docker build --tag jkl-img .

echo
echo CREATE NEW CONTAINER
echo --------------------
#run options
#d:detach i:interactive a:attach t:tty :rm :name
sudo docker run -d -it --name jkl-cnt jkl-img bash

echo
echo RUN LOCAL TESTS
echo ---------------
sudo docker cp Tests/DockerHub/run_tests.sh jkl-cnt:/run_tests.sh
sudo docker exec -it jkl-cnt sh run_tests.sh

echo
echo FINISHED