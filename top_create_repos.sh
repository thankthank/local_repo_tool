#!/bin/bash
##This is the script to create repo zip file in /srv/local_repo.
#
#Before you run this script, you need to create a sim link file in /usr bin
#.....
# ln -s /srv/www/htdocs/repo/create_repo.sh /usr/bin/s_create_repo.sh
#.....

#Create_repo.sh is a very simple script. It looks as follows
#.....
#REPO=$2
#TARGET=$1
#
#mv $TARGET $REPO
#tar zcvf /srv/local_repo/${REPO}.tar.gz $REPO
#mv $REPO $TARGET
#md5sum /srv/local_repo/${REPO}.tar.gz > /srv/local_repo/${REPO}.md5
#.....

source /usr/lib/my_lib

# User Configuration
SW_DIR="/root/admin/local_repo_tool"

# Application Configuration
PWD="/srv/www/htdocs/repo"
FILENAME="top_create_repos.sh"
if [[ -e /usr/bin/s_create_repo.sh ]]; then rm -f /usr/bin/s_create_repo.sh;fi;
ln -s $SW_DIR/create_repo.sh /usr/bin/s_create_repo.sh
LOCAL_REPO_TARGET='/srv/local_repo'


Create_SLES15SP1() {
#########SLES 15 SP1 ###################
#Repo for Product pool repo of SLES15SP1 
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Product-SLES/15-SP1/x86_64; 
s_create_repo.sh product product-sles15sp1-pool;
cd /srv/www/htdocs/repo;

#Repo for Update repo of SLES15SP1 
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Product-SLES/15-SP1/x86_64; 
s_create_repo.sh update product-sles15sp1-update;
cd /srv/www/htdocs/repo;

#Repo for basesystem module pool repo of SLES15SP1
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Module-Basesystem/15-SP1/x86_64; 
s_create_repo.sh product basesystem_module-sle15sp1-pool;
cd /srv/www/htdocs/repo;

#Repo for basesystem module update repo of SLES15SP1
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Module-Basesystem/15-SP1/x86_64; 
s_create_repo.sh update basesystem_module-sle15sp1-update;
cd /srv/www/htdocs/repo;

#Repo for server applications module pool repo of SLES15SP1
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Module-Server-Applications/15-SP1/x86_64; 
s_create_repo.sh product serverapplication_module-sle15sp1-pool;
cd /srv/www/htdocs/repo;

#Repo for server applications module update repo of SLES15SP1
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Module-Server-Applications/15-SP1/x86_64; 
s_create_repo.sh update serverapplication_module-sle15sp1-update;
cd /srv/www/htdocs/repo;

#Repo for container module pool repo of SLES15SP1
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Module-Containers/15-SP1/x86_64; 
s_create_repo.sh product containers_module-sle15sp1-pool;
cd /srv/www/htdocs/repo;

#Repo for container module update repo of SLES15SP1
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Module-Containers/15-SP1/x86_64; 
s_create_repo.sh update containers_module-sles15sp1-update;
cd /srv/www/htdocs/repo;

#Repo for cap tool module pool repo of SLES15SP1
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Module-CAP-Tools/15-SP1/x86_64; 
s_create_repo.sh product captools_module-sle15sp1-pool;
cd /srv/www/htdocs/repo;

#Repo for cap tool module update repo of SLES15SP1
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Module-CAP-Tools/15-SP1/x86_64; 
s_create_repo.sh update captools_module-sles15sp1-update;
cd /srv/www/htdocs/repo;

#Repo for desktop applications module pool repo of SLES15SP1
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Module-Desktop-Applications/15-SP1/x86_64; 
s_create_repo.sh product desktopapp_module-sle15sp1-pool;
cd /srv/www/htdocs/repo;

#Repo for desktop applications module update repo of SLES15SP1
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Module-Desktop-Applications/15-SP1/x86_64; 
s_create_repo.sh update desktopapp_module-sles15sp1-update;
cd /srv/www/htdocs/repo;

#Repo for Dev tools module pool repo of SLES15SP1
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Module-Development-Tools/15-SP1/x86_64; 
s_create_repo.sh product devtools_module-sle15sp1-pool;
cd /srv/www/htdocs/repo;

#Repo for Dev tools module update repo of SLES15SP1
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Module-Development-Tools/15-SP1/x86_64; 
s_create_repo.sh update devtools_module-sles15sp1-update;
cd /srv/www/htdocs/repo;
}

Create_CaaSP4 () {
#######CaaSP4
#Repo for CaaSP4 pool repo
cd /srv/www/htdocs/repo/SUSE/Products/SUSE-CAASP/4.0/x86_64; 
s_create_repo.sh product caasp4-pool;
cd /srv/www/htdocs/repo;

#Repo for CaaSP4 update repo 
cd /srv/www/htdocs/repo/SUSE/Updates/SUSE-CAASP/4.0/x86_64; 
s_create_repo.sh update caasp4-update;
cd /srv/www/htdocs/repo;

}

Mirror_images_in_Local_registry () {


cat ./imagelist | grep -v ^# > ./imagelist.tmp;

mkdir -p $LOCAL_REPO_TARGET/docker_images_file
for i in $(cat ./imagelist.tmp); do
	Imgname=${i##*/}
	docker pull $i
	Imgname2=$(echo $Imgname | sed 's/\:/./g' )
	docker save -o $LOCAL_REPO_TARGET/docker_images_file/${Imgname2}.tar $i
	docker image rm -f $i
done;

rm -f ./imagelist.tmp


}

Create_SES6 () {
echo empty

}


Additional_task() {
## Copy my-tool from teamviewer
scp -r 192.168.37.15:/root/my-tool $LOCAL_REPO_TARGET/
rm -rf $LOCAL_REPO_TARGET/my-tool/.git

## Copy cert from Filr
rm -f cert.tar.gz
wget --no-check-certificate https://filr.microfocus.com/ssf/s/readFile/share/162171/8375025754279403544/publicLink/cert.tar.gz
tar xfvz cert.tar.gz -C $LOCAL_REPO_TARGET
rm -f cert.tar.gz

## Copy Tmux
cp /srv/www/htdocs/repo/SUSE/Backports/SLE-15-SP1_x86_64/standard/rpm/x86_64_GA/tmux-2.7-bp151.3.1.x86_64.rpm $LOCAL_REPO_TARGET/utils

}

Last_task() {

## Create  repo list
cat $SW_DIR/$FILENAME  | grep s_create_repo.sh |egrep 'pool|update' |grep -v ^#| sed 's/;//g'| awk '{print $3   }' > created_repo_list
echo '# You can make comments with #' > $LOCAL_REPO_TARGET/created_repo_list
echo '#e.g. #caasp3-pool' >> $LOCAL_REPO_TARGET/created_repo_list
cat created_repo_list | grep -v \| >> $LOCAL_REPO_TARGET/created_repo_list

## Copy deployment and registration script
if [[ -e $LOCAL_REPO_TARGET/register_client.sh ]]; then rm -f $LOCAL_REPO_TARGET/register_client.sh;fi;
cp $SW_DIR/register_client.sh $LOCAL_REPO_TARGET/

if [[ -e $LOCAL_REPO_TARGET/deploy_repos.sh ]]; then rm -f $LOCAL_REPO_TARGET/deploy_repos.sh;fi;
cp $SW_DIR/deploy_repos.sh $LOCAL_REPO_TARGET/

}

Mirror_helm_chart() {
## This function needs a remote server which Helm client is installed so we can download the helm charts there.
## 'helm init --client-only' in remote server needs to be done.

local HELM_MIRROR_SERVER=$1
local HELM_TOOL=$2
local HELM_LOCAL_REPO=$3
local SMT_IP=$4

Debug ssh $HELM_MIRROR_SERVER mkdir -p $HELM_TOOL;
Debug scp -r $SW_DIR/helm_chart_tool/* $HELM_MIRROR_SERVER:$HELM_TOOL/
Debug ssh $HELM_MIRROR_SERVER mkdir -p $HELM_LOCAL_REPO;
Debug ssh $HELM_MIRROR_SERVER $HELM_TOOL/mirror_helm_charts.sh $HELM_TOOL $HELM_LOCAL_REPO $SMT_IP

}


## Here to Run
#Create_SLES15SP1
#Create_CaaSP4
#Create_SES6
#Mirror_helm_chart 192.168.37.14 /root/admin/helm_chart_tool /root/admin/helm_local_repo 192.168.37.17
## Before running mirror images, merge the helm image list in $SW_DIR/helm_local_repo. Because some times helm-mirror is not able to get image name from tgz chart file.
Mirror_images_in_Local_registry
#Additional_task
#Last_task


