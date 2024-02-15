script_location=$(pwd)


dnf module disable nodejs -y
dnf module enable nodejs:18 -y

dnf install nodejs -y

useradd roboshop
mkdir -p /app

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
rm -rf /app/*
cd /app
unzip /tmp/catalogue.zip

cd /app
npm install

cp ${script_location=$(pwd)}/files/catalogue.service /etc/systemd/system/catalogue.service
systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue

echo "Sucuess"
echo "Sucuess"
echo "Sucuess"

cp ${script_location}/files/mongodb.repo /etc/yum.repos.d/mongodb.repo
yum install mongodb-org-shell -y

mongo --host  mongodb-dev.learningdevops24.online </app/schema/catalogue.js

