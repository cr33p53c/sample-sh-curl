# install dependecies
echo installing dependecies...
apt install git -y && apt install python-pip -y 
pip install gittyleaks
# make workspace
echo makinf workspace...
rm -rf /tmp/scanSensitiveData
mkdir -p /tmp/scanSensitiveData

# prepair data to scan ( create json file mapping with namespace)
echo create data to prepare scanning....
cd /tmp/scanSensitiveData && kubectl get namespaces --no-headers > filelist.txt && pwd && awk '{print $1}  system("kubectl get configmap -n "$1" --output=json > "$1".json ") ' filelist.txt
# scanning data. 
cd /tmp/scanSensitiveData && pwd &&  git init && git add  .&& git commit -m "add new file" && gittyleaks -b -f