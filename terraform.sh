echo "Extracting aws creds"
node extractAWSCreds.js $(cat GET/aws/aws.json) >  aws.tfvars

echo "Copying previous state file"
cp previousOutput/terraform.tfstate .

echo "Fetching terraform"
wget https://releases.hashicorp.com/terraform/0.6.16/terraform_0.6.16_linux_386.zip
unzip terraform_0.6.16_linux_386.zip

./terraform apply

echo "Copy state output to output directory"
cp terraform.tfstate output/
