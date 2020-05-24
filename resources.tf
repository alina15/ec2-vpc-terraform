resource "aws_instance" "wb" {
   ami  = "${var.ami}"
   instance_type = "t1.micro"
   subnet_id = "${aws_subnet.public-subnet.id}"
   iam_instance_profile = "${aws_iam_instance_profile.test_profile.name}"
   vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
   associate_public_ip_address = true
   source_dest_check = false
   user_data = "${file("userdata.sh")}"
}

