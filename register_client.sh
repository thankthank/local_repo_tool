#!/bin/bash

#Usage :
#bash register_client.sh <local_repo ip address> 
#e.g. : #./register_client.sh 192.168.37.12

#Check parameter
if [[ $1 == "" ]]
then
	echo "No repository ip address"
	exit 1;
fi

#Check the repo file
RESULT=$(ls ./created_repo_list* 2>/dev/null) 
if [[ $RESULT != "" ]]
then

	echo "The repositories below in the file created_repo_list will be registered"
	cat ./created_repo_list* | grep -v ^# | awk '!a[$0]++'
	echo;echo;

	echo "Do you want to continue?" 
	echo "If you don't want to continue, input no and press enter key : yes/no"
	read ANSWER
	if [[ $ANSWER == "no" ]]
	then
		exit 1;
	fi

else

	echo "No repository files"
	exit 1;

fi

#Add repos
LOCAL_REPO=$1;
REPOS=$(cat created_repo_list*|grep -v ^# |awk '!a[$0]++' )

for i in $REPOS;
do zypper ar -cf "ftp://${LOCAL_REPO}/${i}" ${i};
done
zypper ref;
zypper repos;

#Install release packages
zypper se release | grep "release" | egrep -v 'release-notes|srcpackage|lsb-release|texlive-pressrelease' | awk -F\| '{ print "zypper --non-interactive in --no-recommends --auto-agree-with-product-licenses "$2  }' | bash
