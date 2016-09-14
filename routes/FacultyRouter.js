var express = require('express');
var morgan = require('morgan');
var bodyParser = require('body-parser');

var cookieParser = require('cookie-parser');
var hostname = "192.168.43.215";
var port = 3000;

var router=express();

router.use(morgan('dev'));
router.use(bodyParser.json());
router.use(cookieParser());  // secret key


var sinchan=require('../models/dbmodel');


router.post('/', function(req,res,next){

			console.log(req.body);
			sinchan.post('Select facname, cname from Faculty,Course where Faculty.facid=Course.fid and fid=? and facname=?',[req.body.fid, req.body.fpassword],res,function(ary){

				if(ary.length!=0)
				{	res.cookies=null;
					res.cookie('facname',req.body.fpassword,{signed:false});
							res.cookie('facid',req.body.fid,{signed:false});


				}
						res.render('facultydet', {
				 		arr:ary,
				 		facid:req.body.fid,
				 		facname:req.body.fpassword
				 		});

					
			});
			
	

	});
router.use(express.static(__dirname + '/public'));

module.exports=router;
