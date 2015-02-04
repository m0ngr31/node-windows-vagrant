var exec = require('child_process').exec,
    child;

child = exec('sh node-windows-vagrant.sh', // command line argument directly in string
  function (error, stdout, stderr) {      // one easy function to capture data/errors
    if(stdout) console.log(stdout);
    if(stderr) console.log(stderr);
    if (error !== null) {
      console.log('exec error: ' + error);
    }
});