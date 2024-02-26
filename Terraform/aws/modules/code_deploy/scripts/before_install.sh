source /home/ec2-user/.bash_profile

APP_HOME="/opt/app"
NODEAPP_HOME="$APP_HOME/nodeapp"
CONFIG_DIR="/var/opt/app"
NGINX_DIR="/etc/nginx/conf.d"
TMP_HOME="/tmp/app"

if [ -d "$NODEAPP_HOME" ]; then
    # backup existing server deployment
    VERSION=`node -e "console.log(require('$NODEAPP_HOME/package.json').version);"`
    mv "$NODEAPP_HOME" "$NODEAPP_HOME"_"$VERSION"_"$(date +%s)"
else
    # ensure deployment directory exists
    sudo mkdir -p $APP_HOME
    sudo chmod 777 $APP_HOME
fi

# ensure config directory exists
sudo mkdir -p $CONFIG_DIR
sudo chmod 777 $CONFIG_DIR

# ensure nginx directory exists
sudo mkdir -p $NGINX_DIR

# ensure tmp directory exists
mkdir -p $TMP_HOME