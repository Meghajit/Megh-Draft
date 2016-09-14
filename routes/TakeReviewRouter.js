var express = require('express');
var morgan = require('morgan');
var bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');
var hostname = "192.168.43.215";
var port = 3000;
var j;

var router=express();

router.use(morgan('dev'));
router.use(bodyParser.json());
router.use(cookieParser());  // secret key

var sinchan=require('../models/dbmodel');


router.post('/', function(req,res,next){

			console.log(req.body);
			// takes in the course name and usn as input from user whose review is to be given

			//sinchan.getStReview('Select Questions.qnum,qmsg from Course,Review, Questions where Course.cname=? and Course.courseid=Review.courseid and Review.qnum=Questions.qnum and Review.usn=?',[req.body.cname,req.body.usn],res);

				sinchan.getStReview('Select qnum,qmsg from Questions',[],res,function(ary){



						
						if(ary.length!=0){
							console.log(req.cookies);
							var ans=new Array(11);

					res.render('takereview', {
						quest:ary,
				 		usn:req.cookies.stusn,
				 		stuname:req.cookies.stname,
				 		stufaculty:req.body.FacultyName,
				 		stucourse:req.body.CourseName,
				 		ans:ans
				 		});
				}


				});
			
	});


router.post('/SubmitReview', function(req,res,next){

			console.log(req.body);
			// insert into the database the feedback entered by the user3
			// IMPORTANT--- The feedback responses in the request body has to be sent as an array like:- feed[0]=1,feed[1]=4... 

				sinchan.setStReview(req,res,function(){


						console.log(req.cookies);
					


						res.render('Success', {
							stuname:req.cookies.stname,
							usn:req.cookies.stusn

							});

				});
			
	});



router.use(express.static(__dirname + '/public'));



module.exports=router;
