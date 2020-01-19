/*
* Initializion point:
*
* this function is called as soon as the extension
* is loaded in the server.
*
* You can add here all the initialization code
*
*/
var dbase

function init()
{
   trace("MyGame server is starting now !")

   // get a reference to the database manager object
   // This will let you interact the database configure for this zone
   dbase = _server.getDatabaseManager()

}


/*
* This method is called by the server when an extension
* is being removed / destroyed.
*
* Always make sure to release resources like setInterval(s)
* open files etc in this method.
*
* In this case we delete the reference to the databaseManager
*/
function destroy()
{
   // Release the reference to the dbase manager
   delete dbase
}



function handleRequest(cmd, params, user, fromRoom)
{
   trace("cmd received: " + cmd)

}

function handleInternalEvent(evt)
{
       
   trace("Event received: " + evt.name)
   if (evt.name == "loginRequest")
   {
   var nick = evt["nick"]
   var pass = evt["pass"]
   var chan = evt["chan"]
   var zone = _server.getCurrentZone()
   
   var sql = "SELECT * FROM cc_user WHERE username='"+nick+"'"
   var response = new Object()
   var queryRes = dbase.executeQuery(sql)
   var isAccount = queryRes.size()
   if (isAccount == 0){
     trace("Faild Account")
      response.err = "هذا الحساب غير موجود."
      response._cmd = "logKO"
     _server.sendResponse(response, -1, null, chan)
   }else{
      var row = queryRes.get(0)
      var username = row.getItem("username")
      var pass2 = _server.md5(_server.getSecretKey(chan)+row.getItem("password"))
      if (nick == username && pass == pass2) {
         var obj = _server.loginUser(nick, pass, chan)
         if (obj.success == false) {
            response.err = obj.error
         } else if (obj.success == true) {
            var user = _server.getUserByChannel(chan);
            var u = _server.instance.getUserByChannel(chan);
            var sql3 = "SELECT * FROM cc_user WHERE username='"+u.getName()+"'"
            var queryRes3 = dbase.executeQuery(sql3)
            var row3 = queryRes3.get(0)
            var statusID = row3.getItem("status_ID");
            if (statusID == 7 || statusID == 8) {
               user.setAsModerator(true)
            }
            isMod = user.isModerator();
            id = user.getUserId();
            var msg = "<msg t='sys'><body action='logOK' r='0'>";
            msg+= "<login n='"+u.getName()+"' id='"+u.getUserId()+"' mod='"+u.isModerator()+"' />";
            msg+= "</body></msg>";

            _server.sendGenericMessage(msg, null, [u])
         
         response._cmd = "init"
         response.name = nick;
         response.id = id;
         response.mail = row3.getItem("mail");
         response.had = row3.getItem("homeAddr");
         response.hid = row3.getItem("home_ID");
         response.st = row3.getItem("status_ID");
         response.mbr = "0,Visitor|1,Banned|2,Unconfirmed|3,Explorer|7,Moderator|8,Super Moderator|4,Resident";
         response.prm = row3.getItem("permission_id");
         response.prtb = row3.getItem("previousTribe");
         response.invars = row3.getItem("inventory");
         response.pvars = row3.getItem("pzl");
         response.lvl = row3.getItem("level");
         response.lang = row3.getItem("lang_id");
         response.dotutorial = row3.getItem("dotutorial");
         response.hp = row3.getItem("happyness");
         response.cr = row3.getItem("money");
         var skill = new Object()
         skill[0] = row3.getItem("skill1");
         skill[1] = row3.getItem("skill2");
         response.skill = skill;
         response.maskc = row3.getItem("mask_colors");
         response.btl = row3.getItem("btl");
         response.motd = row3.getItem("MOTD");
         response.mask = row3.getItem("mask");
         response.sex = row3.getItem("sex");
         response.perfs = row3.getItem("perfs");
         response.jd = row3.getItem("register_date");
         response.mgam = row3.getItem("mgam");
         response.gam = row3.getItem("gam");
         response.abt = row3.getItem("about");
         response.medals = row3.getItem("medals");
         response.tb = row3.getItem("tribe_ID");
         clothes = row3.getItem("clothing");
         var tribes = []
         var sql2 = "SELECT * FROM cc_tribes"
         var queryRes2 = dbase.executeQuery(sql2)
         for (var i = 0; i < queryRes2.size(); i++)
            {
               var tempRow2 = queryRes2.get(i);
               var tribeInfo = {}
               tribeInfo.id    = Number(tempRow2.getItem("ID"))
               tribeInfo.name    = tempRow2.getItem("name")
               tribeInfo.chief = tempRow2.getItem("chief_id")
               tribes.push(tribeInfo)
            }
      response.tribeData = tribes
      _server.sendResponse(response, -1, null, [u])
      var variables = {}
      variables.$trb = String(row3.getItem("tribe_ID"));
      variables.$chr = String(row3.getItem("sex")+"!"+row3.getItem("mask")+"!"+row3.getItem("mask_colors"));
      _server.setBuddyVariables(u, variables)
      }
   }else{
         trace("Incorrect username or password error...hmmm")
         response._cmd = "logKO"
         response.err = "#ERR1"
         _server.sendResponse(response, -1, null, chan)
      }
}

}else if (evt.name == "userJoin"){
         var r = evt["room"]
         var u = evt["user"]
         trace("User: " + u.getName() + " joined room: " + r.getName())
         if (r.getId() == 1) {
            var sql3 = "SELECT * FROM cc_user WHERE username='"+ u.getName() +"'"
            var queryRes3 = dbase.executeQuery(sql3)
            var row3 = queryRes3.get(0)
            var uVars = {}
            uVars.chr = row3.getItem("sex")+"!"+row3.getItem("mask")+"!"+row3.getItem("mask_colors");
            uVars.usr = u.getUserId();
            uVars.clth = String(row3.getItem("clothing"));
            uVars.hpy = String(row3.getItem("happyness"));
            money = row3.getItem("money");
            moneyArray = money.split(",");
            uVars.cr = Number(moneyArray[0])
            uVars.trb = String(row3.getItem("tribe_ID"));
            _server.setUserVariables(u, uVars, true)
         }
}else if (evt.name == "userExit"){

      
      }
}