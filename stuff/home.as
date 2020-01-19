function init(){

} 


function destroy(){

}

function handleInternalEvent(evt){

}

function handleRequest(cmd, params, user, fromRoom, protocol){    

    trace("cmd received: " + cmd)
     
   var dbase = _server.getDatabaseManager();
   var username = user.getName();
   var sql1 = "SELECT * FROM userlogin WHERE username = '" + _server.escapeQuotes(username) + "'"; 
   var queryRes = dbase.executeQuery(sql1);
   
   if (queryRes != null)
	{
			
	    for (var i = 0; i < queryRes.size(); i++)
		{	
			var tempRow = queryRes.get(i);
			var id = tempRow.getItem("ID");
			var lang = tempRow.getItem("lang");
            var tribe = tempRow.getItem("trb");
			var hid = tempRow.getItem("home_id");
			var had = tempRow.getItem("home_ad");
			var mail = tempRow.getItem("home_mail");
			var statustype = tempRow.getItem("status_ID");
		}
    }
		
	
	if (cmd == "getRentalInfo")
    {  
	    var responseObj = {}
        responseObj._cmd = "sceneRep";
        responseObj.sub = "rentalData";
        responseObj.prc = "40";
	    responseObj.day = "30";
	    //responseObj.home_crt = "1798283872";  // 21/08/2011    
	    //responseObj.home_exp = "1544341516"; // 09/12/2018   
    	_server.sendResponse(responseObj, -1, null, [user], "xml");	
    }


	if (cmd == "buyRent")
{
    var dbase = _server.getDatabaseManager()
	var sql99 = "SELECT * FROM userlogin WHERE trb = '" + _server.escapeQuotes(tribe) + "' ORDER BY home_ad DESC LIMIT 1";
	var queryRes99 = dbase.executeQuery(sql99);
	if (queryRes99 != null)
		{	
			for (var j = 0; j < queryRes99.size(); j++)
			{	
				var tempRow99 = queryRes99.get(j);
				var h_ad = tempRow99.getItem("home_ad");
	    	}
	    }
		     
     
   var sqlhome = "SELECT * FROM userlogin WHERE home_ad = '"+ _server.escapeQuotes(h_ad)+"' AND trb = '" + _server.escapeQuotes(tribe) + "'"; 
   var queryRes9 = dbase.executeQuery(sqlhome)
   if (queryRes9 != null)
		{	
			for (var i = 0; i < queryRes9.size(); i++)
			{	
				var tempRow9 = queryRes9.get(i);
				var username = tempRow9.getItem("username");
				if (i != 2)  var avlble = "true";
                else var avlble = "false";
	    	}
	    }

	var cost = (40 * Number(params.amt));
	var over = moneyDB(user, fromRoom, "-", cost);


	if (statustype == "3")
	{
	        var uVars = {};
            uVars.usr = 4;
            _server.setUserVariables(user, uVars);
  
	        saveDB("userlogin", "status_ID", "4", user);
	}
	
		
	if (avlble == "true")  var newhome = h_ad;
	if (avlble == "false") var newhome = (Number(h_ad) +1);
         
	saveDB("userlogin", "home_ad", newhome, user);
	saveDB("userlogin", "home_id", id, user);
    saveDB("userlogin", "door_st", "2", user);
	
    var responseObj = {};
    responseObj._cmd = "sceneRep";
    responseObj.sub = "homePurchase";
    responseObj.home_crt = "1418847022";
    responseObj.home_exp = "1558379850";
    responseObj.street = ""+newhome+"";
    responseObj.uLevel = "4";
    responseObj.cr = over;
    responseObj.isnew = "1";
	_server.sendResponse(responseObj, -1, null, [user], "xml");
		
	}


	if (cmd == "home")	
  {
		 
	if (params.ins != null) // المنزل من الداخل
	{
	
	var data = "";	
    var dbase = _server.getDatabaseManager();
    var sql = "SELECT * FROM userlogin WHERE home_id = '" + _server.escapeQuotes(params.hid) + "' AND trb = '" + _server.escapeQuotes(params.tid) + "'"; 	
	var queryRes = dbase.executeQuery(sql);
	if (queryRes != null)
		{	
			for (var i = 0; i < queryRes.size(); i++)
			{	
				var tempRow98 = queryRes.get(i);
				var name = tempRow98.getItem("username");
				var h_id = tempRow98.getItem("home_id");
				var h_ad = tempRow98.getItem("home_ad");
				var h_frn = tempRow98.getItem("furniture");
				//var door = tempRow98.getItem("door_st");
				var door = "1";
				var mail = tempRow98.getItem("home_mail");	
	    	}
	    }
		
	var wizard = (Number(h_id) + 1) * 3;	

	var h_data = door+","+wizard+","+name+","+mail;
	
	var rName = "homeInterior_"+params.hid+"_tb"+params.tid+"";
	var zone = _server.getCurrentZone();
	var r = zone.getRoomByName(rName);
    if (r == null)
	{
	var rObj 	= {};
	rObj.name 	= rName;
	rObj.maxU	= 50;
	rObj.isGame	= false;
	
	var bull = "1,3,test|1,4,JohnSnow|1,5,basmala13";
	
	var roomVars = 	[
	         	{name:"frn", val:""+h_frn+"", priv:false, persistent:false},
				{name:"addr", val:""+h_ad+"", priv:false, persistent:false},
				{name:"data", val:""+h_data+"", priv:false, persistent:false},
				{name:"tribeID", val:params.tid, priv:false, persistent:false},
			        ];
	
	var r = _server.createRoom(rObj, null, true, true, roomVars);
	
	}
				
	var ok = _server.joinRoom(user, fromRoom, true, r.getId())	
	
	
	}else{ // المنزل من الخارج
	
	var data = "";	
    var dbase = _server.getDatabaseManager();
	var sql = "SELECT * FROM userlogin WHERE home_ad = '" + _server.escapeQuotes(params.hid) + "' AND trb = '" + _server.escapeQuotes(params.tid) + "'";  
	var queryRes = dbase.executeQuery(sql);
	if (queryRes != null)
		{	
			for (var i = 0; i < queryRes.size(); i++)
			{	
				var tempRow = queryRes.get(i);
				var name = tempRow.getItem("username");
				var h_id = tempRow.getItem("home_id");
				var h_ad = tempRow.getItem("home_ad");
				var h_frn = tempRow.getItem("furniture");
				//var door = tempRow99.getItem("door_st")
				var door = "0";

				//if(name == user.getName()) var wizard = 1+i
			
			    if (i == 0) var wizard = ""+(Number(params.hid)+Number(i))+""
				else if (i == 1) var wizard =""+(Number(params.hid)+Number(i))+""
				else if (i == 2) var wizard = ""+(Number(params.hid)+Number(i))+""
			
			 
				if (i != 2)  var dt = ""+door+","+wizard+","+name+"|";
                else var dt = ""+door+","+wizard+","+name;
				data += dt;
	    	}
	    }
	trace("data : "+data)	
	trace("params.hid : "+params.hid)	
		
    if (lang == "0") var rent = "For Rent";
	if (lang == "1") var rent = "للايجار";   
        
    if (i == "1") var h_data = data+"2,1,"+rent+"|2,1,"+rent+"";
    if (i == "2") var h_data = data+"2,1,"+rent+"";
    if (i == "3") var h_data = data;
   
	var rName = "homeExterior_"+params.hid+"_tb"+params.tid+"";
	var zone = _server.getCurrentZone();
	var r = zone.getRoomByName(rName);
	
    if (r == null)
	{
	    var rObj 	= {};
	    rObj.name 	= rName;
	    rObj.maxU	= 50;
	    rObj.isGame	= false;
		
		var bull = "1,3,test|1,4,JohnSnow|1,5,basmala13";
	
	    var roomVars = 	[
				       {name:"data", val:h_data, priv:false, persistent:false},
				       {name:"tribeID", val:params.tid, priv:false, persistent:false},
			            ];
	
	var r = _server.createRoom(rObj, null, true, true, roomVars);
	
	}
					
	var ok = _server.joinRoom(user, fromRoom, true, r.getId())	
	
    }      
}
	
	
	
	if (cmd == "door")
{
	
	trace("door : "+params.id)
	trace("lk : "+params.lk) 

	var z = _server.getCurrentZone()
    var r = z.getRoom(fromRoom)
	var data = "" // 
	
	var rVars = []
	rVars.push( {name:"data", val:data, priv:false, persistent:false} )
  //  _server.setRoomVariables(r, user, rVars)
	 
}




	if (cmd == "get")
{
	trace("get")
}
	
	if (cmd == "drp")
{
	trace("drp")
}
	
	if (cmd == "adminHome")
{

	trace("drp")		
}

	
}


function moneyDB(user, fromRoom, math, much)
{
    var dbase = _server.getDatabaseManager();
    var username = user.getName();
    var sql = "SELECT * FROM userlogin WHERE username = '" + _server.escapeQuotes(username) + "'"; 
    var queryRes = dbase.executeQuery(sql);
	if (queryRes != null)
		{
			
			for (var i = 0; i < queryRes.size(); i++)
			{	
				var tempRow = queryRes.get(i);
                var cr = tempRow.getItem("cr");
                var tribe = tempRow.getItem("trb");
			}
		}

    var zone = _server.getCurrentZone();
	var room = zone.getRoom(fromRoom);
	var value = room.getVariable("tb").getValue();
	var parts = cr.split(",");
    var yeknom = parts[0];
    var huhulo = parts[1];
	
	if (value == "1" || tribe == "1" && value == "0") var money = yeknom;
    if (value == "2" || tribe == "2" && value == "0") var money = huhulo;
	
	if (math == "+") var opiration = (money + much);
	if (math == "-") var opiration = (money - much);
	if (math == "*") var opiration = (money * much);
	if (math == "/") var opiration = (money / much);
	 
    if (value == "1" || tribe == "1" && value == "0") var save = opiration+","+huhulo;
    if (value == "2" || tribe == "2" && value == "0") var save = yeknom+","+opiration;
    
	saveDB("userlogin", "cr", save, user);
	
	var resp = {};
	resp._cmd = "purse";
    resp.cr = save;
	_server.sendResponse(resp, -1, null, [user], "xml");
	
	return save;
	
}


function saveDB(table, column, value, user)
{
var dbase = _server.getDatabaseManager();
var username = user.getName();
var sql = "UPDATE "+table+" SET "+column+"='" + _server.escapeQuotes(value) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
var success = dbase.executeCommand(sql);		
}

