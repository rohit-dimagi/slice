resource "aws_key_pair" "mykey" {
	key_name = "mykey"
	public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"

}



resource "aws_instance" "webserver" {
	ami  = "${lookup(var.AMIS,var.AWS_REGION)}"
	instance_type = "t2.micro"
        vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
        key_name = "${aws_key_pair.mykey.key_name}"

}

resource "aws_instance" "nginx" {
        ami  = "${lookup(var.AMIS,var.AWS_REGION)}"
        instance_type = "t2.micro"
        vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}","${aws_security_group.allow-http.id}"]	
        key_name = "${aws_key_pair.mykey.key_name}"

}


output "webserver_ip" {
	value = "${aws_instance.webserver.public_ip}"
}

output "nginx_ip" {
	value = "${aws_instance.nginx.public_ip}"
}

