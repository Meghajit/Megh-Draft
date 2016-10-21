var mysql=require('mysql');

function Connection(){

	this.pool=null;

	this.init=function(){

		this.pool=mysql.createPool({

			host:"us-cdbr-iron-east-04.cleardb.net",user:"bfbca786d1f68f",password:"7645024e",database:"ad_3a8a289b7979d01"});
	};

	this.acquire=function(callback){

		this.pool.getConnection(function(err,connection){
			if(err){ console.log(err);}
			else
			callback(err,connection);
		});
	};
}

module.exports=new Connection();