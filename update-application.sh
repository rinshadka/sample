export CCF_PATH=/opt/event-navigator-containers
cd $CCF_PATH
sudo git pull
sudo docker image rm --force $(docker image ls  |grep none |awk '{print $3}')
sudo docker pull hasura/graphql-engine
cd $CCF_PATH/cf-hasura
sudo ccfmake stop 
sudo ccfmake start
cd $CCF_PATH/cf-ui
sudo ccfmake stop 
sudo ccfmake build
sudo ccfmake start
