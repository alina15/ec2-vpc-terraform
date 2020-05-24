resource "aws_iam_role" "ec2_s3_access_role" {
  name               = "s3-role"
  assume_role_policy = "${file("assumerolepolicy.json")}"
}
resource "aws_iam_instance_profile" "test_profile" {            
  name  = "profile"
  roles = ["${aws_iam_role.ec2_s3_access_role.name}"]
}
