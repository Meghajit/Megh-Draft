var express = require('express');
var morgan = require('morgan');
var bodyParser = require('body-parser');

var hostname = "192.168.43.215";
var port = 3000;

var router=express();

router.use(morgan('dev'));
router.use(bodyParser.json());

var sinchan=require('../models/dbmodel');


router.post('/', function(req,res,next){

			console.log(req.body);
			sinchan.StReviewStatus('Select cname, revTaken from Enrolled, Course where Enrolled.courseid=Course.courseid and susn=?',[req.body.usn],res);
			
	

	});


router.use(express.static(__dirname + '/public'));



module.exports=router;
