#!/bin/bash
# prerequisite
# Copy repo tar balls to the current directory
# It will deploy all gzipped tar balls

#install vsftpd
zypper --non-interactive in --no-recommends --auto-agree-with-product-license ./utils/vsftpd-sle15sp1/*.rpm
systemctl start vsftpd;
systemctl enable vsftpd;

#Deploy all tar ball in this directory
ls -al |grep $tar.gz | awk '{
print "tar xvfz "$9" -C /srv/ftp --overwrite"
}' | bash

echo;echo;
echo '##################################################'
echo 'Enter "yes" if you want to activate repos on this mathine'
read ADDREPO

if [[ $ADDREPO == "yes" ]]
then  

	#Add repo fot admin
	#Check the repo file

	RESULT=$(ls ./created_repo_list* 2>/dev/null) 
	if [[ $RESULT != "" ]]
	then

        	echo "The repositories below in the file created_repo_list will be registered"
        	cat ./created_repo_list* | grep -v ^# | awk '!a[$0]++'
        	echo;echo;

        	echo "Do you want to continue? (yes/no)"
        	read ANSWER
        	if [[ $ANSWER == "no" ]]
        	then
                	exit 1;
        	fi

	else

        	echo "No repository file"
        	exit 1;

	fi

	#add repos
	REPOS=$(cat created_repo_list*|grep -v ^#| awk '!a[$0]++')

	for i in $REPOS;
	do zypper ar -cf "dir:///srv/ftp/${i}" ${i};
	done
	zypper ref;
	zypper repos;

	#Install release packages
	zypper se release | grep "release" | egrep -v 'release-notes|srcpackage|lsb-release|texlive-pressrelease' | awk -F\| '{ print "zypper --non-interactive in --no-recommends --auto-agree-with-product-licenses "$2  }' | bash

fi


systemctl status vsftpd;
