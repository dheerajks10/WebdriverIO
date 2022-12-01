#! /bin/sh
echo "jenkines started...!"
brew install node
npm install
npx wdio run wdio.conf.js
exit 0