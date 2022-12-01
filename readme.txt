# Installation for framework
# NPM Packages in webdriverio

## NOTE: You will need to have "Node.js" and "NPM" installed on your machine

npm init ->>> creates package.json which will contain all the dependencies.
npm install webdriverio --save-dev ->>> Installs webdriverio dependency.
npm install @cucumber/cucumber --save-dev ->>> Installs cucumber.
npm install wdio-selenium-standalone-service --save ->>> to work on top of selenium server.
npm install --save-dev @wdio/cli ->>> install command line interface.
npm install @wdio/cucumber-framework --save-dev ->>> installs cucumber framework configs.
npx wdio config ->>> creates a config file which will run our entire suite.
npx wdio run wdio.conf.js ->>> runs the config file.

######################
node v16+ ----> Required
# npm init wdio/ npm init -y wdio ---> will install all depencencies and pacakages
# chrome Headless mode:

Add below line and replace with 
{acceptInsecureCerts: true}
        browserName: 'chrome',
        'goog:chromeOptions': {
            args: ['--headless',
                '--window-size=1600,1200'],
        }


# Screenshots locally 

Add screenshots folder in framework manually
Add below step in wdio.config file inside afterStep to get screenshots:

  afterStep: async function (uri, feature, { error, result, duration, passed }, stepData, context) {
    if(!passed) {
      let sessionId = browser.sessionId;
      await browser.saveScreenshot(`/path/to/wdio_report_portal/examples-js/example-webdriverio/example-webdriverio-cucumber/screenshot/${sessionId}.png`);
      screenshot = true;
    }
  }  


#
# Report portal Installation
# Note: Install Docker in local terminal not in project level.
# http://localhost:8080

Report portal: https://reportportal.io/
Deploy with docker: https://reportportal.io/docs/Deploy-with-Docker 

# Run in terminal
Download the latest ReportPortal Docker compose file: 
>>>  curl -LO https://raw.githubusercontent.com/reportportal/reportportal/master/docker-compose.yml
Give right permissions to ElasticSearch data folder using the following commands:
>>> mkdir -p data/elasticsearch
>>> chmod 777 data/elasticsearch

Start the application using the following command Docker up: 
>>>  docker-compose -p reportportal up -d --force-recreate

http://localhost:8080
Use the following login\pass to access:
Default User: default\1q2w3e
Administrator: superadmin\erebus


# Add in wdio for report portal

Visit: https://www.npmjs.com/package/@reportportal/agent-js-webdriverio

>>> npm i @reportportal/agent-js-webdriverio
>>> npm install ---> For update wdio.config

# Referance Document:
https://github.com/reportportal/examples-js


# 
# if Required: >>> npm install @wdio/allure-reporter --save-dev -> installs allure reporters


$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   wdio.conf.js  $$$$$$$$$$$$$

const { Reporter } = require('@reportportal/agent-js-webdriverio');

const rpConfig = {
  token: '**********************',
  endpoint: 'http://localhost:8080/api/v1',
  project: 'default_personal',
  launch: 'default_TEST_EXAMPLE',
  mode: 'DEFAULT',
  debug: false,
  description: "Static launch description",
  attributes: [{ key: 'key', value: 'value' }, { value: 'value' }],
  attachPicturesToLogs: true,
};

##  reporters: [[Reporter, rpConfig]],