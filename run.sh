#! /bin/sh
echo "jenkines started...!"
node --version
npm install
npx wdio run wdio.conf.js
exit 0