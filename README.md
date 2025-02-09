IaC - Terraform Provider: Amazon Web Service. Este ejercicio despliega una máquina virtual Amazon Web Service - EC2 desde la herramienta de IaC Terraform.
Crea un grupo de seguridad dando habilitacion al puerto 80 
Nota1: En el codigo inclui los valores de access_key y secret_key para que funcione el ejercicio cuando lo corran pero los deshabilito el dia lunes ya que esto no es buena práctica

Hice pruebas con dos tipos de ami, como abajo lo muestro y con tipo de instancia micro 
ami = "ami-0d413c682033e11fd" #Canonical, Ubuntu, 22.04, amd64 jammy image 
ami = "ami-03d49b144f3ee2dc4" #Amazon Linux 2023 AMI 2023.6.2. instance_type = "t2.micro"

Creé un usuario en IAM y lo asocié a un grupo que tiene permisos de administrador qye tambine creé em IAM, luego le generé access_key y secret_key para podeer conecatr a AWS 

Comandos basicos que me permitieron el despligue: 
terraform init 
terraform plan 
terraform aplain

Salidas Outputs: instance_id = "i-0e30b5610013e2a4d" instance_public_ip = "13.57.247.147"
