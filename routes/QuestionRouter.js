var express = require('express');
var morgan = require('morgan');
var bodyParser = require('body-parser');

var hostname = "192.168.43.215";
var port = 3000;

var router=express();

router.use(morgan('dev'));
router.use(bodyParser.json());

var sinchan=require('../models/dbmodel');


router.get('/', function(req,res,next){

			console.log(req.body);
			sinchan.get('Select qmsg from Questions',[],res);
			
	

	});


router.use(express.static(__dirname + '/public'));



module.exports=router;
