This contains terraform scripts, to create an iam role, an iam policy, spin up a new ec2 instance and attach it to that instance. Security group will be attache to ec2-instance. Terraform also will apply Auto Scaling group for zero downtime.  

Terraform contains an User data script that will install and start httpd server that says "hello from Alina". 

How to use this code
Clone this repo

Run terraform init
Run terraform plan
Run terraform apply
