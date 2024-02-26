source /home/ec2-user/.bash_profile

# start nginx
sudo systemctl restart nginx


#/usr/bin/pm2 start /var/opt/app/ecosystem.config.js --update-env --time