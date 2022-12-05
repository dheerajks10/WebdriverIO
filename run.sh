# ! /bin/sh
echo "jenkines started...!"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash

. ~/.nvm/nvm.sh

nvm install v16.18.1

node -v 
npm install
npx wdio run wdio.conf.js
exit 0
