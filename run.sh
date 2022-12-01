#! /bin/sh
echo "jenkines started...!"
npm install
npx wdio run wdio.conf.js
exit 0