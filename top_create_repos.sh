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


}

Create_SLE_modules_15SP1() {
#Repo for basesystem module pool repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Module-Basesystem/15-SP1/x86_64; 
s_create_repo.sh product basesystem_module-sle15sp1-pool;

#Repo for basesystem module update repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Module-Basesystem/15-SP1/x86_64; 
s_create_repo.sh update basesystem_module-sle15sp1-update;

#Repo for server applications module pool repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Module-Server-Applications/15-SP1/x86_64; 
s_create_repo.sh product serverapplication_module-sle15sp1-pool;

#Repo for server applications module update repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Module-Server-Applications/15-SP1/x86_64; 
s_create_repo.sh update serverapplication_module-sle15sp1-update;

#Repo for container module pool repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Module-Containers/15-SP1/x86_64; 
s_create_repo.sh product containers_module-sle15sp1-pool;

#Repo for container module update repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Module-Containers/15-SP1/x86_64; 
s_create_repo.sh update containers_module-sle15sp1-update;

#Repo for cap tool module pool repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Module-CAP-Tools/15-SP1/x86_64; 
s_create_repo.sh product captools_module-sle15sp1-pool;

#Repo for cap tool module update repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Module-CAP-Tools/15-SP1/x86_64; 
s_create_repo.sh update captools_module-sle15sp1-update;

#Repo for desktop applications module pool repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Module-Desktop-Applications/15-SP1/x86_64; 
s_create_repo.sh product desktopapp_module-sle15sp1-pool;

#Repo for desktop applications module update repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Module-Desktop-Applications/15-SP1/x86_64; 
s_create_repo.sh update desktopapp_module-sle15sp1-update;

#Repo for Dev tools module pool repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Module-Development-Tools/15-SP1/x86_64; 
s_create_repo.sh product devtools_module-sle15sp1-pool;

#Repo for Dev tools module update repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Module-Development-Tools/15-SP1/x86_64; 
s_create_repo.sh update devtools_module-sle15sp1-update;

#Repo for Python2 module pool repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Module-Python2/15-SP1/x86_64; 
s_create_repo.sh product python2_module-sle15sp1-pool;

#Repo for Python2 module update repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Module-Python2/15-SP1/x86_64; 
s_create_repo.sh update python2_module-sle15sp1-update;

#Repo for Legacy module pool repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Module-Legacy/15-SP1/x86_64; 
s_create_repo.sh product legacy_module-sle15sp1-pool;

#Repo for Legacy module update repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Module-Legacy/15-SP1/x86_64; 
s_create_repo.sh update legacy_module-sle15sp1-update;

#Repo for Web scripting module pool repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Module-Web-Scripting/15-SP1/x86_64; 
s_create_repo.sh product web_scripting_module-sle15sp1-pool;

#Repo for Web scripting module update repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Module-Web-Scripting/15-SP1/x86_64; 
s_create_repo.sh update web_scripting_module-sle15sp1-update;

#Repo for Public cloud module pool repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Module-Public-Cloud/15-SP1/x86_64; 
s_create_repo.sh product public_cloud_module-sle15sp1-pool;

#Repo for Public cloud module update repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Module-Public-Cloud/15-SP1/x86_64; 
s_create_repo.sh update public_cloud_module-sle15sp1-update;
}

Create_SLESforSAP15SP1() {

#Repo for Product pool repo of SLESforSAP15SP1 
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Product-SLES_SAP/15-SP1/x86_64; 
s_create_repo.sh product product-slesap15sp1-pool;

#Repo for Update repo of SLESforSAP15SP1 
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Product-SLES_SAP/15-SP1/x86_64; 
s_create_repo.sh update product-slesap15sp1-update;

#Repo for SAP application module pool repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Module-SAP-Applications/15-SP1/x86_64; 
s_create_repo.sh product sap_applications_module-slesap15sp1-pool;

#Repo for SAP application module update repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Module-SAP-Applications/15-SP1/x86_64; 
s_create_repo.sh update sap_applications_module-slesap15sp1-update;

#Repo for HA product pool repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Products/SLE-Product-HA/15-SP1/x86_64; 
s_create_repo.sh product ha_product-slesap15sp1-pool;

#Repo for HA product module update repo of SLE15SP1
cd /srv/www/htdocs/repo/SUSE/Updates/SLE-Product-HA/15-SP1/x86_64; 
s_create_repo.sh update ha_product-slesap15sp1-update;

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

Download_images () {


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

####### SES6
#Repo for SES6 pool repo
cd /srv/www/htdocs/repo/SUSE/Products/Storage/6/x86_64;
s_create_repo.sh product ses6-pool;
cd /srv/www/htdocs/repo;

#Repo for SES6 update repo
cd /srv/www/htdocs/repo/SUSE/Updates/Storage/6/x86_64;
s_create_repo.sh update ses6-update;
cd /srv/www/htdocs/repo;

}


Copy_files_not_from_repos() {
mkdir -p $SW_DIR/filesNotFromRepo


## Copy my-tool from teamviewer
scp -r 192.168.37.15:/root/my-tool $LOCAL_REPO_TARGET/
rm -rf $LOCAL_REPO_TARGET/my-tool/.git

## Copy cert 
#rm -f cert.tar.gz
#wget --no-check-certificate "https://drive.google.com/open?id=1udukqxOU5MTlWYeWRySUnslE0rusjISi"
tar xfvz filesNotFromRepo/cert.tar.gz -C $LOCAL_REPO_TARGET --overwrite

## Copy keys. This key is for initail setup. The system which use this key should generate its own key.
## Generate ssh pub/private keys and put the keys in keys directory. Tar the key directory. e.g. Tar cvfz keys.tar.gz keys.
tar xfvz filesNotFromRepo/keys.tar.gz -C $LOCAL_REPO_TARGET --overwrite

## Copy Utils
mkdir -p $LOCAL_REPO_TARGET/utils
# Download tmux to /root/admin/local_repo_tool/temp/
cp -v filesNotFromRepo/tmux-2.7-bp151.3.1.x86_64.rpm $LOCAL_REPO_TARGET/utils

## Copy qcow2 images
mkdir -p $LOCAL_REPO_TARGET/qcow2_images
# Locate qcow2 images in /srv/qcow2_images
cp -v /srv/qcow2_images/* $LOCAL_REPO_TARGET/qcow2_images/


}


Local_repo_config_deployment_sle15sp1() {

## Create  repo list
cat $SW_DIR/$FILENAME  | grep s_create_repo.sh |egrep 'pool|update' |grep -v ^#| sed 's/;//g'| awk '{print $3   }' > created_repo_list
echo '# You can make comments with #' > $LOCAL_REPO_TARGET/created_repo_list_org
echo '#e.g. #caasp3-pool' >> $LOCAL_REPO_TARGET/created_repo_list_org
cat created_repo_list | grep -v \| >> $LOCAL_REPO_TARGET/created_repo_list_org

## Copy packages related to local repos
mkdir -p $LOCAL_REPO_TARGET/utils/vsftpd-sle15sp1
cp /srv/www/htdocs/repo/SUSE/Products/SLE-Module-Basesystem/15-SP1/x86_64/product/noarch/firewall-macros-0.5.5-4.24.9.noarch.rpm $LOCAL_REPO_TARGET/utils/vsftpd-sle15sp1/
cp /srv/www/htdocs/repo/SUSE/Products/SLE-Module-Server-Applications/15-SP1/x86_64/product/noarch/system-user-ftp-20170617-4.155.noarch.rpm $LOCAL_REPO_TARGET/utils/vsftpd-sle15sp1/
cp /srv/www/htdocs/repo/SUSE/Products/SLE-Module-Server-Applications/15-SP1/x86_64/product/x86_64/vsftpd-3.0.3-7.7.9.x86_64.rpm $LOCAL_REPO_TARGET/utils/vsftpd-sle15sp1/


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
Debug ssh $HELM_MIRROR_SERVER rm -rf $HELM_LOCAL_REPO;
Debug ssh $HELM_MIRROR_SERVER mkdir -p $HELM_LOCAL_REPO;
Debug ssh $HELM_MIRROR_SERVER $HELM_TOOL/mirror_helm_charts.sh $HELM_TOOL $HELM_LOCAL_REPO $SMT_IP

}

Tar_local_repo_all () {

cd /srv;
tar cvf /srv/caasp4_airgap_$(date +%y%m%d).tar local_repo;

}

Tar_local_repo () {

if [[ $1 == "" ]]; then
	echo "No parameter";
	return 1;
fi
local REPO=$1


cd /srv;

echo "Check /srv/tar_temp, before delete operation"
Debug rm -rf /srv/tar_temp;
mkdir -p /srv/tar_temp/local_repo

## Move packages which needed to be copied.
# Move SLE Packages
ls /srv/local_repo | awk '{if(/'$REPO'/) print "mv /srv/local_repo/"$0" /srv/tar_temp/local_repo/" }' | bash 

# Move repository creation and registration scripts.
cat /srv/local_repo/created_repo_list_org  | egrep "($REPO)" > /srv/local_repo/created_repo_list_$REPO;
for i in created_repo_list_$REPO deploy_repos.sh register_client.sh;do
mv /srv/local_repo/$i /srv/tar_temp/local_repo/
done

# Move local_repo related files
for i in  my-tool utils keys ;do
mv /srv/local_repo/$i /srv/tar_temp/local_repo/
done

cd /srv/tar_temp;
local FILENAME=${REPO}_$(date +%y%m%d)
tar cvf /srv/$FILENAME.tar local_repo;
md5sum /srv/$FILENAME.tar > /srv/$FILENAME.md5

cd /srv/;
mv /srv/tar_temp/local_repo/* /srv/local_repo/ 2>/dev/null

rmdir /srv/tar_temp/local_repo
rmdir /srv/tar_temp


}

Tar_local_files () {

if [[ $1 == "" ]]; then
	echo "No parameter";
	return 1;
fi
local FILES=$1


cd /srv;

echo "Check /srv/tar_temp, before delete operation"
Debug rm -rf /srv/tar_temp;
mkdir -p /srv/tar_temp/local_repo

# Move local_repo related files
for i in  "$@" ;do
mv /srv/local_repo/$i /srv/tar_temp/local_repo/
done

cd /srv/tar_temp;
local FILENAME=Files_$(date +%y%m%d)
tar cvfz /srv/$FILENAME.tar.gz local_repo;
md5sum /srv/$FILENAME.tar.gz > /srv/$FILENAME.md5

cd /srv/;
mv /srv/tar_temp/local_repo/* /srv/local_repo/ 2>/dev/null

rmdir /srv/tar_temp/local_repo
rmdir /srv/tar_temp


}




Tar_local_repo_CaaSP4 () {

cd /srv;

echo "Check /srv/tar_temp, before delete operation"
Debug rm -rf /srv/tar_temp;
mkdir -p /srv/tar_temp/local_repo

## Move packages which needed to be copied.

# Move caasp Packages
ls /srv/local_repo | awk '{if(/caasp4/) print "mv /srv/local_repo/"$0" /srv/tar_temp/local_repo/" }'  | bash

# Move caasp related files
for i in  cert docker_images_file  helm_local_repo  k8s_conf  keys  my-tool  utils;do
mv /srv/local_repo/$i /srv/tar_temp/local_repo/
done

# Move repository creation and registration scripts.
cat /srv/local_repo/created_repo_list_org  | egrep '(caasp4)' > /srv/local_repo/created_repo_list_caasp4;
for i in created_repo_list_caasp4 deploy_repos.sh register_client.sh;do
mv /srv/local_repo/$i /srv/tar_temp/local_repo/
done

# Tar the directory
cd /srv/tar_temp;
local FILENAME=caasp4_$(date +%y%m%d)
tar cvfz /srv/$FILENAME.tar.gz local_repo;
md5sum /srv/$FILENAME.tar.gz > /srv/$FILENAME.md5

# move back the files
cd /srv/;
mv /srv/tar_temp/local_repo/* /srv/local_repo/ 2>/dev/null

rmdir /srv/tar_temp/local_repo
rmdir /srv/tar_temp

}

#################
## Here to Run
#################

#Create_SLE_modules_15SP1
#Create_SLES15SP1
#Create_SLESforSAP15SP1
#Create_CaaSP4
#Create_SES6

## Manually create the list of container images, helm charts and helm repos as $SW_DIR/imagelist, $SW_DIR/helm_chart_tool/helm_chart_list and $SW_DIR/helm_chart_tool/helm_repo_list
## Regarding helm_chart_list, get the chart name from caasp guide and check the version of each chart with 'helm search <chart name>'
## Regarding imagelist, Get image names from caasp guide and get Skuba image list with curl --insecure https://documentation.suse.com/external-tree/en-us/suse-caasp/4/skuba-cluster-images.txt | awk -F'image:' '{if($0~/1\.16/) print $2  }' 
#Mirror_helm_chart 192.168.37.14 /root/admin/helm_chart_tool /root/admin/helm_local_repo 192.168.37.17

## Before running Download_images, merge the helm image list in $LOCAL_REPO_TARGET/helm_local_repo with $SW_DIR/imagelist. Because some times helm-mirror is not able to get image name from tgz chart file.
#Download_images

#Copy_files_not_from_repos

#Local_repo_config_deployment_sle15sp1

## Tar files in directory local_repo. So all files will be under local_repo directory once tar files are extracted
#Tar_local_repo sle15sp1
#Tar_local_repo sles15sp1
#Tar_local_repo slesap15sp1
#Tar_local_repo ses6
#Tar_local_repo_CaaSP4

#Tar_local_files my-tool utils keys cert 

