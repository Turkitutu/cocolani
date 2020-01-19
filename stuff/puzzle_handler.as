var antihack = new Object();
var counter = new Object();
function init(){

}

function destroy(){
		
}

function handleInternalEvent(evt){
    
    if (evt.name == "logOut" || evt.name == "userLost") // عند خروج لاعب او اقفال المتصفح او الصفحة 
    {
	    var user = evt.user;
        var username = user.getName();
        if (antihack.username != undefined) delete antihack.username;
    }
}

function handleRequest(cmd, params, user, fromRoom, protocol) {

    trace("cmd : "+cmd)

	var dbase = _server.getDatabaseManager();
    var username = user.getName();
    var sql_full = "SELECT * FROM userlogin WHERE username = '" + _server.escapeQuotes(username) + "'"; 
    var queryRes_full = dbase.executeQuery(sql_full);
	if (queryRes_full != null)
		{		
			for (var i = 0; i < queryRes_full.size(); i++)
			{	
				var tempRow_full = queryRes_full.get(i);
				var store = tempRow_full.getItem("store");
				var lang = tempRow_full.getItem("lang");
				var hp = tempRow_full.getItem("hp");
				var pvars = tempRow_full.getItem("pvars");
				var invars = tempRow_full.getItem("invars");
				var invtrick = ","+invars;
				var invtrick1 = ","+invars+",";
			}  
		}

	if(cmd == "BOT_give") { 

    var sql = "SELECT * FROM obj_item WHERE id = '" + _server.escapeQuotes(params.id) + "'"; 
    var queryRes = dbase.executeQuery(sql);
	if (queryRes != null)
	{
		for (var i = 0; i < queryRes.size(); i++)
		{	
			var tempRow = queryRes.get(i);
            var item = tempRow.getItem("obj");
			var item_ar = tempRow.getItem("obj_ar");
            var obj_name = tempRow.getItem("obj_name");
			var obj_name_ar = tempRow.getItem("obj_name_ar");
			var objcry = tempRow.getItem("price");
			var image = tempRow.getItem("image");
			var objid = tempRow.getItem("id");
        }
	}

	if (lang == "0") var namee = obj_name;
    if (lang == "0") var obj = item;
	if (lang == "1") var namee = obj_name_ar;
    if (lang == "1") var obj = item_ar;
	
	
    var nostop = false;
	var bullshit = ""+store+"";
    var store_array = bullshit.split("|");
		
    for (var i = 0; i < store_array.length; i++) 
    {  
        if (store_array[i] == ""+obj+"")
	    {
     	    store_array.splice(i, 1);
	        var newarray = store_array.join("|");
			var nostop = true;
	        break;
        }
    }
		
	if(params.botid == "3" || params.botid == "5" )  // بوت بسيط
	
    {		
		if (params.botid == "3"){  // العجوز في المنارة
        var needs = "57";
		var pzl_id = "";
		var prize = 25;
		}else if (params.botid == "5"){ // التاجر لما تعطيه جوز هند من المزرعة	
        var needs = "58";
		var pzl_id = "";
		var prize = 25;
		}
		
    if (invtrick.indexOf(","+params.id) != -1) {// اذا اعطى نفس الشيئ مرتين
		
	var resp = {};
    resp._cmd = "sceneRep";
	resp.sub = "puz";
	resp.nowant = "0";
	_server.sendResponse(resp, -1, null, [user], "xml");	
	
	}else if(needs.indexOf(params.id) != -1 && invtrick.indexOf(","+params.id) == -1) {   // اذا اعطى للتاجر شيئ مفيد	
	
	if (invars.length() != 0) var addin = ""+invars+","+params.id+"";
    if (invars.length() == 0) var addin = params.id;
		
	var resp = {};
    resp._cmd = "sceneRep";
	resp.sub = "puz";
	resp.invvar = addin;
	resp.di = params.id;
	resp.nw = "1";
	resp.win = "1";
	resp.botid = params.botid;
	_server.sendResponse(resp, -1, null, [user], "xml");	
		
	saveDB("userlogin", "invars", addin, user);
		
    if(nostop)
    {
	var resp = {};
    resp._cmd = "dinv";
    resp.id = params.id;
	_server.sendResponse(resp, -1, null, [user], "xml");
		
	saveDB("userlogin", "store", newarray, user);
	
	moneyDB(user, fromRoom, "+", prize);
	}
	
	}
}	

    if(params.botid == "1" || params.botid == "2" || params.botid == "4" )  // بوت معقد
	
    {	
	    if(params.botid == "1"){  // التاجر لما يصنع لك حقيبة توت
		var prize = "57~57~37~Bag of berries~Bag of berries~0~0~0~0";
		var prize_ar = "57~57~37~حقيبة التوت~حقيبة التوت~0~0~0~0";
		var needss = ",8,2,7,6,3,4,1,";
		var needs_array = [8,2,7,6,3,4,1];
		var pzl_id = "";
	    }else if (params.botid == "2"){ // الى يصنع خودة المنجم	
		var prize = "409~409~409~Helmet~Helmet~2~1~0~0";
		var prize_ar = "409~409~409~خودة~خودة~2~1~0~0";
		var needss = ",9,12,13,10,15,11,14,";
		var needs_array = [9,12,13,10,15,11,14];
		var pzl_id = "";
		}else if (params.botid == "4"){  // الى يصنع شعلة	
		var prize = "701~701~701~Torch~Torch~4~1~0~0";
		var prize_ar = "701~701~701~شعلة~شعلة~4~1~0~0";
		var needss = ",50,51,49,48,";
		var needs_array = [50,51,49,48];
		var pzl_id = "";
	    }	
		
	if(needss.indexOf(","+params.id+",") == -1) { // اذا اعطى الاعب شيئا غير مرغوب فيه
	
	var resp = {};
    resp._cmd = "sceneRep";
	resp.sub = "puz";
	resp.nowant = "1"; // لا اريد هذه القطعة
	_server.sendResponse(resp, -1, null, [user], "xml");
				
	}else if (invtrick1.indexOf(","+params.id+",") != -1) { // اذا اعطى شيئا اعطاه سابقا
		
	var resp = {};
    resp._cmd = "sceneRep";
	resp.sub = "puz";
	resp.keep = "1"; // احتفظ بهذه القطعة انها لك
	_server.sendResponse(resp, -1, null, [user], "xml");
	
	}else if(needss.indexOf(","+params.id+",") != -1 && invtrick1.indexOf(","+params.id+",") == -1) {  // اذا اعطى للتاجر شيئ مفيد

	if(nostop)
    {
	var resp = {};
    resp._cmd = "dinv";
    resp.id = params.id;
	_server.sendResponse(resp, -1, null, [user], "xml");
		
	saveDB("userlogin", "store", newarray, user);
	}
   		
	if (invars.length() != 0) var addin = ""+invars+","+params.id+"";
    if (invars.length() == 0) var addin = params.id;
		
	saveDB("userlogin", "invars", addin, user);

   	var dbase = _server.getDatabaseManager();
    var username = user.getName();
    var sql = "SELECT * FROM userlogin WHERE username = '" + _server.escapeQuotes(username) + "'"; 
    var queryRes = dbase.executeQuery(sql);
	if (queryRes != null)
		{		
			for (var i = 0; i < queryRes.size(); i++)
			{	
				var tempRow = queryRes.get(i);
				var invars = tempRow.getItem("invars");
				var invtrick99 = ","+invars;
			}
		}	
	
	    for (var i = 0; i < needs_array.length; i++) 
        {  
            if (needs_array[i] == params.id)
	        {
     	     needs_array.splice(i, 1);
	         break;
            }
        }
		
		for (var j = 0; j < needs_array.length; j++) 
        {  
            if (invtrick99.indexOf(","+needs_array[j]) != -1) {
			var check = true;
			}else{
			var check = false;
			break;
			}
        }
		
	if (check) { // اذا اعطى غرض لانهاء اللغز
	var resp = {};
    resp._cmd = "sceneRep";
	resp.sub = "puz";
	resp.invvar = addin;
	resp.di = params.id;
	resp.win = "1";
	resp.nw = "1";
	resp.botid = params.botid;
	resp.nm = namee;
	_server.sendResponse(resp, -1, null, [user], "xml");
	
	if (lang == "0") var reward = prize;
    if (lang == "1") var reward = prize_ar;
    
	var resp = {};
    resp._cmd = "buy";
    resp.adinv = reward; 
	_server.sendResponse(resp, -1, null, [user], "xml");
	
	if (store.length() != 0) var additem = ""+store+"|"+reward+"";
	if (store.length() == 0) var additem = reward;
    
	saveDB("userlogin", "store", additem, user);
	
	if (params.botid == "1")  moneyDB(user, fromRoom, "+", 25)
	
	}else{

	var resp = {};
    resp._cmd = "sceneRep";
    resp.di = params.id;
	resp.sub = "puz";
	resp.botid = params.botid;
	resp.nm = namee;
	resp.invvar = addin;
	resp.nw = "1";
	_server.sendResponse(resp, -1, null, [user], "xml");
	
	}
   }	
  }	
	
	if(params.botid == "6" )  // الزر الى بمملكة الجليد
	
    {
	 _server.banUser(user, 1, "You're banned! /n لقد تم حضرك ", _server.BAN_BY_NAME);
    }
	
}
	 
	if(cmd == "pzl") { // open

	var sql = "SELECT * FROM obj_item WHERE id = '" + _server.escapeQuotes(params.id) + "'"; 
    var queryRes = dbase.executeQuery(sql);
	if (queryRes != null)
		{
			for (var i = 0; i < queryRes.size(); i++)
			{	
				var tempRow = queryRes.get(i);
                var item = tempRow.getItem("obj");
				var item_ar = tempRow.getItem("obj_ar");
			}
		}
     		


	var monkeys = {12:14, 2:13, 3:17, 41:16, 8:15, 12:14};
	var stones = {19:10, 17:8, 18:9};


	if (lang == "0") var banana = item
    if (lang == "1") var banana = item_ar
	
	var nostop = false;
	var bullshit = ""+store+"";
	var store_array = bullshit.split("|");
		
    for (var i = 0; i < store_array.length; i++) 
    {  
        if (store_array[i] == ""+banana+"")
	    {
     	    store_array.splice(i, 1);
	        var newarray = store_array.join("|");
			var nostop = true;
	        break;
        }
    }
	   
	if(nostop)
	{

	saveDB("userlogin", "store", newarray, user);
    
	var resp = {};
    resp._cmd = "dinv";
    resp.id = params.id;
	_server.sendResponse(resp, -1, null, [user], "xml");
	}
	
	if (invars.length() != 0) var addin = ""+invars+","+params.id+"";
    if (invars.length() == 0) var addin = params.id;
		
	var resp = {};
    resp._cmd = "sceneRep";
    resp.invvar = addin;
	_server.sendResponse(resp, -1, null, [user], "xml");
	
	saveDB("userlogin", "invars", addin, user);
	
	trace("params.id : "+params.id)
	
    if (fromRoom == "33") var monky = stones[params.id];
    if (fromRoom != "33") var monky = monkeys[fromRoom];

    if (pvars.length() != 0) var addmonky = ""+pvars+","+monky+"";
    if (pvars.length() == 0) var addmonky = monky;
	
	var resp = {};
    resp._cmd = "sceneRep";
    resp.sub = "puz";
	resp.pzlupd = addmonky;
		
	_server.sendResponse(resp, -1, null, [user], "xml");
	
	saveDB("userlogin", "pvars", addmonky, user);

	}
	
	
	if(cmd == "bribe")  { // الساحر في الساحة
	
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
	 
    if (value == "1" || tribe == "1" && value == "0") var m = yeknom;
    if (value == "2"|| tribe == "2" && value == "0") var m = huhulo;

	
	var price = 50;

    var cr =  Number(m)
    var opi = (cr - 50)
	
    var resp = {}
    resp._cmd = "sceneRep"
	resp.sub = "bribe"	
	if ( cr >= 50) resp.res = "1" 
	else resp.res = "0"

	_server.sendResponse(resp, -1, null, [user], "xml")
	
    if (resp.res == "1") 
	{
	
	    if (value == "1" || tribe == "1" && value == "0") var save = opi+","+huhulo;
        if (value == "2" || tribe == "2" && value == "0") var save = yeknom+","+opi;
    
	    saveDB("userlogin", "cr", save, user);
	
	    var resp = {};
	    resp._cmd = "purse";
        resp.cr = save;
	    _server.sendResponse(resp, -1, null, [user], "xml");
	
	}

    }

	if(cmd == "claimreward") { // open
		
	    anti_hackers(user);
	
	    if (fromRoom == "23" || fromRoom == "33"){ // النقود في بداية المنجم داخل الخزانة  // او الاحجية الى فوق الجبل 
	    
		
		    if (params.id == "1"){// العملات باول خزانة
		    var prize = 25;
		    var theid = 2;
	        }else if (params.id == "2"){ // العملات باخر خزانة	
		    var prize = 50;
		    var theid = 3;
	        }else if (params.id == "11"){ // الاحجية الى فوق الجبل	
		    var prize = 100; 
		    var theid = 11;
	        }

	moneyDB(user, fromRoom, "+", prize);	
		
	if (pvars.length() != 0) var addpzl = ""+pvars+","+theid+"";
    if (pvars.length() == 0) var addpzl = theid;
	
	saveDB("userlogin", "pvars", addpzl, user);
	
	var resp = {};
    resp._cmd = "sceneRep";
    resp.id = theid;
	resp.sub = "puz";
	resp.pzlupd = addpzl;
	_server.sendResponse(resp, -1, null, [user], "xml");
				
	}
	

    if (fromRoom == "8" || fromRoom == "15") // جائزة انقاد القبيلة قبعة احتفال او 250 من العملة
	{
		if (fromRoom == "8"){ // سوق يكنوم
		var item = "410~68~410~Celebration Yeknom Hat~Celebration Hat~2~1~0~0";
		var item_ar = "410~68~410~قبعة احتفال يكنوم~قبعة احتفال يكنوم~2~1~0~0";
		var prize = 250;
		var theid = 20;
	    }else if (fromRoom == "15"){ // سوق هوهولو	
	    var item = "411~69~411~Celebration Huhu Hat~Celebration Hat~2~1~0~0";
		var item_ar = "411~69~411~قبعة احتفال هوهولو~قبعة احتفال هوهولو~2~1~0~0";
		var prize = 250;
		var theid = 21;
	    }
		
	if (lang == "0") var item = item;
    if (lang == "1") var item = item_ar;
    
	if (params.id == "1") {// اختيار قبعة احتفال

	var resp = {};
    resp._cmd = "buy";
    resp.adinv = item;
	_server.sendResponse(resp, -1, null, [user], "xml");
	
	if (store.length() != 0) var additem = ""+store+"|"+item+"";
	if (store.length() == 0) var additem = item;

	saveDB("userlogin", "store", additem, user);
	
	}

    if (params.id == "2") moneyDB(user, fromRoom, "+", prize);  // اختيار 250 من العملة
				
	if (pvars.length() != 0) var addpzl = ""+pvars+","+theid+"";
    if (pvars.length() == 0) var addpzl = theid;
	
	var resp = {};
    resp._cmd = "sceneRep";
    resp.id = theid;
	resp.sub = "puz";
	resp.pzlupd = addpzl;
	
	_server.sendResponse(resp, -1, null, [user], "xml");
	
	saveDB("userlogin", "pvars", addpzl, user);
				
	}
	
	
    if (fromRoom == "37") // لغز الشاطئ
	{
	
	if (lang == "0") var item = "705~705~705~Summer Camp Beach Ball~Beach Ball~4~1~0~0";
    if (lang == "1") var item = "705~705~705~كرة شاطئ~كرة شاطئ~4~1~0~0";
    
	var prize = 300;
	var theid = 22;

	var mny = moneyDB(user, fromRoom, "+", prize);
	
    var resp = {};
    resp._cmd = "buy";
    resp.adinv = item;
	_server.sendResponse(resp, -1, null, [user], "xml");
	
	if (store.length() != 0) var additem = ""+store+"|"+item+"";
    if (store.length() == 0) var additem = item;
	
	saveDB("userlogin", "store", additem, user);

    if (pvars.length() != 0) var addpzl = ""+pvars+","+theid+"";
    if (pvars.length() == 0) var addpzl = theid;
	
	saveDB("userlogin", "pvars", addpzl, user);
	
	var resp = {};
    resp._cmd = "sceneRep";
    resp.id = theid;
	resp.sub = "puz";
	resp.pzlupd = addpzl;
	_server.sendResponse(resp, -1, null, [user], "xml");
	
	}
	
	
	if(fromRoom == "49") { // اعطاء رأس القرد الاخضر ليمو
  
    if (lang == "0") var green = "59~59~39~Green monkey gem~Green monkey gem~0~0~0~0";
    if (lang == "1") var green = "59~59~39~رأس القرد الاخضر~رأس القرد الاخضر~0~0~0~0";
	
	var thenum = 59;
	var num = 19;
	var prize = 250;
    
    var nostop = false;
	var bullshit = ""+store+"";
	var store_array = bullshit.split("|");
		
    for (var i = 0; i < store_array.length; i++) 
    {  
        if (store_array[i] == ""+green+"")
	    {
     	    store_array.splice(i, 1);
	        var newarray = store_array.join("|");
			var nostop = true;
	        break;
        }
    }
	   
	if(nostop){
	
	saveDB("userlogin", "store", newarray, user);

	var resp = {};
    resp._cmd = "dinv";
    resp.id = "59";
	_server.sendResponse(resp, -1, null, [user], "xml");
	
    if (pvars.length() != 0) var pzl = ""+pvars+","+num+"";
    if (pvars.length() == 0) var pzl = num;
	
	var resp = {};
    resp._cmd = "sceneRep";
    resp.sub = "puz";
	resp.pzlupd = pzl;
		
	_server.sendResponse(resp, -1, null, [user], "xml");
	
	saveDB("userlogin", "pvars", pzl, user);
			
    moneyDB(user, fromRoom, "+", prize);	
	
	if (invars.length() != 0) var addgem = ""+invars+","+thenum+"";
    if (invars.length() == 0) var addgem = thenum;

	saveDB("userlogin", "invars", addgem, user);
	}
  }
}
	
	if(cmd == "energy") { 

	if(params.id == "1") var price = 5;
    if(params.id == "2") var price = 10;
    if(params.id == "3") var price = 14;
	
	moneyDB(user, fromRoom, "-", price);
	
	}
	
	
	if(cmd == "tuberide") { 
	
	var price =  Number(params.id); 		
	moneyDB(user, fromRoom, "-", price);
	
	}
	
	if(cmd == "pzldrp") {

	var sql = "SELECT * FROM obj_item WHERE id = '" + _server.escapeQuotes(params.id) + "'"; 
    var queryRes = dbase.executeQuery(sql);
	if (queryRes != null)
	{
		for (var i = 0; i < queryRes.size(); i++)
		{	
			var tempRow = queryRes.get(i);
            var item = tempRow.getItem("obj");
		    var item_ar = tempRow.getItem("obj_ar");
		}
	}	

	if (lang == "0") var obj = item;
    if (lang == "1") var obj = item_ar;
    
    var nostop = false;
	var bullshit = ""+store+"";
	var store_array = bullshit.split("|");
		
    for (var i = 0; i < store_array.length; i++) 
    {  
        if (store_array[i] == ""+obj+"")
	    {
     	    store_array.splice(i, 1);
	        var newarray = store_array.join("|");
			var nostop = true;
	        break;
        }
    }
	 
	if(nostop){
	
	saveDB("userlogin", "store", newarray, user);
	
	var resp = {};
    resp._cmd = "dinv";
    resp.id = params.id; 
	_server.sendResponse(resp, -1, null, [user], "xml");
		
	}  

	if (invars.length() != 0) var addin = ""+invars+","+params.id+"";
    if (invars.length() == 0) var addin = params.id;	
	
	saveDB("userlogin", "invars", addin, user);
		
	var resp = {};
    resp._cmd = "sceneRep";
	resp.id = params.id;
	resp.sub = "puz";
    resp.invvar = addin;
	
	_server.sendResponse(resp, -1, null, [user], "xml");
	   
}
	
	
	
	

    if(cmd == "scrt") {
	
    var z = _server.getCurrentZone();
	var r = z.getRoom(fromRoom);
	var open = 1;
    var username = user.getName();
	var rVars = [];
	rVars.push( {name:"door", val:open, priv:false, persistent:false} );
    _server.setRoomVariables(r, null, rVars);

    var prm = {};
	prm.r = r;
	prm.user = username;

    counter[username] = setInterval("wait", 13000 ,prm);

	     
	}	
	
	
	if(cmd == "doneTutorial")  // open

	{	

	var ok = _server.joinRoom(user, fromRoom, true, 4)
	
	}

}

function wait(prm)
{    
     var close = 0;
     var rVars = []
     rVars.push( {name:"door", val:close, priv:false, persistent:false} )
     _server.setRoomVariables(prm.r, null, rVars)

	 clearInterval(counter[prm.user]);

	 delete counter[prm.user];

     return;
}



function saveDB(table, column, value, user)
{
var dbase = _server.getDatabaseManager();
var username = user.getName();
var sql = "UPDATE "+table+" SET "+column+"='" + _server.escapeQuotes(value) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
var success = dbase.executeCommand(sql);			
}

function moneyDB(user, fromRoom, math, valu)
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
	
	if (value == "1" || tribe == "1" && value == "0") var moneyy = yeknom;
    if (value == "2" || tribe == "2" && value == "0") var moneyy = huhulo;
	
    var much = Number(valu);
	var money = Number(moneyy);
	
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

function anti_hackers(user)
{
    var username = user.getName();
    var ary = antihack.username 
    if (ary == undefined) ary = antihack.username = []
		
    if (user != null) 
    {   
        ary.push(getTimer());
        var thetime = ary.slice(Math.max(ary.length - 2, 1));
		
        if (thetime.length == 2)
        {
            if(thetime[1] - thetime[0] <= 100)
            {
			    var lan = user.properties.get("lang");
                if(lan != null) var lang = lan;
					
                if (lang ==  "1") var msg = "لقد تم حضرك لمحاولتك استعمال برنامج الويب برو";
                if (lang ==  "0") var msg = "You're being banned Because you tried to use Web Pro";
                var ban = _server.banUser(user, 1, msg, _server.BAN_BY_NAME);
             
                delete antihack.username;
            }
        }
    }
}

function fulldate()
{
    var date = new Date();
    var month = date.getMonth() +1
    var year = date.getFullYear()
    var str = date.toString();
    var spl = str.split(" ");
    var day = spl[2];
    var full = year+"-"+month+"-"+day;
    return full;
}