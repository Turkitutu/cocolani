var bota
var prize = new Object()

function init(){
var zone = _server.getCurrentZone();
	zone.setPubMsgInternalEvent(true);
	
}


function destroy(){
clearInterval(bota);	
}

function handleInternalEvent(evt)
{
	if (evt.name == "pubMsg")
	{
	   
		var user = evt.user;
	    var username = evt.user.getName();
        var roomid = evt.room.getId();
        var msg = evt.msg;
         
		//prize[username] = msg
		
		
		
		
        if (msg.indexOf("come bot") > -1) createbot()
		
	
    
	}
	

}

function handleRequest(cmd, params, user, fromRoom, protocol)
{	

}


function createbot(){
   
    var username = "ملك_المسابقات";
    var date = "2019-02-04";
	var profile = "مسابقات جديدة كل يوم ";
	var sex = "M";
    var mask = "0,2,2,2";
	var maskc = "800,-1000,0|255,100,0|255,255,255|248,150,-1000";
	var tribe = "1";
	var clth = "200,410,308,754";
	var statustype = "8";

    var bot = _server.createNPC(username, "127.0.0.1", 9339, "cocolani");

	if(bot != null){
	
    var store_date = bot.properties.put("date", date); 
    var store_profile = bot.properties.put("profile", profile); 
	var store_chr = bot.properties.put("chr", sex+"!"+mask+"!"+maskc+""); 
	var store_trb = bot.properties.put("trb", tribe); 
	var store_clth = bot.properties.put("clth", clth); 
	var store_usr = bot.properties.put("user", statustype); 
	var store_hid = bot.properties.put("hid", "");
			   
    var uVars = new Object();
    uVars.clth = ""+clth+"";
    uVars.usr = ""+statustype+""; 
    uVars.chr = ""+sex+"!"+mask+"!"+maskc+""
    uVars.cr = "40"
    uVars.hpy = "100"
    uVars.trb = ""+tribe+"";
    _server.setUserVariables(bot, uVars)
	
    _server.joinRoom(bot, 24, true, 4)
	
	var zone = _server.getCurrentZone();
	var room = zone.getRoom(4)
	
	var msgstart = "استعدو"
	
    var send  = _server.dispatchPublicMessage(msgstart, room,  bot)

    var things = {}
	things.count = 1
    things.user = bot
	things.room = room
	
	bota = setInterval("action", 5000 ,things) 
	
	}
	
}


function action(things)
{    
    if (things.user != null)
	{
	    var textFile = _server.readFile("sfsExtensions/info/promo.txt")
		var array = textFile.split(",")
	   
        if (things.count == array.length)
        {
        var end = "حسنا ايها الاعبون نراكم المرة القادمة"
		var send  = _server.dispatchPublicMessage(end, things.room,  things.user)
		var romove =  _server.disconnectUser(things.user)
		clearInterval(bota);
        return
		}else{	
		var send1  = _server.dispatchPublicMessage("الكود :", things.room,  things.user)
        var send  = _server.dispatchPublicMessage(array[things.count], things.room,  things.user)
		
	    var dst_x =  Math.floor(Math.random() * 400) + 100;
	    var dst_y = Math.floor(Math.random() * 400) + 100;
		
        var uVars = new Object()
	    uVars.dst = ""+dst_x+","+dst_y+""
        uVars.ps = "621.65,327.65,1"
	    uVars.cld = false
        uVars.pth = "1"
         _server.setUserVariables(things.user, uVars)
		
		
        things.count++;
		trace("things.count : "+things.count)
		
	    return things.count
        
        }	
}
}