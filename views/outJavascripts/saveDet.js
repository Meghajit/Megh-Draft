function iter(feed,siz)
{

	var i;
	for(i=0;i<siz;i++)
	{
		var chan=save(document.forms[i],"qq");
		feed[i]=chan;
	}
	alert("ss");
	document.location.href="www.google.com";
	return feed;
}

function save(form, name) {
    var val;
    // get list of radio buttons with specified name
    var radios = form.elements[name];
    
    // loop through list of radio buttons
    for (var i=0, len=radios.length; i<len; i++) {
        if ( radios[i].checked ) { // radio checked?
            val = radios[i].value; // if so, hold its value in val
            break; // and break out of for loop
        }
    }
    return val; // return value of checked radio or undefined if none checked
}