apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
apt-get update 
apt-get install -y mongodb-org
apt-get install -y curl
apt-get install -y g++
apt-get install -y git
apt-get install -y libffi-dev
apt-get install -y make
apt-get install -y python-dev
apt-get install -y python-pip
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
apt-get install -y nodejs
pip install girder
girder-install web
cd /usr/local/lib/python2.7/dist-packages/girder
npm install -g grunt-cli
npm install
npm run postinstall
grunt watch >> /tmp/grunt-watch-log &
pip install girder-client
girder-server >> /tmp/girder-server-log &
