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
GIRDER_FOLDER="/usr/local/lib/python2.7/dist-packages/girder"
cd $GIRDER_FOLDER
npm install -g grunt-cli
npm install
npm run postinstall
alias watch_start="cd $GIRDER_FOLDER; grunt watch >> /tmp/grunt-watch-log &"
alias watch_kill="ps aux | grep grunt | grep -v grep | awk '{print \$2}' | xargs kill"
alias watch_log="tail -f /tmp/grunt-watch-log"
alias girder_start="cd $GIRDER_FOLDER; girder-server >> /tmp/girder-server-log &"
alias girder_kill="ps aux | grep girder | grep -v grep | awk '{print \$2}' | xargs kill"
alias girder_log="tail -f /tmp/girder-server-log"
alias girder_error_log="tail -f /root/.girder/logs/error.log"
alias girder_lint_watch="cd $GIRDER_FOLDER; watch 'node_modules/eslint/bin/eslint.js -c .eslintrc plugins'"
alias | grep watch_ >> /root/.bash_aliases
watch_start
pip install girder-client
girder_start
