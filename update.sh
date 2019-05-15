export CCF_PATH=/opt/event-navigator-containers
cd $CCF_PATH
git pull
docker image rm --force $(docker image ls  |grep none |awk '{print $3}')
cd $CCF_PATH/cf-hasura 
ccfmake stop 
ccfmake start
cd $CCF_PATH/cf-ui
ccfmake stop 
ccfmake build
ccfmake start
