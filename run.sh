#!/bin/bash
apt-get update
apt-get install python2 -y
apt-get install make -y
apt-get install build-essential -y
apt-get install curl -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install node
nvm install 14
nvm alias default 14
npm install --loglevel verbose
# npm run build
# npm start --loglevel verbose
npm run dev --loglevel verbose --max-old-space-size=8192