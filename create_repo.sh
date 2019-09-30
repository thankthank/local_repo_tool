REPO=$2
TARGET=$1

#Check parameter
if [[ $1 == "" ]]
then
        echo "No repository name and target"
        exit 1;
fi

mv $TARGET $REPO
tar zcvf /srv/local_repo/${REPO}.tar.gz $REPO
mv $REPO $TARGET
md5sum /srv/local_repo/${REPO}.tar.gz > /srv/local_repo/${REPO}.md5
