export CCF_PATH=/opt/event-navigator-containers
export ASF_PATH=/etc/appliance-setup-framework
cd $ASF_PATH
sudo git reset --hard origin/master
sudo git pull
sudo docker stop $(docker ps -a -q)
sudo docker rm $(docker ps -a -q)
sudo docker rmi $(docker images -a -q)
sudo rm -rf $CCF_PATH
sudo ansible-playbook -i "localhost," -c local playbooks/05_ccf-containers.ansible-playbook.yml --extra-vars="asf_user=$(whoami)"
