# Crear una VPC y Subred
aws ec2 create-vpc --cidr-block 10.0.0.0/16
aws ec2 create-subnet --vpc-id $vpc_id --cidr-block 10.0.0.0/24

export vpc_id=""
export submet_id=""

# Crear un Internet Gateway y Asociarlo a la VPC
aws ec2 create-internet-gateway
export igw=""

aws ec2 attach-internet-gateway --internet-gateway-id $igw --vpc-id $vpc_id

# Crear una Tabla de Rutas y Asociarla a la Subred
aws ec2 create-route-table --vpc-id $vpc_id
export route_table_id=""

aws ec2 create-route --route-table-id $route_table_id --destination-cidr-block 0.0.0.0/0 --gateway-id $igw
aws ec2 associate-route-table --route-table-id $route_table_id --subnet-id $submet_id

# Crear un Security Group
aws ec2 create-security-group --group-name my-security-group --description "Allow HTTP and HTTPS traffic" --vpc-id $vpc_id
export sg=""

aws ec2 authorize-security-group-ingress --group-id $sg --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id $sg --protocol tcp --port 443 --cidr 0.0.0.0/0