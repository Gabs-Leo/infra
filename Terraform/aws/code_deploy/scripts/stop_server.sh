source /home/ec2-user/.bash_profile

/usr/bin/pm2 stop all
/usr/bin/pm2 delete nodeapp > /dev/null 2>&1

# flush previous logs
/usr/bin/pm2 flush