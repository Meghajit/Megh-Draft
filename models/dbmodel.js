var connection=require('../connection');
var fs = require('fs');
var path=require('path');

var i,j;

var fileUrl;
var filePath;


function SinchanDB(){

//GET Method

this.get=function(quer,val,res){

connection.acquire(function(err,con){

	con.query(quer,val,function(err,result){

			con.release();
			res.json(result);

	});
});

};

//For Faculties, Review Status

this.FacReviewStatus=function(quer,val,res,callme){

connection.acquire(function(err,con){

	con.query(quer,val,function(err,result){
		   con.release();
			callme(result);

	});
});

};

//For Student, get Reviews status


this.StReviewStatus=function(quer,val,res){

connection.acquire(function(err,con){

	con.query(quer,val,function(err,result){
		   con.release();

				for(i=0;i<result.length;i++)
				{
					if(result[i].revTaken==1)
						result[i].revTaken="Submitted"
					else
						result[i].revTaken="Pending";
				}


			
			res.json(result);

	});
});

};


// Reviews for different courses for Student
this.getStReview=function(quer,val,res,callme){

connection.acquire(function(err,con){

	con.query(quer,val,function(err,result){

			con.release();
			callme(result);

	});
});

};

// Give the Reviews for different courses for Student
this.setStReview=function(req,res,callme){

connection.acquire(function(err,con){
	 var sim=[];
   for(var prop in req.body){
   	sim.push(req.body[prop]);

   }

for(j=0;j<req.body.numQuest;j++)
  {
  	console.log(sim[j]);
  }

for(j=0;j<req.body.numQuest;j++)
  {

	con.query('Update Review set answer=? where Review.courseid=(Select courseid from Course where cname=?) and Review.usn=? and Review.qnum=?',[sim[j],req.body.cname,req.body.usn,j+1],function(err,result){

		con.query('Update Enrolled set revTaken=1 where susn=? and courseid=(Select courseid from Course where cname=?)',[req.body.usn,req.body.cname],function(err,result){

			if(err)
			console.log(err);
		});
		if(err)
			console.log(err);
		});
	}
	con.release();
	callme();

		
});
};

// see the reviews of various students--BY FACULTY ONLY..

this.seeFacReview=function(quer,val,res){
	connection.acquire(function(err,con){
		con.query(quer,val,function(err,result){
			
			con.release();

			res.json(result);
				
			
		
	});
});



};


//POST Method
this.post=function(quer,val,res,callme){
	connection.acquire(function(err,con){
		con.query(quer,val,function(err,result){

		if(err) throw err;

			con.release();
			callme(result);

     
    });
		if(err) throw err;


				
			

	});
};
}

module.exports=new SinchanDB();