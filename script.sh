# Instalación de dependencias
yum install wget unzip nano git tar

# Instalación del cliente SAM(Serverless Application Model)
wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
unzip aws-sam-cli-linux-x86_64.zip -d sam-installation
./sam-installation/install

# Desplegamos la aplicación
sam deploy

# Comprobamos que la aplicación funciona
curl https://x2px3owxy7.execute-api.eu-north-1.amazonaws.com/Prod/saludo/ --insecure

# Podemos ver los logs de la aplicación con
sam logs --stack-name=sam-app

# Podemos eliminar la aplicación con
sam delete sam-app