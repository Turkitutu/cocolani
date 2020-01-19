function init(){


}


function destroy(){
	
	
	
}

function handleInternalEvent(evt)
{
	
	
}



function handleRequest(cmd, params, user, fromRoom, protocol)
{
// get info from the database

	var dbase = _server.getDatabaseManager()
    var username = user.getName()
    var sql_full = "SELECT * FROM userlogin WHERE username = '" + _server.escapeQuotes(username) + "'"; 
    var queryRes_full = dbase.executeQuery(sql_full)
	if (queryRes_full != null)
		{		
			for (var i = 0; i < queryRes_full.size(); i++)
			{	
				var tempRow_full = queryRes_full.get(i)
				var store = tempRow_full.getItem("store")
				var lang = tempRow_full.getItem("lang")
				var hp = tempRow_full.getItem("hp")
				var pvars = tempRow_full.getItem("pvars")
				var invars = tempRow_full.getItem("invars")
				var invtrick = ","+invars
				var invtrick1 = ","+invars+","
			}  
		}
	

	
	if(cmd == "BOT_give")  // open

	{	

		  
	  var sql99 = "SELECT * FROM obj_item WHERE id = '" + _server.escapeQuotes(params.id) + "'"; 
      var queryRes99 = dbase.executeQuery(sql99)
	  if (queryRes99 != null)
		{
			for (var i = 0; i < queryRes99.size(); i++)
			{	
				var tempRow99 = queryRes99.get(i)
                var item = tempRow99.getItem("obj")
				var item_ar = tempRow99.getItem("obj_ar")
                var obj_name = tempRow99.getItem("obj_name")
				var obj_name_ar = tempRow99.getItem("obj_name_ar")
				var objcry = tempRow99.getItem("price")
				var image = tempRow99.getItem("image")
				var objid = tempRow99.getItem("id")

			}
		}
		
		
// اللغة 


	    if (lang == "0")
	    {
		var namee = obj_name
		var obj = item
	    }else{
        var namee = obj_name_ar
	    var obj = item_ar
		}		
	
	
// موقع القطعة بالمخزون
		
		if(store.indexOf("|"+obj) != -1 ) // اخر شي بالمخزون
        {
	    var trick = "|"+obj
	    }else if(store.indexOf("|"+obj+"|") != -1 ) // وسط المخزون
	    {
	    var trick = "|"+obj
	    }else if(store.indexOf(obj+"|") != -1 ) // اول المخزون 
	    {
	    var trick = obj+"|"
	    }else if(store.indexOf(obj) != -1 ) // الشي الوحيد بالمخزون
	    {
	    var trick = obj
	    }


	
// Bots with one obj 
		
	if(params.botid == "3" || params.botid == "5" )  // Eazy Bots
	
    {	
		
		if (params.botid == "3")  // العجوز في المنارة
	    {	
        var needs = "57"
		var pzl_id = ""
		var prize = 25
		}else if (params.botid == "5")  // التاجر لما تعطيه جوز هند من المزرعة
	    {	
        var needs = "58"
		var pzl_id = ""
		var prize = 25
		}
				

		
    // work start
		
    if (invtrick.indexOf(","+params.id) != -1) // اذا اعطى نفس الشيئ مرتين
		
	{
	var responseObj = {}
    responseObj._cmd = "sceneRep"
	responseObj.sub = "puz"
	responseObj.nowant = "0" 
	_server.sendResponse(responseObj, -1, null, [user], "xml")	
	
	}else if(needs.indexOf(params.id) != -1 && invtrick.indexOf(","+params.id) == -1)   // اذا اعطى للتاجر شيئ مفيد	
	
	{

    //invars	
	
	if (invars.length() != 0)
    {
	var addin = ""+invars+","+params.id+""
	}else{
	var addin = params.id 
	}	
			
	var responseObj = {}
    responseObj._cmd = "sceneRep"
	responseObj.sub = "puz"
	responseObj.invvar = addin
	responseObj.di = params.id 
	responseObj.nw = "1"	
	responseObj.win = "1"
	responseObj.botid = params.botid

	
	_server.sendResponse(responseObj, -1, null, [user], "xml")	
		
	var sql = "UPDATE userlogin SET invars='" + _server.escapeQuotes(addin) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql)	
		
    //delete

	var responseObj = {}
    responseObj._cmd = "dinv"
    responseObj.id = params.id
	_server.sendResponse(responseObj, -1, null, [user], "xml")	
		
    var empty = ""
	var delet = store.replace(trick, empty)
	var sql = "UPDATE userlogin SET store='" + _server.escapeQuotes(delet) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql)
	
    // add prize 25 coins
	
    var fonc = selectmoney(user, fromRoom)
    var cr =  Number(fonc)
	var opi = (cr + prize)
    var over = savemoney(user, fromRoom, opi)

	}
	
	}	


// Bots with multi objs

    if(params.botid == "1" || params.botid == "2" || params.botid == "4" )  // Hards Bots
	
    {	
	    if(params.botid == "1")  // التاجر لما يصنع لك حقيبة توت
	    {	
		var prize = "57~57~37~Bag of berries~Bag of berries~0~0~0~0"
		var prize_ar = "57~57~37~حقيبة التوت~حقيبة التوت~0~0~0~0"
		var needs = "8,2,7,6,3,4,1"
		var pzl_id = ""
	    }else if (params.botid == "2") // الى يصنع خودة المنجم
	    {	
		var prize = "409~409~409~Helmet~Helmet~2~1~0~0"
		var prize_ar = "409~409~409~خودة~خودة~2~1~0~0"
		var needs = "9,12,13,10,15,11,14"
		var pzl_id = ""
		}else if (params.botid == "4")  // الى يصنع شعلة
	    {	
		var prize = "701~701~701~Torch~Torch~4~1~0~0"
		var prize_ar = "701~701~701~شعلة~شعلة~4~1~0~0"
		var needs = "50,51,49,48"
		var pzl_id = ""
	    }
		

        var needss = ","+needs+","
		
// work		
		
	if(needss.indexOf(","+params.id+",") == -1)   // اذا اعطى الاعب شيئا غير مرغوب فيه
	
	{	
    trace("-------------------------------------------------------")
	trace("nowant")
	var responseObj = {}
    responseObj._cmd = "sceneRep"
	responseObj.sub = "puz" 
	responseObj.nowant = "1" // لا اريد هذه القطعة
	_server.sendResponse(responseObj, -1, null, [user], "xml")	
				
	}else if (invtrick1.indexOf(","+params.id+",") != -1) // اذا اعطى شيئا اعطاه سابقا
		
	{
    trace("-------------------------------------------------------")
	trace("keep")
	var responseObj = {}
    responseObj._cmd = "sceneRep"
	responseObj.sub = "puz"
	responseObj.keep = "1" // احتفظ بهذه القطعة انها لك
	_server.sendResponse(responseObj, -1, null, [user], "xml")	
	
	}else if(needss.indexOf(","+params.id+",") != -1 && invtrick1.indexOf(","+params.id+",") == -1)   // اذا اعطى للتاجر شيئ مفيد
		
	{

    //delete

	var responseObj = {}
    responseObj._cmd = "dinv"
    responseObj.id = params.id
	_server.sendResponse(responseObj, -1, null, [user], "xml")	
		
    var empty = ""
	var delet = store.replace(trick, empty)
	var sql = "UPDATE userlogin SET store='" + _server.escapeQuotes(delet) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql)

    //invars
   		
	if (invars.length() != 0)
    {
	var addin = ""+invars+","+params.id+""
	}else{
	var addin = params.id 
	}	
	
	var sql = "UPDATE userlogin SET invars='" + _server.escapeQuotes(addin) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql)	

   	 var dbase99 = _server.getDatabaseManager()
     var username = user.getName()
     var sql99 = "SELECT * FROM userlogin WHERE username = '" + _server.escapeQuotes(username) + "'"; 
     var queryRes99 = dbase99.executeQuery(sql99)
	 if (queryRes99 != null)
		{		
			for (var i = 0; i < queryRes99.size(); i++)
			{	
				var tempRow99 = queryRes99.get(i)
				var invars99 = tempRow99.getItem("invars")
				var invtrick99 = ","+invars99
			}
		}	
	
// magic code 	

	    var step1 = ","+needs+","
        var cut = step1.replace(","+params.id, "")
		var tes = cut.replace(",", "")
		var don = tes.split(",");
		
		var item1 = ","+don[0]+","
		var item2 = ","+don[1]+","
		var item3 = ","+don[2]+","
		if (params.botid == "1" || params.botid == "2" ) 
	    {	
		var item4 = ","+don[3]+","
		var item5 = ","+don[4]+","
		var item6 = ","+don[5]+","
        }else{
        var item4 = ""
		var item5 = ""
		var item6 = ""
		}
		
		if(invtrick99.indexOf(item1) != -1 && invtrick99.indexOf(item2) != -1 && invtrick99.indexOf(item3) != -1 && invtrick99.indexOf(item4) != -1 && invtrick99.indexOf(item5) != -1 && invtrick99.indexOf(item6) != -1)  
	    {
        var check = "1"
        }else{
        var check = "0"
		}	

// check		
		
	if (check == "1")  // اذا اعطى غرض لانهاء اللغز
	{
	trace("-------------------------------------------------------")
	trace("win")
	
	var responseObj = {}
    responseObj._cmd = "sceneRep"
	responseObj.sub = "puz"
	responseObj.invvar = addin
	responseObj.di = params.id 
	responseObj.win = "1"
	responseObj.nw = "1"
	responseObj.botid = params.botid
	responseObj.nm = namee
	_server.sendResponse(responseObj, -1, null, [user], "xml")
	
	if (lang == "0")
    {
    var reward = prize
	}else{
    var reward = prize_ar
    }
	
	var responseObj = {}
    responseObj._cmd = "buy"
    responseObj.adinv = reward 
	_server.sendResponse(responseObj, -1, null, [user], "xml")
	
	if (store.length() != 0)
    {
	var additem = ""+store+"|"+reward+""
	}else{
    var additem = reward
	}
	var sql3 = "UPDATE userlogin SET store='" + _server.escapeQuotes(additem) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql3)
	
	if (params.botid == "1")
    { 
	// add prize 25 coins
	
    var fonc = selectmoney(user, fromRoom)
    var cr =  Number(fonc)
	var opi = (cr + 25)
    var over = savemoney(user, fromRoom, opi)	
	}
	
	}else{

	var responseObj = {}
    responseObj._cmd = "sceneRep"
    responseObj.di = params.id 
	responseObj.sub = "puz"
	responseObj.botid = params.botid
	responseObj.nm = namee
	responseObj.invvar = addin
	responseObj.nw = "1"
	_server.sendResponse(responseObj, -1, null, [user], "xml")
	
	

	}
	}	
	}	
	
	 if(params.botid == "6" )  // الزر الى بمملكة الجليد
	
    {

	 _server.banUser(bannableUser, 99999, "You're banned! /n لقد تم حضرك ", _server.BAN_BY_NAME)
	
    }
	
    }
	
		if(cmd == "pzl")  // open

	{
	
	  var sql99 = "SELECT * FROM obj_item WHERE id = '" + _server.escapeQuotes(params.id) + "'"; 
      var queryRes99 = dbase.executeQuery(sql99)
	  if (queryRes99 != null)
		{
			for (var i = 0; i < queryRes99.size(); i++)
			{	
				var tempRow99 = queryRes99.get(i)
                var item = tempRow99.getItem("obj")
				var item_ar = tempRow99.getItem("obj_ar")

			}
		}
     		
//monky	
	
    if(fromRoom == "12") // القرد في الخلد
	{
	var monky = 14
    }else if (fromRoom == "2") // القرد في البنك
	{
	var monky = 13
	}else if (fromRoom == "3") //القرد عند باب المعبد
    {
	var monky = 17
	}else if (fromRoom == "41") // القرد عند التمثال
	{
	var monky = 16
	}else if (fromRoom == "8") //  القرد في السوق
	{
	var monky = 15
	}else if (fromRoom == "33") //  الاحجار الثلاثة فوق الجبل 
	{
	
	if (params.id == "19") // الحجر الناري 
	{
	var monky = 10		
	}else if (params.id == "17") // الحجر الغاضب الاول
	{	
	var monky = 8	
	}else if (params.id == "18") // الحجر الغاضب الثاني
	{	
	var monky = 9
	}
	
    }
	
// اللغة 


	if (lang == "0")
    {
    var banana = item
	}else{
    var banana = item_ar
    }
    
	
	if(store.indexOf("|"+banana) != -1 ) // اخر شي بالمخزون
    {
	var trick = "|"+banana
	}else if(store.indexOf("|"+banana+"|") != -1 ) // وسط المخزون
	{
	var trick = "|"+banana
	}else if(store.indexOf(banana+"|") != -1 ) // اول المخزون 
	{
	var trick = banana+"|"
	}else if(store.indexOf(banana) != -1 ) // الشي الوحيد بالمخزون
	{
	var trick = banana
	}
	 
	
// invars	
	
	if (invars.length() != 0)
    {
	var addin = ""+invars+","+params.id+""
	}else{
	var addin = params.id 
	}	
		
	var responseObj = {}
    responseObj._cmd = "sceneRep"
    responseObj.invvar = addin
	
	_server.sendResponse(responseObj, -1, null, [user], "xml")
	
	var sql = "UPDATE userlogin SET invars='" + _server.escapeQuotes(addin) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql)
	
//delete

    var empty = ""
	var delet = store.replace(trick, empty)
	var sql = "UPDATE userlogin SET store='" + _server.escapeQuotes(delet) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql)


	var responseObj = {}
    responseObj._cmd = "dinv"
    responseObj.id = params.id
	
	_server.sendResponse(responseObj, -1, null, [user], "xml")
	
	
//pvars

    if (pvars.length() != 0)
    {
	var addmonky = ""+pvars+","+monky+""
	}else{
	var addmonky = monky 
	}

	var responseObj = {}
    responseObj._cmd = "sceneRep"
    responseObj.sub = "puz"
	responseObj.pzlupd = addmonky
		
	_server.sendResponse(responseObj, -1, null, [user], "xml")
	
    var sql = "UPDATE userlogin SET pvars='" + _server.escapeQuotes(addmonky) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql)

	}
	
	
	if(cmd == "bribe")  // closed
	{
			 
	var responseObj = {}
	var fonc = selectmoney(user, fromRoom)
    var cr =  Number(fonc)

	 
	 if ( cr >= 50){
	 responseObj._cmd = "sceneRep"
	 responseObj.sub = "bribe"
	 responseObj.res = "1"
	 
	 }else{
	 responseObj._cmd = "sceneRep" 
	 responseObj.sub = "bribe"
	 responseObj.res = "0"
	 }
	 
	_server.sendResponse(responseObj, -1, null, [user], "xml")
	
    if (responseObj.res == "1")
	{	
	
	var opi = (cr - 50)
    var over = savemoney(user, fromRoom, opi)

    }

}

	if(cmd == "claimreward")  // open
	{	

	
	    if (fromRoom == "23" || fromRoom == "33") // النقود في بداية المنجم داخل الخزانة  // او الاحجية الى فوق الجبل 
	
	{
		
		if (params.id == "1") // العملات باول خزانة
	{
		var prize = 25
		var theid = 2
		
	}else if (params.id == "2") // العملات باخر خزانة
	{	
		var prize = 50  
		var theid = 3
		
	}else if (params.id == "11") // الاحجية الى فوق الجبل
	{	
		var prize = 100  
		var theid = 11
	}
	
		
    

// purse 

    var fonc = selectmoney(user, fromRoom)
    var cr =  Number(fonc)
	var opi = (cr + prize)
    var over = savemoney(user, fromRoom, opi)
	   
//pvars		
		
	if (pvars.length() != 0)
    {
	var addpzl = ""+pvars+","+theid+""
	}else{
	var addpzl = theid
	}
	
	var responseObj = {}
    responseObj._cmd = "sceneRep"
    responseObj.id = theid 
	responseObj.sub = "puz"
	responseObj.pzlupd = addpzl
	_server.sendResponse(responseObj, -1, null, [user], "xml")
	
	var sql = "UPDATE userlogin SET pvars='" + _server.escapeQuotes(addpzl) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql)	
				
	}
	

    if (fromRoom == "8" || fromRoom == "15") // جائزة انقاد القبيلة قبعة احتفال او 250 من العملة
	
	{
		
		if (fromRoom == "8") // سوق يكنوم
	{
		var item = "410~68~410~Celebration Yeknom Hat~Celebration Hat~2~1~0~0"
		var item_ar = "410~68~410~قبعة احتفال يكنوم~قبعة احتفال يكنوم~2~1~0~0"
		var prize = 250
		var theid = 20
		
	}else if (fromRoom == "15") // سوق هوهولو
	{	
	    var item = "411~69~411~Celebration Huhu Hat~Celebration Hat~2~1~0~0"
		var item_ar = "411~69~411~قبعة احتفال هوهولو~قبعة احتفال هوهولو~2~1~0~0"
		var prize = 250  
		var theid = 21	
	}
	
		
	if (lang == "0")
    {
    var item = item
	}else{
    var item = item_ar
    }

	
	if (params.id == "1") // اختيار قبعة احتفال
	{
	
	var responseObj = {}
    responseObj._cmd = "buy"
    responseObj.adinv = item 
	_server.sendResponse(responseObj, -1, null, [user], "xml")
	
	if (store.length() != 0)
    {
	var additem = ""+store+"|"+item+""
	var sql2 = "UPDATE userlogin SET store='" + _server.escapeQuotes(additem) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql2)
	}else{
	var sql3 = "UPDATE userlogin SET store='" + _server.escapeQuotes(item) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql3)
	
	}
	
	}else if (params.id == "2") // اختيار 250 من العملة
	{

    var fonc = selectmoney(user, fromRoom)
    var cr =  Number(fonc)
	var opi = (cr + prize)
    var over = savemoney(user, fromRoom, opi)
	   
	}		
		
	if (pvars.length() != 0)
    {
	var addpzl = ""+pvars+","+theid+""
	}else{
	var addpzl = theid
	}
	
	var responseObj = {}
    responseObj._cmd = "sceneRep"
    responseObj.id = theid 
	responseObj.sub = "puz"
	responseObj.pzlupd = addpzl
	
	_server.sendResponse(responseObj, -1, null, [user], "xml")
	
	var sql = "UPDATE userlogin SET pvars='" + _server.escapeQuotes(addpzl) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql)	
				
	}

// لغز الشاطئ		
	
    if (fromRoom == "37") // لغز الشاطئ
	{
	
	if (lang == "0")
    {
    var item = "705~705~705~Summer Camp Beach Ball~Beach Ball~4~1~0~0"
	}else{
    var item = "705~705~705~كرة شاطئ~كرة شاطئ~4~1~0~0"
    }
	
	var prize = 300
	var theid = 22

// purse
	
	var fonc = selectmoney(user, fromRoom)
    var cr =  Number(fonc)
	var opi = (cr + prize)
    var over = savemoney(user, fromRoom, opi)
	
// buy	 

    var responseObj = {}
    responseObj._cmd = "buy"
    responseObj.adinv = item 
	_server.sendResponse(responseObj, -1, null, [user], "xml")
	
	if (store.length() != 0)
    {
	var additem = ""+store+"|"+item+""
	var sql2 = "UPDATE userlogin SET store='" + _server.escapeQuotes(additem) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql2)
	}else{
	var sql3 = "UPDATE userlogin SET store='" + _server.escapeQuotes(item) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql3)
	}
	

    if (pvars.length() != 0)
    {
	var addpzl = ""+pvars+","+theid+""
	}else{
	var addpzl = theid
	}
	
	var responseObj = {}
    responseObj._cmd = "sceneRep"
    responseObj.id = theid 
	responseObj.sub = "puz"
	responseObj.pzlupd = addpzl
	
	_server.sendResponse(responseObj, -1, null, [user], "xml")
	
	var sql = "UPDATE userlogin SET pvars='" + _server.escapeQuotes(addpzl) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql)
	
	}
	
// اعطاء رأس القرد الاخضر ليمو
	
	if(fromRoom == "49") // اعطاء رأس القرد الاخضر ليمو
  {
  
  
    if (lang == "0")
    {
    var green = "59~59~39~Green monkey gem~Green monkey gem~0~0~0~0"
	}else{
    var green = "59~59~39~رأس القرد الاخضر~رأس القرد الاخضر~0~0~0~0"
    }
			
	
	if(store.indexOf("|"+green) != -1 ) // اخر شي بالمخزون
    {
	var trick = "|"+green
	}else if(store.indexOf("|"+green+"|") != -1 ) // وسط المخزون
	{
	var trick = "|"+green
	}else if(store.indexOf(green+"|") != -1 ) // اول المخزون 
	{
	var trick = green+"|"
	}else if(store.indexOf(green) != -1 ) // الشي الوحيد بالمخزون
	{
	var trick = green
	}	
		

//delete
    
    var empty = ""
	var delet = store.replace(trick, empty)
	var sql = "UPDATE userlogin SET store='" + _server.escapeQuotes(delet) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql)

	
	var responseObj = {}
    responseObj._cmd = "dinv"
    responseObj.id = "59"
	
	_server.sendResponse(responseObj, -1, null, [user], "xml")

//pvars

    var num = "19"
	
    if (pvars.length() != 0)
    {
	var pzl = ""+pvars+","+num+""
	}else{
	var pzl = num 
	}

	var responseObj = {}
    responseObj._cmd = "sceneRep"
    responseObj.sub = "puz"
	responseObj.pzlupd = pzl
		
	_server.sendResponse(responseObj, -1, null, [user], "xml")
	
    var sql = "UPDATE userlogin SET pvars='" + _server.escapeQuotes(pzl) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql)	
		
// purse 

    var fonc = selectmoney(user, fromRoom)
    var cr =  Number(fonc)
	var opi = (cr + 250)
    var over = savemoney(user, fromRoom, opi)		
		
// invars	
	 
	var thenum = 59
	
	if (invars.length() != 0)
    {
	var addgem = ""+invars+","+thenum+""
	}else{
	var addgem = thenum
	}	
	
	var sql = "UPDATE userlogin SET invars='" + _server.escapeQuotes(addgem) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql)
		
	    }
	
	}
	
	
	
		if(cmd == "energy")  // closed

	{	
	
	 	if(params.id == "1") 
		{
		var price = 5
	    }else if (params.id == "2")
		{
		var price = 10
	    }else if (params.id == "3")
		{
		var price = 14
		}
		
// purse 
		
	var fonc = selectmoney(user, fromRoom)
    var cr =  Number(fonc)
	var opi = (cr - price)
    var over = savemoney(user, fromRoom, opi)
	
  

	}
	
		if(cmd == "tuberide")  // closed

	{	
	var price =  Number(params.id) 		
	var fonc = selectmoney(user, fromRoom)
    var cr =  Number(fonc)
	var opi = (cr - price)
    var over = savemoney(user, fromRoom, opi)
	
	}
	
	   if(cmd == "pzldrp") 

	{	
	
	  var sql99 = "SELECT * FROM obj_item WHERE id = '" + _server.escapeQuotes(params.id) + "'"; 
      var queryRes99 = dbase.executeQuery(sql99)
	  if (queryRes99 != null)
		{
			for (var i = 0; i < queryRes99.size(); i++)
			{	
				var tempRow99 = queryRes99.get(i)
                var item = tempRow99.getItem("obj")
				var item_ar = tempRow99.getItem("obj_ar")

			}
		}	

	
	if (lang == "0")
    {
    var obj = item
	}else{
    var obj = item_ar
    }
		
	
    if(store.indexOf("|"+obj) != -1 ) // اخر شي بالمخزون
    {
	var trick = "|"+obj
	}else if(store.indexOf("|"+obj+"|") != -1 ) // وسط المخزون
	{
	var trick = "|"+obj
	}else if(store.indexOf(obj+"|") != -1 ) // اول المخزون 
	{
	var trick = obj+"|"
	}else if(store.indexOf(obj) != -1 ) // الشي الوحيد بالمخزون
	{
	var trick = obj
	}	
		
// invars	
	
	if (invars.length() != 0)
    {
	var addin = ""+invars+","+params.id+""
	}else{
	var addin = params.id 
	}	
		
	var responseObj = {}
    responseObj._cmd = "sceneRep"
	responseObj.id = params.id 
	responseObj.sub = "puz"
    responseObj.invvar = addin
	
	_server.sendResponse(responseObj, -1, null, [user], "xml")
	
	var sql = "UPDATE userlogin SET invars='" + _server.escapeQuotes(addin) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql)
	
//delete

    var empty = ""
	var delet = store.replace(trick, empty)
	var sql = "UPDATE userlogin SET store='" + _server.escapeQuotes(delet) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sql)


	var responseObj = {}
    responseObj._cmd = "dinv"
    responseObj.id = params.id 
	
	_server.sendResponse(responseObj, -1, null, [user], "xml")	
		
		
		
   
	     
	}
	
	
	
	

   if(cmd == "scrt") 

	{	
	
    var z = _server.getCurrentZone()
	var r = z.getRoom(fromRoom)
	
	var rVars = []
	rVars.push( {name:"door", val:1, priv:false, persistent:false} )
    _server.setRoomVariables(r, user, rVars)
	wait(13000)
	var rVars = []
	rVars.push( {name:"door", val:0, priv:false, persistent:false} )
    _server.setRoomVariables(r, user, rVars)
	
	     
	}	
	
	
	if(cmd == "doneTutorial")  // open

	{	

	var ok = _server.joinRoom(user, fromRoom, true, 4)
	
	}

}

function wait(ms){
   var start = new Date().getTime();
   var end = start;
   while(end < start + ms) {
     end = new Date().getTime();
  }
}

function selectmoney(user, fromRoom)
{
    var dbase = _server.getDatabaseManager()
    var username = user.getName()
    var sql = "SELECT * FROM userlogin WHERE username = '" + _server.escapeQuotes(username) + "'"; 
    var queryRes = dbase.executeQuery(sql)
	if (queryRes != null)
		{
			
			for (var i = 0; i < queryRes.size(); i++)
			{	
				var tempRow = queryRes.get(i)
                var cr = tempRow.getItem("cr")
                var tribe = tempRow.getItem("trb")
			}
		}

    
    var zone = _server.getCurrentZone()
	var room = zone.getRoom(fromRoom)
	var value = room.getVariable("tb").getValue()
	var parts = cr.split(",")
    var yeknom = parts[0]
    var huhulo = parts[1]
	
	 
    if (value == "1" || tribe == "1" && value == "0") // الشراء بعملة يكنوم 
    {
	var m = yeknom
    }else if (value == "2"|| tribe == "2" && value == "0") // الشراء بعملة هوهولو
	{
	var m = huhulo
	}
	
	return m
	
}

function savemoney(user, fromRoom, opi)
{
    var dbase = _server.getDatabaseManager()
    var username = user.getName()
    var sql = "SELECT * FROM userlogin WHERE username = '" + _server.escapeQuotes(username) + "'"; 
    var queryRes = dbase.executeQuery(sql)
	if (queryRes != null)
		{
			
			for (var i = 0; i < queryRes.size(); i++)
			{	
				var tempRow = queryRes.get(i)
                var cr = tempRow.getItem("cr")
                var tribe = tempRow.getItem("trb")
			}
		}

    var dbase = _server.getDatabaseManager() 
    var zone = _server.getCurrentZone()
	var room = zone.getRoom(fromRoom)
	var value = room.getVariable("tb").getValue()
	var parts = cr.split(",")
    var yeknom = parts[0]
    var huhulo = parts[1]
	 
    if (value == "1" || tribe == "1" && value == "0") // الشراء بعملة يكنوم 
    {
	var save = opi+","+huhulo
    }else if (value == "2" || tribe == "2" && value == "0") // الشراء بعملة هوهولو
	{
    var save = yeknom+","+opi
	}
	
    var sqlmoney = "UPDATE userlogin SET cr='" + _server.escapeQuotes(save) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
    var success = dbase.executeCommand(sqlmoney)
	
	if (success)
	{
	var responseObj = {}
	responseObj._cmd = "purse"
    responseObj.cr = save
	_server.sendResponse(responseObj, -1, null, [user], "xml") 
	}else{
	var responseObj = {}
    responseObj._cmd = "error" 
    responseObj.err = "error please try again  /n حدث خطأ اثناء عملية الدفع"
	_server.sendResponse(responseObj, -1, null, [user], "xml")
	}
}

function happy(user)
{
    var dbase = _server.getDatabaseManager()
    var username = user.getName()
    var sql = "SELECT * FROM userlogin WHERE username = '" + _server.escapeQuotes(username) + "'"; 
    var queryRes = dbase.executeQuery(sql)
	if (queryRes != null)
		{
			
			for (var i = 0; i < queryRes.size(); i++)
			{	
				var tempRow = queryRes.get(i)
                var hp = tempRow.getItem("hp")
			}
		}
		
	var hp1 =  Number(hp)
	var hp3 = (hp1 + 25) 	
	
	if ( hp <= 100)
		{
	        
	        if ( hp3 > 100) {
	        var new_hp = "100"
	        }else{
	        var new_hp = hp3
            }
			
			
			var responseObj = {}
		    responseObj._cmd = "hp" 
			responseObj.hp = new_hp
			
	        _server.sendResponse(responseObj, -1, null, [user], "xml")
			  
			var sql_hp = "UPDATE userlogin SET hp='" + _server.escapeQuotes(new_hp) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
            var success = dbase.executeCommand(sql_hp)
	
        }
			
}

function saveDB(table, column, value, user)
{
var dbase = _server.getDatabaseManager()
var username = user.getName()
var sql = "UPDATE "+table+" SET "+column+"='" + _server.escapeQuotes(value) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
var success = dbase.executeCommand(sql)			
}