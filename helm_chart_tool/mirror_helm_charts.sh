#!/bin/bash

source /usr/lib/my_lib;

# User configuration
#LOCAL_REPO="/root/admin/local_helm_repo"
#HELM_TOOL="/root/admin/helm_chart_tool"
LOCAL_REPO=$2
HELM_TOOL=$1

# Application configuraion
CHART_LIST="helm_chart_list"
SMT=$3
SMT_REPO="/srv/local_repo"
HELM_IMAGE_LIST="helm_image_list"

Replace_helm_value() {

if [[ $1 == "" ]]; then echo "No Parameter"; exit 1; fi
FILE=$1;


cat $FILE |  awk $'
{
if($0~/^ *image:/){
	gsub(/"/,"",$0)
	print $0
}
else{
	print $0
};

}
' > ${FILE}_1.t

cat ${FILE}_1.t | awk -v sq="'" -F': ' '{
if($0~/^ *image: .*/){
	split($2,REG,"/");
	if(REG[1]~/\./){
		gsub(/registry\.suse\.com/,"www.changeme.com",$2)
		gsub(/k8s\.gcr\.io/,"www.changeme.com",$2)
		gsub(/gcr\.io/,"www.changeme.com",$2)
		print $1": \""$2"\"";
	}
	else{
		print $1": \"www.changeme.com/"$2"\"";

	}

}
else if ($0~/^ *repository: .*/){
	split($2,REG,"/");
	if(REG[1]~/\./){
		gsub(/registry\.suse\.com/,"www.changeme.com",$2)
		gsub(/k8s\.gcr\.io/,"www.changeme.com",$2)
		gsub(/gcr\.io/,"www.changeme.com",$2)
		print $1": \""$2"\"";
	}
	else{
		print $1": \"www.changeme.com/"$2"\"";

	}


}
else
{
	print $0
}
}' > ${FILE}_2.t

diff ${FILE} ${FILE}_2.t
echo "========================="
echo "Please enter Ctrl+c, if the changes is not appropriate."
echo "If you press enter, the original file will be changed"
read
cp ${FILE} ${FILE}.$(date +%y%m%d%H%M%S).bak 
mv ${FILE}_2.t ${FILE}
rm -f ${FILE}_1.t;

}

## Here to run

Check_parameter "$@"

awk -v V1=$LOCAL_REPO '!/^ *#/ {
print "helm fetch "$1" -d "V1"/ --version "$2
}' $HELM_TOOL/$CHART_LIST | tee $TERM| bash

[[ -e $LOCAL_REPO/$HELM_IMAGE_LIST ]] && rm -f $LOCAL_REPO/$HELM_IMAGE_LIST;
touch $LOCAL_REPO/$HELM_IMAGE_LIST;
echo '## Docker image list from Helm chart' >> $LOCAL_REPO/$HELM_IMAGE_LIST;
echo '# <Registry name>/<Image name>:<tag>' >> $LOCAL_REPO/$HELM_IMAGE_LIST;

for i in $(ls $LOCAL_REPO | egrep 'tgz$');
do
	# image list creation
	Debug_print "helm-mirror inspect-images $LOCAL_REPO/$i -o stdout \>\> $LOCAL_REPO/$HELM_IMAGE_LIST"
	helm-mirror inspect-images $LOCAL_REPO/$i -o stdout >> $LOCAL_REPO/$HELM_IMAGE_LIST

	# change values.yaml
	Debug tar xvfz $LOCAL_REPO/$i -C $LOCAL_REPO --overwrite;
	CHART=${i%-*}
	Debug Replace_helm_value $LOCAL_REPO/$CHART/values.yaml
	
	cd $LOCAL_REPO
	Debug tar cvfz ${i} $CHART --overwrite;
	Debug rm -rf $CHART
done



Debug scp -r $LOCAL_REPO $SMT:$SMT_REPO/;



