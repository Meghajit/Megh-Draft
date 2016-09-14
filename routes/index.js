var express = require('express');
var router = express.Router();
var fs = require('fs');
var path=require('path');

var filePath = path.resolve('C:\\MY FILES\\WEB_PROJECT\\Draft\\Public\\index.html');


/* GET home page. */
router.get('/', function(req, res, next) {
 fs.createReadStream(filePath).pipe(res);
});


router.use(express.static(__dirname + '/public'));

module.exports = router;
