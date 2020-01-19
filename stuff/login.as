var antihack = new Object();
function init(){
    trace("");
    trace("::::::: { Safari islands SmartFox Extension Core } :::::::");
    trace(":                                                        :");
    trace(": Version: 2.3 -- (c) 2019 fakiri25                      :");
    trace(":                                                        :");
    trace("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");
    trace("");
}

function destroy(){
	
}

function handleRequest(cmd, params, user, fromRoom, protocol)
{	

}

function handleInternalEvent(evt) {
	      	 		 
// User Try to Login	
	 
	if (evt.name == "loginRequest") 
	{	    
		var error = "";
		var nick = evt["nick"]; 
		var pass = evt["pass"]; 
		var chan = evt["chan"]; 
		var forceLogin = true; 
		
		var dbase =  _server.getDatabaseManager();
		var adminSQL = "SELECT * FROM admin ORDER BY motd"; 
	    var execute = dbase.executeQuery(adminSQL); 
        if (execute != null && execute.size() > 0) var panel = execute.get(0) 
		var st = panel.getItem("game_st"); 

		var userSQL = "SELECT * FROM userlogin WHERE username = '" + _server.escapeQuotes(nick) + "'"; 
		var queryRes = dbase.executeQuery(userSQL); 
		
            if (queryRes != null && queryRes.size() > 0) 
                {
		                    var tempRow = queryRes.get(0);
                            var statustype = tempRow.getItem("status_ID");	
                            var password = tempRow.getItem("password");							
	                        var key = _server.getSecretKey(chan); 
	                        var md5 = _server.md5(key+password);
                            if(md5 == pass){ // save some works					
						    var sex = tempRow.getItem("sex");
						    var hp = tempRow.getItem("hp"); 
						    var cr = tempRow.getItem("cr"); 
						    var date = tempRow.getItem("date"); 
						    var pref = tempRow.getItem("pref"); 
			                var mask = tempRow.getItem("mask"); 
			                var maskc = tempRow.getItem("maskc"); 
		                    var tribe = tempRow.getItem("trb"); 
		                    var profile = tempRow.getItem("about"); 
		                    var prm = tempRow.getItem("prm"); 
						    var clth = tempRow.getItem("clth");  
						    var store = tempRow.getItem("store"); 
					        var invars = tempRow.getItem("invars"); 
						    var medals = tempRow.getItem("medals"); 
						    var gam = tempRow.getItem("gam"); 
						    var pvars = tempRow.getItem("pvars"); 
						    var lang = tempRow.getItem("lang"); 
						    var hid = tempRow.getItem("home_id"); 
						    var had = tempRow.getItem("home_ad");
						    var mail = tempRow.getItem("home_mail"); 
						    var wins = tempRow.getItem("wins"); 
						    var total_battles = tempRow.getItem("total_battles"); 
						    var lvl = tempRow.getItem("lvl"); 
						    var ip = tempRow.getItem("ip"); 
							}
                }
				
// Check the username and the password	
			
		if (md5 == pass && st == "on" && statustype != "1")
		{
			var obj = _server.loginUser(nick, pass, chan, forceLogin); 
			
			if (obj.success == false){ // login fail maybe zone full or closed or ip banned ext......
			error = obj.error;	
			}else{ 
			var u = _server.getUserByChannel(chan); 
			var uid = u.getUserId();
		    var mod = u.isModerator(); 
            var ip = u.getIpAddress(); 
			var motd = panel.getItem("motd"); 
         	var huhu = panel.getItem("huhu_king"); 
            var yeknom = panel.getItem("yknm_king");
            var mod1 = panel.getItem("mod1");
		    var mod2 = panel.getItem("mod2");
			
			var login = "<msg t='sys'><body action='logOK' r='0'><login n='"+nick+"' id='"+uid+"' mod='"+mod+"' /></body></msg>"; 
		    _server.sendGenericMessage(login, null, [u]); 

            var res = {}
            res._cmd = "init";
            res.lang = lang; 
            res.motd = motd;    
            res.tb = ""+tribe+"";  
	        res.hp = hp;  
            res.gam = gam; 
	        res.maskc = maskc;  
            res.mask = mask; 
	        res.sex = sex;  
	        res.prm = prm;  
	        res.cr = ""+cr+""; 
	        res.prefs = pref;  
	        res.abt = profile; 
	        res.jd = date; 
	        res.pvars =  ""+pvars+""; 
	        res.invars = ""+invars+"";  
	        res.inv = ""+store+"";         
	        res.medals = ""+medals+""; 
            res.dotutorial = "0"; 
	        res.btl = ""+wins+";"+total_battles+""; 
	        res.skill = { "0":""+lvl+"", "1":"0" };  
	        res.prtb = "0"; 
	        res.mgam = "0:0,0:0";
	        res.mail = mail; 
			
			if (nick == ""+mod1+"" || nick == ""+mod2+"") res.st = "8";
            else res.st = statustype; 

	        if (hid != "0" && had != "0"){
	        res.hid = hid; 
	        res.had = had; 
	        } 

	        res.mbr = "0,Visitor|1,Banned|2,Unconfirmed|3,Explorer|7,Moderator|8,Super Moderator|4,Resident"; 
	        res.lvl =  "20,50,100,300,800,1800,3000,4400,6000,7800,9800,12000,14400,17000"; 
	        res.tribeData = [{"id":1,"name":"Yeknom"},{"id":2,"name":"Huhuloa"}]; 
            
            _server.sendResponse(res, -1, null, [u], "xml");		
			
			saveDB("userlogin", "ip", ip, u); 
			saveDB("userlogin", "last_login", fulldate(), u); 
			
			// put some vars
			
		    u.properties.put("date", date); 
            u.properties.put("profile", profile); 
         	u.properties.put("lang", lang); 
         	u.properties.put("lvl", lvl); 
			u.properties.put("chr", sex+"!"+mask+"!"+maskc+""); 
			u.properties.put("hid", hid); 
			u.properties.put("trb", tribe); 
			u.properties.put("clth", clth); 
			
			if (nick == ""+huhu+"")  u.properties.put("huhu", true); 
			if (nick == ""+yeknom+"") u.properties.put("yeknom", true); 

			if (nick == ""+mod1+"" || nick == ""+mod2+""){
		    u.properties.put("user", "8"); 
			}else{
			u.properties.put("user", statustype); 
			}
			
			var Bvars = {} 
            Bvars.$trb = tribe; 
            Bvars.$chr = sex+"!"+mask+"!"+maskc+""; 
			if ( had != "0") Bvars.$had = had; 
            _server.setBuddyVariables(u, Bvars);
			
            }
			
		}else{
		if (st == "off" ) error = "#ERR11"; // تسجيل الدخول متوقف حاليا
		else if (statustype == "1") error = "#ERR8"; // انت محضور
	    else error = "#ERR1"; // اسم المستخدم او كلمة المرور غير صحيحة
		}
		 
	   
	   if(error != "") {
			var res = new Object()
			res._cmd = "logKO";
			res.err = error;
			_server.sendResponse(res, -1, null, chan);		
	   }

}

// User Join Room	
 	
	if (evt.name == "userJoin" ) 
{    

    var u = evt.user;
	var username = u.getName();
    var r = evt.room;
	var rooms = u.getRoomsConnected();
	
// Avatar Sttings 

    var chr1 = u.properties.get("chr");
	if (chr1 != null) var chr = chr1; 
	
	var hid1 = u.properties.get("hid");
	if (hid1 != null) var hid = hid1;
	
	var trb1 = u.properties.get("trb");
	if (trb1 != null) var tribe = trb1;
	
	var clth1 = u.properties.get("clth");
	if (clth1 != null) var clth = clth1;
	
	var statustype1 = u.properties.get("user");
	if (statustype1 != null) var statustype = statustype1;
	
	
	var huhu1 = u.properties.get("huhu");
	if (huhu1 != null) var huhu = huhu1;
	
	var yeknom1 = u.properties.get("yeknom");
	if (yeknom1 != null) var yeknom = yeknom1;
    
    var uVars = new Object();
    uVars.clth = ""+clth+"";
    uVars.usr = ""+statustype+"";
	uVars.hpy = "100";
    uVars.trb = ""+tribe+"";
	uVars.chr = ""+chr+"";
	
	if (hid != "0" ) uVars.addr = hid;

    if (huhu == true ) uVars.chief = "1";
	
	if (yeknom == true ) uVars.chief = "2";
	
    
	if (rooms[0] != "18") uVars.cr = rooms[0]; 
	else  uVars.cr = "34";
	  
    _server.setUserVariables(u, uVars);
	
	
	if(r.getId() == "1")
	{
		var resp = {};
	    resp._cmd = "error";
	    resp.err = "اللعبة مفتوحة للابد الان و لن يتم اغلاقها لهذا المرجو نشر الرابط في كل مكان"; 
	   // _server.sendResponse(resp, -1, null, [u], "xml");
	
	}
	
	

}

// User exit

if (evt.name == "userExit")  
{
if (antihack.username != undefined) delete antihack.username;
}

	
// User lost or log out
	
if (evt.name == "logOut" || evt.name == "userLost") // عند خروج لاعب او اقفال المتصفح او الصفحة 
{
   var roomIds = evt.roomIds;
   var user = evt.user;
   var username = user.getName();

   anti_hackers(user);
   
   saveDB("userlogin", "prm", roomIds, user);
  
}
 
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
function saveDB(table, column, value, user)
{
var dbase = _server.getDatabaseManager();
var username = user.getName();
var sql = "UPDATE "+table+" SET "+column+"='" + _server.escapeQuotes(value) + "' WHERE username = '" + _server.escapeQuotes(username) + "'";
var success = dbase.executeCommand(sql);		
}

function fulldate()
{
var date = new Date();
var month = date.getMonth() +1;
var year = date.getFullYear();
var str = date.toString();
var spl = str.split(" ")
var day = spl[2];
var full = year+"-"+month+"-"+day;

return full
}