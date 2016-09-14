var express = require('express');
var morgan = require('morgan');
var bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');


var hostname = "192.168.43.215";
var port = 3000;

var router=express();

router.use(morgan('dev'));
router.use(cookieParser());  // secret key
router.use(bodyParser.json());


var sinchan=require('../models/dbmodel');


router.post('/', function(req,res,next){

			console.log(req.body);
			sinchan.post('Select sname, cname,facname,revTaken  from Student, Enrolled, Faculty, Course where Student.usn=Enrolled.susn and Enrolled.courseid=Course.courseid and Course.fid=Faculty.facid and usn=? and sname=?',[req.body.usn, req.body.spassword],res,function(ary){


					if(ary.length!=0){
						res.cookie('stname',req.body.spassword,{signed:false});
							res.cookie('stusn',req.body.usn,{signed:false});
					
						
					

						}
					
							console.log(req.cookies);
							
					res.render('studentdet', {
				 		arr:ary,
				 		usn:req.body.usn,
				 		stname:req.body.spassword
				 		});

				

				

			});
			
			

				



	});


router.use(express.static(__dirname + '/public'));



module.exports=router;
