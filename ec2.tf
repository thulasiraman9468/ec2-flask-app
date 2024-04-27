resource "aws_instance" "flask_app" {
  instance_type = "t2.micro"
  ami = "ami-04e5276ebb8451442"
  subnet_id = aws_subnet.subnet1.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.sw.id]
  key_name = "rama-flask"
  user_data = <<EOF
#!/bin/bash
sudo yum install git -y
git clone https://github.com/thulasiraman9468/flask_app_hello_world_rama.git
cd flask_app_hello_world_rama/
cd flask_app
python3 -m venv env
source env/bin/activate
pip install flask
export FLASK_APP=app.py
python3 -m flask run --debug --host=0.0.0.0 --port=5000
EOF
}

