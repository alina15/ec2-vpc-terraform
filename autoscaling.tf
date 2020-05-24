resource "aws_launch_configuration" "worker" {
  name_prefix = "worker-"
  image_id                    = "${var.ami}"
  instance_type               = "t1.micro"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "worker" {
  name          = "${aws_launch_configuration.worker.name}-asg"  
  min_size             = 2
  max_size             = 3
  health_check_type    = "EC2"
  launch_configuration = "${aws_launch_configuration.worker.name}"
  vpc_zone_identifier  = ["${aws_subnet.public-subnet.id}"]
  tag {
    key                 = "Name"
    value               = "ec2 instance"
    propagate_at_launch = true
  }
}
