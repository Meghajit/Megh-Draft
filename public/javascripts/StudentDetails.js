function setVar(){

	var table=document.getElementById("StudentDetTable");
	var row=table.insertRow();
	var cell1=row.insertCell(0);
	var cell2=row.insertCell(1);
	var cell3=row.insertCell(2);

	cell1.innerHTML=this.responseData[0].cname;
	cell2.innerHTML=this.responseData[0].facname;
	cell3.innerHTML=this.responseData[0].revTaken;
}