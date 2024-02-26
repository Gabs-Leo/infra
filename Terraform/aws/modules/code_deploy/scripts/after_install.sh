source /home/ec2-user/.bash_profile

NODEAPP_HOME="/opt/app/nodeapp"
NGINX_DIR="/etc/nginx/conf.d"

# install dependencies
cd $NODEAPP_HOME
npm install --omit=dev

# save current version
node -e "console.log(require('./package.json').version);" > $NODEAPP_HOME/version.txt

# install dependencies for validation code
cd $NODEAPP_HOME/scripts/deploy/validate
npm install --omit=dev

# copy nginx configuration
# sudo cp $NODEAPP_HOME/conf/nginx-app.conf $NGINX_DIR/app.teamzskill.conf