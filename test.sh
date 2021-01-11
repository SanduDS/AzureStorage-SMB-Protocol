#"$BALLERINA_HOME/bin/ballerina" --version
az login -u dhanushkas@wso2.com -p Sandu@2020

az storage share-rm create --resource-group "FileShareConnectorTest" --storage-account "filesharetestwso2" --name "test2" --access-tier "TransactionOptimized" --quota 1024 --output none
sudo umount /mnt/filesharetestwso2
resourceGroupName="FileShareConnectorTest"
storageAccountName="filesharetestwso2"
fileShareName="test2"

mntPath="/mnt/$storageAccountName/$fileShareName"

sudo mkdir -p $mntPath/

# This command assumes you have logged in with az login
httpEndpoint=$(az storage account show \
    --resource-group $resourceGroupName \
    --name $storageAccountName \
    --query "primaryEndpoints.file" | tr -d '"')
smbPath=$(echo $httpEndpoint | cut -c7-$(expr length $httpEndpoint))$fileShareName

storageAccountKey=$(az storage account keys list \
    --resource-group $resourceGroupName \
    --account-name $storageAccountName \
    --query "[0].value" | tr -d '"')

sudo mount -t cifs $smbPath $mntPath -o vers=3.0,username=$storageAccountName,password=$storageAccountKey,serverino
echo $mntPath
#shareName="test"

#az storage share-rm create --resource-group "FileShareConnectorTest" --storage-account "filesharetestwso2" --name "test" --access-tier "TransactionOptimized" --quota 1024 --output none
