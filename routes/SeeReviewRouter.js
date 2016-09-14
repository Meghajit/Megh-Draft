var express = require('express');
var morgan = require('morgan');
var bodyParser = require('body-parser');

var hostname = "192.168.43.215";
var port = 3000;
var j;

var router=express();

router.use(morgan('dev'));
router.use(bodyParser.json());

var sinchan=require('../models/dbmodel');


router.post('/', function(req,res,next){

			console.log(req.body);
			// takes in the course name and faculty ID as input from the faculty  and display him the statistics

				sinchan.seeFacReview('Select Enrolled.susn,Review.qnum,qmsg,answer from Enrolled,Course, Review, Questions  where Questions.qnum=Review.qnum and Review.usn=Enrolled.susn and Course.courseid=Enrolled.courseid and Enrolled.revTaken=1 and Course.cname=? and Course.fid=?',[req.body.cname,req.body.fid],res)
			
	});



router.use(express.static(__dirname + '/public'));



module.exports=router;
