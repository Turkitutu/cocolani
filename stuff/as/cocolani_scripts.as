// Decompiled by AS3 Sorcerer 5.72
// www.as3sorcerer.com

//------------------------------------------------------------
//cocolani_fla.mc_login_animate_4

package cocolani_fla
{
    import flash.display.MovieClip;
    import flash.events.*;
    import flash.text.*;
    import flash.geom.*;
    import flash.net.*;
    import flash.display.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.system.*;
    import flash.external.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*; 
    import flash.filters.*;
    import flash.globalization.*;
    import flash.media.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.xml.*;

    public dynamic class mc_login_animate_4 extends MovieClip 
    {

        public var thisref:*;

        public function mc_login_animate_4()
        {
            addFrameScript(0, this.frame1, 15, this.frame16, 20, this.frame21, 42, this.frame43);
        }

        internal function frame1():*
        {
            this.thisref = this;
            stop();
        }

        internal function frame16():*
        {
            this.thisref.parent.openingAnim(1);
        }

        internal function frame21():*
        {
            stop();
        }

        internal function frame43():*
        {
            this.thisref = this;
            this.thisref.parent.openingAnim(6);
        }


    }
}//package cocolani_fla

//------------------------------------------------------------
//com.cocolani.common.popup_menu

package com.cocolani.common
{
    import flash.display.MovieClip;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;
    import com.cocolani.obj.furn_wallItem;
    import com.cocolani.obj.furnItem;

    public class popup_menu extends MovieClip 
    {

        internal var thisref:*;
        internal var refobj:*;
        internal var iconArr:*;
        internal var sceneRef:*;
        internal var iwidth:* = 30;

        public function popup_menu(_arg_1:*, _arg_2:Array, _arg_3:*)
        {
            this.thisref = this;
            this.iconArr = [];
            super();
            this.refobj = _arg_1;
            this.sceneRef = _arg_3;
            var _local_4:* = getDefinitionByName("menu_popup_icon");
            var _local_5:* = 0;
            while (_local_5 < _arg_2.length)
            {
                this.iconArr[_local_5] = addChild(new (_local_4)());
                this.iconArr[_local_5].gotoAndStop(_arg_2[_local_5].id);
                this.iconArr[_local_5].addEventListener(MouseEvent.CLICK, this.click);
                this.iconArr[_local_5].x = ((_local_5 % 2) * this.iwidth);
                this.iconArr[_local_5].y = (int((_local_5 / 2)) * this.iwidth);
                _local_5++;
            };
        }

        public function click(_arg_1:MouseEvent):*
        {
            if (((this.refobj is furnItem) || (this.refobj is furn_wallItem)))
            {
                this.sceneRef.commonSceneObjClick(this.refobj, _arg_1.currentTarget.currentFrame);
            }
            else
            {
                if (this.refobj.handlesOptions)
                {
                    this.refobj.optionResult(_arg_1.currentTarget.currentFrame);
                }
                else
                {
                    this.sceneRef.optionResult(this.refobj, _arg_1.currentTarget.currentFrame);
                };
            };
        }


    }
}//package com.cocolani.common

//------------------------------------------------------------
//com.cocolani.common.simplebutton

package com.cocolani.common
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.events.MouseEvent;

    public class simplebutton extends MovieClip 
    {

        public var thetext:TextField;
        public var mytext:*;
        public var me:*;
        public var textFormat1:*;
        public var textFormat2:*;
        public var textSt:*;

        public function simplebutton()
        {
            this.me = this;
            super();
            stop();
            buttonMode = true;
            mouseChildren = false;
            this.enable();
        }

        public function setTextFormat(_arg_1:TextFormat, _arg_2:TextFormat):*
        {
            this.textFormat1 = _arg_1;
            this.textFormat2 = _arg_2;
            this.textSt = this.me.thetext.y;
        }

        public function setTextFormatStd():*
        {
            var _local_1:* = new TextFormat();
            _local_1.color = 0;
            var _local_2:* = new TextFormat();
            _local_2.color = 0xFFFFFF;
            this.setTextFormat(_local_1, _local_2);
        }

        public function rollover(e:MouseEvent):*
        {
            if (e.type == "mouseOver")
            {
                try
                {
                    if (!e.currentTarget.stage.getChildAt(0).getChildByName("cursorRef"))
                    {
                        e.currentTarget.gotoAndStop(2);
                    };
                }
                catch(e)
                {
                    e.currentTarget.gotoAndStop(2);
                };
            }
            else
            {
                if (e.type == "mouseOut")
                {
                    e.currentTarget.gotoAndStop(1);
                }
                else
                {
                    if (e.type == "mouseDown")
                    {
                        e.currentTarget.gotoAndStop(3);
                        if (e.currentTarget.stage.getChildAt(0).getChildByName("mc_interface"))
                        {
                            e.currentTarget.stage.getChildAt(0).mc_interface.audio.playSound("sfx_click");
                        };
                    }
                    else
                    {
                        if (e.type == "mouseUp")
                        {
                            e.currentTarget.gotoAndStop(2);
                        };
                    };
                };
            };
        }

        public function updtext():*
        {
            if (((getChildByName("thetext")) && (this.mytext)))
            {
                this.me.thetext.text = this.mytext;
                if (((this.textFormat2) && (currentFrame == 2)))
                {
                    this.me.thetext.setTextFormat(this.textFormat2);
                    this.me.thetext.y = (this.textSt - 2);
                }
                else
                {
                    if (this.textFormat1)
                    {
                        this.me.thetext.y = this.textSt;
                        this.me.thetext.setTextFormat(this.textFormat1);
                    };
                };
            };
        }

        public function setText(_arg_1:*):*
        {
            if (getChildByName("thetext"))
            {
                this.mytext = _arg_1;
                this.me.thetext.text = this.mytext;
            }
            else
            {
                trace(("problem setting text to  " + _arg_1));
            };
        }

        public function disable(_arg_1:Boolean=true):*
        {
            removeEventListener(MouseEvent.MOUSE_OVER, this.rollover);
            removeEventListener(MouseEvent.MOUSE_OUT, this.rollover);
            removeEventListener(MouseEvent.MOUSE_DOWN, this.rollover);
            removeEventListener(MouseEvent.MOUSE_UP, this.rollover);
            buttonMode = false;
            if (_arg_1)
            {
                gotoAndStop(4);
            };
        }

        public function enable():*
        {
            addEventListener(MouseEvent.MOUSE_OVER, this.rollover);
            addEventListener(MouseEvent.MOUSE_OUT, this.rollover);
            addEventListener(MouseEvent.MOUSE_DOWN, this.rollover);
            addEventListener(MouseEvent.MOUSE_UP, this.rollover);
            buttonMode = true;
            gotoAndStop(1);
        }


    }
}//package com.cocolani.common

//------------------------------------------------------------
//com.cocolani.common.tools

package com.cocolani.common
{
    import flash.geom.Point;
    import flash.utils.ByteArray;

    public class tools 
    {


        public function repText(_arg_1:*, _arg_2:*):*
        {
            var _local_3:* = 1;
            while (_arg_2.length > 0)
            {
                _arg_1 = ((_arg_1.substr(0, _arg_1.indexOf((("%rep" + _local_3) + "%"))) + _arg_2.shift()) + _arg_1.substr((_arg_1.indexOf((("%rep" + _local_3) + "%")) + 6), _arg_1.length));
                _local_3++;
            };
            return (_arg_1);
        }

        public function repChar(_arg_1:*, _arg_2:*, _arg_3:*):*
        {
            if (_arg_3 == _arg_2)
            {
                return ("Error.");
            };
            while (_arg_1.indexOf(_arg_2) > -1)
            {
                _arg_1 = ((_arg_1.substr(0, _arg_1.indexOf(_arg_2)) + _arg_3) + _arg_1.substr((_arg_1.indexOf(_arg_2) + 1)));
            };
            return (_arg_1);
        }

        public function convertPointToArr(_arg_1:*):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_2:* = this.clone(_arg_1);
            for (_local_3 in _local_2)
            {
                for (_local_4 in _local_2[_local_3])
                {
                    if ((_local_2[_local_3][_local_4] is Point))
                    {
                        _local_2[_local_3][_local_4] = ["p", _local_2[_local_3][_local_4].x, _local_2[_local_3][_local_4].y];
                    };
                };
            };
            return (_local_2);
        }

        public function convertArrToPoint(_arg_1:*):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_2:* = this.clone(_arg_1);
            for (_local_3 in _local_2)
            {
                for (_local_4 in _local_2[_local_3])
                {
                    if (((_local_2[_local_3][_local_4] is Array) && (_local_2[_local_3][_local_4][0] == "p")))
                    {
                        _local_2[_local_3][_local_4] = new Point(_local_2[_local_3][_local_4][1], _local_2[_local_3][_local_4][2]);
                    };
                };
            };
            return (_local_2);
        }

        public function clone(_arg_1:Object):*
        {
            var _local_2:ByteArray = new ByteArray();
            _local_2.writeObject(_arg_1);
            _local_2.position = 0;
            return (_local_2.readObject());
        }


    }
}//package com.cocolani.common

//------------------------------------------------------------
//com.cocolani.gui.ASCIIcontext

package com.cocolani.gui
{
    import flash.ui.ContextMenu;
    import flash.net.URLRequest;
    import flash.ui.ContextMenuItem;
    import flash.events.ContextMenuEvent;
    import flash.net.navigateToURL;

    public class ASCIIcontext 
    {

        private var myContextMenu:ContextMenu;
        internal var menuLabel:String = "Powered by ASCII MEDIA";
        internal var menuURL:* = new URLRequest("http://www.asciimedia.com");
        internal var myStageRef:*;

        public function ASCIIcontext(_arg_1:*)
        {
            this.myStageRef = _arg_1;
            var _local_2:* = new ContextMenu();
            _local_2.hideBuiltInItems();
            var _local_3:ContextMenuItem = new ContextMenuItem(this.menuLabel);
            _local_2.customItems.push(_local_3);
            _local_3.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, this.menuItemSelectHandler);
            _arg_1.contextMenu = _local_2;
        }

        private function menuItemSelectHandler(_arg_1:ContextMenuEvent):void
        {
            navigateToURL(this.menuURL, "_blank");
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.buddyListController

package com.cocolani.gui
{
    import it.gotoandplay.smartfoxserver.SFSEvent;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;

    public class buddyListController 
    {

        public var stageref:*;
        public var sfs:*;
        public var mc_interface:*;
        public var chatBlockerArr:* = [];
        public var chatBlockerId:* = [];

        public function buddyListController(_arg_1:*)
        {
            this.stageref = _arg_1;
            this.sfs = this.stageref.sfs;
            this.mc_interface = this.stageref.mc_interface;
            this.sfs.addEventListener(SFSEvent.onBuddyList, this.onBuddyListHandler);
            this.sfs.addEventListener(SFSEvent.onBuddyListError, this.onBuddyListErrorHandler);
            this.sfs.addEventListener(SFSEvent.onBuddyListUpdate, this.onBuddyListUpdateHandler);
            this.sfs.addEventListener(SFSEvent.onBuddyPermissionRequest, this.onBuddyPermissionRequestHandler);
            this.sfs.addEventListener(SFSEvent.onBuddyRoom, this.onBuddyRoomHandler);
            this.sfs.addEventListener(SFSEvent.onPrivateMessage, this.onPrivateMessageHandler);
        }

        public function Moderator_PvtMessage(_arg_1:Object):*
        {
            var _local_2:* = 0;
            while (_local_2 < this.stageref.popupWindows.length)
            {
                if (this.stageref.popupWindows[_local_2].popupName == "mod_chat")
                {
                    if (this.stageref.popupWindows[_local_2].contentref.targetRef.nm == _arg_1.nm)
                    {
                        this.stageref.setChildIndex(this.stageref.popupWindows[_local_2], (this.stageref.numChildren - 1));
                        return (this.stageref.popupWindows[_local_2].contentref);
                    };
                };
                _local_2++;
            };
            var _local_3:* = this.stageref.newpopup("com.cocolani.gui.moderatorChat", "class", "mod_chat", true);
            _local_3.setstageref(this.stageref);
            _local_3.setup(_arg_1);
            return (_local_3);
        }

        public function Moderator_PvtMessage_Response(_arg_1:*):*
        {
            var _local_2:* = this.Moderator_PvtMessage({
                "nm":_arg_1.tgt.nm,
                "id":_arg_1.tgt.id
            });
            _local_2.pvtResponse(_arg_1);
        }

        public function setIgnore(_arg_1:String, _arg_2:*, _arg_3:*=null):*
        {
            var _local_4:*;
            if (_arg_2)
            {
                if (_arg_3 == "id")
                {
                    this.chatBlockerId.push(_arg_1);
                }
                else
                {
                    this.chatBlockerArr.push(_arg_1);
                };
            }
            else
            {
                if (_arg_3 == null)
                {
                    for (_local_4 in this.chatBlockerArr)
                    {
                        if (_arg_1 == this.chatBlockerArr[_local_4])
                        {
                            this.chatBlockerArr.splice(_local_4, 1);
                            break;
                        };
                    };
                }
                else
                {
                    for (_local_4 in this.chatBlockerId)
                    {
                        if (_arg_1 == this.chatBlockerId[_local_4])
                        {
                            this.chatBlockerId.splice(_local_4, 1);
                            break;
                        };
                    };
                };
            };
        }

        public function checkIfIgnored(_arg_1:String, _arg_2:*=null):*
        {
            var _local_3:*;
            if (_arg_2 == null)
            {
                for (_local_3 in this.chatBlockerArr)
                {
                    if (_arg_1 == this.chatBlockerArr[_local_3])
                    {
                        return (true);
                    };
                };
                return (false);
            };
            for (_local_3 in this.chatBlockerId)
            {
                if (_arg_1 == this.chatBlockerId[_local_3])
                {
                    return (true);
                };
            };
            return (false);
        }

        private function onPrivateMessageHandler(_arg_1:SFSEvent):void
        {
            var _local_4:*;
            var _local_2:* = false;
            var _local_3:* = 0;
            while (_local_3 < this.stageref.popupWindows.length)
            {
                if (this.stageref.popupWindows[_local_3].popupName.substr(0, 4) == "chat")
                {
                    if (_arg_1.params.sender)
                    {
                        if (this.stageref.popupWindows[_local_3].contentref.avName == _arg_1.params.sender.getName())
                        {
                            _local_2 = true;
                            if (this.checkIfIgnored(_arg_1.params.sender.getName()) == false)
                            {
                                this.stageref.popupWindows[_local_3].contentref.pvtResponse(_arg_1.params);
                            };
                        };
                    }
                    else
                    {
                        if (this.stageref.popupWindows[_local_3].contentref.avID == _arg_1.params.userId)
                        {
                            _local_2 = true;
                            if (this.checkIfIgnored(_arg_1.params.userId, "id") == false)
                            {
                                this.stageref.popupWindows[_local_3].contentref.pvtResponse(_arg_1.params);
                            };
                        };
                    };
                };
                _local_3++;
            };
            if (((!(_arg_1.params.userId == this.sfs.myUserId)) && (!(_local_2))))
            {
                if (_arg_1.params.sender)
                {
                    if (this.checkIfIgnored(_arg_1.params.sender.getName()))
                    {
                        return;
                    };
                }
                else
                {
                    if (this.checkIfIgnored(_arg_1.params.userId, "id"))
                    {
                        return;
                    };
                };
                _local_4 = this.stageref.newpopup("com.cocolani.gui.privateChat", "class", "chat", true);
                _local_4.setstageref(this.stageref);
                if (_arg_1.params.sender)
                {
                    _local_4.setup(_arg_1.params.sender);
                }
                else
                {
                    _local_4.setupID(_arg_1.params.userId);
                };
                _local_4.pvtResponse(_arg_1.params);
            };
        }

        public function reset():*
        {
            this.chatBlockerArr = [];
        }

        private function onBuddyListHandler(_arg_1:SFSEvent):void
        {
            if (((this.mc_interface) && (this.mc_interface.playerPopupRef)))
            {
                this.mc_interface.playerPopupRef.buddylistContainer.setBuddyList(_arg_1.params.list);
            };
            if (((this.mc_interface) && (this.mc_interface.getChildByName("buddylist"))))
            {
                this.mc_interface.getChildByName("buddylist").setBuddyList(_arg_1.params.list);
            };
        }

        private function onBuddyListErrorHandler(_arg_1:SFSEvent):void
        {
            if (_arg_1.params.error.indexOf("An identical request") > -1)
            {
                this.stageref.showmsg(this.stageref.langObj.getText("err10"));
            }
            else
            {
                if (_arg_1.params.error.indexOf("#ERR") > -1)
                {
                    this.stageref.showmsg(this.stageref.langObj.getErrMsg(_arg_1.params.error));
                }
                else
                {
                    this.stageref.showmsg(("An error occurred while loading the buddy list: " + _arg_1.params.error));
                };
            };
        }

        private function onBuddyListUpdateHandler(_arg_1:SFSEvent):void
        {
            var _local_2:Object = _arg_1.params.buddy;
            var _local_3:String = _local_2.name;
            var _local_4:String = ((_local_2.isOnline) ? "online" : "offline");
            if (((this.mc_interface.playerPopupRef) && (this.mc_interface.playerPopupRef.buddylistContainer)))
            {
                this.mc_interface.playerPopupRef.buddylistContainer.buddyUpdate(_arg_1.params.buddy);
            };
            if (this.mc_interface.getChildByName("buddylist"))
            {
                this.mc_interface.getChildByName("buddylist").buddyUpdate(_arg_1.params.buddy);
            };
        }

        private function onBuddyPermissionRequestHandler(_arg_1:SFSEvent):void
        {
            var _local_2:*;
            var _local_3:*;
            if (this.checkIfIgnored(_arg_1.params.sender) == false)
            {
                _local_2 = getDefinitionByName("mc_request");
                _local_3 = this.stageref.addChild(new (_local_2)());
                _local_3.requesttxt.text = this.stageref.langObj.repText("gui45", _arg_1.params.sender.toUpperCase());
                _local_3.bt_yes.addEventListener(MouseEvent.CLICK, this.onBuddyPermResponse);
                _local_3.bt_no.addEventListener(MouseEvent.CLICK, this.onBuddyPermResponse);
                _local_3.data = _arg_1.params;
            };
        }

        private function onBuddyPermResponse(_arg_1:MouseEvent):*
        {
            if (_arg_1.currentTarget.name == "bt_yes")
            {
                this.sfs.sendBuddyPermissionResponse(true, _arg_1.currentTarget.parent.data.sender);
            }
            else
            {
                this.sfs.sendBuddyPermissionResponse(false, _arg_1.currentTarget.parent.data.sender);
            };
            this.stageref.removeChild(_arg_1.currentTarget.parent);
        }

        private function onBuddyRoomHandler(_arg_1:SFSEvent):void
        {
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.lang.Language

package com.cocolani.lang
{
    import com.cocolani.modules.ArabicTextJustify;
    import flash.text.TextFieldType;
    import flash.text.TextField;
    import flash.text.TextFormat;

    public class Language 
    {

        internal var langObj:* = new Object();
        public var selectedLang:Number = 0;
        internal var langlist:* = ["", "_ar"];
        internal var langExt:* = ["", "ae"];
        internal var langdir:* = [0, 1];
        internal var langdirDesc:* = ["left", "right"];
        internal var langResizing:* = [0, 3];
        internal var arabicConvert:* = new ArabicTextJustify();

        public function Language()
        {
            this.langObj.l_0tmp01 = "If you experience difficulty with your password today, please check your email. ";
            this.langObj.l_1tmp01 = "في حال واجهتك صعوبات في كلمة السر الخاصة بك، الرجاء مراجعة بريدك الألكتروني";
            this.langObj.l_0err01 = "We have detected that port %rep1% is unavailable on your network. Due to this, network and gaming performance will be very poor. We suggest unblocking this port in order to enjoy playing Cocolani at its best.";
            this.langObj.l_0err02 = "You have been logged out due to inactivity.";
            this.langObj.l_0err03 = "There was a problem with the conversation. Please contact technical support";
            this.langObj.l_0err04 = "Warning : Local language different to registered language.";
            this.langObj.l_0err05 = "Could not load dialogue at this time. Please contact technical support.";
            this.langObj.l_0err06 = "You have more than one window open. Please close this other window and refresh in order to play";
            this.langObj.l_0err07 = "Could not load registration information. Please contact technical support.";
            this.langObj.l_0err08 = "There was a problem with loading data. Please contact technical support.";
            this.langObj.l_0err09 = "Can't change scenes to the same scene you're in.";
            this.langObj.l_0err10 = "You have already sent out a friendship request to this user. If there was a mistake, then please try again a bit later.";
            this.langObj.l_0err11 = "That is not a valid reason for reporting this player.";
            this.langObj.l_0err12 = "Your session with facebook has expired.";
            this.langObj.l_0err13 = "To enjoy fullscreen mode, you need to update to the latest version of flash.";
            this.langObj.l_0alterr01 = "We have detected that port 9339 is unavailable on your network. Due to this, network and gaming performance will be very poor. We suggest unblocking this port in order to enjoy playing Cocolani at its best.";
            this.langObj.l_0srv1 = "Invalid username or password";
            this.langObj.l_0srv2 = "Your email address has not been confirmed. Please check your email and click on the link to confirm your account. Check your junk mail folder, or click on the 'forgot password' link for further assistance.";
            this.langObj.l_0srv3 = "You are banned! Please contact technical support if this is in error.";
            this.langObj.l_0srv4 = "No flooding allowed!";
            this.langObj.l_0srv5 = "You've been warned! No flooding! Now you're kicked";
            this.langObj.l_0srv6 = "Stop Flooding!! You're being banned";
            this.langObj.l_0srv8 = "You have been banned!";
            this.langObj.l_0srv9 = "You have filled up your list of friends.";
            this.langObj.l_0srv10 = "Can't make friends with that person - their friends list is full.";
            this.langObj.l_0srv11 = "Logins are currently disabled. Please try again a bit later.";
            this.langObj.l_0cht01 = "<b><font color='#AAAAAA'>%rep1%</font></b>: %rep2%\n";
            this.langObj.l_0login01 = "USERNAME";
            this.langObj.l_0login02 = "PASSWORD";
            this.langObj.l_0login03 = "LOGIN";
            this.langObj.l_0login04 = "REGISTER";
            this.langObj.l_0login05 = "FORGOT PASSWORD";
            this.langObj.l_0login06 = "Select a Zone";
            this.langObj.l_0login07 = "Character Selection";
            this.langObj.l_0login08 = "NEW CHARACTER";
            this.langObj.l_0hlp00 = "BUY CREDIT";
            this.langObj.l_0hlp01 = "MY HOUSE";
            this.langObj.l_0hlp02 = "DO ACTION";
            this.langObj.l_0hlp03 = "TRIBE INFORMATION";
            this.langObj.l_0hlp04 = "INVENTORY";
            this.langObj.l_0hlp05 = "PROFILE";
            this.langObj.l_0hlp06 = "HAPPINESS METER";
            this.langObj.l_0hlp07 = "BATTLE PRACTICE";
            this.langObj.l_0hlp08 = "BATTLE";
            this.langObj.l_0hlp09 = "CLICK TO SAY";
            this.langObj.l_0hlp10 = "VIEW CHAT HISTORY";
            this.langObj.l_0hlp11 = "DISPLAY / HIDE BUDDY LIST";
            this.langObj.l_0hlp12 = "MODERATORS PANEL";
            this.langObj.l_0hlp13 = "ADJUST GAMEPLAY GRAPHICS QUALITY";
            this.langObj.l_0hlp14 = "TOGGLE AUDIO";
            this.langObj.l_0hlp15 = "LOGOUT";
            this.langObj.l_0hlp16 = "BACK TO TUTORIAL";
            this.langObj.l_0hlp17 = "Online Status";
            this.langObj.l_0hlp18 = "Visit Home";
            this.langObj.l_0hlp19 = "Remove Friend";
            this.langObj.l_0hlp20 = "Private Message";
            this.langObj.l_0hlp21 = "YOU HAVE MAIL WAITING AT YOUR HOME.";
            this.langObj.l_0hlp22 = "Site Configuration Settings";
            this.langObj.l_0hlp23 = "Search for user(s)";
            this.langObj.l_0hlp24 = "Scene List";
            this.langObj.l_0hlp25 = "Swear Word Monitor";
            this.langObj.l_0hlp26 = "Chat Monitor";
            this.langObj.l_0hlp27 = "Play / pause";
            this.langObj.l_0hlp28 = "Automatically set battle settings";
            this.langObj.l_0hlp29 = "Save new battle settings";
            this.langObj.l_0hlp30 = "Careful: Initiate Server Restart";
            this.langObj.l_0hlp31 = "Teleport to selected location.";
            this.langObj.l_0hlp32 = "Message this user.";
            this.langObj.l_0hlp33 = "Kick this user with message.";
            this.langObj.l_0hlp34 = "Ban this user with message.";
            this.langObj.l_0hlp35 = "IP Ban this user / hacker with message.";
            this.langObj.l_0hlp36 = "TOGGLE AUTOMATIC PATHFINDING";
            this.langObj.l_0hlp37 = "Report this player for abusive behaviour.";
            this.langObj.l_0hlp38 = "Challenge this player to a practice battle match.";
            this.langObj.l_0hlp39 = "Careful: Toggles whether access and logins are restricted.";
            this.langObj.l_0hlp40 = "Refreshes server settings. Only permitted to run this once.";
            this.langObj.l_0hlp41 = "Broadcast a message to all zones.";
            this.langObj.l_0hlp42 = "Ignore this person.";
            this.langObj.l_0hlp43 = "Open the weaponstore.";
            this.langObj.l_0hlp44 = "Give item to.";
            this.langObj.l_0hlp45 = "TOGGLE FULLSCREEN MODE";
            this.langObj.l_0gui00 = "Profile";
            this.langObj.l_0gui01 = "Chat history";
            this.langObj.l_0gui02 = "ACTIONS";
            this.langObj.l_0gui03 = "LOGOUT";
            this.langObj.l_0gui04 = "Send";
            this.langObj.l_0gui05 = "Name";
            this.langObj.l_0gui06 = "Tribe";
            this.langObj.l_0gui07 = "Rank";
            this.langObj.l_0gui08 = "Battles Won/Loss";
            this.langObj.l_0gui09 = "Joined";
            this.langObj.l_0gui10 = "About";
            this.langObj.l_0gui11 = "PROFILE";
            this.langObj.l_0gui12 = "MY INVENTORY";
            this.langObj.l_0gui13 = "TRIBE INFORMATION";
            this.langObj.l_0gui14 = "AWARDS";
            this.langObj.l_0gui15 = "Private chat with ";
            this.langObj.l_0gui17 = "OK";
            this.langObj.l_0gui18 = "DONE";
            this.langObj.l_0gui19 = "PURCHASED";
            this.langObj.l_0gui20 = "BATTLE";
            this.langObj.l_0gui21 = "PRACTICE";
            this.langObj.l_0gui23 = "GIVE";
            this.langObj.l_0gui24 = "SAVE";
            this.langObj.l_0gui25 = "Locals Online";
            this.langObj.l_0gui26 = "Visitors Online";
            this.langObj.l_0gui40 = "You are now friends with %rep1%";
            this.langObj.l_0gui41 = "You are no longer friends with %rep1%";
            this.langObj.l_0gui42 = "You need to be in the same location to trade items.";
            this.langObj.l_0gui43 = "You can't do this here. Please go somewhere else to do this.";
            this.langObj.l_0gui44 = "ARE YOU SURE YOU WANT TO REMOVE %rep1% FROM YOUR FRIENDS?";
            this.langObj.l_0gui45 = "%rep1% WOULD LIKE TO BE YOUR FRIEND. DO YOU ACCEPT?";
            this.langObj.l_0gui46 = "WEAPONS STORE";
            this.langObj.l_0gui47 = "UPGRADED";
            this.langObj.l_0gui48 = "Are you sure you want to skip the tutorial?";
            this.langObj.l_0gui49 = "Are you sure you want to return to the tutorial?";
            this.langObj.l_0gui50 = "%rep1% WOULD LIKE TO PRACTICE BATTLING WITH YOU. DO YOU ACCEPT?";
            this.langObj.l_0gui51 = "You receive:";
            this.langObj.l_0gui52 = "You are not yet a homeowner. Please contact your local furniture store for information on renting your own home.";
            this.langObj.l_0gui53 = "You don't have enough currency for that.";
            this.langObj.l_0gui54 = "GAME MESSAGE";
            this.langObj.l_0gui55 = "EXCHANGE";
            this.langObj.l_0gui56 = "NEXT";
            this.langObj.l_0gui57 = "BUY";
            this.langObj.l_0gui58 = "FURNITURE STORE";
            this.langObj.l_0gui59 = "WEAPONS STORE";
            this.langObj.l_0gui60 = "ACCESSORIES STORE";
            this.langObj.l_0gui62 = "Thank you, the exchange was successful.";
            this.langObj.l_0gui63 = "You recieved";
            this.langObj.l_0gui64 = "in exchange for";
            this.langObj.l_0gui65 = "SMS CREDIT";
            this.langObj.l_0gui66 = "Send an empty SMS to your selected provider to receive %rep1% in currency and to be eligible for a free gift";
            this.langObj.l_0gui67 = "Select Country";
            this.langObj.l_0gui68 = "Enter Code";
            this.langObj.l_0gui69 = "REDEEM";
            this.langObj.l_0gui70 = "This code has already been redeemed!";
            this.langObj.l_0gui71 = "Incorrect code. Please check code and re-enter.";
            this.langObj.l_0gui72 = "There was a problem with the transaction.";
            this.langObj.l_0gui73 = "Congratulations on your Purchase";
            this.langObj.l_0gui74 = "%rep1% x";
            this.langObj.l_0gui75 = "Select One";
            this.langObj.l_0gui76 = "REQUEST";
            this.langObj.l_0gui77 = "YES";
            this.langObj.l_0gui78 = "NO";
            this.langObj.l_0gui79 = "REPORT PLAYER";
            this.langObj.l_0gui80 = "Please explain what your reason is for reporting this player. You must have a valid reason why this player is breaking the rules.";
            this.langObj.l_0gui81 = "CANCEL";
            this.langObj.l_0gui82 = "SEND";
            this.langObj.l_0gui83 = "The report has been sent. Thank you.";
            this.langObj.l_0gui84 = "You don't have enough currency from the other tribes' to exchange to this currency. Setting the amount to the amount you have available : %rep1%";
            this.langObj.l_0gui85 = "Are you sure you want to log out?";
            this.langObj.l_0gui86 = "%rep1% of %rep2% medals earned.";
            this.langObj.l_0gui87 = "%rep1% of %rep2% games discovered.";
            this.langObj.l_0gui88 = "Moderator chat with ";
            this.langObj.l_0gui90 = "No awards";
            this.langObj.l_0gui91 = "REMOVE BUDDY";
            this.langObj.l_0gui92 = "ADD BUDDY";
            this.langObj.l_0gui93 = "BATTLE TRAINING";
            this.langObj.l_0gui94 = "XP";
            this.langObj.l_0gui100 = "Furniture Items";
            this.langObj.l_0gui101 = "Clothing Items";
            this.langObj.l_0gui102 = "Quest Items";
            this.langObj.l_0gui103 = "All Items";
            this.langObj.l_0gui104 = "Weapons Items";
            this.langObj.l_0action01 = "SIGH";
            this.langObj.l_0action02 = "SNEEZE";
            this.langObj.l_0action03 = "NOD HEAD";
            this.langObj.l_0action04 = "GIGGLE";
            this.langObj.l_0action05 = "SHAKE HEAD";
            this.langObj.l_0action06 = "CUTE";
            this.langObj.l_0action07 = "STOP";
            this.langObj.l_0action08 = "WAVE";
            this.langObj.l_0medal01 = "bronze";
            this.langObj.l_0medal02 = "silver";
            this.langObj.l_0medal03 = "gold";
            this.langObj.l_0medal10 = "Congratulations, you have upgraded your medal for %rep1% to %rep2%!";
            this.langObj.l_0medal11 = "Congratulations, you have won a %rep1% medal for %rep2%!";
            this.langObj.l_0tut01 = "Oooh that opened very nicely. It is empty. I must have taken that horn sometime ago..";
            this.langObj.l_0tut02 = "Oooh that opened very nicely. Looks like there may be something inside..";
            this.langObj.l_0tut03 = "It's already open. No need to do anything more to it.";
            this.langObj.l_0tut04 = "Unfortunately, that's not helping me get this chest open.";
            this.langObj.l_0tut05 = "Please follow the tutorial instructions. You can have a look at this later.";
            this.langObj.l_0tut06 = "It's not a good idea to hurt the seagull.";
            this.langObj.l_0tut07 = "That may be useful.. But I probably need to use something else first to get this fixed..";
            this.langObj.l_0tut08 = "Hmm.. I don't know how I could use that to fix this raft!";
            this.langObj.l_0tut09 = "Nice work!";
            this.langObj.l_0tut10 = "Dialogue not setup in tutorial for current language. Defaulting to English.";
            this.langObj.l_0tut11 = "Sitting on that raft is probably not a good idea, until you can get it going.";
            this.langObj.l_0tut12 = "That raft is looking in very good shape indeed. I feel certain this will be good enough to go and find my island..";
            this.langObj.l_0tut13 = "You already have a fish. Go on, follow the instructions.";
            this.langObj.l_0tut14 = "You don't have enough currency for that.";
            this.langObj.l_0tut15 = "Please follow the tutorial instructions on the top of the screen.";
            this.langObj.l_0tut16 = "This is the wrong time to be doing that. Please follow the instructions.";
            this.langObj.l_0tut17 = "This chest appears to be locked. Hmm.";
            this.langObj.l_0tut18 = "Oh wow, that looks like a shiny new horn.";
            this.langObj.l_0tut19 = "There is nothing more left in the chest.";
            this.langObj.l_0tut20 = "This looks like a broken down raft.";
            this.langObj.l_0tut21 = "That's looking much better.. Could do with a little support, now.";
            this.langObj.l_0tut22 = "Need to find a way for it to catch the breeze, I would say.";
            this.langObj.l_0tut23 = "This looks ready to go! I should probably say goodbye to the captain, first.";
            this.langObj.l_0tut24 = "I'm not quite sure what that is from here..";
            this.langObj.l_0tut25 = "You already have one of those.";
            this.langObj.l_0tut26 = "This may be useful..";
            this.langObj.l_0tut27 = "That's not what the captain wants.";
            this.langObj.l_0tut28 = "Welcome to Tutorial Island. This is a short walk-through of essential information to introduce you to the features in Cocolani. Est. time 10 - 15 minutes. \nYou may click the 'skip tutorial' button at any time.";
            this.langObj.l_0tut29 = "That wooden plank looks a bit rotten. Also it appears to be wedged deep in the sand so I can't pick it up.";
            this.langObj.l_0fdb00 = "You must be in the same location to trade with one another.";
            this.langObj.l_0fdb01 = "Please select an inventory item to trade by dragging it from the inventory into the trade box.";
            this.langObj.l_0fdb02 = "Please select a user to trade with by clicking their name using the tab on the inventory popup.";
            this.langObj.l_0fdb03 = "%rep2% is offering you a %rep1%. Do you accept?";
            this.langObj.l_0fdb04 = "You can't give that away.";
            this.langObj.l_0fdb05 = "You are already in that area.";
            this.langObj.l_0fdb06 = "This area is currenty full. Moving you to another area.";
            this.langObj.l_0fdb07 = "You don't have the skills to purchase this weapon yet. Work to level up your skills and come back next time.";
            this.langObj.l_0fdb08 = "You need to be a home renter to purchase this item.";
            this.langObj.l_0fdb09 = "You must be in the same location to practice battle with one another.";
            this.langObj.l_0fdb10 = "Request sent for battle practice.";
            this.langObj.l_0fdb11 = "This user is currently busy.";
            this.langObj.l_0com00 = "I am too far away.";
            this.langObj.l_0com01 = "I picked up the %rep1%.";
            this.langObj.l_0com02 = "Dear";
            this.langObj.l_0com03 = "From";
            this.langObj.l_0com04 = "Send";
            this.langObj.l_0com05 = "Please choose somebody to send this message to.";
            this.langObj.l_0com06 = "Your message is too short.";
            this.langObj.l_0com07 = "The carrier pigeon carried the mail to %rep1% successfully.";
            this.langObj.l_0com08 = "You can't read other peoples mail.";
            this.langObj.l_0com09 = "You don't have enough credit for that.";
            this.langObj.l_0com10 = "There is no space to sit there.";
            this.langObj.l_0com11 = "There is somebody sitting there, you can't take it till they stand up.";
            this.langObj.l_0com12 = "You need to select more currency in order to make a trade.";
            this.langObj.l_0com13 = "OUR CHIEF\n%rep1%\n";
            this.langObj.l_0com14 = "VACANT";
            this.langObj.l_0com15 = "You have no mail.";
            this.langObj.l_0com16 = "PLEASE SELECT";
            this.langObj.l_0com17 = "COMPOSE LETTER";
            this.langObj.l_0com18 = "COST:1";
            this.langObj.l_0com19 = "There is already somebody else sitting there..";
            this.langObj.l_0com20 = "There was a problem with the request.";
            this.langObj.l_0mpgame01 = "Draw on %rep1%. Please roll again";
            this.langObj.l_0mpgame02 = "You win the first move..";
            this.langObj.l_0mpgame03 = "%rep1% wins the first move..";
            this.langObj.l_0mpgame04 = "You win the first move..";
            this.langObj.l_0mpgame05 = "%rep1% has left the game.";
            this.langObj.l_0mpgame06 = "There was a problem setting up the game board. Please contact tech support.";
            this.langObj.l_0mpgame07 = "Can't move...";
            this.langObj.l_0mpgame08 = "%rep1% wins, %rep2% losses";
            this.langObj.l_1mpgame01 = " %rep1%   قم بالرمى مره اخرى.سحب ";
            this.langObj.l_1mpgame02 = "ربحت النقلة الاولى ";
            this.langObj.l_1mpgame03 = "فاز بالتحركية الاولى   %rep1% ";
            this.langObj.l_1mpgame04 = "لقد ربحت النقلة الاولى";
            this.langObj.l_1mpgame05 = "ترك اللعبه   %rep1% ";
            this.langObj.l_1mpgame06 = "هناك مشكلة فى تهيئه طاولة اللعبة من فضلك قم بالاتصال بالدعم الفنى ";
            this.langObj.l_1mpgame07 = "لايمكنك التحرك";
            this.langObj.l_1mpgame08 = "الرابح %rep1% . الخاسر  %rep2%";
            this.langObj.l_0hom00 = "That's the door to my home. It looks closed.";
            this.langObj.l_0hom01 = "The door to my home is currently open.";
            this.langObj.l_0hom02 = "The door looks closed from here.";
            this.langObj.l_0hom03 = "The door looks open from here.";
            this.langObj.l_0hom04 = "I open the door.";
            this.langObj.l_0hom05 = "I close the door.";
            this.langObj.l_0hom06 = "The door is locked.";
            this.langObj.l_0hom08 = "I open the door.";
            this.langObj.l_0hom09 = "I close the door.";
            this.langObj.l_0hom10 = "The door has been finely carved.";
            this.langObj.l_0hom11 = "The owner of this room wouldn't like me opening or closing their door..";
            this.langObj.l_0hom12 = "That's the door to my home. It looks closed.";
            this.langObj.l_0hom13 = "The door to my home is currently open.";
            this.langObj.l_0hom14 = "The door looks closed from here.";
            this.langObj.l_0hom15 = "The door looks open from here.";
            this.langObj.l_0hom16 = "I lock the door.";
            this.langObj.l_0hom17 = "I unlock the door.";
            this.langObj.l_0hom18 = "You can rent your very own your home now, in the spectacular rainforest residential area!";
            this.langObj.l_0hom19 = "You can rent your very own your home now, besides a magnificent lava flow with prime magma views!";
            this.langObj.l_0hom20 = "Your rental\n";
            this.langObj.l_0hom21 = "First rent: %rep1%\n";
            this.langObj.l_0hom22 = "Expires: %rep1%\n";
            this.langObj.l_0hom23 = "NO RENTAL IS REQUIRED.\n";
            this.langObj.l_0hom24 = "%rep1% days";
            this.langObj.l_0hom25 = "This seems to be a brochure for renting a home in this tribe. The storekeeper looks at me funny as I move towards it, so I think better of it.";
            this.langObj.l_0hom26 = "MAIL INBOX";
            this.langObj.l_0hom27 = "NEW";
            this.langObj.l_0hom28 = "REPLY";
            this.langObj.l_0hom29 = "SEND";
            this.langObj.l_0hom30 = "PLEASE WAIT<br>LOADING ROOM STATE";
            this.langObj.l_0hom31 = "Your home appears to have gone missing. Please contact support.";
            this.langObj.l_0hom32 = "To visit homes in the other tribe, you need to make your way to that tribe.";
            this.langObj.l_0jun00 = "feather";
            this.langObj.l_0jun01 = "vine leaf";
            this.langObj.l_0jun02 = "pretty flower";
            this.langObj.l_0jun03 = "berry";
            this.langObj.l_0jun04 = "The toucan is beautiful from up close, too.";
            this.langObj.l_0jun05 = "That Toucan looks bright and colourful from here..";
            this.langObj.l_0jun06 = "As I peer over and see a banana there, I wonder how you get there?";
            this.langObj.l_0jun07 = "I can't really see anything from there.";
            this.langObj.l_0jun08 = "Find me these things,and I will make you very happy:2 vine leaves,coconut,banana peel,gem,feather,flower,and a seed.";
            this.langObj.l_0jun09 = "It looks like a little table with little pieces on it from here.";
            this.langObj.l_0jun10 = "Wonder what these symbols are for ?";
            this.langObj.l_0jun11 = "Looks like an interesting arrangement of symbols from here.";
            this.langObj.l_0jun12 = "I pick up the %rep1%.";
            this.langObj.l_0jun13 = "Looks like there might be something there..";
            this.langObj.l_0jun14 = "It seems like this monkey has been fed already - he's not interested in another banana.";
            this.langObj.l_0jun15 = "Hmm, the monkey seems to like that banana! It gobbled it up in one go!";
            this.langObj.l_0jun16 = "The monkey doesn't seem to be interested in that..";
            this.langObj.l_0jun17 = "This is the symbol of the Yeknoms, the legendary jungle tribe.";
            this.langObj.l_0jun18 = "That doesn't seem to fit, there.";
            this.langObj.l_0jun2_00 = "vine leaf";
            this.langObj.l_0jun2_01 = "banana peel";
            this.langObj.l_0jun2_02 = "coconut shell";
            this.langObj.l_0jun2_03 = "green gem";
            this.langObj.l_0jun2_04 = "The monkey yelps at me.";
            this.langObj.l_0jun2_05 = "Looks like there might be something there..";
            this.langObj.l_0jun2_06 = "I use the doorknocker, but nothing happens.";
            this.langObj.l_0jun2_07 = "Large bronze doorknockers adorn the temple door.";
            this.langObj.l_0jun2_08 = "It looks like the start of a row of dilapidated pillars towering above the forest canopy.";
            this.langObj.l_0jun2_09 = "You know, that looks very much like an eye socket!";
            this.langObj.l_0jun2_10 = "The gem fits perfectly in the socket! Wallah!";
            this.langObj.l_0jun2_11 = "It looks as if the eye is looking back at me..";
            this.langObj.l_0jun2_12 = "Large doorknockers adorn the temple door.";
            this.langObj.l_0jun_vil01 = "That looks like a cloth on that juice stand over there from here.";
            this.langObj.l_0jun_vil02 = "Hmmm. This may come in handy..";
            this.langObj.l_0jun_vil03 = "Yellow flowers grow beautifully inside the flowerpot.";
            this.langObj.l_0jun_vil04 = "This door is locked.";
            this.langObj.l_0jun_vil05 = "A few chairs sits outside this store. Very tiny chairs.. These must have been designed for small children..";
            this.langObj.l_0jun_vil06 = "There appears to be a drawing of a couch on this sign. I wonder what that means?";
            this.langObj.l_0jun_vil07 = "That basket is filled with very heavy looking weapons. This must be the weapons store.";
            this.langObj.l_0jun_vil08 = "This hat on this sign reminds me of a place that sells clothing accessories.. Hmm";
            this.langObj.l_0jun_vil09 = "This is the sign to the furniture store, a place where many good times where had when the previous store keeper was working here.";
            this.langObj.l_0jun_vil10 = "That's the sign for the juice stand.";
            this.langObj.l_0jun_vil11 = "This is where the battle master sells weapons to passer-bys. I believe he has been refurbishing this for a while now, I wonder when it will open again.";
            this.langObj.l_0jun_fur01 = "Finally. That missing banana.";
            this.langObj.l_0jun_fur02 = "An aquarium for sale.";
            this.langObj.l_0jun_fur03 = "A bookshelf is for sale.";
            this.langObj.l_0jun_fur04 = "A chair is for sale.";
            this.langObj.l_0jun_fur05 = "A small plant is on display for sale.";
            this.langObj.l_0jun_fur06 = "A table is on display for sale.";
            this.langObj.l_0jun_fur07 = "A small tv is on display for sale.";
            this.langObj.l_0jun_fur08 = "Some vases are on display.";
            this.langObj.l_0jun_fur09 = "Some drawers are on display.";
            this.langObj.l_0jun_fur10 = "Some vases are on display for sale.";
            this.langObj.l_0jun_fur11 = "Incense sticks fill the air with a fruity scent.";
            this.langObj.l_0jun_fur12 = "The door is locked. I think they want us to keep out.";
            this.langObj.l_0jun_lei01 = "Let me pick up the fragment.";
            this.langObj.l_0jun_lei02 = "Yellow flowers grow beautifully inside this vase.";
            this.langObj.l_0jun_lig01 = "Let me pick up the fragment.";
            this.langObj.l_0jun_lig02 = "Fuel containers rest beside the lighthouse.";
            this.langObj.l_0jun_lig03 = "It seems there is a little fuel in this container.. Some fuel can get me a long way.";
            this.langObj.l_0jun_lig04 = "It appears this container is empty. This must be the discarded pile..";
            this.langObj.l_0jun_lig05 = "That lighthouse door is so tiny! I wonder what little creatures work in here.. Unfortunately, I won't be crawling through it, as it is locked.";
            this.langObj.l_0jun_pat01 = "Let me pick up the fragment.";
            this.langObj.l_0jun_pat02 = "That's strange. It looks like something is missing from there..";
            this.langObj.l_0jun_pat03 = "The puzzle is already complete. It won't need any more pieces.";
            this.langObj.l_0jun_pat04 = "That piece is already there. Hm. Just when I thought I was getting somewhere.";
            this.langObj.l_0jun_pat05 = "Hmmm.. you know, that looks like that fits!";
            this.langObj.l_0jun_pat06 = "It's looking good.. Just a few more pieces..";
            this.langObj.l_0jun_pat07 = "That would like nice there. But something tells me that it won't really fit all that well..";
            this.langObj.l_0jun_pat08 = "Hmm, just one more piece, nearly there!!";
            this.langObj.l_0jun_pat09 = "Oh wow, nice fresh banana.";
            this.langObj.l_0jun_pat10 = "Something is loose over there, by the looks. Let me get closer to have a better look..";
            this.langObj.l_0jun_pat11 = "Hm, this stick could come in handy!";
            this.langObj.l_0jun_path12 = "Let me pick up the fragment.";
            this.langObj.l_0jun_path13 = "That looks like a plaque on the statue. I can't read what it says from here.";
            this.langObj.l_0jun_path14 = "Finally. That missing banana.";
            this.langObj.l_0jun_path15 = "Oh wow, nice fresh banana.";
            this.langObj.l_0jun_path16 = "The door is locked.";
            this.langObj.l_0jun_path17 = "I've never seen a door locked this hard.";
            this.langObj.l_0jun_path18 = "There are scorch marks all over this..";
            this.langObj.l_0jun_path19 = "There is an assortment of coconuts in here. I'd better leave them alone!";
            this.langObj.l_0jun_path20 = "Ooh that bird looks quite pretty from here!";
            this.langObj.l_0jun_path21 = "That gigantic beetle is what the trader uses to move around with. It looks quite happy there with him.";
            this.langObj.l_0jun_path22 = "A basket filled with coconuts lies there. Best that I probably don't touch these, they are not mine to touch.";
            this.langObj.l_0jun_path23 = "A single coconut sits next to the basket. I should probably leave those alone, though, they belong to the coconut farmer.";
            this.langObj.l_0jun3_00 = "What's that low rumbling noise.. ?";
            this.langObj.l_0jun3_01 = "Let me slide my hands down in there... Now I have dust all over my hands!";
            this.langObj.l_0jun3_02 = "Let me slide my hands down in there... Oh, oh, what is this contraption? Might come in handy!";
            this.langObj.l_0jun3_03 = "Looks like an ordinary vase to me from here.";
            this.langObj.l_0jun3_04 = "That looks like some rope hanging off there.";
            this.langObj.l_0jun3_05 = "A bit of a tug and the rope is set free. This may be useful to me.";
            this.langObj.l_0jun3_06 = "There is something green rotating on that platform. I'll need to get closer to take a proper look.";
            this.langObj.l_0jun3_07 = "You pick up the green gem.";
            this.langObj.l_0jun3_08 = "Looks like a banana sitting out there.";
            this.langObj.l_0jun3_09 = "There is already a lever in there. It doesn't need another one.";
            this.langObj.l_0jun3_10 = "Oh wow! That fits perfectly! Phew!";
            this.langObj.l_0jun3_11 = "I'm trying to put that in there, but it just doesn't seem to fit properly.";
            this.langObj.l_0jun3_12 = "With a push and a shove, the lever sets something in motion!";
            this.langObj.l_0jun3_13 = "Eerie green eyes stare back at me through the grill!";
            this.langObj.l_0jun3_14 = "Uh oh...";
            this.langObj.l_0jun3_15 = "There is a slot in there. I wonder if it is missing something?";
            this.langObj.l_0jun3_16 = "Ooooh it's dark in here. Think I might need to find something to help me see here.";
            this.langObj.l_0jun3_17 = "Some strange force is holding me back from entering this passage. Maybe there is something I need to do first?";
            this.langObj.l_0jun4_00 = "The door to this weapon shop has a sign on it which says 'closed'. Perhaps they are keen fishermen";
            this.langObj.l_0jun4_01 = "I can see what looks like a door in the distance.";
            this.langObj.l_0jun4_beach01 = "The sign says 'No littering and no animals are permitted on the beach.'";
            this.langObj.l_0vol0_00 = "That is the pride & joy of the Huhuloa tribe, the tribe that lives with the volcano, the black rock.";
            this.langObj.l_0vol0_01 = "That crab looks like it's having a good time walking to-and-fro on that great big carving.";
            this.langObj.l_0vol0_02 = "There is an empty jar on the table.";
            this.langObj.l_0vol0_03 = "There is a small jar on the table.";
            this.langObj.l_0vol0_04 = "There is a tall jar on the table.";
            this.langObj.l_0vol0_05 = "There is a large jar there on the table.";
            this.langObj.l_0vol0_06 = "A mechanical crab sits on the table. How cute.";
            this.langObj.l_0vol0_07 = "A great big egg lies just there. I wonder what sort of beast this will hatch, or perhaps this is a feast for a family!";
            this.langObj.l_0vol0_08 = "A great big crystal lies there.";
            this.langObj.l_0vol0_09 = "A black rock lies on the table. It has quite an exquisite shape, I must say.";
            this.langObj.l_0vol0_10 = "That is the biggest cherry that I have ever seen.";
            this.langObj.l_0volvil_00 = "A couch and rug sit above the store. So this is where I can find furniture in town.";
            this.langObj.l_0volvil_01 = "The shield above the blacksmiths signifies that this must be a weapons armory.";
            this.langObj.l_0volvil_02 = "I can probably buy clothing items at this place, by the looks of that sign..";
            this.langObj.l_0vol_tmp01 = "It looks a bit like a turtle from here. It looks like he may need some help.";
            this.langObj.l_0vol_tmp02 = "That big chunk of metal helps dig tunnels through the hot volcanic rock.";
            this.langObj.l_0vol_tmp03 = "It looks like a wheelbarrow from here.";
            this.langObj.l_0vol_tmp04 = "On close inspection, I see the wheelbarrow is filled with chunky black rocks. No touching!";
            this.langObj.l_0vol1_00 = "I pick up the hard hat.";
            this.langObj.l_0vol1_01 = "This broken cart definitely needs some work. It's wheels are all fallen off.";
            this.langObj.l_0vol1_02 = "The fully loaded mine cart sits there patiently waiting for processing of its ores. ";
            this.langObj.l_0vol1_03 = "This knob has a series of gauges next to it. What they mean, is difficult to tell.";
            this.langObj.l_0vol1_04 = "It's probably best not to touch this valve right now.";
            this.langObj.l_0vol1_05 = "From here, it looks like that steel bar looks like it may come in handy.";
            this.langObj.l_0vol1_06 = "I pick up the steel bar.";
            this.langObj.l_0vol1_07 = "That cart looks in serious need of repair. That must be what the mechanic is trying to fix.";
            this.langObj.l_0vol1_08 = "There seems to be nothing else in this basket other than a few broken tools.";
            this.langObj.l_0vol1_09 = "You find 25 black rocks!";
            this.langObj.l_0vol1_10 = "Nice find! You find 50 black rocks!";
            this.langObj.l_0vol1_11 = "The wheelbarrow is loaded with rocks. Sadly, it's not the black rock type that I would like!";
            this.langObj.l_0vol1_12 = "The pick sits there, ready for use in the mine.";
            this.langObj.l_0vol1_13 = "What an impressive looking machine! The magnet on the front looks high powered for mining activites.";
            this.langObj.l_0vol1_14 = "The crab scurries about back and forth, searching, searching.. Best leave it alone.";
            this.langObj.l_0vol1_15 = "There is a pick leaning against the wall there. I won't be needing that.";
            this.langObj.l_0vol1_16 = "A wheelbarrow sits near to the miner.";
            this.langObj.l_0vol1_17 = "That sign appears to warn of rocks falling ahead.";
            this.langObj.l_0vol2_00 = "I rummage around inside the basket, and find some old bird droppings.";
            this.langObj.l_0vol2_01 = "I look inside this basket, and find some hay, which is no use to me.";
            this.langObj.l_0vol2_02 = "Inside this basket, there is another basket. Inside that basket, there is another smaller basket. I keep doing this 7 times, until I discover a tiny basket with nothing inside.";
            this.langObj.l_0vol2_03 = "There is a jar with blue stuff there. Of which contents, I can't be sure of.";
            this.langObj.l_0vol2_04 = "There is a jar with green liquid there. Best not to touch it if you don't know what it is.";
            this.langObj.l_0vol2_05 = "The sign says something about discarding all medical supplies here.";
            this.langObj.l_0vol2_06 = "I wind the bolt lose using the wench. Which works wonderfully. I now have the bolt.";
            this.langObj.l_0vol2_07 = "I try that, but are unable to loosen the bolt.";
            this.langObj.l_0vol2_08 = "I open the chest using the crowbar and find it is filled with dust.";
            this.langObj.l_0vol2_09 = "Unfortunately that didn't help.";
            this.langObj.l_0vol2_10 = "I open the chest using the crowbar. Inside the chest, there are some old broken drill bits.";
            this.langObj.l_0vol2_11 = "I open the chest using the crowbar. Inside the chest, there are some old broken drill bits. However, I did loosen the nail, might need that.";
            this.langObj.l_0vol2_12 = "Other than a layer of dust, this basket is empty.";
            this.langObj.l_0vol2_13 = "Opening the basket, I see a dusty wrench. This may come in handy!";
            this.langObj.l_0vol2_14 = "Inside the basket, there are metal shavings. Hardly of any use to me.";
            this.langObj.l_0vol2_15 = "Inside the basket, there is old rotten cardboard.";
            this.langObj.l_0vol2_16 = "That chest is empty.";
            this.langObj.l_0vol2_17 = "This chest is fastened shut with a nail. Try as I might, I can't seem to get it open.";
            this.langObj.l_0vol2_18 = "The chest is jammed shut, try as I might, I can't open it.";
            this.langObj.l_0vol2_19 = "This chest is filled with broken pieces of pottery.";
            this.langObj.l_0vol2_20 = "This wheel looks rather rusty. It's edges are very rough.";
            this.langObj.l_0vol2_21 = "This wheel looks perfect, with only a slight imperfection. It might even come in handy.";
            this.langObj.l_0vol2_22 = "This wheel looks partially broken. It's no wonder it's in the junkyard!";
            this.langObj.l_0vol2_23 = "That bolt looks to be fastened tight to the steamer.";
            this.langObj.l_0vol2_24 = "This box is filled with lumps of something.";
            this.langObj.l_0vol2_25 = "Lumps of something. It's no wonder it's stored in a junkyard.";
            this.langObj.l_0vol2_26 = "Odds and ends are strewn about in the crab container. There sure isn't a shortage of pipes around this place.";
            this.langObj.l_0vol2_27 = "That container sits idly with even more junk contained within.";
            this.langObj.l_0vol2_28 = "The rusty looking nail seems to be wedged in there tightly.";
            this.langObj.l_0vol2_29 = "That's a nice rusty nail. That could be handy.";
            this.langObj.l_0vol2_30 = "That looks like a sort of drill commonly used by the tribe from here.";
            this.langObj.l_0vol2_31 = "That drill just may turn out to be useful, so you take it.";
            this.langObj.l_0vol2_32 = "That looks like some sort of a tool from here.";
            this.langObj.l_0vol2_33 = "It's a hoe. There's no need for one of these here.";
            this.langObj.l_0vol2_34 = "You have already made the glue. After that fireworks performance, you decide you're not going there again in a hurry.";
            this.langObj.l_0vol2_35 = "This tan coloured basket contains a whole lot of straw. Not very helpful, is that?";
            this.langObj.l_0vol2_36 = "This green basket is filled with garlic. I don't see a use for that right now.";
            this.langObj.l_0vol2_37 = "It looks like a spade and a pick etched into that rock. Below it is an arrow pointing to the right.";
            this.langObj.l_0vol2_38 = "A gut feel tells me that I may need to use the wrench for something else before I give it away..";
            this.langObj.l_0vol3_00 = "Sadly, it's empty.";
            this.langObj.l_0vol3_01 = "This chest seems to be fastened shut. I can't seem to be able to open it.";
            this.langObj.l_0vol3_02 = "Using the crowbar, I winch open the chest, to find a fury rock relic!";
            this.langObj.l_0vol3_03 = "Try as I might, that doesn't help me open the chest.";
            this.langObj.l_0vol3_04 = "It appears that there is nothing more left inside this chest.";
            this.langObj.l_0vol3_05 = "Looks like a green froth from here.";
            this.langObj.l_0vol3_06 = "On closer inspection, this green froth over the fire looks, quite, um, furious. One wonders what this will taste like!.";
            this.langObj.l_0vol3_07 = "That looks like a plaque on the statue. I can't read what it says from here.";
            this.langObj.l_0vol3_08 = "Hmmm, it looks like this basket is completely empty.";
            this.langObj.l_0vol4_00 = "Those eggs are too far down the ledge for me to reach them.";
            this.langObj.l_0vol4_01 = "There is no need to put anything more on there!";
            this.langObj.l_0vol4_02 = "The fury rock snaps into position with a click. Good work!";
            this.langObj.l_0vol4_03 = "That doesn't seem to fit very well at all!";
            this.langObj.l_0vol4_04 = "There is no need to put anything more on there!";
            this.langObj.l_0vol4_05 = "The angry rock snaps into position with a click. Good work!";
            this.langObj.l_0vol4_06 = "It doesn't seem to fit very well in there, but it seems pretty close!";
            this.langObj.l_0vol4_07 = "That doesn't seem to fit very well at all!";
            this.langObj.l_0vol4_08 = "";
            this.langObj.l_0vol4_09 = "The cooker rock snaps into position with a click. Good work!";
            this.langObj.l_0vol4_10 = "It doesn't seem to fit very well in there, but it seems pretty close!";
            this.langObj.l_0vol4_11 = "That doesn't seem to fit very well at all!";
            this.langObj.l_0vol4_12 = "The fury rock looks nice there in its position.";
            this.langObj.l_0vol4_13 = "The angry rock looks snug in its position. I feel proud.";
            this.langObj.l_0vol4_14 = "The cooker rock sits firmly upon its stand.";
            this.langObj.l_0vol4_15 = "That looks like a gigantic puzzle Piece!. Wow! Something is happening!";
            this.langObj.l_0vol4_16 = "Looks like the stand is holding up nicely with the rock on top of it. I feel proud!";
            this.langObj.l_0vol4_17 = "That looks like a container of some sort. It has some little clamps on it, as if something is normally connected to it.";
            this.langObj.l_0vol5_00 = "Hmm, that hasn't helped loosen it.";
            this.langObj.l_0vol5_01 = "That piece looks quite spectacular from here.";
            this.langObj.l_0vol5_02 = "This piece looks quite remarkable.. It is a little rickety on it's base there.";
            this.langObj.l_0war00 = "PRACTICE";
            this.langObj.l_0war01 = "TEAM";
            this.langObj.l_0war02 = "VERSUS";
            this.langObj.l_0war03 = "Battle";
            this.langObj.l_0war04 = "Players";
            this.langObj.l_0war05 = "PREPARING";
            this.langObj.l_0war06 = "FINDING UP TO";
            this.langObj.l_0war07 = "MORE PLAYERS";
            this.langObj.l_0war08 = "LOADING";
            this.langObj.l_0war09 = "Movie Focus Lost!\nClick here to gain movie focus.";
            this.langObj.l_0war10 = "Draw!";
            this.langObj.l_0war11 = "Wins!";
            this.langObj.l_0war12 = "WAITING FOR OTHER PLAYERS";
            this.langObj.l_0war13 = "Waiting for other players...";
            this.langObj.l_0war14 = "LV";
            this.langObj.l_0war15 = "You Died";
            this.langObj.l_0war16 = "Perhaps try another game, or root for your team in spectator mode.";
            this.langObj.l_0war17 = "Rock";
            this.langObj.l_0war18 = "Battle Ball";
            this.langObj.l_0war19 = "Frisbee";
            this.langObj.l_0war20 = "Boomerang";
            this.langObj.l_0war21 = "Cherry Bomb";
            this.langObj.l_0war22 = "Bubble";
            this.langObj.l_0war23 = "Healer";
            this.langObj.l_0war24 = "Attractor";
            this.langObj.l_0war25 = "Repulsor";
            this.langObj.l_0war30 = "Instructions";
            this.langObj.l_0war31 = "Battle time! Using various weapons, your aim is to reduce your opponent's health to zero. For a team to win the match, the players must reduce all of the opponents' health to zero.";
            this.langObj.l_0war32 = "Gameplay occurs in turns. During a turn you can move your character and prepare their attack. You must wait for the timer to appear before a turn begins. Finish your turn before the timer ends.";
            this.langObj.l_0war33 = "During a turn you can walk with the arrow or WASD keys to move into attack position. By clicking the mouse on screen during a turn, you prepare your currently selected weapon.";
            this.langObj.l_0war34 = "Select your weapon from your battle inventory at the bottom of the screen. Most weapons can only be used once, so make your turns count! (Note: You only have one weapon to begin with).";
            this.langObj.l_0war35 = "You gain Experience Points (XP) for damaging other players. If you gain enough XP, you will increase your level. Each new level presents a new set of weapons that can be purchased from the weapons store.";
            this.langObj.l_0war36 = "Your happiness influences the effectiveness of your weapons. For projectile based weapons a higher happiness means a more accurate aim. Your ability to defend with defensive items is also increased with a higher happiness.";
            this.langObj.l_0war37 = "You can use the chat bar at the bottom to communicate with other players.";
            this.langObj.l_0war41 = "Objective";
            this.langObj.l_0war42 = "Gameplay";
            this.langObj.l_0war43 = "Controls";
            this.langObj.l_0war44 = "Weapons";
            this.langObj.l_0war45 = "Leveling Up";
            this.langObj.l_0war46 = "Happiness";
            this.langObj.l_0war47 = "Chat";
            this.langObj.l_0war51 = "Health Taken: ";
            this.langObj.l_0war52 = "Health Lost: ";
            this.langObj.l_0war53 = "Experience Gained: ";
            this.langObj.l_0war54 = "Games Won: ";
            this.langObj.l_0war55 = "Friendly Health Taken: ";
            this.langObj.l_0war50 = "Skipping to next turn. Performance is low on your machine. To increase performance, lower your quality settings.";
            this.langObj.l_0war60 = "Starting in ";
            this.langObj.l_0war70 = "INSTRUCTIONS";
            this.langObj.l_0war100 = "XP Bar";
            this.langObj.l_0war101 = "Map";
            this.langObj.l_0war102 = "Camera Slider";
            this.langObj.l_0war103 = "Your Player";
            this.langObj.l_0war104 = "Your Team Member";
            this.langObj.l_0war105 = "Enemy";
            this.langObj.l_0war106 = "Instructions Menu";
            this.langObj.l_0war107 = "Exit";
            this.langObj.l_0war108 = "Rock";
            this.langObj.l_0war109 = "Battle Ball";
            this.langObj.l_0war110 = "Frisbee";
            this.langObj.l_0war111 = "Cherry Bomb";
            this.langObj.l_0war112 = "Boomerang";
            this.langObj.l_0war113 = "Bubble Shield";
            this.langObj.l_0war114 = "Health";
            this.langObj.l_0war115 = "Attractor";
            this.langObj.l_0war116 = "Repulsor";
            this.langObj.l_0war117 = "Player Info";
            this.langObj.l_0war118 = "NEW GAME";
            this.langObj.l_0war119 = "SPECTATE";
            this.langObj.l_0war120 = "EXIT";
            this.langObj.l_0war140 = "Level ";
            this.langObj.l_0war141 = " - XP ";
            this.langObj.l_0war200 = "Shows how much experience (XP) needs to be gained before your avatar reaches a new level.";
            this.langObj.l_0war201 = "Shows the level, player, and weapon positions.";
            this.langObj.l_0war202 = "Click and drag to manually control the camera.";
            this.langObj.l_0war203 = "This is you! See instructions for controlling your player.";
            this.langObj.l_0war204 = "This person is on your team. Be careful not to attack them, and try your best to defend them.";
            this.langObj.l_0war205 = "This person is an enemy! Destroy them!";
            this.langObj.l_0war206 = "Click on this to view the instructions on how to play.";
            this.langObj.l_0war207 = "Click on this to exit the current game.";
            this.langObj.l_0war208 = "Your default weapon. It is weak, but rocks are in abundant supply.";
            this.langObj.l_0war209 = "Slighty more powerful than a rock. It also rolls and bounces better as well!";
            this.langObj.l_0war210 = "A long range weapon. The most upgraded frisbee explodes on impact!";
            this.langObj.l_0war211 = "A powerful explosive. Short range but effective. Upgrade to maximum to triple the fun!";
            this.langObj.l_0war212 = "A tricky weapon to use, but it has its advantages. As long as it returns to your player you can use it as many times as you want!";
            this.langObj.l_0war213 = "A very effective defensive weapon. This will deflect any incoming projectiles. Upgrade to increase the bubble's strength.";
            this.langObj.l_0war214 = "Use this to regenerate some health, but be careful! Sometimes it can explode!";
            this.langObj.l_0war215 = "Manipulate the trajectory of incoming projectiles. This will attract projectiles to its position.";
            this.langObj.l_0war216 = "Manipulate the trajectory of incoming projectiles. This will repel projectiles to its position.";
            this.langObj.l_0war217 = "Displays information for a particular character. The bar displays their remaining health. Click on this to move the camera to their position.";
            this.langObj.l_0war218 = "";
            this.langObj.l_0war219 = "";
            this.langObj.l_0war301 = "Loading";
            this.langObj.l_0war302 = "Ready";
            this.langObj.l_0war400 = "The purchased weapon will be available in the next match.";
            this.langObj.l_1err01 = 'ليس متاحًا على شبكتك؛ لذلك فإن أداء الشبكة سيكون على غير ما يُرام، ونقترح ألا تحظر هذا المنفذ حتى تستمتع بلعب "جزر عيش سفاري" على أكمل وج %rep1% لقد اكتشفنا أن المنفذ ';
            this.langObj.l_1err02 = "لقد تم إخراجك نتيجة عدم التفعيل";
            this.langObj.l_1err03 = "هناك مشكلة في الحوار. من فضلك، اتصل بالدعم الفني";
            this.langObj.l_1err04 = "تحذير: اللغة المحلية المستعملة مختلفة عن لغة التسجيل";
            this.langObj.l_1err05 = "لا يمكنك تحميل حوار الآن. من فضلك، اتصل بالدعم الفني";
            this.langObj.l_1err06 = "لديك أكثر من نافذة مفتوحة. من فضلك، أغلق النافذة الأخرى، وأعد التنشيط لتستطيع اللعب";
            this.langObj.l_1err07 = "لا يمكنك تحميل بيانات التسجيل. من فضلك، اتصل بالدعم الفني";
            this.langObj.l_1err08 = "هناك مشكلة في تحميل البيانات. من فضلك، اتصل بالدعم الفني";
            this.langObj.l_1err09 = "لا يمكن تحويل المشاهد إلى نفس المشهد الذي أنت فيه";
            this.langObj.l_1err10 = "لقد أرسلت بالفعل طلبا الصداقة لهذا المستخدم. اذا كان هناك خطأ ، ثم الرجاء المحاولة مرة أخرى قليلا في وقت لاحق";
            this.langObj.l_1err11 = "هذا السبب غير مقنع لإبلاغك عن إساءة لهذا اللاعب";
            this.langObj.l_1err12 = "انتهت الدورة الخاصه بك مع الفايس بوك ";
            this.langObj.l_1err13 = "للاستمتاع بوضع ملء الشاشه يجب عليك تحديث الفلاش بلاير الى احدث اصدار ";
            this.langObj.l_1alterr01 = 'المنفذ 9339 غير متاح عبر شبكتك، ولذلك سيكون أداؤك للعبة ضعيفًا للغاية. نقترح عليك فتح هذا المنفذ؛ حتى تتمكن من الاستمتاع بلعبة "جزر عيش سفاري" بصورة أفضل';
            this.langObj.l_1srv1 = "اسم المستخدم أو كلمة المرور غير صالحة";
            this.langObj.l_1srv2 = "لم يتم تأكيد عنوان بريدك الإلكتروني بعد. فضلاً، راجع بريدك الإلكتروني، واضغط على الرابط لتأكيد حسابك. راجع صندوق الرسائل المهملة، أو انقر 'نسيت كلمة المرور' لمزيد من المساعدة";
            this.langObj.l_1srv3 = "أنت محظور! فضلاً اتصل بالدعم الفني، إذا كان ذلك تم بالخطأ";
            this.langObj.l_1srv4 = "غير مسموح بأي تمادي!";
            this.langObj.l_1srv5 = "لقد تم تحذيرك! لا للتمادي! أنت مستبعد الآن";
            this.langObj.l_1srv6 = "أوقف التمادي! لقد تم حظرك.";
            this.langObj.l_1srv8 = "لقد تم حظرك";
            this.langObj.l_1srv9 = "يريد البعض إضافتك إلى قائمة أصدقائهم، لكن قائمة أصدقائك كاملة حاليًّا";
            this.langObj.l_1srv10 = "لا يمكن تكوين صداقات مع ذلك الشخص -- قائمة أصدقائهم ممتلئ";
            this.langObj.l_1srv11 = "تسجيل الدخول معطل لمدة محدودة. يرجى المحاولة مرة أخرى بعد قليل";
            this.langObj.l_1cht01 = "%rep2% :<b><font color='#AAAAAA'>%rep1%</font></b>\n";
            this.langObj.l_1login01 = "اسم المستخدم";
            this.langObj.l_1login02 = "كلمة المرور";
            this.langObj.l_1login03 = "تسجيل دخول";
            this.langObj.l_1login04 = "تسجيل";
            this.langObj.l_1login05 = "نسيت كلمة المرور";
            this.langObj.l_1login06 = "حدِّد منطقة";
            this.langObj.l_1login07 = "اختيار شخصية";
            this.langObj.l_1login08 = "شخصية جديدة";
            this.langObj.l_1hlp00 = "شراء رصيد";
            this.langObj.l_1hlp01 = "منزلي";
            this.langObj.l_1hlp02 = "قم بأداء نشاط";
            this.langObj.l_1hlp03 = "معلومات القبيلة";
            this.langObj.l_1hlp04 = "مخزون";
            this.langObj.l_1hlp05 = "ملف خاص";
            this.langObj.l_1hlp06 = "مقياس السعادة";
            this.langObj.l_1hlp07 = "ممارسة القتال";
            this.langObj.l_1hlp08 = "معركة/ قتال";
            this.langObj.l_1hlp09 = "انقر كي تتحدث";
            this.langObj.l_1hlp10 = "مشاهدة سِجل الدردشة";
            this.langObj.l_1hlp11 = "إظهار/ إخفاء قائمة الأصدقاء";
            this.langObj.l_1hlp12 = "لوحة المراقبين";
            this.langObj.l_1hlp13 = "تعديل جودة الصورة";
            this.langObj.l_1hlp14 = "تبديل صوت";
            this.langObj.l_1hlp15 = "خروج";
            this.langObj.l_1hlp16 = "العودة إلى البرنامج";
            this.langObj.l_1hlp17 = "وضع متصل";
            this.langObj.l_1hlp18 = "زيارة الرئيسية";
            this.langObj.l_1hlp19 = "حذف صديق";
            this.langObj.l_1hlp20 = "رسالة خاصة";
            this.langObj.l_1hlp21 = "هناك رسالة بريدية في انتظارك";
            this.langObj.l_1hlp22 = "إعدادات تكوين الموقع";
            this.langObj.l_1hlp23 = "ابحث عن مستخدم (مستخدمين)";
            this.langObj.l_1hlp24 = "قائمة المشاهد";
            this.langObj.l_1hlp25 = "مراقب الكلمات البذيئة";
            this.langObj.l_1hlp26 = "مراقب الدردشة";
            this.langObj.l_1hlp27 = "تشغيل/ توقف";
            this.langObj.l_1hlp28 = "ضبط إعدادات المعركة تلقائيًّا";
            this.langObj.l_1hlp29 = "احفظ إعدادات معركة جديدة";
            this.langObj.l_1hlp30 = "انتبه: سيعاود الخادم (السيرفر) التشغيل من جديد";
            this.langObj.l_1hlp32 = "ابعث رسالة إلى هذا اللاعب";
            this.langObj.l_1hlp31 = "الانتقال للموقع المختار";
            this.langObj.l_1hlp32 = "أبعث رسالة إلى هذا اللاعب ";
            this.langObj.l_1hlp33 = "ابعث رسالة استبعاد إلى هذا اللاعب";
            this.langObj.l_1hlp34 = "ابعث رسالة حظر لهذا المستخدم";
            this.langObj.l_1hlp35 = "احظر رقم الآي بي الخاص بهذا اللاعب أو الهاكر";
            this.langObj.l_1hlp36 = "تبديل الاستطلاعية التلقائي";
            this.langObj.l_1hlp37 = "أبلغ عن إساءة من هذا اللاعب";
            this.langObj.l_1hlp38 = "تحدَّ هذا اللاعب في معركة تدريبية";
            this.langObj.l_1hlp39 = "احذر: هذه الخاصية تتحكم في تحديد عدد اللاعبين داخل المنطقة";
            this.langObj.l_1hlp40 = "إعادة تنشيط إعدادات السيرفر. لا يسمح لك بعمل ذلك إلا مرة واحدة";
            this.langObj.l_1hlp41 = "أرسل رسالة عامة لهذه المنطقة";
            this.langObj.l_1hlp42 = "تجاهل هذا الشخص";
            this.langObj.l_1hlp43 = "شراء الأسلحة";
            this.langObj.l_1hlp44 = "إعطاء";
            this.langObj.l_1hlp45 = " تبديل وضع ملء الشاشة";
            this.langObj.l_1gui00 = "ملف خاص";
            this.langObj.l_1gui01 = "سِجل الدردشة";
            this.langObj.l_1gui02 = "إجراءات";
            this.langObj.l_1gui03 = "خروج";
            this.langObj.l_1gui04 = "ارسل";
            this.langObj.l_1gui05 = "اسم";
            this.langObj.l_1gui06 = "قبيلة";
            this.langObj.l_1gui07 = "تصنيف";
            this.langObj.l_1gui08 = "ربح/خسارة المعارك";
            this.langObj.l_1gui09 = "التحق";
            this.langObj.l_1gui10 = "عن اللاعب";
            this.langObj.l_1gui11 = "ملف خاص";
            this.langObj.l_1gui12 = "مخزن";
            this.langObj.l_1gui13 = "معلومات القبيلة";
            this.langObj.l_1gui14 = "جوائز";
            this.langObj.l_1gui15 = " دردشة خاصة مع ";
            this.langObj.l_1gui16 = "قِف";
            this.langObj.l_1gui17 = "موافق";
            this.langObj.l_1gui18 = "تم بالفعل";
            this.langObj.l_1gui19 = "تم شراؤه";
            this.langObj.l_1gui20 = "معركة";
            this.langObj.l_1gui21 = "ممارسة";
            this.langObj.l_1gui22 = "موجة";
            this.langObj.l_1gui23 = "أعط";
            this.langObj.l_1gui24 = "احفظ";
            this.langObj.l_1gui25 = "السكان المتواجدون";
            this.langObj.l_1gui26 = "الزوّار المتواجدون";
            this.langObj.l_1gui40 = "%rep1% أصبحت الآن صديقًا ل";
            this.langObj.l_1gui41 = "%rep1% لم تعد صديقًا ل";
            this.langObj.l_1gui42 = "تحتاج إلى أن تكون في نفس الموقع لتتمكن من تبادل الأشياء";
            this.langObj.l_1gui43 = "لا يمكنك عمل ذلك هنا. من فضلك، اذهب إلى مكان آخر للقيام بذلك";
            this.langObj.l_1gui44 = "من قائمة أصدقائك  %rep1%  هل تريد فعلاً القيام بحذف";
            this.langObj.l_1gui45 = "ير غب أن يكون صديقا لك، فهل تقبل ذلك؟   %rep1%";
            this.langObj.l_1gui46 = "متجر الأسلحة";
            this.langObj.l_1gui47 = "ترقية";
            this.langObj.l_1gui48 = "هل تريد فعلاً تخطِّي برنامج المساعدة؟";
            this.langObj.l_1gui49 = "هل تريد فعلاً العودة إلى برنامج المساعدة؟";
            this.langObj.l_1gui50 = "يرغب في بدء معركة تدريبية معك، فهل تقبل ذلك؟  %rep1%";
            this.langObj.l_1gui51 = "لقد تسلمت";
            this.langObj.l_1gui52 = "لم تصبح بعد مالكًا للمنزل. من فضلك، اتصل بمتجر الأثاث المحلي للحصول على معلومات عن استئجار منزلك";
            this.langObj.l_1gui53 = "ليس لديك عملات نقدية تكفي لذلك.";
            this.langObj.l_1gui54 = "رسالة المشرف";
            this.langObj.l_1gui55 = "تبادل";
            this.langObj.l_1gui56 = "التالي";
            this.langObj.l_1gui57 = "شراء";
            this.langObj.l_1gui58 = "متجر الأثاث";
            this.langObj.l_1gui59 = "متجر الأسلحة";
            this.langObj.l_1gui60 = "متجر إكسسوارات";
            this.langObj.l_1gui62 = "شكرًا لك. لقد تم التبادل بنجاح";
            this.langObj.l_1gui63 = "لقد تلقيت";
            this.langObj.l_1gui64 = "في مقابل";
            this.langObj.l_1gui65 = "رصيد الرسائل القصيرة";
            this.langObj.l_1gui66 = "من العملة، وتُرشح للفوز بإحدى الجوائز المجانية %rep1% ابعث برسالة نصيّة فارغة لتحصل على ";
            this.langObj.l_1gui67 = "حدِّد الدولة";
            this.langObj.l_1gui68 = "ادخل الرمز";
            this.langObj.l_1gui69 = "تجديد";
            this.langObj.l_1gui70 = "تم بالفعل تجديد هذا الرمز";
            this.langObj.l_1gui71 = "رمز غير صحيح. فضلاً، راجع الرمز، وأعد الإدخال";
            this.langObj.l_1gui72 = "حدثت مشكلة أثناء العملية";
            this.langObj.l_1gui73 = "تهانينا على شرائك ";
            this.langObj.l_1gui74 = "%rep1% x";
            this.langObj.l_1gui75 = "اختر واحداً";
            this.langObj.l_1gui76 = "طلب";
            this.langObj.l_1gui77 = "نعم";
            this.langObj.l_1gui78 = "لا";
            this.langObj.l_1gui79 = "أبلغ عن إساءة من لاعب";
            this.langObj.l_1gui80 = "من فضلك، قم بتوضيح سبب إبلاغك عن إساءة من هذا اللاعب؛ فلا بد أن يكون لديك سبب واضح يؤكد خرق هذا اللاعب للقواعد";
            this.langObj.l_1gui81 = "إلغاء";
            this.langObj.l_1gui82 = "أرسل";
            this.langObj.l_1gui83 = "تم إرسال التقرير. شكرًا لك";
            this.langObj.l_1gui84 = "ليست لديك كمية كافية من عملات القبائل الأخرى لاستبدالها بهذه العملة. أعد تحديد الكمية المطلوبة لتناسب المبلغ المتوفر لديك: %rep1%";
            this.langObj.l_1gui85 = "هل أنت متأكد أنك تريد الخروج؟";
            this.langObj.l_1gui86 = "من %rep2% %rep1% الميداليات المُكتسبة";
            this.langObj.l_1gui87 = "من %rep1% %rep2% الألعاب المكتشفة";
            this.langObj.l_1gui88 = " دردشة المشرف مع ";
            this.langObj.l_1gui90 = "بلا جوائز";
            this.langObj.l_1gui91 = "حذف صديق";
            this.langObj.l_1gui92 = "إضافة صديق";
            this.langObj.l_1gui93 = "معركة تدريبية";
            this.langObj.l_1gui94 = " نقاط الخبرة ";
            this.langObj.l_1gui100 = "الأثاث";
            this.langObj.l_1gui101 = "الملابس";
            this.langObj.l_1gui102 = "عناصر المهمة";
            this.langObj.l_1gui103 = "الكل";
            this.langObj.l_1gui104 = "الأسلحة";
            this.langObj.l_1action01 = "تنهُّد";
            this.langObj.l_1action02 = "عطس";
            this.langObj.l_1action03 = "إيماءة الموافقة";
            this.langObj.l_1action04 = "قهقهة";
            this.langObj.l_1action05 = "هز الرأس";
            this.langObj.l_1action06 = "تودد";
            this.langObj.l_1action07 = "توقف";
            this.langObj.l_1action08 = "تلويح باليد";
            this.langObj.l_1medal01 = "برونز";
            this.langObj.l_1medal02 = "فضة";
            this.langObj.l_1medal03 = "ذهب";
            this.langObj.l_1medal10 = " تهانينا! لقد قمت بترقية ميداليتك من %rep1%  إلى %rep2% ! ";
            this.langObj.l_1medal11 = "  تهانينا! لقد ربحت  %rep2%  ميدالية عن         \n %rep1%";
            this.langObj.l_1tut01 = "رائع! لقد تم فتحه بسهولة. إنه فارغ. كان عليّ أخذ هذا البوق منذ فترة";
            this.langObj.l_1tut02 = "رائع! لقد تم فتحه بسهولة. يبدو أن هناك شيئًا ما بالداخل";
            this.langObj.l_1tut03 = "لقد تم فتحه، ولا حاجة لعمل شيء إضافي له";
            this.langObj.l_1tut04 = "لسوء الحظ، هذا لا يساعدني في فتح هذا الصندوق";
            this.langObj.l_1tut05 = "من فضلك، اتَّبع تعليمات البرنامج. يمكنك إلقاء نظرة على ذلك لاحقًا.";
            this.langObj.l_1tut06 = "ليس مقبولاً أو جيدًا أن تؤذي طائر النَّورس";
            this.langObj.l_1tut07 = "ربما يكون ذلك مفيدًا، لكن من المحتمل أن أحتاج أولاً إلى استخدام شيء آخر؛ حتى يمكنني إصلاح ذلك.";
            this.langObj.l_1tut08 = "لا أدرى كيف أستعمل ذلك لإصلاح هذه العوّامة";
            this.langObj.l_1tut09 = "عمل جيد";
            this.langObj.l_1tut10 = "الحوار غير مُعدّ على البرنامج باللغة الحالية. من فضلك، استعمل الإنجليزية";
            this.langObj.l_1tut11 = "على الأرجح، فإن الجلوس في هذه العوامة ليس فكرة جيدة، إلى حين أن يمكنك إعادة إصلاحها وتشغيلها";
            this.langObj.l_1tut12 = "بالفعل، تبدو هذه العوامة في شكل جيد. إنني على يقين من أنها جيدة بما يكفي للإبحار بها والعثور على جزيرتي";
            this.langObj.l_1tut13 = "إن لديك سمكة بالفعل. استمر، واتّبع التعليمات";
            this.langObj.l_1tut14 = "ليس لديك عملات نقدية تكفي لذلك";
            this.langObj.l_1tut15 = "من فضلك، اتبع تعليمات البرنامج الظاهرة أعلى الشاشة";
            this.langObj.l_1tut16 = "إن الوقت غير مناسب لعمل ذلك. من فضلك، اتبع التعليمات";
            this.langObj.l_1tut17 = "يبدو أن هذا الصندوق مغلق.";
            this.langObj.l_1tut18 = "عجبًا! إنه يبدو وكأنه بوق جديد لامع";
            this.langObj.l_1tut19 = "ليس هناك شيء متروك في الصندوق";
            this.langObj.l_1tut20 = "على ما يبدو أنها عوّامة معطّلة";
            this.langObj.l_1tut21 = "يبدو ذلك جيدًا. هل تستطيع عمل ذلك الآن بدعم بسيط";
            this.langObj.l_1tut22 = "أرى أنك تبحث عن طريقة لالتقاط الأنفاس";
            this.langObj.l_1tut23 = "يبدو أن الأمر مهيأ للذهاب. ربما يجب عليّ أولاً أن أودع القائد";
            this.langObj.l_1tut24 = "لست متأكدا تمامًا ماذا يأتي من هنا";
            this.langObj.l_1tut25 = "لديك بالفعل واحدة من ذلك";
            this.langObj.l_1tut26 = "ربما يكون ذلك مفيدًا";
            this.langObj.l_1tut27 = "ليس هذا ما يريده القائد";
            this.langObj.l_1tut28 = 'مرحبا بك في جزيرة المساعدة.. سنأخذك في جولة قصيرة على المعلومات الأساسية عن كيفية التعامل مع عالم كوكولاني.. هذه الجولة قد تستغرق من 10-15 دقيقة.. يمكنك الضغط على زر ""إلغاء الجولة" في أي وقت لتجاوز هذه المرحلة';
            this.langObj.l_1tut29 = "يبدو أن لوح الخشب هذا بالٍ إلى حد ما، كما يبدو أنه غائر في الرمال، لذا لا يمكنني التقاطه";
            this.langObj.l_1fdb00 = "لا بد أن تكون فى نفس المكان، كي يمكنك المتاجرة أو المبادلة مع شخص آخر";
            this.langObj.l_1fdb01 = "من فضلك، اختر أحد البنود لتتاجر به، وذلك بسحبه من قائمة المخزون إلى صندوق التبادل التجاري";
            this.langObj.l_1fdb02 = "من فضلك، اختر لاعبا لتتاجر أو تتبادل معه، وذلك بالنقر على اسمه الذي سيظهر لك عندما تفتح نافذة مخزن المقتنيات";
            this.langObj.l_1fdb03 = "هل تقبل ذلك؟, %rep1%  يعرض عليك  %rep2%";
            this.langObj.l_1fdb04 = "ليس بإمكانك التخلي عن ذلك.";
            this.langObj.l_1fdb05 = "أنت موجود بالفعل في هذه المنطقة";
            this.langObj.l_1fdb06 = "هناك مشكلة في التحاقك بهذه المنطقة. من فضلك، اتصل بالدعم الفني";
            this.langObj.l_1fdb07 = "ليست لديك مهارات كافية لشراء هذا السلاح بعد. ارتقِ بمستوى مهاراتك، وعد مرة أخرى";
            this.langObj.l_1fdb08 = "إنك تحتاج إلى أن تكون عضوًا قادرًا على الدفع كى تستطيع شراء هذا النوع";
            this.langObj.l_1fdb09 = "لا بد أن تكون في نفس الموقع؛ حتى يمكنك ممارسة القتال مع شخص آخر";
            this.langObj.l_1fdb10 = "أرسل طلبا لبدء معركة تدريبية";
            this.langObj.l_1fdb11 = "هذا المستخدم مشغول حاليا";
            this.langObj.l_1com00 = "إنني بعيد جدًّا";
            this.langObj.l_1com01 = "%rep1% لقد قمت بالتقاط";
            this.langObj.l_1com02 = "عزيزي";
            this.langObj.l_1com03 = "من";
            this.langObj.l_1com04 = "أرسل";
            this.langObj.l_1com05 = "من فضلك، اختر شخصًا ما ترسل إليه هذه الرسالة";
            this.langObj.l_1com06 = "رسالتك قصيرة جدًّا";
            this.langObj.l_1com07 = "%rep1% تم إرسال البريد الإلكتروني بنجاح إلى";
            this.langObj.l_1com08 = "لا يمكنك قراءة البريد الإلكتروني الخاص بآخرين";
            this.langObj.l_1com09 = "ليس لديك رصيد كافٍ لذلك";
            this.langObj.l_1com10 = "ليس هناك مكان يمكنك الجلوس فيه";
            this.langObj.l_1com11 = "يجلس شخص ما هناك، ولا يمكنك أخذ ذلك المكان إلى أن يقف ويتركه";
            this.langObj.l_1com12 = "أنت في حاجة إلى مزيد من العملات كي تتاجر";
            this.langObj.l_1com13 = "\n %rep1% \n القائد ";
            this.langObj.l_1com14 = "للإيجار";
            this.langObj.l_1com15 = "ليس لديك أي بريد إليكتروني";
            this.langObj.l_1com16 = "من فضلك قم بالاختيار";
            this.langObj.l_1com17 = "اكتب رسالة";
            this.langObj.l_1com18 = "التكلفة: 1";
            this.langObj.l_1com19 = "هناك بالفعل شخص آخر يجلس هناك..";
            this.langObj.l_1com20 = "كانت هناك مشكلة مع هذا الطلب.";
            this.langObj.l_1hom00 = "هذا هو باب منزلي، إلا أنه يبدو مغلقًا";
            this.langObj.l_1hom01 = "الباب إلى منزلي مفتوح حاليًّا";
            this.langObj.l_1hom02 = "من مكاني هذا يبدو أن الباب مغلق";
            this.langObj.l_1hom03 = "يبدو أن الباب مفتوح من هنا";
            this.langObj.l_1hom04 = "إنني أفتح الباب";
            this.langObj.l_1hom05 = "إنني أغلق الباب";
            this.langObj.l_1hom06 = "الباب مغلق";
            this.langObj.l_1hom08 = "إنني أفتح الباب";
            this.langObj.l_1hom09 = "إنني أغلق الباب";
            this.langObj.l_1hom10 = "هذا الباب هو تحفة فنية مصنوعة بإتقان";
            this.langObj.l_1hom11 = "إن مالكي هذه الغرفة لا يودون أن أفتح أو أغلق بابهم";
            this.langObj.l_1hom12 = "هذا الباب يقود إلى منزلي. إنه يبدو مغلقًا";
            this.langObj.l_1hom13 = "إن باب منزلي مفتوح حاليًا";
            this.langObj.l_1hom14 = "يبدو أن الباب مغلق";
            this.langObj.l_1hom15 = "يبدو أن الباب مفتوح";
            this.langObj.l_1hom16 = "أنا أغلق الباب";
            this.langObj.l_1hom17 = "أنا أفتح الباب";
            this.langObj.l_1hom18 = "الآن يمكنك استئجار منزلك الخاص بك في منطقة الغابات المطيرة السكنية المذهلة";
            this.langObj.l_1hom19 = "الآن يمكنك استئجار منزلك الخاص بك بجوار منطقة الحمم والرواسب البركانية الرائعة";
            this.langObj.l_1hom20 = "إيجارك\n";
            this.langObj.l_1hom21 = "%rep1%\n :الإيجار الأول";
            this.langObj.l_1hom22 = "%rep1%\n:ينتهي";
            this.langObj.l_1hom23 = "لا حاجة للإيجار\n";
            this.langObj.l_1hom24 = "%rep1% :أيام";
            this.langObj.l_1hom25 = "يبدو أن هذا كُتيب لإيجار منزل بهذه القبيلة، وبينما أنا أتوجه ناحيته، ينظر إلى أمين المخازن ضاحكًا، لذا فإنني أفكر في الأمر جيدًا";
            this.langObj.l_1hom26 = "صندوق البريد";
            this.langObj.l_1hom27 = "جديد";
            this.langObj.l_1hom28 = "الرد";
            this.langObj.l_1hom29 = "أرسل";
            this.langObj.l_1hom30 = "غرفة التحميل";
            this.langObj.l_1hom31 = "يبدو أن منزلك قد اختفى، نرجو الاتصال بالدعم";
            this.langObj.l_1hom32 = ".لزيارة المنازل في قبيلة أخرى ، يجب أن تذهب إلى هذه القبيلة";
            this.langObj.l_1jun00 = "ريشة";
            this.langObj.l_1jun01 = "ورق الكرمة";
            this.langObj.l_1jun02 = "وردة جميلة";
            this.langObj.l_1jun03 = "ثمرة";
            this.langObj.l_1jun04 = "كم يبدو طائر الطوقان جميلاً عند رؤيته عن قرب";
            this.langObj.l_1jun05 = "كم يبدو طائر الطوقان متألقًا بألوانه الزاهية عند رؤيته من هنا";
            this.langObj.l_1jun06 = "بينما أرى تلك الموزة هناك، أتساءل كيف لي أن أحصل عليها؟";
            this.langObj.l_1jun07 = "لا أستطيع رؤية شيء هنالك.";
            this.langObj.l_1jun08 = "أوجد لي الأشياء التالية وسأوفر لك السعادة: أوراق من شجر الكرمة، جوز الهند، قشر الموز، جوهرة، ريشة، وردة، وبذرة";
            this.langObj.l_1jun09 = "من هنا تبدو أنها منضدة صغيرة، عليها بعض القطع الصغيرة";
            this.langObj.l_1jun10 = "ترى ما الذي تعنيه هذه الرموز";
            this.langObj.l_1jun11 = "يبدو ترتيب الرموز مثيرا للاهتمام";
            this.langObj.l_1jun12 = "%rep1%  إنني ألتقط الـ";
            this.langObj.l_1jun13 = ".يبدو أن هنالك شيء ما";
            this.langObj.l_1jun14 = ".يبدو أن هذا القرد قد شبع بالفعل، حيث لم يعد مهتمًا بالحصول على المزيد";
            this.langObj.l_1jun15 = ".يبدو أن القرد يحب الموز جدًّا، فقد التهمه دفعة واحدة";
            this.langObj.l_1jun16 = ".يبدو أن القرد غير مهتم بهذا";
            this.langObj.l_1jun17 = 'هذا رمز سكان "يوكنوم"، قبيلة الغابة الأسطورية';
            this.langObj.l_1jun18 = "لا يبدو الأمر مناسبًا هناك";
            this.langObj.l_1jun2_00 = "ورق الكرمة";
            this.langObj.l_1jun2_01 = "قشر الموز";
            this.langObj.l_1jun2_02 = "قشرة جوز الهند";
            this.langObj.l_1jun2_03 = "جوهرة خضراء";
            this.langObj.l_1jun2_04 = "القرد يصرخ في";
            this.langObj.l_1jun2_05 = "يبدو أن هناك شيئا ما";
            this.langObj.l_1jun2_06 = "إنني أستخدم مطرقة الباب، ولكن لا استجابة.";
            this.langObj.l_1jun2_07 = "تبدو مطرقة الباب البرونزية هذه ضخمة جدًّا";
            this.langObj.l_1jun2_08 = "يبدو أنه بداية صف من الأعمدة المتهدمة أعلى الغابة";
            this.langObj.l_1jun2_09 = "أنت تعلم أن ذلك يبدو إلى حد بعيد كمحجر العين";
            this.langObj.l_1jun2_10 = "مدهش! إن الجوهرة تناسب هذا المقبس تمامًا";
            this.langObj.l_1jun2_11 = "يبدو وكأن العين تنظر إليّ";
            this.langObj.l_1jun2_12 = "يا لها من مطرقة باب ضخمة!";
            this.langObj.l_1jun_vil01 = "يبدو كأن هناك قطعة قماش ملقاة على ذلك الحامل هناك";
            this.langObj.l_1jun_vil02 = "ربما يسهل الحصول على ذلك.";
            this.langObj.l_1jun_vil03 = "تنمو الزهور الصفراء بشكل جميل في إصيص الزهور";
            this.langObj.l_1jun_vil04 = "الباب مغلق";
            this.langObj.l_1jun_vil05 = "توجد مقاعد قليلة صغيرة جدًّا خارج هذا المخزن، ويبدو أنها مصممة لصغار الأطفال";
            this.langObj.l_1jun_vil06 = "يبدو أن هناك رسم لأريكة في هذا الرمز، ترى ما الذي يعنيه ذلك؟";
            this.langObj.l_1jun_vil07 = "هذه السلة مليئة بالأسلحة التي تبدو ثقيلة. من المؤكد أن هذا هو متجر الأسلحة";
            this.langObj.l_1jun_vil08 = "همم! هذه القبعة الموجودة بتلك اللافتة تُذكرني بمكان بيع إكسسوارات الملابس";
            this.langObj.l_1jun_vil09 = "هذه اللافتة تشير إلى متجر الأثاث الذي شهد الكثير من الأوقات الطيبة، عندما كان يعمل هنا الحارس السابق للمتجر";
            this.langObj.l_1jun_vil10 = "هذه اللافتة تشير إلى محل العصائر";
            this.langObj.l_1jun_vil11 = "هنا يقوم قائد المعركة ببيع الأسلحة للمارّة، وأعتقد أنه قام الآن بتجديد فعل ذلك ذلك لبعض الوقت، وإنني أتساءل عن موعد فتح المكان مرة أخرى";
            this.langObj.l_1jun_fur01 = "أخيرًا! ها هي الموزة المفقودة";
            this.langObj.l_1jun_fur02 = "حوض أسماك للبيع";
            this.langObj.l_1jun_fur03 = "رف كتب للبيع";
            this.langObj.l_1jun_fur04 = "مقعد للبيع";
            this.langObj.l_1jun_fur05 = "نبات للبيع";
            this.langObj.l_1jun_fur06 = "منضدة للبيع";
            this.langObj.l_1jun_fur07 = "جهاز تلفزيون للبيع.";
            this.langObj.l_1jun_fur08 = "بعض أواني الزينة (الفازات) المعروضة";
            this.langObj.l_1jun_fur09 = "بعض وحدات الأدراج معروضة للبيع";
            this.langObj.l_1jun_fur10 = "بعض المزهريات معروضة للبيع";
            this.langObj.l_1jun_fur11 = "أعواد من البخور تملأ الجو برائحة الفاكهة";
            this.langObj.l_1jun_fur12 = "الباب مغلق. أعتقد أنهم يريدون إبعادنا";
            this.langObj.l_1jun_lei01 = "دعني التقط هذه القطعة";
            this.langObj.l_1jun_lei02 = "تنمو الزهور الصفراء بشكل جميل في المزهرية";
            this.langObj.l_1jun_lig01 = "دعني ألتقط هذه القطعة";
            this.langObj.l_1jun_lig02 = "حاويات الوقود قابعة إلى جوار المنارة";
            this.langObj.l_1jun_lig03 = "يبدو أن هناك وقودًا قليلاً في هذه الحاوية، وببعض الوقود يمكنني قطع طريق طويل";
            this.langObj.l_1jun_lig04 = "يبدو أن الحاوية فارغة. لا بد أن ذلك هو الركام المهمل";
            this.langObj.l_1jun_lig05 = "إن باب المنارة صغير جدًّا، وإنني لأعجب من تلك المخلوقات الصغيرة التي تعمل داخلها. للأسف، لا أستطيع المرور من خلاله لأنه مغلق";
            this.langObj.l_1jun_pat01 = "دعني ألتقط هذه القطعة";
            this.langObj.l_1jun_pat02 = "إنه لأمر غريب! يبدو أن شيئًا ما فُقِد من هنا";
            this.langObj.l_1jun_pat03 = "لقد اكتمل اللغز بالفعل. ليست هناك حاجة لمزيد من القطع";
            this.langObj.l_1jun_pat04 = "هذه القطعة موجودة هناك بالفعل، هممممم... وأنا الذي ظننت أنني حللت اللغز";
            this.langObj.l_1jun_pat05 = "أنت تعلم أن ذلك يبدو مناسبًا";
            this.langObj.l_1jun_pat06 = "يبدو الأمر جيدًا. نحتاج فقط إلى مزيد من القطع";
            this.langObj.l_1jun_pat07 = "يبدو الأمر جيدًا هنا، إلا أن شيئًا ما يشعرني أن ذلك لن يكون مناسبًا لكل ذلك";
            this.langObj.l_1jun_pat08 = "هناك قطعة واحدة تقريبًا";
            this.langObj.l_1jun_pat09 = "يا له من موز طازج شهي";
            this.langObj.l_1jun_pat10 = "هناك شيء ما مفقود. دعنى اقترب أكثر لإلقاء نظرة بشكل أفضل";
            this.langObj.l_1jun_pat11 = "من الممكن أن تكون هذه العصا في متناول اليد";
            this.langObj.l_1jun_path12 = "دعني ألتقط هذه القطعة";
            this.langObj.l_1jun_path13 = "يبدو أنها لوحة على التمثال، وإنني لا أستطيع قراءتها من هنا";
            this.langObj.l_1jun_path14 = "أخيرًا! ها هو الموز المفقود";
            this.langObj.l_1jun_path15 = "يا له من موز طازج شهي";
            this.langObj.l_1jun_path16 = "الباب مغلق";
            this.langObj.l_1jun_path17 = "لم أر من قبل بابًا محكم الإغلاق كذلك";
            this.langObj.l_1jun_path18 = "هناك علامات حريق في كل الأنحاء";
            this.langObj.l_1jun_path19 = "توجد هنا تشكيلة متنوعة من جوز الهند. إنني أفضل تركها";
            this.langObj.l_1jun_path20 = "كم يبدو هذا الطائر جميلاً جدًا من هنا";
            this.langObj.l_1jun_path21 = "هذه الخنفساء العملاقة هي ما يصطحبه معه التاجر معه أينما ذهب.. يا للسعادة التي تبدو عليها معه";
            this.langObj.l_1jun_path22 = "توجد هناك سلة مليئة بجوز الهند،  وعلى الأرجح أنني أفضل عدم لمسها، لأنها ليست لي";
            this.langObj.l_1jun_path23 = "توجد ثمرة جوز هند بالقرب من السلة. ربما يتوجب عليّ ترك ثمار جوز الهند هذه، حيث إنها تخص مزارع جوز الهند";
            this.langObj.l_1jun3_00 = "ما هذا الضجيج المنخفض";
            this.langObj.l_1jun3_01 = "دعنى أدخل يديَّ هنا. والآن، لقد أصاب الغبار كلتا يديّ";
            this.langObj.l_1jun3_02 = "دعنى أدخل يديَّ هنا. عجبًا! ما هذا الشيء الغريب؟ قد يكون في المتناول";
            this.langObj.l_1jun3_03 = "تبدو لي من هنا وكأنها مزهرية عادية";
            this.langObj.l_1jun3_04 = "يبدو أن حبلاً يتدلّى هناك";
            this.langObj.l_1jun3_05 = "بجذبة خفيفة سيتحرَّر الحبل. ربما يكون ذلك مفيدًا بالنسبة لي";
            this.langObj.l_1jun3_06 = "هناك شيء أخضر يتناوب على هذه المنصة، وإنني أحتاج إلى أن أكون على مقربة منه لإلقاء نظرة ثاقبة عليه";
            this.langObj.l_1jun3_07 = "إنك تلتقط الجوهرة الخضراء";
            this.langObj.l_1jun3_08 = "يبدو أنها شجرة موز موجودة هناك";
            this.langObj.l_1jun3_09 = "توجد بالفعل رافعة هناك، ولسنا في حاجة إلى أخرى";
            this.langObj.l_1jun3_10 = "رائع! كم يبدو ذلك مناسبًا";
            this.langObj.l_1jun3_11 = "إنني أحاول وضع ذلك هناك، إلا أنه ذلك لا يبدو مناسبًا بشكل صحيح";
            this.langObj.l_1jun3_12 = "من خلال الضغط والدفع، يمكن للرافعة تحريكها";
            this.langObj.l_1jun3_13 = 'وكأن عيون "إيري" الخضراء تُحدِّق فيّ من خلال المشواة';
            this.langObj.l_1jun3_14 = "يا للعجب";
            this.langObj.l_1jun3_15 = "توجد فتحة هنالك، ولكنني مندهش لأن هناك شيء ما مفقود";
            this.langObj.l_1jun3_16 = " إن المكان مظلم جدًّا هنا، ولا بد أن أجد شيئًا ما يساعدني على الرؤية";
            this.langObj.l_1jun3_17 = "هناك قوه غريبه تعيدنى الى الخلف وتمنعنى من الدخول الى هذا الممر ,, ربما هناك شىء يجب ان افعله اولا؟؟؟";
            this.langObj.l_1jun4_00 = "هناك لافتة على باب متجر الأسلحة تفيد بأنه مغلق. ربما هم صيادون محافظون";
            this.langObj.l_1jun4_01 = "إنني أرى ما يشبه الباب من هذه المسافة";
            this.langObj.l_1jun4_beach01 = "إن اللافتة تقول بأنة غير مسموح برمى النفايات والحيوانات على الشاطىء ";
            this.langObj.l_1vol0_00 = 'ذلك هو فخر وبهجة قبيلة "هوهولوا"، التى تعيش مع البركان والصخرة السوداء.';
            this.langObj.l_1vol0_01 = "فيما يبدو أن سرطان البحر يقضي وقتًا ممتعًا وهو يمشي جيئة وذهابًا عبر هذا المنحدر الكبير";
            this.langObj.l_1vol0_02 = "يوجد إناء فارغ على المنضدة";
            this.langObj.l_1vol0_03 = "يوجد إناء صغير على المنضدة";
            this.langObj.l_1vol0_04 = "يوجد إناء طويل على المنضدة";
            this.langObj.l_1vol0_05 = "يوجد إناء ضخم على المنضدة";
            this.langObj.l_1vol0_06 = "يقبع سرطان البحر الآلي على المنضدة. لكم يبد جميلاً";
            this.langObj.l_1vol0_07 = "توجد هنالك بيضة كبيرة، وإني لأتساءل ما نوع هذا الكائن الذي سيفقس منها، أو ربما يكون ذلك بمثابة عيد للأسرة";
            this.langObj.l_1vol0_08 = "توجد هنالك قطعة كريستال ضخمة";
            this.langObj.l_1vol0_09 = "توجد صخرة سوداءعلى المنضدة، ولا بد لي أن أقول أنها ذات شكل رائع جدًّا";
            this.langObj.l_1vol0_10 = "إنها أكبر كرزة رأيتها في حياتي";
            this.langObj.l_1volvil_00 = "توجد أريكة وسجادة بالأعلى في هذا المتجر؛ لذلك فإن هذا المكان بالمدينة هو الذي يمكنني أن أجد فيه الأثاث";
            this.langObj.l_1volvil_01 = "الدرع الموجود أعلى الحدادين يدل على أن هذا المكان مستودع أسلحة";
            this.langObj.l_1volvil_02 = "من خلال الاطلاع على هذه اللافتة، ربما يكون باستطاعتي شراء الملابس من هذا المكان";
            this.langObj.l_1vol_tmp01 = "تبدو من هنا وكأنها تشبه السُّلحفاة نوعًا ما. على ما يبدو أنه يحتاج إلى مساعدة";
            this.langObj.l_1vol_tmp02 = "تلك الكتلة المعدنية الضخمة تساعد في حفر الأنفاق عبر الصخور البركانية الملتهبة";
            this.langObj.l_1vol_tmp03 = "فيما يبدو من هنا أنها عربة يدوية";
            this.langObj.l_1vol_tmp04 = "بالفحص عن قرب، أرى أن العربة اليدوية ممتلئة بالصخور السوداء. احذر أن تلمسها";
            this.langObj.l_1vol1_00 = "إنني أقوم بالتقاط القبعة";
            this.langObj.l_1vol1_01 = "تلك العربة المكسورة تحتاج قَطْعًا إلى بعض الإصلاح. لقد سقطت عجلاتها جميعًا";
            this.langObj.l_1vol1_02 = "إن عربة المنجم المليئة تقبع هنالك منذ مدة في انتظار تجهيز الخامات اللازمة لها";
            this.langObj.l_1vol1_03 = "إن لهذا المقبض عدة مقاييس تالية له، ومن الصعب أن أخبر بما تعنيه";
            this.langObj.l_1vol1_04 = "على الأرجح، يُفضَّل ألا ألمس هذا الصمام الآن";
            this.langObj.l_1vol1_05 = "إنه يبدو من هنا وكأنه قضيب من الفولاذ الصلب، وقد يصبح في متناول اليد";
            this.langObj.l_1vol1_06 = "إنني ألتقط مفتاح الفولاذ الصلب";
            this.langObj.l_1vol1_07 = "يبدو أن هذه العربة فى حاجة ماسة إلى الصيانة والإصلاح، وهذا ما يتوجب على الميكانيكي فعله";
            this.langObj.l_1vol1_08 = "يبدو أنه ليس هناك شيء آخر في هذه السلة غير بعض الأدوات القليلة المكسورة";
            this.langObj.l_1vol1_09 = "لقد وجدت 25 صخرة سوداء";
            this.langObj.l_1vol1_10 = "حسنًا! لقد وجدت 50 صخرة سوداء";
            this.langObj.l_1vol1_11 = "إن العربة محمَّلة بالصخور، ومن المحزن أنها ليست من نوع الصخور السوداء التي أعجب بها";
            this.langObj.l_1vol1_12 = "المِعوَل موجود هناك، وهو جاهز للاستخدام في المنجم";
            this.langObj.l_1vol1_13 = "يا لها من آلة ذات منظر مدهش ومثير! والمغناطيس الموجود في المقدمة مُعدّ خصيصًا لأنشطة التعدين";
            this.langObj.l_1vol1_14 = "ينطلق سرطان البحر ذهابًا وإيابًا يبحث ويبحث، ومن الأفضل تركه وشأنه";
            this.langObj.l_1vol1_15 = "يوجد مِعْول هناك اتجاه الحائط، وإنني لست في حاجة إليه";
            this.langObj.l_1vol1_16 = "تقف العربة بالقرب من عامل المنجم";
            this.langObj.l_1vol1_17 = "تظهر هذه العلامة للتحذير من سقوط الصخور";
            this.langObj.l_1vol2_00 = "أبحث داخل السلة، وأجد مخلفات بعض الطيور";
            this.langObj.l_1vol2_01 = "انظر في هذه السلة، وأجد بعض القش عديم الفائدة بالنسبة لي";
            this.langObj.l_1vol2_02 = "يوجد داخل هذه السلة سلة أخرى بداخلها أخرى أصغر منها. إنني أفعل ذلك 7 مرات، إلى أن اكتشف  السلة الصغيرة جدًّا، والتي لا يوجد بها شيء";
            this.langObj.l_1vol2_03 = "يوجد هنالك إناء ذو بطانة زرقاء، إلا أنني لست متأكدًا من محتوياته";
            this.langObj.l_1vol2_04 = "يوجد هنالك إناء به سائل أخضر، ومن الأفضل ألا تلمسه إذا لم تكن تعرف ما هو ذلك السائل";
            this.langObj.l_1vol2_05 = "تشير هذه العلامة إلى ترك كل المستلزمات الطبيّة هنا";
            this.langObj.l_1vol2_06 = "لقد قمت بخلع المزلاج باستخدام هذه العتلة.. المزلاج الآن في يدي";
            this.langObj.l_1vol2_07 = "إنني أحاول ذلك، ولكن لا يمكنني تخفيف حركة المزلاج";
            this.langObj.l_1vol2_08 = "إنني أفتح الصندوق مستخدمًا العتلة، وأجده ممتلئًا بالغبار";
            this.langObj.l_1vol2_09 = "لسوء الحظ، لن يفيد ذلك في شيء";
            this.langObj.l_1vol2_10 = "إنني أفتح الصندوق مستخدمًا العتلة، وبداخله توجد بقايا أشياء مكسورة ومفتتة";
            this.langObj.l_1vol2_11 = "إنني أفتح الصندوق مستخدمًا العتلة، وبداخله توجد بقايا أشياء مكسورة ومفتتة، ومع ذلك افتقدت المسمار الذي ربما أحتاج إليه";
            this.langObj.l_1vol2_12 = "بخلاف ما يعلوها من تراب وصدأ، فإن هذه السلة فارغة";
            this.langObj.l_1vol2_13 = "عند فتح السلة، رأيت مفتاحًا أصابه الغبار والتراب، ومن الممكن أن يكون في متناول يدي";
            this.langObj.l_1vol2_14 = "داخل السلة هناك ماكينات حلاقة معدنية - صعب استخدامها بالنسبة لي";
            this.langObj.l_1vol2_15 = "يوجد داخل السلة ورق مقوى قديم وبالٍ";
            this.langObj.l_1vol2_16 = "الصندوق فارغ";
            this.langObj.l_1vol2_17 = "تم إغلاق هذا الصندوق غلقًا محكمًا بمسمار، وقد حاولت فتحه، إلا أنه يبدو أنني لن أستطيع ذلك";
            this.langObj.l_1vol2_18 = "تم إغلاق هذا الصندوق غلقًا محكمًا، وقد حاولت فتحه، لكني لم أستطع";
            this.langObj.l_1vol2_19 = "يمتلء هذا الصندوق بقطع من الفخار المكسورة";
            this.langObj.l_1vol2_20 = "تبدو هذه العجلة صدئة نوعًا ما، كما أن حوافها خشنة جدًّا";
            this.langObj.l_1vol2_21 = "تبدو هذه العجلة في حالة جيدة، ومع بعض الإصلاحات الطفيفة يمكن أن تصبح في متناول اليد";
            this.langObj.l_1vol2_22 = "تبدو هذه العجلة مكسورة جزئيا، وليس غريبًا أن توجد في موقع النفايات";
            this.langObj.l_1vol2_23 = "يبدو هذا المزلاج مثبتًا بشدة في الباخرة";
            this.langObj.l_1vol2_24 = "يمتلئ هذا الصندوق بكتل من الأشياء";
            this.langObj.l_1vol2_25 = "إنها كُتل من الأشياء، ولا عجب في أنها مُخزّنة في موقع النفايات";
            this.langObj.l_1vol2_26 = "إن النهايات والاحتمالات متناثرة حول حاوية سرطان البحر. هناك يقين من أنه ليس هناك نقص في عدد الأنابيب حول هذا المكان";
            this.langObj.l_1vol2_27 = "تقبع هذه الحاوية هنا وقد تركت على نحو مهمل، بما تحتوي عليه من مخلفات";
            this.langObj.l_1vol2_28 = "يبدو أن المسمار الصدئ مثبت هنالك بإحكام";
            this.langObj.l_1vol2_29 = "ذلك مسمار صدئ يمكن استخدامه";
            this.langObj.l_1vol2_30 = "فيما يبدو أنه نوع من النسيج شائع الاستخدام هنا في القبيلة";
            this.langObj.l_1vol2_31 = "قد يتم تحويل هذا النسيج ويصبح مفيدًا، لذا قم خذه لك";
            this.langObj.l_1vol2_32 = "فيما يبدو أنها من الأدوات المستخدمة هنا";
            this.langObj.l_1vol2_33 = "إنها جرافة. لا حاجة هنا لواحدة منها";
            this.langObj.l_1vol2_34 = "لقد صنعت الغراء بالفعل. الصمغ، وبعد أداء هذه لألعاب النارية،  قرّرت ألا تذهب إلى هناك ثانية وأنت في عجلة من أمرك";
            this.langObj.l_1vol2_35 = "تحتوي هذه السلة الملونة على مجموعة من القش غير المفيد، أليس كذلك؟";
            this.langObj.l_1vol2_36 = "هذه السلة الخضراء ممتلئة بالثوم الذي لا أرى استخدامًا له الآن";
            this.langObj.l_1vol2_37 = "يبدو وكأن جاروفًا ومعولاً مخفيّان في هذه الصخرة. يوجد في الأسفل سهم يشير إلى اليمين";
            this.langObj.l_1vol2_38 = " لدي شعور أنني سأحتاج هذا المفتاح لعمل شيء آخر قبل أن أقوم بإعادته";
            this.langObj.l_1vol3_00 = "يا له أمر محزن. إنه فارغ";
            this.langObj.l_1vol3_01 = "يبدو هذا الصندوق مغلقًا غلقًا محكمًا، ولن يكون باستطاعتي فتحه";
            this.langObj.l_1vol3_02 = "مستخدمًا هذه العتلة، أحاول فتح الصندوق لأعثر على بقايا صخرة الطباخ";
            this.langObj.l_1vol3_03 = "رغم محاولتي، لم أتمكن من فتح الصندوق";
            this.langObj.l_1vol3_04 = "يبدو أنه ليس هناك شيء آخر متروك داخل الصندوق";
            this.langObj.l_1vol3_05 = "يبدو ذلك من هنا وكأنه رغوة خضراء";
            this.langObj.l_1vol3_06 = "بعد مزيد من التدقيق، هذه الرغوة الخضراء فوق النار تبدو كما لو كانت، همممم، ضخمة، ترى كيف سيكون طعمها؟";
            this.langObj.l_1vol3_07 = "فيما يبدو أنها لوحة فوق  التمثال، لكنني لا أستطيع قراءة ما كتب عليها من هنا";
            this.langObj.l_1vol3_08 = "يبدو أن هذه السلة فارغة تمامًا";
            this.langObj.l_1vol4_00 = "يبعد هذا البيض عنّي لمسافة يصعب علي معها الوصول إليه";
            this.langObj.l_1vol4_01 = "ليست هناك حاجة لوضع شيء آخر هنا";
            this.langObj.l_1vol4_02 = "يا له من عمل جيد! لقد استقرت الصخرة الغاضبة في الموضع بنقرة واحدة";
            this.langObj.l_1vol4_03 = "فيما يبدو أنها غير مناسبة على الإطلاق";
            this.langObj.l_1vol4_04 = "ليست هناك حاجة لوضع شيء آخر هنا";
            this.langObj.l_1vol4_05 = "يا له من عمل جيد! لقد استقرت الصخرة الغاضبة في الموضع بنقرة واحدة";
            this.langObj.l_1vol4_06 = "لا يبدو ذلك ملائمًا هنا، ولكنه يبدو جميلاً عن قرب";
            this.langObj.l_1vol4_07 = "فيما يبدو أنها غير مناسبة على الإطلاق";
            this.langObj.l_1vol4_08 = "";
            this.langObj.l_1vol4_09 = "يا له من عمل جيد! لقد استقرت صخرة الطباخ في الموضع بنقرة واحدة";
            this.langObj.l_1vol4_10 = "لا يبدو ذلك ملائمًا هنا، ولكنه يبدو جميلاً عن قرب";
            this.langObj.l_1vol4_11 = "فيما يبدو أنها غير مناسبة على الإطلاق";
            this.langObj.l_1vol4_12 = "تبدو الصخرة جميلة في موضعها";
            this.langObj.l_1vol4_13 = "إن الصخرة الغاضبة محمية في موضعها هذا، وأنا فخور بذلك";
            this.langObj.l_1vol4_14 = "إن صخرة الطباخ راسخة فوق منصتها";
            this.langObj.l_1vol4_15 = "عجبًا! يبدو ذلك كجزء من لغز كبير. هناك شيء ما يحدث";
            this.langObj.l_1vol4_16 = "تبدو المنصة صامدة بشكل جيد مع الصخرة المثبتة أعلاها. أشعر بالفخر لذلك";
            this.langObj.l_1vol4_17 = "يبدو ذلك كحاوية من نوع ما، بها بعض الكلاليب، وكأن شيئًا ما يتعلق بها بشكل طبيعي";
            this.langObj.l_1vol5_00 = "لم يساعد ذلك في فقدها";
            this.langObj.l_1vol5_01 = "تبدو هذه القطعة مثيرة جدًّا من هنا";
            this.langObj.l_1vol5_02 = "تبدو هذه القطعة رائعة جدًّا، إلا أنها متهالكة من قاعدتها";
            this.langObj.l_1war00 = "تدريب";
            this.langObj.l_1war01 = "فريق";
            this.langObj.l_1war02 = "مقابل/ ضد";
            this.langObj.l_1war03 = "معركة";
            this.langObj.l_1war04 = "لاعبون";
            this.langObj.l_1war05 = "تحضير";
            this.langObj.l_1war06 = "  ";
            this.langObj.l_1war07 = "اللعبة لبدء المتبقي اللاعبين عدد";
            this.langObj.l_1war08 = "تحميل";
            this.langObj.l_1war09 = "فقدت تركيز الفيلم! انقر هنا للحصول على تركيز الفيلم.";
            this.langObj.l_1war10 = "سحب";
            this.langObj.l_1war11 = "ربح";
            this.langObj.l_1war12 = "اللاعبين بقية انتظار في";
            this.langObj.l_1war13 = "اللاعبين بقية انتظار في";
            this.langObj.l_1war14 = "LV";
            this.langObj.l_1war15 = "لقد متَّ";
            this.langObj.l_1war16 = "حاول لعبة أخرى، أو أسس فريقك بأسلوب المشاهدة والاستخبار";
            this.langObj.l_1war17 = "صخرة";
            this.langObj.l_1war18 = "كرة المعركة";
            this.langObj.l_1war19 = "الصحن الطائر";
            this.langObj.l_1war20 = "العصا المعقوفة";
            this.langObj.l_1war21 = "قنبلة الكرز";
            this.langObj.l_1war22 = "فقاعة";
            this.langObj.l_1war23 = "المعالج";
            this.langObj.l_1war24 = "الجذاب";
            this.langObj.l_1war25 = "وسيلة الحماية";
            this.langObj.l_1war30 = "التعليمات";
            this.langObj.l_1war31 = "حان وقت المعركة! استخدم مختلف الأسلحة، واجعل هدفك هو إضعاف صحة خصمك إلى درجة الصفر، ولزامًا على الفريق الراغب في الفوز بالمبارة أن يضعف لاعبوه صحة خصومه إلى درجة الصفر";
            this.langObj.l_1war32 = "تتم اللعبة على عدة جولات، وخلال الجولة الواحدة، يمكنك تحريك شخصيتك والتجهيز لهجماتهم. يلزم عليك أن تنتظر الميقات للظهور قبل بدء الجولة، وعليك إنهاء الجولة قبل مرور الوقت";
            this.langObj.l_1war33 = "يمكنك خلال الجولة أن تتبع السهم أو مفاتيح WASD؛ وذلك للتحرك لوضع الهجوم، كما يمكنك أثناء الجولة، ومن خلال نقر الماوس على الشاشة، إعداد أسلحتك المختارة حاليًّا";
            this.langObj.l_1war34 = "اختر سلاحك من مخزون المعركة أسفل الشاشة، واعلم أن معظم الأسلحة تستخدم مرة واحدة فقط، لذا قم بإحصاء جولاتك. (ملحوظة: يمكنك البدء بسلاح واحد فقط)";
            this.langObj.l_1war35 = "لقد حصلت على نقاط خبرة (إكس بي) لنجاحك في تحطيم لاعبين آخرين، وإذا ما نجحت في الحصول على مزيد من الـ (إكس بي)، فسوف ترفع مستواك، ومع كل مستوى جديد، تحصل على مجموعة أسلحة جدية يمكنك شراؤها من مخزن الأسلحة";
            this.langObj.l_1war36 = "سعادتك تؤثر في فاعلية أسلحتك، وأسلحة القذائف تصيب أهدافها بدقة إذا كان مستوى السعادة مرتفعًا، كما أن قدرتك على استخدام الوسائل الدفاعية ترتفع مع ازدياد سعادتك";
            this.langObj.l_1war37 = "يمكنك استخدام شريط الدردشة في الأسفل للتواصل مع لاعبين آخرين";
            this.langObj.l_1war41 = "هدف اللعبة";
            this.langObj.l_1war42 = "طريقة اللعب";
            this.langObj.l_1war43 = "أدوات التحكم";
            this.langObj.l_1war44 = "أسلحة";
            this.langObj.l_1war45 = "الارتقاء لمستوى أعلى";
            this.langObj.l_1war46 = "مقياس السعادة";
            this.langObj.l_1war47 = "دردشة";
            this.langObj.l_1war50 = "تخطي إلى الدور التالي.  أداء منخفض على جهازك. لرفع مستوى الأداء، وانخفاض ضبط الجودة الخاصة بك.";
            this.langObj.l_1war51 = "الصحة المكتسبة:";
            this.langObj.l_1war52 = "الصحة المفقودة:";
            this.langObj.l_1war53 = "الخبرة المكتسبة:";
            this.langObj.l_1war54 = "مرات الفوز:";
            this.langObj.l_1war55 = "الصحة المفقودة من الفريق:";
            this.langObj.l_1war60 = "ابتداءً من ";
            this.langObj.l_1war70 = "تعليمات";
            this.langObj.l_1war100 = "مقياس الخبرة";
            this.langObj.l_1war101 = "خريطة";
            this.langObj.l_1war103 = "لاعبك";
            this.langObj.l_1war102 = "عارض الصور";
            this.langObj.l_1war104 = "عضو فريقك";
            this.langObj.l_1war105 = "عدو";
            this.langObj.l_1war106 = "قائمة التعليمات";
            this.langObj.l_1war107 = "خروج";
            this.langObj.l_1war108 = "صخرة";
            this.langObj.l_1war109 = "كرة المعركة";
            this.langObj.l_1war110 = "الطبق الطائر";
            this.langObj.l_1war111 = "قنبلة";
            this.langObj.l_1war112 = "العصا المعقوفة";
            this.langObj.l_1war113 = "فقاعة الحماية";
            this.langObj.l_1war114 = "صحة";
            this.langObj.l_1war115 = "جاذب";
            this.langObj.l_1war116 = "وسيلة الحماية";
            this.langObj.l_1war117 = "معلومات اللاعب";
            this.langObj.l_1war118 = " أخرى مرة العب";
            this.langObj.l_1war119 = "مشاهدة";
            this.langObj.l_1war120 = "خروج";
            this.langObj.l_1war140 = "المستوى";
            this.langObj.l_1war141 = " نقاط الخبرة ";
            this.langObj.l_1war200 = "عرض نقاط الخبرة التي تحتاج الحصول عليها قبل أن يصل رمزك إلى مستوى جديد";
            this.langObj.l_1war201 = "عرض المستوى، واللاعب، ومواقع الأسلحة";
            this.langObj.l_1war202 = "انقر واسحب، كي تتحكم في الكاميرا يدويًّا";
            this.langObj.l_1war203 = "رجاءً، اطّلع على تعليمات التحكم في لاعبك";
            this.langObj.l_1war204 = "هذا الشخص ينتمي إلى فريقك. احرص على عدم مهاجمته، وحاول بكل قوتك الدفاع عنه";
            this.langObj.l_1war205 = "احذر! إنه عدو. قمْ بتحطيمهم";
            this.langObj.l_1war206 = "انقر هنا لمشاهدة تعليمات طريقة اللعب";
            this.langObj.l_1war207 = "انقر هنا للخروج من اللعبة الحالية";
            this.langObj.l_1war208 = "هذا سلاحك الافتراضي. إنه ضعيف، لكن الصخور متوفرة بكثرة";
            this.langObj.l_1war209 = "إنها أقوى قليلاً من صخرة، كما أنها تلتف وترتد بشكل أفضل";
            this.langObj.l_1war210 = "سلاح طويل المدى. الفريسبي المعدّلة للأفضل تنفجر نتيجة الاصطدام";
            this.langObj.l_1war211 = "انفجار قوي قصير المدى، لكنه فعال. ارتقِ إلى الحد الأقصى لمضاعفة المرح ثلاث مرات";
            this.langObj.l_1war212 = "إنه سلاح خادع، لكنه له مزاياه؛ فبمجرد أن يعود إلى لاعبك، يمكنك استخدامه عدة مرات كما تريد";
            this.langObj.l_1war213 = "سلاح دفاعي مؤثر وفعال سوف يصد أية قذائف قادمة. ارتقِ كي تزيد من قوة الفقاعات";
            this.langObj.l_1war214 = "استخدم ذلك لتجديد صحتك، لكن كن حذرًا؛ حيث إنها قد تنفجر أحيانًا";
            this.langObj.l_1war215 = "تلاعب بمسار المقذوفات القادمة. سيؤدي ذلك إلى جذب المقذوفات إلى موضعها";
            this.langObj.l_1war216 = "تلاعب بمسار المقذوفات القادمة. سيؤدي ذلك إلى صدّ المقذوفات وإعادتها إلى موضعها";
            this.langObj.l_1war217 = "عرض معلومات شخصية محددة، حيث يعرض الشريط صحتهم المتبقية. انقر هنا لتحريك الكاميرا لموقعهم";
            this.langObj.l_1war218 = "";
            this.langObj.l_1war219 = "";
            this.langObj.l_1war301 = "تحميل";
            this.langObj.l_1war302 = "جاهز";
        }

        public function setFormat(_arg_1:TextField, _arg_2:Object=null):*
        {
            var _local_3:*;
            _local_3 = _arg_1.getTextFormat();
            if (((!(_arg_2)) || ((_arg_2) && (!(_arg_2.noalign)))))
            {
                _local_3.align = this.langdirDesc[this.langdir[this.selectedLang]];
            };
            if (_arg_2)
            {
                if (_arg_2.forceAlign)
                {
                    _local_3.align = _arg_2.forceAlign;
                };
                if (_arg_2.enlarge)
                {
                    _local_3.size = (_arg_1.getTextFormat(0, _arg_1.text.length).size + this.langResizing[this.selectedLang]);
                };
            };
            _arg_1.setTextFormat(_local_3);
            if (((_arg_1.type == TextFieldType.INPUT) && (_local_3.align)))
            {
                _arg_1.defaultTextFormat = _local_3;
            };
        }

        public function getLangDir():*
        {
            return (this.langdir[this.selectedLang]);
        }

        public function setTextJustify(_arg_1:TextField, _arg_2:String, _arg_3:*=null):*
        {
            var _local_4:*;
            if (this.langdir[this.selectedLang] == 1)
            {
                this.arabicConvert.setText(_arg_1, _arg_2, _arg_3);
                this.setFormat(_arg_1, _arg_3);
            }
            else
            {
                _local_4 = _arg_1.getTextFormat();
                if (((_arg_3) && (_arg_3 is TextFormat)))
                {
                    _local_4 = _arg_3;
                };
                if (((_arg_3) && (_arg_3.htmlText)))
                {
                    _arg_1.htmlText = _arg_2;
                }
                else
                {
                    _arg_1.text = _arg_2;
                };
                _arg_1.setTextFormat(_local_4);
            };
        }

        public function getLangExtension():*
        {
            return (this.langlist[this.selectedLang]);
        }

        public function getLangExtensionWeb():*
        {
            return (this.langExt[this.selectedLang]);
        }

        public function getText(_arg_1:*):*
        {
            if (this.langObj[((("l_" + this.selectedLang) + "alt") + _arg_1)])
            {
                return (this.langObj[((("l_" + this.selectedLang) + "alt") + _arg_1)]);
            };
            if (this.langObj[(("l_" + this.selectedLang) + _arg_1)])
            {
                return (this.langObj[(("l_" + this.selectedLang) + _arg_1)]);
            };
            return ("**LANGUAGE**");
        }

        public function repText(_arg_1:*, _arg_2:String=null, _arg_3:Array=null):*
        {
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            if (this.langObj[(("l_" + this.selectedLang) + _arg_1)])
            {
                _local_4 = this.langObj[(("l_" + this.selectedLang) + _arg_1)];
                if (_local_4.indexOf("%rep1%") == -1)
                {
                    return (_local_4);
                };
                _local_5 = false;
                if (this.IsLTRText(_local_4))
                {
                    _local_5 = true;
                    _local_4 = ((_local_4.substr(0, _local_4.indexOf("%rep1%")) + _arg_2) + _local_4.substr((_local_4.indexOf("%rep1%") + 6), _local_4.length));
                }
                else
                {
                    _local_6 = this.isLTRChar(_arg_2.charAt(0));
                    if (((_local_6) && (!(this.isOppFeedChar(_arg_2.charAt(0))))))
                    {
                        _local_4 = ((((_local_4.substr(0, _local_4.indexOf("%rep1%")) + " ") + _arg_2) + " ") + _local_4.substr((_local_4.indexOf("%rep1%") + 6), _local_4.length));
                    }
                    else
                    {
                        _local_4 = ((((_local_4.substr((_local_4.indexOf("%rep1%") + 6), _local_4.length) + " ") + _arg_2) + " ") + _local_4.substr(0, _local_4.indexOf("%rep1%")));
                    };
                };
                if (_arg_3)
                {
                    for (_local_7 in _arg_3)
                    {
                        _local_8 = (("%rep" + (_local_7 + 2)) + "%");
                        _arg_3[_local_7] = String(_arg_3[_local_7]);
                        if (_local_5)
                        {
                            _local_4 = ((_local_4.substr(0, _local_4.indexOf(_local_8)) + _arg_3[_local_7]) + _local_4.substr((_local_4.indexOf(_local_8) + 6), _local_4.length));
                        }
                        else
                        {
                            _local_6 = this.isLTRChar(_arg_3[_local_7].charAt(0));
                            if (_local_6)
                            {
                                _local_4 = ((((_local_4.substr(0, _local_4.indexOf(_local_8)) + " ") + _arg_3[_local_7]) + " ") + _local_4.substr((_local_4.indexOf(_local_8) + 6), _local_4.length));
                            }
                            else
                            {
                                _local_4 = ((((_local_4.substr((_local_4.indexOf(_local_8) + 6), _local_4.length) + " ") + _arg_3[_local_7]) + " ") + _local_4.substr(0, _local_4.indexOf(_local_8)));
                            };
                        };
                    };
                };
                return (_local_4);
            };
            return ("**LANGUAGE**");
        }

        public function IsLTRText(_arg_1:*):*
        {
            if (_arg_1.indexOf("%rep") == 0)
            {
                if (this.isLTRChar(_arg_1.charAt(8)))
                {
                    return (true);
                };
                return (false);
            };
            return (this.isLTRChar(_arg_1.charAt(0)));
        }

        public function isLTRChar(_arg_1:String):*
        {
            var _local_2:*;
            _local_2 = _arg_1.charCodeAt(0);
            if (((_local_2 >= 0x0600) && (_local_2 <= 1791)))
            {
                return (false);
            };
            return (true);
        }

        public function isOppFeedChar(_arg_1:String):*
        {
            var _local_2:*;
            _local_2 = _arg_1.charCodeAt(0);
            if (((_local_2 >= 48) && (_local_2 <= 58)))
            {
                return (true);
            };
            return (false);
        }

        public function setlang(_arg_1:*):*
        {
            var _local_2:*;
            _local_2 = 0;
            while (_local_2 < this.langlist.length)
            {
                if (this.langlist[_local_2] == _arg_1)
                {
                    this.selectedLang = _local_2;
                    return;
                };
                _local_2++;
            };
        }

        public function getErrMsg(_arg_1:*):*
        {
            if (_arg_1.indexOf("#ERR") > -1)
            {
                return (this.getText(("srv" + _arg_1.substr((_arg_1.indexOf("#ERR") + 4), _arg_1.length))));
            };
            return (false);
        }


    }
}//package com.cocolani.lang

//------------------------------------------------------------
//com.cocolani.modules.astar.AStarLine

package com.cocolani.modules.astar
{
    import de.polygonal.ds.LinkedStack;
    import de.polygonal.ds.GraphNode;
    import de.polygonal.ds.Graph;
    import de.polygonal.ds.GraphArc;
    import de.polygonal.ds.Heap;
    import de.polygonal.ds.*;

    public class AStarLine 
    {


        private static function compareHeuristic(_arg_1:GraphNodePointer, _arg_2:GraphNodePointer):int
        {
            if (_arg_1.heuristic < _arg_2.heuristic)
            {
                return (1);
            };
            if (_arg_1.heuristic > _arg_2.heuristic)
            {
                return (-1);
            };
            return (0);
        }

        public static function getPath(_arg_1:GraphNode, _arg_2:GraphNode):LinkedStack
        {
            var _local_3:LinkedStack = new LinkedStack();
            var _local_4:Waypoint = _arg_2.data;
            while (_local_4)
            {
                _local_3.push(_local_4);
                _local_4 = _local_4.prev;
            };
            return (_local_3);
        }

        public static function unmarkWaypoints(_arg_1:Graph):void
        {
            var _local_4:GraphNode;
            var _local_5:Waypoint;
            var _local_2:Array = _arg_1.nodes;
            var _local_3:int;
            while (_local_3 < _arg_1.maxSize)
            {
                _local_4 = _local_2[_local_3];
                if (_local_4)
                {
                    _local_5 = _local_4.data;
                    _local_5.init();
                };
                _local_3++;
            };
        }

        public static function find(_arg_1:Graph, _arg_2:GraphNode, _arg_3:GraphNode):Boolean
        {
            var _local_5:GraphNode;
            var _local_6:GraphNodePointer;
            var _local_7:Waypoint;
            var _local_8:int;
            var _local_9:GraphArc;
            var _local_10:GraphNode;
            var _local_11:Waypoint;
            var _local_12:Number;
            var _local_13:Number;
            unmarkWaypoints(_arg_1);
            var _local_4:Heap = new Heap(0x0400, compareHeuristic);
            _local_4.enqueue(new GraphNodePointer(_arg_2, 0));
            while (_local_4.size != 0)
            {
                _local_6 = _local_4.front;
                _local_4.dequeue();
                _local_5 = _local_6.node;
                _local_7 = _local_5.data;
                if (!_local_7.marked)
                {
                    _local_7.marked = true;
                    if (_local_5 == _arg_3)
                    {
                        return (true);
                    };
                    _local_8 = 0;
                    for (;_local_8 < _local_5.numArcs;_local_8++)
                    {
                        _local_9 = _local_5.arcs[_local_8];
                        _local_10 = _local_9.node;
                        _local_11 = _local_10.data;
                        if (!_local_11.marked)
                        {
                            _local_12 = (_local_7.distance + (_local_7.distanceTo(_local_11) * _local_9.weight));
                            if (_local_11.prev != null)
                            {
                                if (_local_12 < _local_11.distance)
                                {
                                    _local_11.prev = _local_7;
                                    _local_11.distance = _local_12;
                                }
                                else
                                {
                                    continue;
                                };
                            }
                            else
                            {
                                _local_11.prev = _local_7;
                                _local_11.distance = _local_12;
                            };
                            _local_13 = (_local_11.distanceTo(_arg_3.data) + _local_12);
                            _local_4.enqueue(new GraphNodePointer(_local_10, _local_13));
                        };
                    };
                };
            };
            return (false);
        }


    }
}//package com.cocolani.modules.astar

import de.polygonal.ds.GraphNode;

class GraphNodePointer 
{

    public var node:GraphNode;
    public var heuristic:Number;

    public function GraphNodePointer(_arg_1:GraphNode, _arg_2:Number)
    {
        this.node = _arg_1;
        this.heuristic = _arg_2;
    }

}


//------------------------------------------------------------
//com.cocolani.modules.astar.Node

package com.cocolani.modules.astar
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;

    public class Node extends Sprite 
    {

        public static var RADIUS:int = 20;
        public static var BORDER_CLR_MARK:int = 0xF40095;
        public static var BORDER_CLR_UNMARK:int = 0x999999;
        public static var BORDER_CLR_ROLLOVER:int = 238576;
        public static var FILL_CLR:int = 0xFFFFFF;

        public var graphIndex:int;
        public var marked:Boolean;
        public var enabled:Boolean;

        public function Node(_arg_1:int)
        {
            this.drawNode(BORDER_CLR_UNMARK);
            this.drawText();
            this.write(("node\n" + _arg_1));
            this.marked = false;
            this.graphIndex = _arg_1;
            this.enabled = true;
            this.freeze(false);
        }

        public function freeze(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                removeEventListener(MouseEvent.MOUSE_OVER, this.onRollOver);
                removeEventListener(MouseEvent.MOUSE_OUT, this.onRollOut);
                removeEventListener(MouseEvent.MOUSE_DOWN, this.onPress);
            }
            else
            {
                addEventListener(MouseEvent.MOUSE_OVER, this.onRollOver, false, 1000);
                addEventListener(MouseEvent.MOUSE_OUT, this.onRollOut, false, 1000);
                addEventListener(MouseEvent.MOUSE_DOWN, this.onPress, false, 1000);
            };
        }

        public function mark():void
        {
            this.drawNode(BORDER_CLR_MARK);
        }

        public function unmark():void
        {
            this.marked = false;
            this.drawNode(BORDER_CLR_UNMARK);
        }

        public function write(_arg_1:String):void
        {
        }

        private function onRollOver(_arg_1:MouseEvent):void
        {
            if (this.marked)
            {
                return;
            };
            this.drawNode(BORDER_CLR_ROLLOVER);
        }

        private function onRollOut(_arg_1:MouseEvent):void
        {
            if (this.marked)
            {
                return;
            };
            this.drawNode(BORDER_CLR_UNMARK);
        }

        private function onPress(_arg_1:MouseEvent):void
        {
            this.marked = (!(this.marked));
            this.drawNode(((this.marked) ? BORDER_CLR_MARK : BORDER_CLR_ROLLOVER));
        }

        private function drawNode(_arg_1:uint):void
        {
            graphics.clear();
            graphics.beginFill(FILL_CLR, 1);
            graphics.lineStyle(2, _arg_1, 1);
            graphics.drawCircle(0, 0, RADIUS);
            graphics.endFill();
        }

        private function drawText():void
        {
        }

        override public function toString():String
        {
            return (("[NODE, graphIndex " + this.graphIndex) + "]");
        }


    }
}//package com.cocolani.modules.astar

//------------------------------------------------------------
//com.cocolani.modules.astar.WalkControl

package com.cocolani.modules.astar
{
    import flash.display.Sprite;
    import de.polygonal.ds.Graph;
    import de.polygonal.ds.LinkedStack;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import de.polygonal.ds.GraphNode;
    import de.polygonal.ds.*;
    import com.cocolani.modules.*;

    public class WalkControl extends Sprite 
    {

        private var graph:Graph;
        private var nodes:Array;
        private var path:LinkedStack;
        private var destinationPoint:Point;
        public var offset:Point;
        private var nodeRadius:Number;
        private var hitter:Sprite;
        private var customNodes:Array;
        private var clipRect:Rectangle;
        private var cameraContainer:Sprite;
        private var nodeJoined:Boolean;
        private var i:*;
        private var dist:Number;
        private var aPoint:Point;
        private var bPoint:Point;

        public function WalkControl(_arg_1:Sprite)
        {
            this.cameraContainer = _arg_1;
            this.offset = new Point(0, 0);
            mouseEnabled = false;
            mouseChildren = false;
            alpha = 0.5;
        }

        public function getPath(_arg_1:GraphNode, _arg_2:GraphNode):LinkedStack
        {
            var _local_3:Array;
            var _local_4:int;
            var _local_5:int;
            var _local_6:GraphNode;
            var _local_7:Number;
            if (AStarLine.find(this.graph, _arg_1, _arg_2))
            {
                trace("Path found successfully");
                return (AStarLine.getPath(_arg_1, _arg_2));
            };
            trace("Path wasnt found");
            _local_3 = [];
            _local_4 = 0;
            while (_local_4 < this.graph.nodes.length)
            {
                _local_6 = this.graph.nodes[_local_4];
                if (((!(_local_6 == _arg_1)) && (!(_local_6 == _arg_2))))
                {
                    _local_7 = Point.distance(new Point(_local_6.data.x, _local_6.data.y), new Point(_arg_1.data.x, _arg_1.data.y));
                    _local_3.push({
                        "node":_local_6,
                        "dist":_local_7
                    });
                };
                _local_4++;
            };
            _local_3.sortOn("dist", Array.NUMERIC);
            _local_5 = 0;
            while (_local_5 < _local_3.length)
            {
                if (AStarLine.find(this.graph, _local_3[_local_5].node, _arg_2))
                {
                    return (AStarLine.getPath(_local_3[_local_5].node, _arg_2));
                };
                _local_5++;
            };
            return (null);
        }

        public function getNodeGrid(_arg_1:Rectangle, _arg_2:Number, _arg_3:Number, _arg_4:Sprite, _arg_5:Array):XML
        {
            var _local_10:int;
            var _local_11:int;
            var _local_13:int;
            var _local_14:int;
            var _local_15:Object;
            var _local_16:Object;
            var _local_19:Array;
            var _local_20:Array;
            var _local_21:Array;
            var _local_22:Array;
            this.clipRect = _arg_1;
            this.customNodes = _local_19;
            var _local_6:int = int(Math.floor((_arg_1.width / _arg_2)));
            var _local_7:int = int(Math.floor((_arg_1.height / _arg_3)));
            this.hitter = _arg_4;
            this.nodeRadius = Math.sqrt(((_arg_2 * _arg_2) + (_arg_3 * _arg_3)));
            var _local_8:Array = [];
            var _local_9:int;
            var _local_12:Array = [];
            _local_10 = 0;
            while (_local_10 < _local_6)
            {
                _local_20 = [];
                _local_8.push(_local_20);
                _local_11 = 0;
                while (_local_11 < _local_7)
                {
                    if (!this.hittingHitter((_arg_1.x + (_local_10 * _arg_2)), (_arg_1.y + (_local_11 * _arg_3))))
                    {
                        _local_16 = {
                            "id":0,
                            "x":0,
                            "y":0,
                            "xInd":0,
                            "yInd":0,
                            "links":[]
                        };
                        _local_16.id = _local_9;
                        _local_16.xInd = _local_8.length;
                        _local_16.yInd = _local_20.length;
                        _local_16.x = ((_arg_1.x + (_local_10 * _arg_2)) + this.offset.x);
                        _local_16.y = ((_arg_1.y + (_local_11 * _arg_3)) + this.offset.y);
                        _local_12.push(_local_16);
                        _local_20.push(_local_16);
                        _local_9++;
                    }
                    else
                    {
                        _local_20.push(-1);
                    };
                    _local_11++;
                };
                _local_10++;
            };
            var _local_17:* = '<?xml version="1.0" encoding="UTF-8"?>';
            _local_17 = (_local_17 + "<map>");
            _local_10 = 0;
            while (_local_10 < _local_6)
            {
                _local_11 = 0;
                while (_local_11 < _local_7)
                {
                    if (_local_8[_local_10][_local_11] != -1)
                    {
                        _local_15 = _local_8[_local_10][_local_11];
                        _local_17 = (_local_17 + "\n");
                        _local_17 = (_local_17 + (((((("<node><id>" + _local_15.id) + "</id><x>") + _local_15.x) + "</x><y>") + _local_15.y) + "</y><links>"));
                        _local_17 = (_local_17 + this.addNodeLink(_local_8, (_local_10 - 1), (_local_11 - 1)));
                        _local_17 = (_local_17 + this.addNodeLink(_local_8, (_local_10 - 0), (_local_11 - 1)));
                        _local_17 = (_local_17 + this.addNodeLink(_local_8, (_local_10 - 1), (_local_11 - 0)));
                        _local_17 = (_local_17 + this.addNodeLink(_local_8, (_local_10 + 1), (_local_11 - 1)));
                        _local_17 = (_local_17 + "</links></node>");
                    };
                    _local_11++;
                };
                _local_10++;
            };
            var _local_18:int = _local_9;
            _local_19 = [];
            _local_13 = 0;
            while (_local_13 < _arg_5.length)
            {
                _local_16 = {
                    "id":0,
                    "x":0,
                    "y":0,
                    "xInd":0,
                    "yInd":0,
                    "links":[]
                };
                _local_16.id = _local_9;
                trace(("Node Count is: " + _local_9));
                _local_16.xInd = -1;
                _local_16.yInd = -1;
                _local_16.x = ((_arg_5[_local_13].x + _arg_4.x) + this.offset.x);
                _local_16.y = ((_arg_5[_local_13].y + _arg_4.y) + this.offset.y);
                _local_19.push(_local_16);
                _local_9++;
                _local_13++;
            };
            _local_13 = 0;
            while (_local_13 < _local_19.length)
            {
                _local_15 = _local_19[_local_13];
                _local_17 = (_local_17 + "\n");
                _local_17 = (_local_17 + (((((("<node><id>" + _local_15.id) + "</id><x>") + _local_15.x) + "</x><y>") + _local_15.y) + "</y><links>"));
                _local_21 = this.getClosestNodes(_local_15, _local_19, 3);
                _local_14 = 0;
                while (_local_14 < _local_21.length)
                {
                    _local_17 = (_local_17 + (("<l>" + _local_21[_local_14]) + "</l>"));
                    _local_14++;
                };
                _local_22 = this.getClosestNodes(_local_15, _local_12, 4);
                _local_14 = 0;
                while (_local_14 < _local_22.length)
                {
                    _local_17 = (_local_17 + (("<l>" + _local_22[_local_14]) + "</l>"));
                    _local_14++;
                };
                _local_17 = (_local_17 + "</links></node>");
                _local_13++;
            };
            _local_17 = (_local_17 + "\n");
            _local_17 = (_local_17 + "</map>");
            return (XML(_local_17));
        }

        private function getClosestNodes(_arg_1:Object, _arg_2:Array, _arg_3:int):Array
        {
            var _local_5:*;
            var _local_6:Array;
            var _local_7:int;
            var _local_8:Object;
            var _local_9:Number;
            var _local_4:Array = [];
            for (_local_5 in _arg_2)
            {
                _local_8 = _arg_2[_local_5];
                if (_local_8 != _arg_1)
                {
                    _local_9 = Point.distance(new Point(_arg_1.x, _arg_1.y), new Point(_local_8.x, _local_8.y));
                    _local_4.push({
                        "node":_local_8,
                        "distance":_local_9
                    });
                };
            };
            _local_4 = _local_4.sortOn("distance", Array.NUMERIC);
            _local_6 = [];
            _local_7 = 0;
            while (_local_7 < _arg_3)
            {
                if (_local_7 < _local_4.length)
                {
                    _local_6.push(_local_4[_local_7].node.id);
                };
                _local_7++;
            };
            return (_local_6);
        }

        public function hittingHitter(_arg_1:Number, _arg_2:Number):*
        {
            if (!this.clipRect.containsPoint(new Point(_arg_1, _arg_2)))
            {
                return (false);
            };
            return (this.hitter.hitTestPoint((_arg_1 + this.offset.x), (_arg_2 + this.offset.y), true));
        }

        public function getPathCoordinates(_arg_1:Point, _arg_2:Point, _arg_3:Number):Array
        {
            var _local_8:*;
            var _local_9:*;
            var _local_4:GraphNode = this.findClosestNodeToPoint(_arg_1);
            var _local_5:GraphNode = this.findClosestNodeToPointByRotation(_arg_2, _arg_3);
            var _local_6:LinkedStack = this.getPath(_local_4, _local_5);
            var _local_7:Array = [];
            this.destinationPoint = _arg_2;
            if (_local_6 == null)
            {
                return ([]);
            };
            if (_local_6.size == 0)
            {
                return ([]);
            };
            while (_local_6.size > 0)
            {
                _local_8 = _local_6.pop();
                _local_7.push(new Point(_local_8.x, _local_8.y));
            };
            _local_7.reverse();
            _local_7.push(_arg_1);
            _local_7.unshift(_arg_2);
            if (stage)
            {
                graphics.lineStyle(5, 0xFFFFFF);
                graphics.moveTo(_local_7[0].x, _local_7[0].y);
                for (_local_9 in _local_7)
                {
                    graphics.lineTo(_local_7[_local_9].x, _local_7[_local_9].y);
                };
            };
            _local_7 = this.dropIrrelevantPoints(_local_7);
            return (_local_7);
        }

        private function dropIrrelevantPoints(_arg_1:Array):*
        {
            var _local_3:Point;
            var _local_4:int;
            var _local_2:Array = [];
            while (_arg_1.length > 0)
            {
                _local_3 = _arg_1.shift();
                _local_2.push(_local_3);
                _local_4 = (_arg_1.length - 1);
                while (_local_4 >= 0)
                {
                    if (this.pointsAreConnectable(_local_3, _arg_1[_local_4]))
                    {
                        _arg_1 = _arg_1.slice(_local_4);
                        _local_4 = -1;
                    }
                    else
                    {
                        _local_4--;
                    };
                };
            };
            return (_local_2);
        }

        private function findClosestNodeToPointByRotation(_arg_1:Point, _arg_2:Number):GraphNode
        {
            var _local_4:*;
            var _local_5:Boolean;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:Object;
            var _local_3:Array = [];
            for (_local_4 in this.nodes)
            {
                this.dist = Point.distance(_arg_1, new Point(this.nodes[_local_4].data.x, this.nodes[_local_4].data.y));
                _local_6 = ((Math.atan2((_arg_1.x - this.nodes[_local_4].data.x), (this.nodes[_local_4].data.y - _arg_1.y)) * 180) / Math.PI);
                _local_7 = this.getAnglesDiff(_arg_2, _local_6);
                _local_3.push({
                    "node":this.nodes[_local_4],
                    "rotationDif":_local_7,
                    "dist":this.dist
                });
                this.newAngleSprite(_arg_1.x, _arg_1.y, _local_6, this.dist);
            };
            _local_3.sortOn("dist", Array.NUMERIC);
            _local_3 = _local_3.slice(0, 5);
            _local_3.sortOn("rotationDif", Array.NUMERIC);
            _local_5 = false;
            while (((_local_5 == false) && (_local_3.length > 0)))
            {
                _local_8 = _local_3.shift();
                _local_5 = this.pointsAreConnectable(new Point(_arg_1.x, _arg_1.y), new Point(_local_8.node.data.x, _local_8.node.data.y));
                if (_local_5)
                {
                    _local_3.unshift(_local_8);
                };
            };
            if (_local_3.length == 0)
            {
                return (null);
            };
            return (_local_3[0].node);
        }

        private function newAngleSprite(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number):*
        {
            var _local_5:Sprite;
            if (stage)
            {
                _local_5 = new Sprite();
                _local_5.x = _arg_1;
                _local_5.y = _arg_2;
                _local_5.graphics.lineStyle(1, 0xFF0000, 1);
                _local_5.graphics.lineTo(0, _arg_4);
                _local_5.rotation = _arg_3;
            };
        }

        private function getAnglesDiff(_arg_1:Number, _arg_2:Number):Number
        {
            var _local_3:Number = ((_arg_1 - _arg_2) % 360);
            if (_local_3 != (_local_3 % 180))
            {
                _local_3 = ((_local_3 < 0) ? (_local_3 + 360) : (_local_3 - 360));
            };
            return (_local_3);
        }

        private function findClosestNodeToPoint(_arg_1:Point):GraphNode
        {
            var _local_2:GraphNode;
            var _local_3:Number = 0xFFFFFF;
            for (this.i in this.nodes)
            {
                this.dist = Point.distance(_arg_1, new Point(this.nodes[this.i].data.x, this.nodes[this.i].data.y));
                if (this.dist < _local_3)
                {
                    _local_2 = this.nodes[this.i];
                    _local_3 = this.dist;
                };
            };
            return (_local_2);
        }

        private function addNodeLink(_arg_1:*, _arg_2:int, _arg_3:int):String
        {
            if (!_arg_1[_arg_2])
            {
                return ("");
            };
            if (!_arg_1[_arg_2][_arg_3])
            {
                return ("");
            };
            if (_arg_1[_arg_2][_arg_3] == -1)
            {
                return ("");
            };
            if ((_arg_1[_arg_2][_arg_3] is Object))
            {
                return (("<l>" + _arg_1[_arg_2][_arg_3].id) + "</l>");
            };
            return ("");
        }

        private function pointsAreConnectable(_arg_1:Point, _arg_2:Point):Boolean
        {
            var _local_6:Number;
            var _local_7:Number;
            var _local_3:Number = ((Math.atan2((_arg_1.x - _arg_2.x), (_arg_1.y - _arg_2.y)) * 180) / Math.PI);
            var _local_4:Number = Point.distance(_arg_1, _arg_2);
            if (stage)
            {
                graphics.lineStyle(1, 0xFF);
            };
            var _local_5:Number = 0;
            while (_local_5 < _local_4)
            {
                _local_6 = ((_local_5 * Math.sin(((_local_3 * Math.PI) / 180))) * -1);
                _local_7 = ((_local_5 * Math.cos(((_local_3 * Math.PI) / 180))) * -1);
                _local_6 = ((_local_6 + _arg_1.x) + this.cameraContainer.x);
                _local_7 = ((_local_7 + _arg_1.y) + this.cameraContainer.y);
                if (stage)
                {
                    graphics.drawCircle(_local_6, _local_7, 1);
                };
                if (this.hittingHitter(_local_6, _local_7))
                {
                    return (false);
                };
                _local_5 = (_local_5 + 1);
            };
            return (true);
        }

        public function newMap(_arg_1:XML):*
        {
            var _local_4:Node;
            var _local_5:Waypoint;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:GraphNode;
            var _local_10:Number;
            var _local_11:Number;
            var _local_12:Array;
            var _local_13:*;
            if (this.graph)
            {
                this.graph.clear();
            };
            this.aPoint = new Point(0, 0);
            this.bPoint = new Point(0, 0);
            this.nodes = [];
            this.graph = new Graph(_arg_1..node.length());
            this.nodes = [];
            graphics.lineStyle(1, 0xFF);
            this.i = 0;
            while (this.i < _arg_1.node.length())
            {
                _local_4 = new Node(this.i);
                _local_4.x = (_arg_1.node[this.i].x[0] - this.offset.x);
                _local_4.y = (_arg_1.node[this.i].y[0] - this.offset.y);
                _local_5 = new Waypoint(this.i);
                _local_5.setPos(_local_4.x, _local_4.y);
                this.graph.addNode(_local_5, this.i);
                if (stage)
                {
                    graphics.drawCircle(_local_4.x, _local_4.y, 4);
                };
                this.i++;
            };
            this.nodes = this.graph.nodes;
            this.i = 0;
            while (this.i < _arg_1.node.length())
            {
                _local_6 = _arg_1.node[this.i].id[0];
                _local_7 = 0;
                while (_local_7 < _arg_1.node[this.i].links[0].l.length())
                {
                    _local_8 = _arg_1.node[this.i].links[0].l[_local_7];
                    this.aPoint.x = this.graph.nodes[_local_6].data.x;
                    this.aPoint.y = this.graph.nodes[_local_6].data.y;
                    this.bPoint.x = this.graph.nodes[_local_8].data.x;
                    this.bPoint.y = this.graph.nodes[_local_8].data.y;
                    if (this.pointsAreConnectable(this.aPoint, this.bPoint))
                    {
                        this.graph.addArc(_local_6, _local_8, 1);
                        this.graph.addArc(_local_8, _local_6, 1);
                    };
                    _local_7++;
                };
                this.i++;
            };
            if (this.stage)
            {
                this.i = 0;
                while (this.i < this.nodes.length)
                {
                    _local_9 = this.nodes[this.i];
                    _local_10 = _local_9.data.x;
                    _local_11 = _local_9.data.y;
                    _local_12 = _local_9.arcs;
                    for (_local_13 in _local_12)
                    {
                        if (stage)
                        {
                            this.graphics.lineStyle(2, 0xFF3300);
                            this.graphics.moveTo(_local_10, _local_11);
                            this.graphics.lineTo(_local_12[_local_13].node.data.x, _local_12[_local_13].node.data.y);
                        };
                    };
                    this.i++;
                };
            };
            var _local_2:int = 9;
            var _local_3:int = 70;
        }


    }
}//package com.cocolani.modules.astar

//------------------------------------------------------------
//com.cocolani.modules.astar.Waypoint

package com.cocolani.modules.astar
{
    public class Waypoint 
    {

        public var marked:Boolean;
        public var distance:Number;
        public var prev:Waypoint;
        public var x:Number;
        public var y:Number;
        public var graphNodeIndex:int;

        public function Waypoint(_arg_1:int)
        {
            this.graphNodeIndex = _arg_1;
            this.init();
        }

        public function setPos(_arg_1:Number, _arg_2:Number):void
        {
            this.x = _arg_1;
            this.y = _arg_2;
        }

        public function distanceTo(_arg_1:Waypoint):Number
        {
            var _local_2:Number = (_arg_1.x - this.x);
            var _local_3:Number = (_arg_1.y - this.y);
            return (Math.sqrt(((_local_2 * _local_2) + (_local_3 * _local_3))));
        }

        public function init():void
        {
            this.marked = false;
            this.distance = 0;
            this.prev = null;
        }


    }
}//package com.cocolani.modules.astar

//------------------------------------------------------------
//com.cocolani.modules.ArabicTextJustify

package com.cocolani.modules
{
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;

    public class ArabicTextJustify 
    {


        private function checkCharType(_arg_1:String):*
        {
            var _local_2:* = _arg_1.charCodeAt(0);
            if (_local_2 < 0x0100)
            {
                return ("EN");
            };
            return ("AR");
        }

        private function endOfLineFix(_arg_1:String):*
        {
            if ((((_arg_1.length > 2) && (this.checkCharType(_arg_1.substr((_arg_1.length - 1), 1)) == "EN")) && (this.checkCharType(_arg_1.substr((_arg_1.length - 2), 1)) == "AR")))
            {
                _arg_1 = (_arg_1.substr((_arg_1.length - 1), 1) + _arg_1.substr(0, (_arg_1.length - 1)));
            };
            return (_arg_1);
        }

        public function setText(_arg_1:*, _arg_2:String, _arg_3:*=null):*
        {
            var _local_12:*;
            var _local_13:*;
            var _local_14:*;
            var _local_4:* = false;
            if (((_arg_3) && (_arg_3.htmlText)))
            {
                _local_4 = true;
            };
            var _local_5:* = new TextField();
            _local_5.wordWrap = true;
            var _local_6:* = _arg_1.getTextFormat();
            if (_local_6.align == "center")
            {
                _local_5.autoSize = TextFieldAutoSize.CENTER;
            }
            else
            {
                _local_5.autoSize = TextFieldAutoSize.RIGHT;
            };
            _local_5.width = _arg_1.width;
            _local_5.multiline = true;
            _local_5.setTextFormat(_local_6);
            var _local_7:* = _arg_2.split(" ");
            var _local_8:* = "";
            var _local_9:* = 0;
            var _local_10:* = "";
            var _local_11:* = _local_5.numLines;
            while (_local_7.length > 0)
            {
                if (++_local_9 > 5000)
                {
                    trace("BROKE!");
                    break;
                };
                _local_12 = _local_7.shift();
                _local_13 = ((_local_10 + " ") + _local_12);
                if (_local_4)
                {
                    _local_5.htmlText = _local_13;
                }
                else
                {
                    _local_5.text = _local_13;
                };
                _local_5.setTextFormat(_local_6);
                _local_14 = false;
                if (((!(1 == _local_5.numLines)) || (_local_12.indexOf("<br") > -1)))
                {
                    if (_local_12.indexOf("<br") > -1)
                    {
                        _local_10 = this.endOfLineFix(_local_10);
                        _local_8 = (((_local_8 + _local_10) + " ") + _local_12.substr(0, (_local_12.lastIndexOf(">") + 1)));
                        _local_10 = _local_12.substring((_local_12.lastIndexOf(">") + 1), _local_12.length);
                    }
                    else
                    {
                        _local_10 = this.endOfLineFix(_local_10);
                        _local_8 = ((_local_8 + _local_10) + "\n");
                        _local_10 = _local_12;
                    };
                    _local_14 = true;
                }
                else
                {
                    _local_10 = _local_13;
                };
            };
            if (!_local_14)
            {
                _local_8 = (_local_8 + _local_10);
            }
            else
            {
                _local_8 = (_local_8 + _local_12);
            };
            if (_local_4)
            {
                _arg_1.htmlText = _local_8;
            }
            else
            {
                _arg_1.text = _local_8;
            };
            _arg_1.setTextFormat(_local_6);
        }


    }
}//package com.cocolani.modules

//------------------------------------------------------------
//com.cocolani.modules.pathFinder

package com.cocolani.modules
{
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.events.Event;
    import com.cocolani.modules.astar.WalkControl;
    import flash.display.Sprite;
    import flash.display.StageQuality;
    import flash.events.*;
    import com.cocolani.modules.astar.*;
    import flash.display.*;

    public class pathFinder 
    {

        private var sceneRef:*;
        private var root:*;
        private var walkControls:Array;
        private var walkCoords:Array;
        private var currentDestination:Point;
        private var offset:Point;
        private var nodeResolution:int;
        private var clipRectangle:Rectangle;
        private var customNodes:Array;
        private var debug:Boolean = false;

        public function pathFinder(_arg_1:*, _arg_2:int=40, _arg_3:Rectangle=null)
        {
            this.sceneRef = _arg_1;
            this.nodeResolution = _arg_2;
            this.clipRectangle = _arg_3;
            this.sceneRef.addEventListener(Event.ADDED_TO_STAGE, this.onAdded);
            this.sceneRef.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
            this.walkControls = [];
            this.customNodes = [];
        }

        public function createNodes():*
        {
            var currentHitter:int;
            var w:WalkControl;
            var collider:Sprite;
            var s:* = undefined;
            var walkControl:WalkControl;
            var cBounds:Rectangle;
            var cRect:Rectangle;
            var hitter:Sprite;
            var toRemove:Array;
            var i:int;
            var savedQuality:String = this.sceneRef.stage.quality;
            this.sceneRef.stage.quality = StageQuality.LOW;
            try
            {
                while (this.walkControls.length > 0)
                {
                    w = this.walkControls.shift();
                    if (w.stage != null)
                    {
                        this.sceneRef.removeChild(w);
                    };
                };
                currentHitter = 1;
                while (this.sceneRef.getChildByName(("collide" + currentHitter)))
                {
                    collider = this.sceneRef.getChildByName(("collide" + currentHitter));
                    s = this.sceneRef.stage.getChildAt(0);
                    walkControl = new WalkControl(this.sceneRef);
                    walkControl.cacheAsBitmap = true;
                    if (((this.debug) && (!(this.sceneRef.contains(walkControl)))))
                    {
                        this.sceneRef.addChild(walkControl);
                    };
                    cBounds = collider.getBounds(this.sceneRef);
                    cRect = new Rectangle((cBounds.x + 10), (cBounds.y + 10), (cBounds.width - 20), (cBounds.height - 20));
                    if (this.clipRectangle != null)
                    {
                        cRect = this.clipRectangle;
                    };
                    hitter = this.sceneRef.getChildByName(("collide" + currentHitter));
                    toRemove = [];
                    i = 0;
                    while (i < hitter.numChildren)
                    {
                        if ((hitter.getChildAt(i) is PathfinderNodeIndicator))
                        {
                            this.customNodes.push(new Point(hitter.getChildAt(i).x, hitter.getChildAt(i).y));
                            toRemove.push(hitter.getChildAt(i));
                        };
                        i = (i + 1);
                    };
                    while (toRemove.length > 0)
                    {
                        hitter.removeChild(toRemove.shift());
                    };
                    walkControl.offset = this.offset;
                    walkControl.mouseChildren = false;
                    walkControl.mouseEnabled = false;
                    walkControl.newMap(walkControl.getNodeGrid(cRect, this.nodeResolution, this.nodeResolution, hitter, this.customNodes));
                    this.walkControls.push(walkControl);
                    currentHitter = (currentHitter + 1);
                };
            }
            catch(e:Error)
            {
                trace(("Error creating nodes... " + e));
            };
            this.sceneRef.stage.quality = savedQuality;
        }

        private function onAdded(_arg_1:Event):*
        {
            this.offset = new Point(this.sceneRef.stage.getChildAt(0).sceneOffset[0], this.sceneRef.stage.getChildAt(0).sceneOffset[1]);
            this.createNodes();
        }

        private function onRemovedFromStage(_arg_1:Event):*
        {
            this.sceneRef.removeEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        }

        public function walkAV(_arg_1:*, _arg_2:*, _arg_3:int=1):Array
        {
            var _local_4:Number = ((Math.atan2((_arg_1.x - _arg_2.x), (_arg_2.y - _arg_1.y)) * 180) / Math.PI);
            this.walkCoords = this.walkControls[(_arg_3 - 1)].getPathCoordinates(new Point(_arg_1.x, _arg_1.y), new Point(_arg_2.x, _arg_2.y), _local_4);
            return (this.walkCoords);
        }


    }
}//package com.cocolani.modules

//------------------------------------------------------------
//com.cocolani.modules.PathfinderNodeIndicator

package com.cocolani.modules
{
    import flash.display.Sprite;

    public class PathfinderNodeIndicator extends Sprite 
    {


    }
}//package com.cocolani.modules

//------------------------------------------------------------
//com.cocolani.obj.furn_wallItem

package com.cocolani.obj
{
    import flash.display.MovieClip;

    public class furn_wallItem extends MovieClip 
    {

        public var myY:*;
        public var myDir:*;
        public var thisref:*;
        public var updateYReq:*;
        public var col:*;
        public var mydata:*;
        private var myOffset:*;
        private var canRotateItem:* = false;

        public function furn_wallItem()
        {
            this.thisref = this;
            this.myOffset = [25, 25];
            super();
            stop();
            mouseChildren = false;
            buttonMode = true;
        }

        public function get offsetStandard():*
        {
            return (this.myOffset);
        }

        public function get canRotate():*
        {
            return (this.canRotateItem);
        }

        public function checkIfEmpty():*
        {
            return (true);
        }

        public function killthis():*
        {
        }

        public function setdata(_arg_1:Array):*
        {
            this.mydata = _arg_1;
        }

        public function setdir(_arg_1:*, _arg_2:*=true):*
        {
            gotoAndStop(("dir" + _arg_1));
            this.myDir = _arg_1;
        }

        public function getoptions(_arg_1:*):*
        {
            var _local_2:* = [];
            if (_arg_1.checkPermEditObj())
            {
                _local_2.push({"id":4});
                _local_2.push({"id":6});
            };
            _local_2.push({"id":5});
            return (_local_2);
        }


    }
}//package com.cocolani.obj

//------------------------------------------------------------
//com.cocolani.obj.furnItem

package com.cocolani.obj
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.geom.Point;

    public class furnItem extends MovieClip 
    {

        public var mydata:*;
        public var myID:*;
        public var myY:*;
        public var myDir:*;
        public var thisref:*;
        public var updateYReq:*;
        public var col:*;
        internal var seatinglist:*;
        internal var objSeperated:* = false;
        private var myOffset:*;
        private var canRotateItem:* = true;
        internal var sitRM:*;
        internal var framecounter:* = 0;
        internal var framecounter2:* = 0;
        public var handlesOptions:* = false;
        public var handlesSeating:* = false;
        public var stageRef:*;

        public function furnItem()
        {
            this.thisref = this;
            this.seatinglist = [];
            this.myOffset = [165, 117];
            this.sitRM = [];
            super();
            stop();
            if (getChildByName("yline"))
            {
                this.thisref.yline.visible = false;
            };
            buttonMode = true;
            addEventListener(Event.ADDED_TO_STAGE, this.initthis);
        }

        public function commonSceneObjClick(_arg_1:*):*
        {
        }

        private function initthis(_arg_1:Event):*
        {
            this.stageRef = _arg_1.currentTarget.stage.getChildAt(0);
        }

        public function get mySeating():*
        {
            return ([1]);
        }

        public function get offsetStandard():*
        {
            return (this.myOffset);
        }

        public function get canRotate():*
        {
            return (this.canRotateItem);
        }

        public function checkIfEmpty():*
        {
            var _local_2:*;
            var _local_1:* = 0;
            for (_local_2 in this.seatinglist)
            {
                if (this.seatinglist[_local_2])
                {
                    _local_1++;
                };
            };
            if (_local_1 == 0)
            {
                return (true);
            };
            return (false);
        }

        public function releaseSeat(_arg_1:*=1):*
        {
            this.seatinglist[_arg_1] = undefined;
            this.destroy();
        }

        public function releaseAV(_arg_1:*):*
        {
            var _local_2:*;
            for (_local_2 in this.seatinglist)
            {
                if (_arg_1.sfsAV.getId() == _arg_1.getId())
                {
                    this.releaseSeat[_local_2];
                };
            };
        }

        public function destroy():*
        {
        }

        public function getSpareSeat():*
        {
            var _local_2:*;
            var _local_1:* = [];
            for (_local_2 in this.mySeating)
            {
                if (!this.seatinglist[this.mySeating[_local_2]])
                {
                    _local_1.push(this.mySeating[_local_2]);
                };
            };
            return (_local_1);
        }

        private function framebugupdate(_arg_1:Event):*
        {
            var _local_2:*;
            if (this.framecounter == 4)
            {
                this.thisref.stage.getChildAt(0).showmsg("Could not perform the action. Please contact technical support.");
                removeEventListener(Event.FRAME_CONSTRUCTED, this.framebugupdate);
            };
            for (_local_2 in this.sitRM)
            {
                if (this.thisref.getChildByName(("sitpos" + this.sitRM[_local_2].pos)))
                {
                    this.avSit(this.sitRM[_local_2].avref, this.sitRM[_local_2].pos);
                    this.sitRM.splice(_local_2, 1);
                    _local_2 = 0;
                };
            };
            if (this.sitRM.length == 0)
            {
                removeEventListener(Event.FRAME_CONSTRUCTED, this.framebugupdate);
            };
            this.framecounter++;
        }

        public function avSit(_arg_1:*, _arg_2:*):*
        {
            this.seatinglist[_arg_2] = _arg_1;
            if (!this.thisref.getChildByName(("sitpos" + _arg_2)))
            {
                this.sitRM.push({
                    "avref":_arg_1,
                    "pos":_arg_2
                });
                addEventListener(Event.FRAME_CONSTRUCTED, this.framebugupdate);
                this.framecounter = 0;
            }
            else
            {
                this.thisref[("sitpos" + _arg_2)].addChild(_arg_1);
                _arg_1.x = 0;
                _arg_1.y = 0;
            };
        }

        public function avStand(_arg_1:*):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_2:* = false;
            for (_local_3 in this.seatinglist)
            {
                if (this.seatinglist[_local_3] == _arg_1)
                {
                    _local_4 = _local_3;
                    this.thisref[("sitpos" + _local_4)].removeChild(this.seatinglist[_local_4]);
                    _local_5 = this.thisref.localToGlobal(new Point(this.thisref[("standpos" + _local_4)].x, this.thisref[("standpos" + _local_4)].y));
                    _local_5 = this.thisref.parent.globalToLocal(_local_5);
                    _arg_1.x = _local_5.x;
                    _arg_1.y = _local_5.y;
                    this.seatinglist[_local_3] = null;
                };
            };
        }

        public function setInteractiveChildren():*
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:*;
            if (this.seatinglist.length > 0)
            {
                this.objSeperated = true;
                mouseEnabled = true;
                mouseChildren = true;
                this.thisref.buttonMode = false;
                _local_1 = ["fgd", "bgd"];
                _local_2 = 0;
                while (_local_2 < _local_1.length)
                {
                    _local_3 = getChildByName(_local_1[_local_2]);
                    if (_local_3)
                    {
                        _local_3.mouseChildren = false;
                        _local_3.buttonMode = true;
                    };
                    _local_2++;
                };
            }
            else
            {
                mouseChildren = false;
                this.thisref.buttonMode = true;
                _local_1 = ["fgd", "bgd"];
            };
        }

        public function updateY(_arg_1:Event):*
        {
            var _local_2:*;
            if (getChildByName("yline"))
            {
                this.framecounter2++;
                this.thisref.yline.visible = false;
                _local_2 = localToGlobal(new Point(this.thisref.yline.x, this.thisref.yline.y));
                this.myY = _local_2.y;
                if (this.updateYReq)
                {
                    this.thisref.parent.setSceneObjY(this.mydata[0]);
                };
                this.checkSeatRender();
                if (this.framecounter2 >= 4)
                {
                    removeEventListener(Event.ENTER_FRAME, this.updateY);
                };
            }
            else
            {
                trace(("Warning : Missing yline on room object " + this.thisref));
                this.myY = this.thisref.y;
                removeEventListener(Event.ENTER_FRAME, this.updateY);
            };
        }

        public function killthis():*
        {
            removeEventListener(Event.ENTER_FRAME, this.updateY);
        }

        public function setdata(_arg_1:Array):*
        {
            this.mydata = _arg_1;
        }

        public function setdir(_arg_1:*, _arg_2:*=true):*
        {
            var _local_3:*;
            for (_local_3 in this.seatinglist)
            {
                if (this.seatinglist[_local_3])
                {
                    this.seatinglist[_local_3].sitav(_arg_1);
                };
            };
            this.updateYReq = _arg_2;
            this.myDir = _arg_1;
            gotoAndStop(("dir" + _arg_1));
            this.framecounter2 = 0;
            if (_arg_2)
            {
                addEventListener(Event.ENTER_FRAME, this.updateY);
            };
        }

        private function checkSeatRender():*
        {
            var _local_1:* = 0;
            while (_local_1 < this.seatinglist.length)
            {
                if (this.seatinglist[_local_1])
                {
                    if (this.thisref.getChildByName(("sitpos" + _local_1)))
                    {
                        if (!this.thisref[("sitpos" + _local_1)].contains(this.seatinglist[_local_1]))
                        {
                            this.thisref[("sitpos" + _local_1)].addChild(this.seatinglist[_local_1]);
                        };
                    };
                };
                _local_1++;
            };
        }

        public function objectReceived(_arg_1:*, _arg_2:*):*
        {
        }

        public function getoptions(_arg_1:*):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_2:* = [];
            if (_arg_1.checkPermEditObj())
            {
                _local_2.push({"id":4});
                _local_3 = 0;
                for (_local_4 in this.seatinglist)
                {
                    if (this.seatinglist[_local_4])
                    {
                        _local_3++;
                    };
                };
                if (_local_3 == 0)
                {
                    _local_2.push({"id":6});
                };
            };
            if (this.mydata[5] == "0")
            {
                if (_arg_1.egoref.sfsAV.getVariable("stob") == this.mydata[0])
                {
                    _local_2.push({"id":8});
                }
                else
                {
                    _local_2.push({"id":7});
                };
            };
            _local_2.push({"id":5});
            return (_local_2);
        }


    }
}//package com.cocolani.obj

//------------------------------------------------------------
//com.cocolani.obj.sceneObjectSit

package com.cocolani.obj
{
    import com.cocolani.sceneObject;
    import flash.events.MouseEvent;
    import flash.geom.Point;

    public class sceneObjectSit extends sceneObject 
    {

        public var seatinglist:* = [];
        public var seatID:*;
        public var myDir:* = 1;
        public var sitDistance:* = 80;
        public var handlesSeating:* = false;

        public function sceneObjectSit()
        {
            ownsInteractity = true;
        }

        public function commonSceneObjClick(_arg_1:*):*
        {
        }

        override public function optionResult(_arg_1:*):*
        {
            var _local_2:*;
            var _local_3:*;
            if (stageRef.mc_scene.sceneRef)
            {
                stageRef.mc_scene.sceneRef.hideOptions();
                if (_arg_1 == 7)
                {
                    if (((this.sitDistance == -1) || (stageRef.mc_scene.sceneRef.getDistanceToObject(thisref) <= this.sitDistance)))
                    {
                        if (this.handlesSeating)
                        {
                            this.commonSceneObjClick(_arg_1);
                        }
                        else
                        {
                            _local_2 = this.getSpareSeat();
                            if (_local_2.length > 0)
                            {
                                stageRef.mc_scene.sceneRef.avatarSit(stageRef.mc_scene.sceneRef.egoref, thisref, _local_2[0]);
                                _local_3 = {};
                                _local_3.stob = this.seatID;
                                _local_3.stsid = _local_2[0];
                                stageRef.sendXTmessage({
                                    "ext":"nav",
                                    "cmd":"sit",
                                    "t":_local_3
                                }, 1);
                                this.setInteractiveChildren();
                            }
                            else
                            {
                                stageRef.showmsg(stageRef.langObj.getText("com09"));
                            };
                        };
                    }
                    else
                    {
                        stageRef.mc_interface.feedback.revealmessage(stageRef.langObj.getText("com00"), "");
                    };
                }
                else
                {
                    if (_arg_1 == 8)
                    {
                        stageRef.mc_scene.sceneRef.avatarStand(stageRef.mc_scene.sceneRef.egoref, thisref);
                        _local_3 = {};
                        _local_3.stob = undefined;
                        _local_3.stsid = undefined;
                        stageRef.sendXTmessage({
                            "ext":"nav",
                            "cmd":"sit",
                            "t":_local_3
                        }, 1);
                        trace("Stand up....");
                    };
                };
            };
        }

        public function setInteractiveChildren():*
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:*;
            if (ownsInteractity)
            {
                if (this.seatinglist.length > 0)
                {
                    objSeperated = true;
                    mouseEnabled = true;
                    mouseChildren = true;
                    removeEventListener(MouseEvent.MOUSE_OVER, mousecatcher);
                    removeEventListener(MouseEvent.MOUSE_OUT, mousecatcher);
                    removeEventListener(MouseEvent.CLICK, mousecatcher);
                    thisref.buttonMode = false;
                    _local_1 = ["fgd", "bgd"];
                    _local_2 = 0;
                    while (_local_2 < _local_1.length)
                    {
                        _local_3 = getChildByName(_local_1[_local_2]);
                        if (_local_3)
                        {
                            _local_3.addEventListener(MouseEvent.MOUSE_OVER, mousecatcher);
                            _local_3.addEventListener(MouseEvent.MOUSE_OUT, mousecatcher);
                            _local_3.addEventListener(MouseEvent.CLICK, mousecatcher);
                            _local_3.mouseChildren = false;
                            _local_3.buttonMode = true;
                        };
                        _local_2++;
                    };
                }
                else
                {
                    mouseChildren = false;
                    addEventListener(MouseEvent.MOUSE_OVER, mousecatcher);
                    addEventListener(MouseEvent.MOUSE_OUT, mousecatcher);
                    addEventListener(MouseEvent.CLICK, mousecatcher);
                    thisref.buttonMode = true;
                    _local_1 = ["fgd", "bgd"];
                    _local_2 = 0;
                    while (_local_2 < _local_1.length)
                    {
                        _local_3 = getChildByName(_local_1[_local_2]);
                        _local_3.removeEventListener(MouseEvent.MOUSE_OVER, mousecatcher);
                        _local_3.removeEventListener(MouseEvent.MOUSE_OUT, mousecatcher);
                        _local_3.removeEventListener(MouseEvent.CLICK, mousecatcher);
                        _local_2++;
                    };
                };
            };
        }

        public function releaseSeat(_arg_1:*=1):*
        {
            this.seatinglist[_arg_1] = undefined;
            this.destroy();
        }

        public function destroy():*
        {
        }

        public function releaseAV(_arg_1:*):*
        {
            var _local_2:*;
            for (_local_2 in this.seatinglist)
            {
                if (_arg_1.sfsAV.getId() == this.seatinglist[_local_2].sfsAV.getId())
                {
                    this.releaseSeat(_local_2);
                };
            };
        }

        public function avSit(_arg_1:*, _arg_2:*):*
        {
            trace(("sitpos 1 = " + thisref.sitpos1));
            trace(("seating list = " + this.seatinglist));
            this.seatinglist[_arg_2] = _arg_1;
            thisref.sitpos1.addChild(_arg_1);
            _arg_1.x = 0;
            _arg_1.y = 0;
            this.setInteractiveChildren();
        }

        public function avStand(_arg_1:*):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_2:* = false;
            for (_local_3 in this.seatinglist)
            {
                if (this.seatinglist[_local_3])
                {
                    if (this.seatinglist[_local_3].sfsAV.getName() == _arg_1.sfsAV.getName())
                    {
                        _local_4 = _local_3;
                        thisref[("sitpos" + _local_4)].removeChild(this.seatinglist[_local_4]);
                        _local_5 = thisref.localToGlobal(new Point(thisref[("standpos" + _local_4)].x, thisref[("standpos" + _local_4)].y));
                        _local_5 = stageRef.mc_scene.sceneRef.globalToLocal(_local_5);
                        _arg_1.x = _local_5.x;
                        _arg_1.y = _local_5.y;
                        this.seatinglist[_local_4] = undefined;
                        _local_2 = true;
                    };
                };
            };
            if (!_local_2)
            {
                thisref.stage.getChildAt(0).showmsg("Problem in object. Please contact technical support.>");
            };
        }

        override public function get mySeating():*
        {
            return ([1]);
        }

        override public function getoptions():*
        {
            var _local_1:* = [];
            if ((((!(stageRef.mc_scene.sceneRef)) || (stageRef.mc_scene.sceneRef.egoref.isSitting == false)) || (this.isEgoSittingHere())))
            {
                if (this.isEgoSitting())
                {
                    _local_1.push({"id":8});
                }
                else
                {
                    if (this.getSpareSeat().length > 0)
                    {
                        _local_1.push({"id":7});
                    };
                };
            };
            _local_1.push({"id":5});
            return (_local_1);
        }

        public function getSpareSeat():*
        {
            var _local_2:*;
            var _local_1:* = [];
            for (_local_2 in this.mySeating)
            {
                if (!this.seatinglist[this.mySeating[_local_2]])
                {
                    _local_1.push(this.mySeating[_local_2]);
                };
            };
            return (_local_1);
        }

        public function isEgoSittingHere():*
        {
            var _local_1:*;
            for (_local_1 in this.seatinglist)
            {
                if (this.seatinglist[_local_1].isego)
                {
                    return (true);
                };
            };
            return (false);
        }

        public function isEgoSitting():*
        {
            var _local_1:*;
            for (_local_1 in this.seatinglist)
            {
                if (stageRef.mc_scene.sceneRef.egoref == this.seatinglist[_local_1])
                {
                    return (true);
                };
            };
            return (false);
        }


    }
}//package com.cocolani.obj

//------------------------------------------------------------
//com.cocolani.panels.popup

package com.cocolani.panels
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import com.greensock.TweenLite;

    public class popup extends MovieClip 
    {

        internal var thisref:*;
        internal var parenttype:*;
        public var myname:* = "";

        public function popup()
        {
            this.thisref = this;
            super();
            if (this.thisref.getChildByName("bgd"))
            {
                this.thisref.bgd.addEventListener(MouseEvent.MOUSE_DOWN, this.dragfn);
                this.thisref.bgd.addEventListener(MouseEvent.MOUSE_UP, this.dragfn);
            }
            else
            {
                addEventListener(MouseEvent.MOUSE_DOWN, this.dragfn);
                addEventListener(MouseEvent.MOUSE_UP, this.dragfn);
            };
            addEventListener(Event.ADDED_TO_STAGE, this.align);
            if (!this.thisref.getChildByName("bt_close"))
            {
                trace("No close button in the popup!");
            }
            else
            {
                this.thisref.bt_close.addEventListener(MouseEvent.CLICK, this.clickbt);
            };
        }

        public function setAttribs(_arg_1:Object):*
        {
            if (_arg_1.dragbgd)
            {
                if (!this.thisref.getChildByName("bgd"))
                {
                    trace(("Warning: there is no mc called 'bgd' in movieclip " + this.myname));
                };
                this.thisref.bgd.addEventListener(MouseEvent.MOUSE_DOWN, this.dragfn);
                this.thisref.bgd.addEventListener(MouseEvent.MOUSE_UP, this.dragfn);
                this.thisref.removeEventListener(MouseEvent.MOUSE_DOWN, this.dragfn);
                this.thisref.removeEventListener(MouseEvent.MOUSE_UP, this.dragfn);
            };
        }

        public function align(_arg_1:Event=null):*
        {
            this.thisref.x = ((this.thisref.stage.getChildAt(0).stageScale[0] / 2) - (this.thisref.width / 2));
            this.thisref.y = ((this.thisref.stage.getChildAt(0).stageScale[1] / 2) - (this.thisref.height / 2));
        }

        public function clickbt(_arg_1:MouseEvent):*
        {
            if (_arg_1.currentTarget.name == "bt_close")
            {
                TweenLite.killTweensOf(this.thisref);
                this.thisref.parent.hidePanel(this.myname);
            };
        }

        public function dragfn(_arg_1:MouseEvent):*
        {
            if (_arg_1.type == "mouseUp")
            {
                this.thisref.stopDrag();
            }
            else
            {
                if (_arg_1.type == "mouseDown")
                {
                    this.thisref.startDrag();
                    this.thisref.parent.setChildIndex(this.thisref, (this.thisref.parent.numChildren - 1));
                };
            };
        }

        public function fadein():*
        {
            this.thisref.alpha = 0;
            new TweenLite(this.thisref, 0.5, {"alpha":1});
        }


    }
}//package com.cocolani.panels

//------------------------------------------------------------
//com.cocolani.scenes.scene

package com.cocolani.scenes
{
    import flash.display.MovieClip;
    import com.cocolani.modules.pathFinder;
    import flash.filters.GlowFilter;
    import flash.filters.BitmapFilterQuality;
    import flash.events.Event;
    import com.cocolani.sceneObjectSit;
    import com.cocolani.obj.sceneObjectSit;
    import com.cocolani.sceneObject;
    import flash.geom.Point;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;
    import flash.display.Loader;
    import com.cocolani.common.popup_menu;
    import flash.display.Shape;
    import com.cocolani.resourceLoader;
    import flash.events.ProgressEvent;
    import com.cocolani.common.tools;
    import com.cocolani.obj.furnItem;
    import flash.display.DisplayObjectContainer;
    import com.cocolani.obj.*;

    public class scene extends MovieClip 
    {

        internal static var offsetStandard:* = [165, 117];

        internal var avlist:* = [];
        public var ObjCat:Array = new Array();
        public var egoref:*;
        public var rootref:*;
        public var thisref:*;
        public var pathFinderRef:pathFinder;
        public var roomSFSobj:*;
        public var langObj:*;
        public var optionsPopup:*;
        public var arrow_cw:*;
        public var arrow_ac:*;
        public var selectedItem:*;
        private var selectFilter:* = new GlowFilter(0xFFFFFF, 1, 8, 8, 2, BitmapFilterQuality.MEDIUM, false, false);
        public var preloadList:* = [];
        public var egosHome:Boolean = false;
        public var sceneOffSet:* = [];
        public var trashed:* = false;
        public var pathFinding:* = true;
        public var isRoomReady:* = true;
        public var preloadItemList:* = [];
        public var PreloadfnToCall:*;

        public function scene()
        {
            var _local_3:*;
            super();
            tabChildren = false;
            this.thisref = this;
            addEventListener(Event.ADDED_TO_STAGE, this.init);
            this.initializePathFinder();
            if (!getChildByName("startpos1"))
            {
                trace("no start position defined");
            };
            if (!getChildByName("collide1"))
            {
                trace("Warning no collission detection object defined");
            };
            this.hideconfig("startpos");
            this.hideconfig("collide");
            this.hideconfig("walktopos");
            this.hideconfig("exitpad");
            this.hideconfig("mask");
            if (getChildByName("background"))
            {
                this.setmouseconfig(this.thisref.background, false);
            }
            else
            {
                trace("Warning, there is no MC called 'background' here");
            };
            if (getChildByName("foreground"))
            {
                this.setmouseconfig(this.thisref.foreground, false);
            }
            else
            {
                trace("Warning, there is no MC called 'foreground' here");
            };
            var _local_1:* = 1;
            var _local_2:* = 0;
            while (_local_2 < numChildren)
            {
                if (((getChildAt(_local_2) is com.cocolani.obj.sceneObjectSit) || (getChildAt(_local_2) is com.cocolani.sceneObjectSit)))
                {
                    _local_3 = getChildAt(_local_2);
                    _local_3.seatID = _local_1;
                    _local_1++;
                };
                _local_2++;
            };
        }

        public function init(_arg_1:Event):*
        {
            if (!this.thisref.stage.getChildAt(0).getChildByName("mc_scene"))
            {
                trace("WARNING : CANNOT RUN FILE IN STANDALONE MODE");
                this.trashChildren(this.thisref);
                return;
            };
            this.sceneOffSet = this.thisref.stage.getChildAt(0).sceneOffset;
            this.rootref = _arg_1.target.stage.getChildAt(0);
            this.langObj = this.rootref.langObj;
            this.pathFinding = this.rootref.mc_interface.bt_pathfinding.status;
            this.rootref.mc_interface.bt_pathfinding.enable();
            this.pathFinding = this.rootref.mc_interface.bt_pathfinding.status;
            this.getLanguage();
            this.getObjectCats();
            if (this.rootref.mc_interface)
            {
                this.initroomfn();
            }
            else
            {
                trace("STANDALONE MODE");
            };
        }

        public function getObjectCats():*
        {
            var _local_2:*;
            var _local_3:*;
            this.ObjCat = [];
            var _local_1:* = 0;
            while (_local_1 < this.thisref.numChildren)
            {
                _local_2 = getChildAt(_local_1);
                if ((_local_2 as sceneObject))
                {
                    _local_3 = new Object();
                    _local_3.ref = _local_2;
                    this.ObjCat.push(_local_3);
                };
                _local_1++;
            };
        }

        public function addObjectToCat(_arg_1:*):*
        {
            var _local_3:*;
            var _local_2:* = _arg_1;
            if ((_local_2 is sceneObject))
            {
                _local_3 = new Object();
                _local_3.ref = _arg_1;
                this.ObjCat.push(_local_3);
            };
        }

        public function autoAddObject(_arg_1:*):*
        {
            _arg_1.updateY();
            this.addObjectToCat(_arg_1);
            this.setObjY(_arg_1, _arg_1.thisYcoord.y);
        }

        public function setlayers():*
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:*;
            if (!this.trashed)
            {
                this.ObjCat.sortOn(["y"], Array.NUMERIC);
                _local_1 = 0;
                while (_local_1 < this.ObjCat.length)
                {
                    _local_2 = (_local_1 + 1);
                    while (_local_2 < this.ObjCat.length)
                    {
                        if (((this.thisref.contains(this.ObjCat[_local_1].ref)) && (this.thisref.contains(this.ObjCat[_local_2].ref))))
                        {
                            _local_3 = true;
                            if (((this.ObjCat[_local_1].isAV) || (this.ObjCat[_local_2].isAV)))
                            {
                                if (this.ObjCat[_local_1].ref.isSitting)
                                {
                                    _local_3 = false;
                                };
                                if (this.ObjCat[_local_2].ref.isSitting)
                                {
                                    _local_3 = false;
                                };
                            };
                            if (_local_3)
                            {
                                if (getChildIndex(this.ObjCat[_local_1].ref) > getChildIndex(this.ObjCat[_local_2].ref))
                                {
                                    swapChildren(this.ObjCat[_local_1].ref, this.ObjCat[_local_2].ref);
                                };
                            };
                        }
                        else
                        {
                            _local_3 = true;
                            if (((this.ObjCat[_local_1].isAV) || (this.ObjCat[_local_2].isAV)))
                            {
                                if (this.ObjCat[_local_1].ref.isSitting)
                                {
                                    _local_3 = false;
                                };
                                if (this.ObjCat[_local_2].ref.isSitting)
                                {
                                    _local_3 = false;
                                };
                            };
                        };
                        _local_2++;
                    };
                    _local_1++;
                };
                for (_local_1 in this.ObjCat)
                {
                    if (((this.ObjCat[_local_1].subtype == "1") || (this.ObjCat[_local_1].subtype == "3")))
                    {
                        setChildIndex(this.ObjCat[_local_1].ref, getChildIndex(this.ObjCat[0].ref));
                    };
                };
                setChildIndex(this.thisref.foreground, (numChildren - 1));
                this.setlayersAfterProcess();
            };
        }

        public function setlayersAfterProcess():*
        {
        }

        public function setObjY(_arg_1:*, _arg_2:*):*
        {
            var _local_3:* = 0;
            while (_local_3 < this.ObjCat.length)
            {
                if (this.ObjCat[_local_3].ref == _arg_1)
                {
                    this.ObjCat[_local_3].y = _arg_2;
                };
                _local_3++;
            };
            this.setlayers();
        }

        public function isExitPadAuto(_arg_1:*):*
        {
            return (true);
        }

        public function avMonitor(_arg_1:*, _arg_2:*=true):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            if (_arg_2)
            {
                _local_4 = localToGlobal(new Point(_arg_1.x, _arg_1.y));
                _local_5 = true;
                _local_6 = 1;
                while (_local_5)
                {
                    if (getChildByName(("exitpad" + _local_6)))
                    {
                        if (getChildByName(("exitpad" + _local_6)).hitTestPoint(_local_4.x, _local_4.y, true))
                        {
                            if (this.isExitPadAuto(_local_6))
                            {
                                _arg_1.commandList = [];
                                _arg_1.stopwalk();
                            };
                            this.executeExit(_arg_1, _local_6);
                        };
                        _local_6++;
                    }
                    else
                    {
                        _local_5 = false;
                    };
                };
            };
            for (_local_3 in this.ObjCat)
            {
                if (((this.ObjCat[_local_3].isAV) && (this.ObjCat[_local_3].ref.sfsAV.getId() == _arg_1.sfsAV.getId())))
                {
                    this.ObjCat[_local_3].y = (_arg_1.y + this.sceneOffSet[1]);
                    break;
                };
            };
            this.AVMonitorOverride(_arg_1);
        }

        public function AVMonitorOverride(_arg_1:*=false):*
        {
        }

        public function getLanguage():*
        {
        }

        public function initroomfn():*
        {
        }

        public function roomVarUpdateOverride(_arg_1:*):*
        {
        }

        public function getPlayerSceneEntryInstructions(_arg_1:*):*
        {
            _arg_1.commandList.push({
                "walkto":new Point(this.thisref.walktopos1.x, this.thisref.walktopos1.y),
                "sendupdate":true,
                "setListener":false,
                "setUserControl":false
            }, {
                "setUserControl":true,
                "setListener":true
            });
            _arg_1.executeNextCommand();
        }

        public function gameMessage(_arg_1:*, _arg_2:*=null, _arg_3:*=null, _arg_4:*=null):*
        {
        }

        public function extReply(_arg_1:*, _arg_2:*=null):*
        {
            if (_arg_2 == "str")
            {
                if (this.rootref.mc_scene.gameRef)
                {
                    this.rootref.mc_scene.gameRef.gameComm(_arg_1);
                };
            };
        }

        public function extReplyAuto(_arg_1:*):*
        {
            var _local_2:*;
            var _local_3:*;
            if (_arg_1.sub == "btlChallenge")
            {
                _local_2 = getDefinitionByName("mc_request");
                _local_3 = this.rootref.addChild(new (_local_2)());
                _local_3.requesttxt.text = this.langObj.repText("gui50", _arg_1.nm.toUpperCase());
                _local_3.bt_yes.addEventListener(MouseEvent.CLICK, this.onBattlePermResponse);
                _local_3.bt_no.addEventListener(MouseEvent.CLICK, this.onBattlePermResponse);
                _local_3.data = _arg_1;
            }
            else
            {
                if (_arg_1.sub == "btlChallengeAgree")
                {
                    this.rootref.mc_scene.loadNewRoom("GamesRoom", true, {
                        "battlegame":true,
                        "battle":0,
                        "pvtbattle":true,
                        "pid":_arg_1
                    });
                };
            };
        }

        private function onBattlePermResponse(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            if (_arg_1.currentTarget.name == "bt_yes")
            {
                if (this.rootref.currentTribe == this.rootref.myTribe)
                {
                    _local_2 = {};
                    _local_2.cmd = "pracBattleResp";
                    _local_2.ext = "gameManager";
                    _local_2.uid = _arg_1.currentTarget.parent.data.uid;
                    this.rootref.sendXTmessage(_local_2);
                };
            };
            this.rootref.removeChild(_arg_1.currentTarget.parent);
        }

        public function checkForInteract(_arg_1:Point):*
        {
        }

        public function checkForDrop(_arg_1:*, _arg_2:*, _arg_3:*):*
        {
        }

        public function closeInteraction(_arg_1:*):*
        {
        }

        public function checkPuzzleDone(_arg_1:*):*
        {
            var _local_4:*;
            var _local_2:* = this.rootref.pzlVars;
            var _local_3:* = false;
            for (_local_4 in _local_2)
            {
                if (_local_2[_local_4] == _arg_1)
                {
                    return (true);
                };
            };
            return (false);
        }

        public function sendPuzzleSucc(_arg_1:*, _arg_2:*=false):*
        {
            var _local_3:* = new Object();
            if (_arg_2)
            {
                _local_3.cmd = "pzldrp";
            }
            else
            {
                _local_3.cmd = "pzl";
            };
            _local_3.ext = "puzzle_handler";
            _local_3.id = _arg_1;
            this.rootref.sendXTmessage(_local_3);
        }

        public function checkforINVObjId(_arg_1:*):*
        {
            var _local_2:* = this.rootref.mc_interface.playerPopupRef.inventoryContainer.getinv();
            var _local_3:* = this.rootref.invVars;
            var _local_4:* = false;
            var _local_5:* = 0;
            while (_local_5 < _local_2.length)
            {
                if (Number(_local_2[_local_5].oid) == _arg_1)
                {
                    _local_4 = true;
                    break;
                };
                _local_5++;
            };
            _local_5 = 0;
            while (_local_5 < _local_3.length)
            {
                if (Number(_local_3[_local_5]) == _arg_1)
                {
                    _local_4 = true;
                    break;
                };
                _local_5++;
            };
            return (_local_4);
        }

        public function checkforINV(_arg_1:*):*
        {
            var _local_2:* = this.rootref.mc_interface.playerPopupRef.inventoryContainer.getinv();
            var _local_3:* = 0;
            while (_local_3 < _local_2.length)
            {
                if (Number(_local_2[_local_3].oid) == _arg_1)
                {
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        public function checkforINVVar(_arg_1:*):*
        {
            var _local_2:* = this.rootref.invVars;
            var _local_3:* = 0;
            while (_local_3 < _local_2.length)
            {
                if (Number(_local_2[_local_3]) == _arg_1)
                {
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        public function hideOptions():*
        {
            if (this.optionsPopup)
            {
                this.rootref.removeChild(this.optionsPopup);
                this.optionsPopup = undefined;
            };
            if (this.arrow_cw)
            {
                this.rootref.mc_scene.foreElements.removeChild(this.arrow_cw);
                this.arrow_cw = undefined;
            };
            if (this.arrow_ac)
            {
                this.rootref.mc_scene.foreElements.removeChild(this.arrow_ac);
                this.arrow_ac = undefined;
            };
        }

        public function avatarSit(_arg_1:*, _arg_2:*, _arg_3:*):*
        {
            if (_arg_1.isSitting == false)
            {
                removeChild(_arg_1);
                if (_arg_1.ego)
                {
                    _arg_1.FollowCursor(false);
                    this.rootref.mc_scene.clickEnable = false;
                };
                _arg_1.sitav(_arg_2.myDir);
                _arg_2.avSit(_arg_1, _arg_3);
            };
        }

        public function avatarStand(_arg_1:*, _arg_2:*):*
        {
            if (!(_arg_2 is Loader))
            {
                _arg_2.avStand(_arg_1);
            };
            _arg_1.standav();
            if (_arg_1.ego)
            {
                _arg_1.FollowCursor(true);
                this.rootref.mc_scene.clickEnable = true;
            };
            addChild(_arg_1);
            this.avMonitor(_arg_1, false);
            this.setlayers();
        }

        public function newOptions(_arg_1:*=null, _arg_2:Array=null):*
        {
            this.hideOptions();
            this.optionsPopup = this.rootref.addChild(new popup_menu(_arg_1, _arg_2, this.thisref));
            var _local_3:* = _arg_1.localToGlobal(new Point(_arg_1.x, _arg_1.y));
            this.optionsPopup.x = this.thisref.stage.mouseX;
            this.optionsPopup.y = this.thisref.stage.mouseY;
        }

        public function optionResult(_arg_1:*, _arg_2:*):*
        {
            this.hideOptions();
        }

        public function removeFurniture(_arg_1:*):*
        {
            var _local_2:* = 0;
            while (_local_2 < this.ObjCat.length)
            {
                if ((((!(this.ObjCat[_local_2].isAV)) && (this.ObjCat[_local_2].ref.mydata)) && (this.ObjCat[_local_2].ref.mydata[0] == _arg_1)))
                {
                    this.thisref.removeChild(this.ObjCat[_local_2].ref);
                    this.thisref.collide1.removeChild(this.ObjCat[_local_2].col);
                    this.ObjCat[_local_2].ref.killthis();
                    this.ObjCat.splice(_local_2, 1);
                    this.setlayers();
                    this.resetNodes();
                    break;
                };
                _local_2++;
            };
            if (this.egosHome)
            {
                this.hideOptions();
            };
        }

        public function adjustFurniture(_arg_1:*):*
        {
            var _local_4:*;
            var _local_2:* = _arg_1.split(",");
            var _local_3:* = 0;
            while (_local_3 < this.ObjCat.length)
            {
                if ((((!(this.ObjCat[_local_3].isAV)) && (this.ObjCat[_local_3].ref.mydata)) && (this.ObjCat[_local_3].ref.mydata[0] == _local_2[0])))
                {
                    this.ObjCat[_local_3].ref.mydata = _local_2;
                    this.ObjCat[_local_3].ref.x = (_local_2[2] - this.ObjCat[_local_3].ref.offsetStandard[0]);
                    this.ObjCat[_local_3].ref.y = (_local_2[3] - this.ObjCat[_local_3].ref.offsetStandard[1]);
                    this.ObjCat[_local_3].ref.alpha = 1;
                    this.ObjCat[_local_3].y = this.ObjCat[_local_3].ref.y;
                    this.ObjCat[_local_3].ref.setdir(_local_2[4]);
                    this.ObjCat[_local_3].ref.setdata(_local_2);
                    this.thisref.collide1.addChild(this.ObjCat[_local_3].ref.col);
                    _local_4 = this.thisref.collide1.globalToLocal(this.thisref.localToGlobal(new Point(_local_2[2], _local_2[3])));
                    this.ObjCat[_local_3].col.x = (_local_4.x - offsetStandard[0]);
                    this.ObjCat[_local_3].col.y = (_local_4.y - offsetStandard[1]);
                    this.ObjCat[_local_3].col.gotoAndStop(("dir" + _local_2[4]));
                    if (this.ObjCat[_local_3].ref.canRotate)
                    {
                        this.alignrotate(this.ObjCat[_local_3].ref);
                        this.arrow_ac.visible = true;
                        this.arrow_cw.visible = true;
                    };
                    if (this.selectedItem)
                    {
                        this.selectedItem.addEventListener(MouseEvent.ROLL_OUT, this.dragSceneObj);
                        this.selectedItem.addEventListener(MouseEvent.CLICK, this.sceneObjClick);
                    };
                    this.setlayers();
                    this.resetNodes();
                    return;
                };
                _local_3++;
            };
        }

        public function resetNodes():*
        {
            this.pathFinderRef.createNodes();
        }

        public function alignrotate(_arg_1:*):*
        {
            this.arrow_cw.x = (((_arg_1.x - this.arrow_cw.width) - (_arg_1.width / 2)) + offsetStandard[0]);
            this.arrow_cw.y = ((_arg_1.y + offsetStandard[1]) - _arg_1.height);
            this.arrow_ac.x = ((_arg_1.x + (_arg_1.width / 2)) + offsetStandard[0]);
            this.arrow_ac.y = ((_arg_1.y + offsetStandard[1]) - _arg_1.height);
        }

        public function placeFurniture(_arg_1:*):*
        {
            this.addSceneObj(_arg_1.split(","));
            if (this.egosHome)
            {
                this.hideOptions();
            };
            this.setlayers();
            this.resetNodes();
        }

        public function setChildren(_arg_1:*, _arg_2:Array):*
        {
            var _local_4:*;
            var _local_5:*;
            _arg_1.mouseChildren = true;
            _arg_1.mouseEnabled = false;
            var _local_3:* = 0;
            while (_local_3 < _arg_1.numChildren)
            {
                _local_4 = false;
                _local_5 = 0;
                while (_local_5 < _arg_2.length)
                {
                    if (_arg_1.getChildAt(_local_3).name == _arg_2[_local_5])
                    {
                        _local_4 = true;
                        break;
                    };
                    _local_5++;
                };
                if (!_local_4)
                {
                    if ((_arg_1.getChildAt(_local_3) is Shape))
                    {
                        trace((("PROBLEM -- THERE IS A SHAPE IN THE OBJECT CALLED " + _arg_1.name) + ". PLEASE MOVE THIS INTO A MOVIECLIP!"));
                    }
                    else
                    {
                        _arg_1.getChildAt(_local_3).mouseEnabled = false;
                        _arg_1.getChildAt(_local_3).mouseChildren = false;
                    };
                };
                _local_3++;
            };
        }

        public function getDistanceToCoord(_arg_1:*):*
        {
            var _local_2:* = Point.distance(_arg_1, this.egoref.parent.localToGlobal(new Point(this.egoref.x, this.egoref.y)));
            if (_local_2)
            {
                return (_local_2);
            };
            return (-1);
        }

        public function getDistanceToObject(_arg_1:*):*
        {
            return (Point.distance(_arg_1.parent.localToGlobal(new Point(_arg_1.x, _arg_1.y)), this.egoref.parent.localToGlobal(new Point(this.egoref.x, this.egoref.y))));
        }

        public function getBearingToObject(_arg_1:*):*
        {
            return (20);
        }

        public function setInteractiveList(_arg_1:Array):*
        {
            var _local_2:* = 0;
            while (_local_2 < _arg_1.length)
            {
                _arg_1[_local_2].setInteractive();
                _arg_1[_local_2].sceneObjId = _local_2;
                _local_2++;
            };
        }

        public function setmouseconfig(_arg_1:*, _arg_2:*):*
        {
            _arg_1.mouseEnabled = _arg_2;
            _arg_1.mouseChildren = false;
        }

        internal function hideconfig(_arg_1:*):*
        {
            var _local_2:* = 1;
            var _local_3:* = true;
            while (_local_3)
            {
                if (getChildByName((_arg_1 + _local_2)))
                {
                    this.thisref[(_arg_1 + _local_2)].visible = false;
                    this.thisref[(_arg_1 + _local_2)].mouseEnabled = false;
                    this.thisref[(_arg_1 + _local_2)].cacheAsBitMap = true;
                }
                else
                {
                    _local_3 = false;
                };
                _local_2++;
            };
        }

        public function executeExit(_arg_1:*, _arg_2:*):*
        {
            _arg_1.commandList.push({
                "walkto":new Point(350, 500),
                "sendupdate":true,
                "setListener":false,
                "setUserControl":false
            }, {
                "loadRoom":3,
                "fileName":"jungle2.swf"
            });
            _arg_1.executeNextCommand();
        }

        public function addInventoryItem():*
        {
        }

        public function roomObjClicked(_arg_1:*):*
        {
        }

        public function getStartPos(_arg_1:*):*
        {
            return (new Point(this.thisref.startpos1.x, this.thisref.startpos1.y));
        }

        private function checkIfEgosHome():*
        {
            if (((this.roomSFSobj.getVariable("addr") == Number(this.thisref.stage.getChildAt(0).myHomeAddr)) && (this.rootref.currentTribe == this.rootref.myTribe)))
            {
                this.egosHome = true;
            }
            else
            {
                this.egosHome = false;
            };
        }

        public function scrollerEvent(_arg_1:*):*
        {
        }

        public function setupScrollers():*
        {
            this.rootref.mc_interface.scroller.enableScroller(0, 0);
        }

        public function sceneRevealed():*
        {
            this.setupScrollers();
        }

        public function gameObjectClosed():*
        {
        }

        public function gameRoomJoined(_arg_1:*):*
        {
            if (this.rootref.mc_scene.gameRef)
            {
                this.rootref.mc_scene.gameRef.joinRoom(_arg_1);
            };
        }

        public function joinRoom(_arg_1:*):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            var _local_11:*;
            var _local_12:*;
            var _local_13:*;
            this.roomSFSobj = _arg_1;
            this.checkIfEgosHome();
            var _local_2:* = _arg_1.getUserList();
            for (_local_3 in _local_2)
            {
                _local_5 = (_local_2[_local_3].getId() == this.rootref.sfs.myUserId);
                if (((!(_arg_1.getVariable("pvt") == true)) || (_local_5)))
                {
                    _local_6 = (getDefinitionByName("com.cocolani.Avatar") as Class);
                    _local_7 = addChild(new _local_6(_local_2[_local_3], this.thisref, _local_5));
                    this.avlist.push(_local_7);
                    _local_8 = new Object();
                    if (_local_5)
                    {
                        this.egoref = _local_7;
                        _local_7.initStartPos(this.getStartPos(_local_2[_local_3]));
                        _local_8.y = _local_7.y;
                        this.getPlayerSceneEntryInstructions(_local_7);
                    }
                    else
                    {
                        if (_local_2[_local_3].getVariable("ps"))
                        {
                            _local_9 = _local_2[_local_3].getVariable("ps").split(",");
                            _local_7.initStartPos(new Point(Number(_local_9[0]), Number(_local_9[1])), Number(_local_9[2]));
                        }
                        else
                        {
                            _local_10 = this.getStartPos(_local_2[_local_3]);
                            _local_9 = [_local_10.x, _local_10.y, 0];
                            _local_7.initStartPos(new Point(Number(_local_9[0]), Number(_local_9[1])), Number(_local_9[2]));
                            this.getPlayerSceneEntryInstructions(_local_7);
                        };
                        if (((!(_local_2[_local_3].getVariable("stob") == undefined)) && (!(_local_2[_local_3].getVariable("stsid") == -1))))
                        {
                            _local_11 = 0;
                            while (_local_11 < this.ObjCat.length)
                            {
                                if ((this.ObjCat[_local_11].ref is com.cocolani.sceneObjectSit))
                                {
                                    if (this.ObjCat[_local_11].ref.seatID == _local_2[_local_3].getVariable("stob"))
                                    {
                                        this.avatarSit(_local_7, this.ObjCat[_local_11].ref, _local_2[_local_3].getVariable("stsid"));
                                    };
                                };
                                _local_11++;
                            };
                        };
                    };
                    _local_8.ref = _local_7;
                    _local_8.y = (_local_7.y + this.thisref.stage.getChildAt(0).sceneOffset[1]);
                    _local_8.isAV = true;
                    this.ObjCat.push(_local_8);
                };
            };
            _local_4 = String(this.roomSFSobj.getVariable("frn")).split("|");
            if (_local_4 != "")
            {
                if (_local_4 != "undefined")
                {
                    for (_local_3 in _local_4)
                    {
                        _local_12 = _local_4[_local_3].split(",");
                        if (this.checkClassExist(("obj" + _local_12[1])))
                        {
                            this.addSceneObj(_local_12);
                        }
                        else
                        {
                            this.preloadList.push(_local_12);
                        };
                    };
                };
            };
            if (this.preloadList.length == 0)
            {
                this.setlayers();
                this.joinRoomOverride();
            }
            else
            {
                this.rootref.mc_scene.setPreloaderMessage(this.rootref.langObj.getText("hom30"));
                _local_13 = [];
                for (_local_3 in this.preloadList)
                {
                    _local_13.push((("obj" + this.preloadList[_local_3][1]) + ".swf"));
                };
                this.rootref.resourceloader.addResources(_local_13, "obj");
                this.rootref.resourceloader.addEventListener(resourceLoader.FILE_FIN, this.onLoadResourceLoading);
                this.rootref.resourceloader.addEventListener(resourceLoader.LOADING_FIN, this.onDoneLoadResourceLoading);
            };
        }

        private function sceneObjClick(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            if (!this.rootref.cursorRef)
            {
                if (this.selectedItem)
                {
                    this.unselectSelected();
                };
                _local_2 = false;
                _local_3 = _arg_1.target.parent.parent.parent;
                while (_local_3.parent)
                {
                    try
                    {
                        if (_local_3.avatarContainer)
                        {
                            _local_2 = true;
                            break;
                        };
                    }
                    catch(e:Error)
                    {
                    };
                    _local_3 = _local_3.parent;
                };
                if (!_local_2)
                {
                    _local_4 = _arg_1.currentTarget.getoptions(this.thisref);
                    this.newOptions(_arg_1.currentTarget, _local_4);
                };
            };
        }

        public function rotateObj(_arg_1:MouseEvent):*
        {
            var _local_2:* = this.selectedItem.mydata;
            var _local_3:* = _local_2[4];
            if (_arg_1.currentTarget.id == 1)
            {
                _local_3++;
                if (_local_3 > 8)
                {
                    _local_3 = 1;
                };
            }
            else
            {
                _local_3--;
                if (_local_3 < 1)
                {
                    _local_3 = 8;
                };
            };
            _local_2[4] = _local_3;
            var _local_4:* = new Object();
            _local_4.ext = "home";
            _local_4.cmd = "edt";
            _local_4.data = String(_local_2);
            this.rootref.sendXTmessage(_local_4);
        }

        public function commonSceneObjClick(_arg_1:*, _arg_2:Number):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            this.hideOptions();
            if (_arg_1.handlesOptions)
            {
                _arg_1.commonSceneObjClick(_arg_2);
                return;
            };
            if (_arg_2 == 4)
            {
                if (this.selectedItem)
                {
                    this.unselectSelected();
                };
                this.selectedItem = _arg_1;
                this.selectedItem.filters = [this.selectFilter];
                this.selectedItem.addEventListener(MouseEvent.ROLL_OUT, this.dragSceneObj);
                if (this.selectedItem.canRotate)
                {
                    _local_3 = getDefinitionByName("bt_rotate_cl");
                    this.arrow_cw = this.rootref.mc_scene.foreElements.addChild(new (_local_3)());
                    _local_3 = getDefinitionByName("bt_rotate_ac");
                    this.arrow_ac = this.rootref.mc_scene.foreElements.addChild(new (_local_3)());
                    this.alignrotate(this.selectedItem);
                    this.arrow_cw.id = 0;
                    this.arrow_ac.id = 1;
                    this.arrow_ac.addEventListener(MouseEvent.CLICK, this.rotateObj);
                    this.arrow_cw.addEventListener(MouseEvent.CLICK, this.rotateObj);
                };
            }
            else
            {
                if (_arg_2 == 6)
                {
                    if (_arg_1.checkIfEmpty())
                    {
                        _local_4 = {};
                        _local_4.ext = "home";
                        _local_4.cmd = "get";
                        _local_4.fid = _arg_1.mydata[0];
                        this.rootref.sendXTmessage(_local_4);
                    }
                    else
                    {
                        this.rootref.showmsg(this.rootref.langObj.getText("com11"));
                    };
                }
                else
                {
                    if (_arg_2 == 7)
                    {
                        if (_arg_1.handlesSeating)
                        {
                            _arg_1.commonSceneObjClick(_arg_2);
                            return;
                        };
                        _local_5 = _arg_1.getSpareSeat();
                        if (_local_5.length > 0)
                        {
                            this.avatarSit(this.egoref, _arg_1, _local_5[0]);
                            _local_6 = {};
                            _local_6.stob = _arg_1.mydata[0];
                            _local_6.stsid = _local_5[0];
                            this.rootref.sendXTmessage({
                                "ext":"nav",
                                "cmd":"sit",
                                "t":_local_6
                            }, 1);
                            _arg_1.setInteractiveChildren();
                        }
                        else
                        {
                            this.rootref.showmsg(this.rootref.langObj.getText("com10"));
                        };
                    }
                    else
                    {
                        if (_arg_2 == 8)
                        {
                            this.avatarStand(this.egoref, _arg_1);
                            _local_6 = {};
                            _local_6.stob = undefined;
                            _local_6.stsid = undefined;
                            this.rootref.sendXTmessage({
                                "ext":"nav",
                                "cmd":"sit",
                                "t":_local_6
                            }, 1);
                            _arg_1.setInteractiveChildren();
                        }
                        else
                        {
                            this.unselectSelected();
                        };
                    };
                };
            };
        }

        private function unselectSelected():*
        {
            if (this.selectedItem)
            {
                this.selectedItem.removeEventListener(MouseEvent.ROLL_OUT, this.dragSceneObj);
                this.selectedItem.filters = [];
                this.selectedItem = undefined;
            };
        }

        private function dragSceneObj(_arg_1:MouseEvent):*
        {
            if (((_arg_1.buttonDown) && (!(this.rootref.cursorRef))))
            {
                _arg_1.currentTarget.alpha = 0;
                if (_arg_1.currentTarget.canRotate)
                {
                    this.arrow_ac.visible = false;
                    this.arrow_cw.visible = false;
                };
                this.rootref.mc_interface.playerPopupRef.inventoryContainer.addCursor(_arg_1.currentTarget.mydata, "SCENEINV");
                this.selectedItem.removeEventListener(MouseEvent.ROLL_OUT, this.dragSceneObj);
                this.selectedItem.removeEventListener(MouseEvent.CLICK, this.sceneObjClick);
                this.thisref.collide1.removeChild(this.selectedItem.col);
            };
        }

        public function resetEdit():*
        {
            this.selectedItem.alpha = 1;
            this.selectedItem.addEventListener(MouseEvent.ROLL_OUT, this.dragSceneObj);
            this.selectedItem.addEventListener(MouseEvent.CLICK, this.sceneObjClick);
            this.thisref.collide1.addChild(this.selectedItem.col);
            if (this.selectedItem.canRotate)
            {
                this.arrow_ac.visible = true;
                this.arrow_cw.visible = true;
            };
        }

        public function cancelEdit():*
        {
            if (this.selectedItem)
            {
                this.selectedItem.alpha = 1;
                this.selectedItem.filters = [];
                this.selectedItem = undefined;
            };
            this.hideOptions();
        }

        public function checkPermEditObj():*
        {
            return (true);
        }

        public function addSceneObj(_arg_1:Array):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            if (this.checkClassExist(("obj" + _arg_1[1])))
            {
                _local_2 = new Object();
                _local_3 = getDefinitionByName(("obj" + _arg_1[1]));
                _local_2.ref = addChild(new (_local_3)());
                _local_2.ref.x = (_arg_1[2] - _local_2.ref.offsetStandard[0]);
                _local_2.ref.y = (_arg_1[3] - _local_2.ref.offsetStandard[1]);
                _local_2.ref.myID = _arg_1[0];
                _local_2.y = _local_2.ref.y;
                _local_2.ref.setdir(_arg_1[4]);
                _local_2.ref.setdata(_arg_1);
                _local_2.id = _arg_1[0];
                _local_2.subtype = _arg_1[5];
                _local_4 = _local_2.ref.getoptions(this.thisref);
                if (((_local_4.length == 1) && (_local_4[0].id == 5)))
                {
                    _local_2.ref.buttonMode = false;
                    _local_2.ref.mouseEnabled = false;
                    _local_2.ref.mouseChildren = false;
                }
                else
                {
                    _local_2.ref.addEventListener(MouseEvent.CLICK, this.sceneObjClick);
                };
                _local_3 = getDefinitionByName((("obj" + _arg_1[1]) + "_col"));
                _local_2.col = this.thisref.collide1.addChild(new (_local_3)());
                _local_5 = this.thisref.collide1.globalToLocal(this.thisref.localToGlobal(new Point(_arg_1[2], _arg_1[3])));
                _local_2.col.x = (_local_5.x - _local_2.ref.offsetStandard[0]);
                _local_2.col.y = (_local_5.y - _local_2.ref.offsetStandard[1]);
                _local_2.col.gotoAndStop(("dir" + _arg_1[4]));
                _local_2.ref.mydata = _arg_1;
                _local_2.ref.col = _local_2.col;
                _local_2.isAV = false;
                this.ObjCat.push(_local_2);
                for (_local_6 in this.avlist)
                {
                    if (this.avlist[_local_6].sfsAV.getVariable("stob") == _arg_1[0])
                    {
                        this.avatarSit(this.avlist[_local_6], _local_2.ref, this.avlist[_local_6].sfsAV.getVariable("stsid"));
                    };
                };
            }
            else
            {
                this.preloadList.push(_arg_1);
                _local_7 = [];
                _local_7.push((("obj" + _arg_1[1]) + ".swf"));
                this.rootref.resourceloader.addResources(_local_7, "obj");
                this.rootref.resourceloader.addEventListener(resourceLoader.FILE_FIN, this.onLoadResourceLoading);
                this.rootref.resourceloader.addEventListener(resourceLoader.LOADING_FIN, this.onDoneLoadResourceLoading);
            };
        }

        public function setSceneObjY(_arg_1:*):*
        {
            var _local_2:*;
            for (_local_2 in this.ObjCat)
            {
                if (((this.ObjCat[_local_2].id) && (this.ObjCat[_local_2].id == _arg_1)))
                {
                    this.ObjCat[_local_2].y = this.ObjCat[_local_2].ref.myY;
                };
            };
            this.setlayers();
        }

        private function onLoadResourceLoading(_arg_1:Event):*
        {
            var _local_2:* = 0;
            while (_local_2 < this.preloadList.length)
            {
                if (this.checkClassExist(("obj" + this.preloadList[_local_2][1])))
                {
                    this.addSceneObj(this.preloadList[_local_2]);
                    this.preloadList.splice(_local_2, 1);
                    _local_2--;
                };
                _local_2++;
            };
        }

        private function onDoneLoadResourceLoading(_arg_1:Event):*
        {
            var _local_2:* = 0;
            while (_local_2 < this.preloadList.length)
            {
                if (this.checkClassExist(("obj" + this.preloadList[_local_2][1])))
                {
                    this.addSceneObj(this.preloadList[_local_2]);
                    this.preloadList.splice(_local_2, 1);
                    _local_2--;
                };
                _local_2++;
            };
            this.setlayers();
            this.joinRoomOverride();
            if (this.preloadList.length == 0)
            {
                this.resetNodes();
            };
        }

        public function get isReady():*
        {
            return (this.isRoomReady);
        }

        public function autoPreloadItems(_arg_1:Array, _arg_2:*=null):*
        {
            this.isRoomReady = false;
            this.PreloadfnToCall = _arg_2;
            this.preloadItemList = _arg_1;
            var _local_3:* = [];
            var _local_4:* = "lang";
            var _local_5:* = 0;
            while (_local_5 < this.preloadItemList.length)
            {
                if (this.checkClassExist(this.preloadItemList[_local_5].cls))
                {
                    this.preloadItemList.splice(_local_5, 1);
                    _local_5--;
                }
                else
                {
                    _local_3.push(this.preloadItemList[_local_5].resource);
                    _local_4 = this.preloadItemList[_local_5].type;
                };
                _local_5++;
            };
            if (this.preloadItemList.length > 0)
            {
                this.preload(_local_3, _local_4);
            }
            else
            {
                this.isRoomReady = true;
                if (this.PreloadfnToCall)
                {
                    this.PreloadfnToCall();
                };
                this.rootref.mc_scene.sceneReady();
            };
        }

        public function initializePathFinder():*
        {
            this.pathFinderRef = new pathFinder(this.thisref);
        }

        public function preload(_arg_1:*, _arg_2:*="lang"):*
        {
            this.rootref.resourceloader.addResources(_arg_1, _arg_2);
            this.rootref.resourceloader.addEventListener(resourceLoader.UPDATE_LOADER, this.onUPDATE_LOADER);
            this.rootref.resourceloader.addEventListener(resourceLoader.LOADING_FIN, this.onLOADING_FIN);
        }

        private function onUPDATE_LOADER(_arg_1:ProgressEvent):*
        {
            if (this.rootref.mc_scene)
            {
                this.rootref.mc_scene.setPreloaderAttrib({
                    "type":"updatePerc",
                    "perc":Math.round(((_arg_1.bytesLoaded / _arg_1.bytesTotal) * 100))
                });
            };
        }

        private function onLOADING_FIN(_arg_1:Event):*
        {
            this.rootref.resourceloader.removeEventListener(resourceLoader.UPDATE_LOADER, this.onUPDATE_LOADER);
            this.rootref.resourceloader.removeEventListener(resourceLoader.LOADING_FIN, this.onLOADING_FIN);
            this.onLOADING_FIN_Override();
        }

        public function onLOADING_FIN_Override():*
        {
            this.isRoomReady = true;
            if (this.preloadItemList.length > 0)
            {
                this.preloadItemList = [];
                this.PreloadfnToCall();
            };
            this.rootref.mc_scene.sceneReady();
        }

        public function joinRoomOverride():*
        {
        }

        public function roomVarUpdate(_arg_1:*):*
        {
            this.roomVarUpdateOverride(_arg_1);
        }

        public function privateSpeech(_arg_1:*):*
        {
            if (_arg_1.length > 0)
            {
                this.thisref.stage.getChildAt(0).sfs.sendPublicMessage(_arg_1, -1);
            };
        }

        public function objectReceived(_arg_1:*, _arg_2:*):*
        {
            var _local_3:*;
            var _local_4:*;
            if (_arg_1.cmd == "avCmd")
            {
                for (_local_3 in this.avlist)
                {
                    if (this.avlist[_local_3].sfsAV.getId() == _arg_2.getId())
                    {
                        _local_4 = new tools();
                        this.avlist[_local_3].commandList = _local_4.convertArrToPoint(_arg_1.commands);
                        this.avlist[_local_3].executeNextCommand();
                    };
                };
            }
            else
            {
                if (_arg_1.cmd == "furnReq")
                {
                    _local_3 = 0;
                    while (_local_3 < this.ObjCat.length)
                    {
                        if (this.ObjCat[_local_3].id == _arg_1.id)
                        {
                            this.ObjCat[_local_3].ref.objectReceived(_arg_1, _arg_2);
                        };
                        _local_3++;
                    };
                };
            };
            this.objectReceivedExtra(_arg_1, _arg_2);
        }

        public function objectReceivedExtra(_arg_1:*, _arg_2:*):*
        {
        }

        public function userAction(_arg_1:*):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            for (_local_2 in this.avlist)
            {
                if (this.avlist[_local_2].sfsAV.getId() == Number(_arg_1.usr))
                {
                    if (_arg_1.ps)
                    {
                        _local_3 = _arg_1.ps.split(",");
                        _local_4 = new Point(_local_3[0], _local_3[1]);
                        this.avlist[_local_2].setpos(_local_4);
                    };
                    this.avlist[_local_2].doaction(_arg_1.act);
                };
            };
        }

        public function usermessage(_arg_1:*, _arg_2:*, _arg_3:*):*
        {
            var _local_4:*;
            for (_local_4 in this.avlist)
            {
                if (this.avlist[_local_4].sfsAV.getId() == _arg_2.getId())
                {
                    this.avlist[_local_4].usermessage(_arg_1);
                };
            };
        }

        public function userjoinroom(_arg_1:*, _arg_2:*):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            if (this.roomSFSobj.getVariable("pvt") != true)
            {
                _local_3 = (getDefinitionByName("com.cocolani.Avatar") as Class);
                _local_4 = addChild(new _local_3(_arg_1, this.thisref, false));
                this.avlist.push(_local_4);
                _local_4.initStartPos(this.getStartPos(_arg_1));
                this.getPlayerSceneEntryInstructions(_local_4);
                _local_5 = new Object();
                _local_5.ref = _local_4;
                _local_5.y = _local_4.y;
                _local_5.isAV = true;
                this.ObjCat.push(_local_5);
                this.setlayers();
            };
        }

        public function userleaveroom(sfsUsrId:*, roomId:*, username:*):*
        {
            var i:* = undefined;
            for (i in this.ObjCat)
            {
                if (((this.ObjCat[i].isAV) && (this.ObjCat[i].ref.sfsAV.getId() == sfsUsrId)))
                {
                    this.userleaveRoomOverride(this.ObjCat[i].ref);
                    this.ObjCat.splice(i, 1);
                    break;
                };
            };
            for (i in this.avlist)
            {
                if (this.avlist[i].sfsAV.getId() == sfsUsrId)
                {
                    this.avlist[i].resetCommands();
                    this.avlist[i].poofMe();
                    if (this.avlist[i].isSitting)
                    {
                        try
                        {
                            if (this.avlist[i].parent.releaseAV)
                            {
                                this.avlist[i].parent.releaseAV(this.avlist[i]);
                            };
                            if (this.avlist[i].parent.parent.releaseAV)
                            {
                                this.avlist[i].parent.parent.releaseAV(this.avlist[i]);
                            };
                        }
                        catch(e)
                        {
                            if (rootref.statusType > 5)
                            {
                                rootref.showmsg(("Error leaving seat, can't find parent to tell it to make seat available. Error info: " + e));
                            };
                        };
                    };
                    this.avlist.splice(i, 1);
                    break;
                };
            };
        }

        public function userleaveRoomOverride(_arg_1:*):*
        {
        }

        public function uservarupdate_override(_arg_1:*, _arg_2:*):*
        {
            return (true);
        }

        public function uservarupdate(_arg_1:*, _arg_2:*):*
        {
            var _local_3:Array;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            if (((_arg_1) && (_arg_2)))
            {
                _local_3 = _arg_2;
                if (!this.uservarupdate_override(_arg_1, _arg_2))
                {
                    return;
                };
                for (_local_4 in this.avlist)
                {
                    if (((this.avlist[_local_4]) && (this.avlist[_local_4].sfsAV.getId() == _arg_1.getId())))
                    {
                        if (_local_3["clth"])
                        {
                            this.avlist[_local_4].setoutfit();
                        };
                        if (_local_3["stob"])
                        {
                            if (_arg_1.getVariable("stob") != undefined)
                            {
                                _local_5 = 0;
                                while (_local_5 < this.ObjCat.length)
                                {
                                    if (((this.ObjCat[_local_5].ref is com.cocolani.sceneObjectSit) || (this.ObjCat[_local_5].ref is com.cocolani.obj.sceneObjectSit)))
                                    {
                                        if (this.ObjCat[_local_5].ref.seatID == _arg_1.getVariable("stob"))
                                        {
                                            this.avatarSit(this.avlist[_local_4], this.ObjCat[_local_5].ref, _arg_1.getVariable("stsid"));
                                        };
                                    };
                                    if ((this.ObjCat[_local_5].ref is furnItem))
                                    {
                                        if (this.ObjCat[_local_5].ref.mydata[0] == _arg_1.getVariable("stob"))
                                        {
                                            this.avatarSit(this.avlist[_local_4], this.ObjCat[_local_5].ref, _arg_1.getVariable("stsid"));
                                        };
                                    };
                                    _local_5++;
                                };
                            }
                            else
                            {
                                this.avatarStand(this.avlist[_local_4], this.avlist[_local_4].parent.parent);
                            };
                        };
                        if (this.avlist[_local_4].ego)
                        {
                            return;
                        };
                        if (_local_3["cld"])
                        {
                            this.avlist[_local_4].monitorActive = _arg_1.getVariable("cld");
                        };
                        if (_local_3["ps"])
                        {
                            _local_6 = _arg_1.getVariable("ps").split(",");
                            this.avlist[_local_4].initStartPos(new Point(_local_6[0], _local_6[1]));
                        };
                        if (_local_3["dst"])
                        {
                            _local_7 = _arg_1.getVariable("dst").split(",");
                            if (_arg_1.getVariable("pth") == true)
                            {
                                this.setAVPath(this.avlist[_local_4], new Point(_local_7[0], _local_7[1]));
                            }
                            else
                            {
                                this.avlist[_local_4].walkto(new Point(_local_7[0], _local_7[1]));
                            };
                        };
                        break;
                    };
                };
            };
        }

        private function setAVPath(_arg_1:*, _arg_2:Point):*
        {
            var _local_5:*;
            var _local_3:* = this.pathFinderRef.walkAV(_arg_2, _arg_1);
            var _local_4:* = [];
            if (((_arg_1.userHasControl) || (_arg_1.ego == false)))
            {
                _arg_1.commandList = [];
                for (_local_5 in _local_3)
                {
                    if (_local_5 == 0)
                    {
                        _local_4.push({
                            "walkto":new Point(_local_3[_local_5].x, _local_3[_local_5].y),
                            "sendupdate":true,
                            "setUserControl":true,
                            "setListener":false,
                            "pathFinder":true
                        });
                    }
                    else
                    {
                        _local_4.push({
                            "walkto":new Point(_local_3[_local_5].x, _local_3[_local_5].y),
                            "sendupdate":true,
                            "setUserControl":true,
                            "setListener":true
                        });
                    };
                };
                _arg_1.commandList = _local_4;
                _arg_1.executeNextCommand();
            };
        }

        public function walkAV(_arg_1:*):*
        {
            if (((this.pathFinding == true) && (this.egoref)))
            {
                this.setAVPath(this.egoref, _arg_1);
            }
            else
            {
                this.egoref.walkego(_arg_1, true);
            };
            if (this.selectedItem)
            {
                this.unselectSelected();
            };
            this.hideOptions();
            this.cancelEdit();
        }

        public function playRewardSound():*
        {
            this.rootref.mc_interface.audio.playSound("sfx_triumph");
        }

        public function shutdown():*
        {
            this.shutdown_override();
            this.rootref.mc_interface.hidePanel("storePanel");
            this.rootref.mc_interface.scroller.disableScroller();
            this.rootref.resourceloader.removeEventListener(resourceLoader.FILE_FIN, this.onLoadResourceLoading);
            this.rootref.resourceloader.removeEventListener(resourceLoader.LOADING_FIN, this.onDoneLoadResourceLoading);
            var _local_1:* = 0;
            while (_local_1 < this.avlist.length)
            {
                this.avlist[_local_1].charexit();
                _local_1++;
            };
            this.avlist = [];
            if (this.rootref.cursorRef)
            {
                this.rootref.mc_interface.playerPopupRef.inventoryContainer.deleteCursor();
            };
            if (this.selectedItem)
            {
                this.unselectSelected();
            };
            this.trashChildren(this.thisref);
            this.trashed = true;
            this.hideOptions();
        }

        public function trashChildren(_arg_1:*):*
        {
            var _local_2:* = 0;
            while (_arg_1.numChildren > 0)
            {
                _local_2++;
                if (_local_2 > 500) break;
                if ((_arg_1.getChildAt(0) is MovieClip))
                {
                    _arg_1.getChildAt(0).stop();
                };
                if ((_arg_1.getChildAt(0) is DisplayObjectContainer))
                {
                    this.trashChildren(_arg_1.getChildAt(0));
                };
                _arg_1.removeChildAt(0);
            };
        }

        public function shutdown_override():*
        {
        }

        public function checkClassExist(className:String):*
        {
            var classref:* = undefined;
            try
            {
                classref = getDefinitionByName(className);
                return (true);
            }
            catch(e:Error)
            {
                return (false);
            };
        }


    }
}//package com.cocolani.scenes

//------------------------------------------------------------
//com.cocolani.cocolani

package com.cocolani
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import com.cocolani.lang.Language;
    import it.gotoandplay.smartfoxserver.SmartFoxClient;
    import com.cocolani.gui.buddyListController;
    import flash.net.LocalConnection;
    import com.cocolani.scenes.scene;
    import com.cocolani.obj.furnItem;
    import com.cocolani.obj.furn_wallItem;
    import com.cocolani.gui.ASCIIcontext;
    import flash.utils.Timer;
    import flash.system.Security;
    import flash.display.LoaderInfo;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import it.gotoandplay.smartfoxserver.SFSEvent;
    import flash.events.ProgressEvent;
    import flash.utils.getDefinitionByName;
    import flash.events.TimerEvent;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import com.greensock.TweenLite;
    import flash.utils.ByteArray;
    import flash.display.DisplayObjectContainer;
    import it.gotoandplay.smartfoxserver.*;
    import fl.transitions.easing.*;

    public class cocolani extends MovieClip 
    {

        internal static var startRoom:* = "jungle_village.swf";
        internal static var startRoomId:* = 8;
        internal static var startConfigs:* = [{"name":"Jungle Bridge"}, {"name":"Volcano Bridge"}];
        internal static var startAtHome:* = false;
        internal static var startInsideHome:* = false;
        internal static var gotoPreviousRoom:* = false;
        internal static var lastLoginRm:* = -1;

        public var mc_scene:sceneloader;
        public var debug:TextField;
        public var login:signin;
        public var langObj:* = new com.cocolani.lang.Language();
        public var sceneLists:*;
        public var zoneSelectorRqd:Boolean = false;
        public var customLogin:Boolean = false;
        public var connLimits:* = 1;
        public var hasJoinedRoom:* = false;
        public var hasJoinedScene:* = false;
        public var myTribe:* = -1;
        public var currentTribe:* = 1;
        public var previousTribe:* = -1;
        public var statusType:* = 0;
        public var targetRoomID:* = 0;
        public var myHomeAddr:* = -1;
        public var myHomeID:* = -1;
        public var invVars:Array;
        public var pzlVars:Array;
        public var prvpzlVars:*;
        public var myIPAddress:*;
        public var loadedAVData:*;
        public var FID:*;
        public var FAccessToken:* = null;
        public var FBVerified:* = false;
        public var FBPaymentCat:* = 0;
        public var isDebug:* = false;
        public var limitZoneFeed:* = true;
        public var sessionMemory:*;
        public var usertypes:* = "";
        public var MOTD:*;
        public var sfs:SmartFoxClient;
        public var intro:MovieClip;
        public var mc_interface:*;
        public var cursorRef:*;
        public var levelThreshold:*;
        private var contextSetting:*;
        public var buddylistControl:buddyListController;
        public var DBURL:* = "http://localhost/cocolani/php/req/";
        public var ip:* = "127.0.0.1";
        public var sfsPort:* = "9339";
        public var swfURL:* = "swf/";
        public var baseURL:* = "";
        public var rootURL:* = "";
        public var zoneName:* = "cocolani";
        public var custID:* = 0;
        public var appID:* = "308987892500579";
        public var key:*;
        public var connectionCheck:LocalConnection;
        public var isConnectionOwner:* = true;
        public var stageRatio:*;
        public var stageScale:*;
        public var sceneOffset:*;
        internal var thisref:*;
        internal var initialized:* = false;
        internal var initGUI:* = false;
        internal var initialResourceLoad:* = false;
        public var loginAfterConnect:* = false;
        internal var loggingin:* = true;
        internal var sceneinit:scene;
        internal var sceneObjBase:sceneObject;
        internal var sceneobj:sceneInteractive;
        internal var afurnItem:furnItem;
        internal var awallItem:furn_wallItem;
        public var tribeAudioLoaded:*;
        public var shuttingDown:* = false;
        internal var walking:Boolean = false;
        internal var msgWindow:*;
        public var popupWindows:*;
        public var preloadedObjects:*;
        internal var preloaderRef:*;
        public var resourceloader:*;
        public var reconnectTimer:*;
        public var mailcost:* = 1;
        public var tribeData:*;
        public var banmessage:* = "You where banned by a moderator because: ";
        public var SRPaymentEnabled:* = 1;

        public function cocolani()
        {
            this.sceneLists = new sceneListings(this);
            this.sessionMemory = {};
            this.levelThreshold = [];
            this.contextSetting = new ASCIIcontext(this);
            this.stageRatio = [];
            this.stageScale = [925, 600];
            this.sceneOffset = [];
            this.thisref = this;
            this.tribeAudioLoaded = [2];
            this.popupWindows = new Array();
            this.preloadedObjects = new Array();
            this.reconnectTimer = new Timer(15000);
            this.tribeData = [{
                "id":1,
                "name":"Yeknom"
            }, {
                "id":2,
                "name":"Hu Hu Hlua"
            }];
            super();
            addFrameScript(2, this.frame3);
            Security.allowDomain("superrewards-offers.com");
            Security.allowDomain("dev.cocolani.com");
            this.stageRatio[0] = (this.stageScale[0] / stage.stageWidth);
            this.stageRatio[1] = (this.stageScale[1] / stage.stageHeight);
            if (LoaderInfo(stage.loaderInfo).parameters["ip"])
            {
                this.ip = LoaderInfo(stage.loaderInfo).parameters["ip"];
                this.DBURL = LoaderInfo(stage.loaderInfo).parameters["regurl"];
                this.custID = Number(LoaderInfo(stage.loaderInfo).parameters["cid"]);
            };
            if (LoaderInfo(stage.loaderInfo).parameters["port"])
            {
                this.sfsPort = LoaderInfo(stage.loaderInfo).parameters["port"];
            };
            if (LoaderInfo(stage.loaderInfo).parameters["lang"])
            {
                this.langObj.selectedLang = Number(LoaderInfo(stage.loaderInfo).parameters["lang"]);
            };
            if (LoaderInfo(stage.loaderInfo).parameters["swfURL"])
            {
                this.swfURL = LoaderInfo(stage.loaderInfo).parameters["swfURL"];
            };
            if (LoaderInfo(stage.loaderInfo).parameters["baseURL"])
            {
                this.baseURL = ((LoaderInfo(stage.loaderInfo).parameters["baseURL"] + "/") + this.swfURL);
                this.rootURL = (LoaderInfo(stage.loaderInfo).parameters["baseURL"] + "/");
            }
            else
            {
                this.rootURL = this.baseURL;
                this.baseURL = (this.baseURL + this.swfURL);
            };
            if (LoaderInfo(stage.loaderInfo).parameters["zone"])
            {
                this.zoneName = LoaderInfo(stage.loaderInfo).parameters["zone"];
            };
            if (LoaderInfo(stage.loaderInfo).parameters["zn"])
            {
                this.zoneSelectorRqd = (LoaderInfo(stage.loaderInfo).parameters["zn"] == "1");
            };
            if (LoaderInfo(stage.loaderInfo).parameters["fid"])
            {
                this.FID = LoaderInfo(stage.loaderInfo).parameters["fid"];
            };
            if (LoaderInfo(stage.loaderInfo).parameters["awrd"])
            {
                this.FBPaymentCat = LoaderInfo(stage.loaderInfo).parameters["awrd"];
            };
            if (LoaderInfo(stage.loaderInfo).parameters["lmtZn"])
            {
                this.limitZoneFeed = LoaderInfo(stage.loaderInfo).parameters["lmtZn"];
            };
            if (LoaderInfo(stage.loaderInfo).parameters["SRon"])
            {
                this.SRPaymentEnabled = LoaderInfo(stage.loaderInfo).parameters["SRon"];
            };
            var resources:* = [];
            this.resourceloader = new resourceLoader(resources, "", this);
            this.resourceloader.addEventListener(resourceLoader.UPDATE_LOADER, this.onLoadResourceLoading);
            this.resourceloader.addEventListener(resourceLoader.LOADING_FIN, this.onLoadResourceDone);
            try
            {
                if (LoaderInfo(stage.loaderInfo).parameters["connLimit"] == "1")
                {
                    this.connectionCheck = new LocalConnection();
                    this.connectionCheck.connect("CocolaniConnection");
                };
                this.connLimits = Number(LoaderInfo(stage.loaderInfo).parameters["connLimit"]);
            }
            catch(e:Error)
            {
                isConnectionOwner = false;
            };
            addEventListener(Event.REMOVED_FROM_STAGE, this.CloseConnection);
        }

        public function verifyFBSession(_arg_1:Object, _arg_2:Object):*
        {
            if (_arg_1)
            {
                this.FBVerified = true;
                if (this.loginAfterConnect)
                {
                    this.login.actionComplete(3);
                };
            }
            else
            {
                ExternalInterface.call("feedback", ("Facebook verification failed: " + _arg_2["error"]));
                this.destroyInstance();
                this.FBVerified = false;
            };
        }

        public function checkFB():*
        {
            this.FBVerified = true;
            if (this.loginAfterConnect)
            {
                this.login.actionComplete(3);
            };
        }

        private function testthisoneout(_arg_1:*=null):*
        {
            trace("HIDE FLASH CALL BACK SUCCESS.");
        }

        public function initMain():*
        {
            if (this.isConnectionOwner)
            {
                this.sceneOffset[0] = this.mc_scene.x;
                this.sceneOffset[1] = this.mc_scene.y;
                this.sfs = new SmartFoxClient(true);
                this.sfs.smartConnect = true;
                this.sfs.addEventListener(SFSEvent.onAdminMessage, this.onsfsAdminevent);
                this.sfs.addEventListener(SFSEvent.onObjectReceived, this.onObjectReceivedHandler);
                this.sfs.addEventListener(SFSEvent.onConnectionLost, this.onConnectionLostHandler);
                this.sfs.addEventListener(SFSEvent.onConnection, this.onConnectionHandler);
                this.sfs.addEventListener(SFSEvent.onExtensionResponse, this.onExtensionResponseHandler);
                this.sfs.addEventListener(SFSEvent.onJoinRoom, this.onJoinRoom);
                this.sfs.addEventListener(SFSEvent.onJoinRoomError, this.onJoinRoomError);
                this.sfs.addEventListener(SFSEvent.onLogin, this.onLoginHandler);
                this.sfs.addEventListener(SFSEvent.onModeratorMessage, this.onsfsModeratorevent);
                this.sfs.addEventListener(SFSEvent.onPublicMessage, this.onPublicMessageHandler);
                this.sfs.addEventListener(SFSEvent.onRandomKey, this.onRandomKeyHandler);
                this.sfs.addEventListener(SFSEvent.onRoomAdded, this.onRoomAddedHandler);
                this.sfs.addEventListener(SFSEvent.onRoomDeleted, this.onRoomDeletedHandler);
                this.sfs.addEventListener(SFSEvent.onRoomListUpdate, this.onRoomListupd);
                this.sfs.addEventListener(SFSEvent.onRoomVariablesUpdate, this.onRoomVariablesUpdate);
                this.sfs.addEventListener(SFSEvent.onUserCountChange, this.onUserCountChange);
                this.sfs.addEventListener(SFSEvent.onUserEnterRoom, this.onUserEnterRoom);
                this.sfs.addEventListener(SFSEvent.onUserLeaveRoom, this.onUserLeaveRoom);
                this.sfs.addEventListener(SFSEvent.onUserVariablesUpdate, this.onUserVariablesUpdateHandler);
                this.sfs.addEventListener(SFSEvent.onLogout, this.onLogoutHandler);
                this.buddylistControl = new buddyListController(this.thisref);
            }
            else
            {
                this.showmsg(this.langObj.getText("err06"));
            };
            if (this.custID == 3)
            {
                this.newpopup((((this.baseURL + "cust/cust3_splash_l") + this.langObj.selectedLang) + ".swf"), "load", "cust3_splash", false, false, {
                    "nocentre":true,
                    "effect":["fadein"]
                });
            }
            else
            {
                if (this.custID == 1)
                {
                    this.newpopup((((this.baseURL + "cust/cust1_splash_l") + this.langObj.selectedLang) + ".swf"), "load", "cust1_splash", false, false, {
                        "nocentre":true,
                        "effect":["fadein"]
                    });
                };
            };
            if (this.FID)
            {
                if (LoaderInfo(stage.loaderInfo).parameters["fbToken"])
                {
                    this.FAccessToken = LoaderInfo(stage.loaderInfo).parameters["fbToken"];
                    this.appID = LoaderInfo(stage.loaderInfo).parameters["faid"];
                };
                this.checkFB();
            };
        }

        public function connectSFS():*
        {
            trace(((("Connecting to " + this.ip) + " on port : ") + this.sfsPort));
            this.sfs.connect(this.ip, this.sfsPort);
        }

        private function CloseConnection(_arg_1:Event):*
        {
            if (this.connectionCheck)
            {
                this.connectionCheck.close();
            };
        }

        private function onLoadResourceLoading(_arg_1:ProgressEvent):*
        {
            if (this.preloaderRef)
            {
                this.preloaderRef.percentagetxt.text = (Math.round(((_arg_1.bytesLoaded / _arg_1.bytesTotal) * 100)) + "%");
            };
        }

        private function onLoadResourceDone(_arg_1:Event):*
        {
            var _local_2:*;
            if (!this.initialResourceLoad)
            {
                this.resourceloader.removeEventListener(resourceLoader.LOADING_FIN, this.onLoadResourceDone);
                this.resourceloader.removeEventListener(resourceLoader.UPDATE_LOADER, this.onLoadResourceLoading);
                if (!this.mc_interface)
                {
                    _local_2 = getDefinitionByName("com.cocolani.gui.world_interface");
                    this.mc_interface = addChild(new (_local_2)());
                };
                this.initInterface();
                this.initialResourceLoad = true;
                this.initialized = true;
            };
            if (this.loggingin)
            {
                this.loggedinfn();
            };
        }

        private function onsfsAdminevent(_arg_1:SFSEvent):void
        {
            if (_arg_1.params.message.indexOf("#ERR") > -1)
            {
                this.showmsg(this.langObj.getErrMsg(_arg_1.params.message));
            }
            else
            {
                this.showmsg(_arg_1.params.message);
            };
            if (_arg_1.params.message.indexOf(this.banmessage) > -1)
            {
            };
        }

        private function logoutfunctions():*
        {
            try
            {
                this.mc_interface.logout(false);
            }
            catch(e)
            {
                trace(("Error closing interface " + e));
            };
            var i:* = 0;
            while (i < this.popupWindows.length)
            {
                trace(("Remove " + this.popupWindows[i]));
                this.popupWindows[i].parent.removeChild(this.popupWindows[i]);
                i++;
            };
            this.popupWindows = [];
            try
            {
                this.mc_scene.logout();
            }
            catch(e)
            {
                trace(("Error closing scene " + e));
            };
            if (((this.intro) && (getChildByName("intro"))))
            {
                this.thisref.removeChild(this.intro);
            };
            this.initialized = true;
            this.loggingin = true;
            this.hasJoinedRoom = false;
            this.hasJoinedScene = false;
            this.initGUI = true;
            this.login.visible = true;
            this.login.addChildAt(this.login.bgdContainer, 0);
            this.login.clearLogin();
            this.mc_interface.audio.fadeOut();
            if (((!(this.FID)) && (!(this.zoneSelectorRqd))))
            {
                this.login.enablelogin();
            }
            else
            {
                if (this.FID)
                {
                    this.login.openingAnim(5);
                    this.login.signinfn(true);
                }
                else
                {
                    if (this.custID < 3)
                    {
                        if (!this.zoneSelectorRqd)
                        {
                            this.login.openingAnim(5);
                            this.login.signinfn(true);
                        }
                        else
                        {
                            this.login.openingAnim(5);
                            this.login.actionComplete(3, 1);
                        };
                    };
                };
            };
            this.sfs.addEventListener(SFSEvent.onRoomListUpdate, this.onRoomListupd);
            this.shuttingDown = false;
            if (this.custID == 3)
            {
                this.login.visible = false;
                if (this.login.customLoginDetails)
                {
                    trace(("user = " + this.login.customLoginDetails.user));
                    this.login.username.text = this.login.customLoginDetails.user;
                    this.login.password.text = this.login.customLoginDetails.pass;
                };
                this.newpopup((((this.baseURL + "cust/cust3_splash_l") + this.langObj.selectedLang) + ".swf"), "load", "cust3_splash", false, false, {
                    "nocentre":true,
                    "effect":["fadein"]
                });
            };
        }

        private function onConnectionLostHandler(_arg_1:SFSEvent):void
        {
            this.shuttingDown = true;
            if (((this.mc_interface) && (!(this.loggingin))))
            {
                this.mc_interface.logout(false);
                this.logoutfunctions();
            };
        }

        private function onConnectionHandler(_arg_1:SFSEvent):void
        {
            if (_arg_1.params.success)
            {
                if (this.reconnectTimer.hasEventListener(TimerEvent.TIMER))
                {
                    this.reconnectTimer.removeEventListener(TimerEvent.TIMER, this.reconnectTimerListener);
                    this.reconnectTimer.stop();
                };
                if (this.custID >= 2)
                {
                    if (this.key == undefined)
                    {
                        this.sfs.getRandomKey();
                    }
                    else
                    {
                        this.login.quicklogin();
                    };
                }
                else
                {
                    if (this.key == undefined)
                    {
                        this.sfs.getRandomKey();
                    }
                    else
                    {
                        if (this.loginAfterConnect)
                        {
                            this.login.signinfn(true);
                        };
                    };
                    this.login.enablelogin();
                };
                if (this.sfs.getConnectionMode() == "http")
                {
                    this.showmsg(this.repText(this.langObj.getText("err01"), this.sfsPort));
                };
            }
            else
            {
                if (!this.reconnectTimer.hasEventListener(TimerEvent.TIMER))
                {
                    this.reconnectTimer.addEventListener(TimerEvent.TIMER, this.reconnectTimerListener);
                    this.reconnectTimer.stop();
                    this.reconnectTimer.start();
                };
            };
        }

        private function onExtensionResponseHandler(_arg_1:SFSEvent):void
        {
            var _local_3:Object;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_2:String = _arg_1.params.type;
            _local_3 = _arg_1.params.dataObj;
            if (_local_2 == "str")
            {
                _local_4 = this.mc_scene.sceneRef;
                if (_local_4)
                {
                    _local_4.extReply(_local_3, _local_2);
                };
            }
            else
            {
                if (_local_3.pzlupd)
                {
                    this.prvpzlVars = this.clone(this.pzlVars);
                    this.pzlVars = _local_3.pzlupd.split(",");
                };
                switch (_local_3._cmd)
                {
                    case "logKO":
                        if (_local_3.err.indexOf("#FUN") > -1)
                        {
                            this.login.miniRegisterSeq = true;
                            this.login.loginBeenSent = false;
                            if ((((this.custID == 3) && (this.login.username.length < 1)) && (this.login.password.length < 10)))
                            {
                                this.showmsg("Missing credentials error.");
                                return;
                            };
                            this.login.openingAnim(1);
                        }
                        else
                        {
                            _local_7 = this.langObj.getErrMsg(_local_3.err);
                            if (!_local_7)
                            {
                                _local_7 = _local_3.err;
                            };
                            this.showmsg(_local_7);
                            this.login.enablelogin();
                        };
                        return;
                    case "init":
                        this.buddylistControl.reset();
                        this.myTribe = Number(_local_3.tb);
                        this.myHomeAddr = Number(_local_3.had);
                        this.myHomeID = Number(_local_3.hid);
                        this.statusType = Number(_local_3.st);
                        this.usertypes = _local_3.mbr;
                        lastLoginRm = _local_3.prm;
                        this.previousTribe = _local_3.prtb;
                        if (((this.previousTribe) && (Number(this.previousTribe) > 0)))
                        {
                            this.currentTribe = this.previousTribe;
                        };
                        this.loadedAVData = _local_3;
                        this.MOTD = _local_3.motd;
                        this.invVars = _local_3.invars.split(",");
                        if (_local_3.pvars.length > 0)
                        {
                            this.pzlVars = _local_3.pvars.split(",");
                        }
                        else
                        {
                            this.pzlVars = [];
                        };
                        this.prvpzlVars = this.pzlVars;
                        this.levelThreshold = _local_3.lvl.split(",");
                        if (this.langObj.selectedLang != Number(_local_3.lang))
                        {
                            this.showmsg(this.langObj.getText("err04"));
                            this.langObj.selectedLang = Number(_local_3.lang);
                        };
                        if (this.mc_interface)
                        {
                            this.initInterface();
                        };
                        this.tribeData = [];
                        for (_local_8 in _local_3.tribeData)
                        {
                            this.tribeData.push({
                                "id":_local_3.tribeData[_local_8].id,
                                "name":_local_3.tribeData[_local_8].name,
                                "chief":_local_3.tribeData[_local_8].chief
                            });
                        };
                        return;
                    case "sceneRep":
                        if (_local_3.invvar)
                        {
                            this.invVars = _local_3.invvar.split(",");
                        };
                        if (((this.mc_scene) && (this.mc_scene.sceneRef)))
                        {
                            this.mc_scene.sceneRef.extReply(_local_3);
                        };
                        return;
                    case "sceneRepAuto":
                        if (((this.mc_scene) && (this.mc_scene.sceneRef)))
                        {
                            this.mc_scene.sceneRef.extReplyAuto(_local_3);
                        };
                        return;
                    case "gameRep":
                        this.mc_scene.gameReply(_local_3);
                        return;
                    case "interface":
                        if (this.mc_interface)
                        {
                            this.mc_interface.XTResponse(_local_3);
                        };
                        return;
                    case "purse":
                        this.mc_interface.setcredit(_local_3.cr);
                        return;
                    case "error":
                        this.showmsg(_local_3.err);
                        return;
                    case "action":
                        this.mc_scene.playerAction(_local_3);
                        return;
                    case "hp":
                        this.mc_interface.updatehappyness(_local_3.hp);
                        return;
                    case "buy":
                        if (_local_3.cr)
                        {
                            this.mc_interface.setcredit(_local_3.cr);
                        }
                        else
                        {
                            if (_local_3.altcr)
                            {
                                this.mc_interface.bt_currency.setAltCredit(_local_3.altcr);
                            };
                        };
                        this.mc_interface.updatehappyness(_local_3.hp);
                        if (_local_3.adinv)
                        {
                            this.mc_interface.addInventoryItem(_local_3.adinv);
                            this.mc_scene.addInventoryItem();
                        };
                        return;
                    case "afrn":
                        this.mc_scene.adjustFurniture(_local_3.frn);
                        return;
                    case "dinv":
                        this.mc_interface.dropInventoryItem(_local_3.id);
                        return;
                    case "dinvM":
                        _local_5 = _local_3.ids.split(",");
                        for (_local_8 in _local_5)
                        {
                            this.mc_interface.dropInventoryItem(_local_5[_local_8]);
                        };
                        return;
                    case "ginv":
                        this.mc_interface.addInventoryItem(_local_3.adinv);
                        return;
                    case "rfrn":
                        this.mc_scene.removeFurniture(_local_3.id);
                        return;
                    case "pfrn":
                        this.mc_interface.dropInventoryItem(_local_3.id);
                        this.mc_scene.placeFurniture(_local_3.frn);
                        return;
                    case "popupReply":
                        for (_local_8 in this.popupWindows)
                        {
                            if (this.popupWindows[_local_8].popupName == _local_3.popup)
                            {
                                this.popupWindows[_local_8].contentref.XTreply(_local_3);
                            };
                        };
                        return;
                    case "profile":
                        if (((this.mc_interface.playerPopupRef) && (this.mc_interface.playerPopupRef.profileContainer)))
                        {
                            this.mc_interface.playerPopupRef.profileContainer.setData(_local_3);
                        };
                        return;
                    case "trdrq":
                        this.mc_interface.incomingInvOffer(_local_3);
                        return;
                    case "mail":
                        _local_8 = 0;
                        while (_local_8 < this.popupWindows.length)
                        {
                            if (this.popupWindows[_local_8].popupName == "mail")
                            {
                                this.popupWindows[_local_8].contentref.mailin(_local_3.data.split("|"));
                            };
                            _local_8++;
                        };
                        return;
                    case "sendSucc":
                        _local_6 = this.getWindowByName("mail");
                        if (_local_3.fail)
                        {
                            if (_local_6)
                            {
                                _local_6.contentref.sendfail();
                            };
                        }
                        else
                        {
                            this.showmsg(this.langObj.repText("com07", _local_3.to));
                            if (_local_6)
                            {
                                _local_6.contentref.sendsuccess();
                            };
                            this.mc_interface.setcredit(_local_3.cr);
                        };
                        return;
                    case "exchangeRt":
                        if (this.mc_interface.speechHandlerRef)
                        {
                            this.mc_interface.speechHandlerRef.setExchangeRate(_local_3.rt);
                        };
                        return;
                    case "exchangeRsp":
                        if (this.mc_interface.speechHandlerRef)
                        {
                            this.mc_interface.speechHandlerRef.setExchangeResponse(_local_3);
                        };
                        return;
                    case "adminFn":
                        for (_local_8 in this.popupWindows)
                        {
                            if (this.popupWindows[_local_8].popupName == "admin")
                            {
                                this.popupWindows[_local_8].contentref.XTreply(_local_3);
                            };
                        };
                        return;
                    case "VarUpd":
                        for (_local_8 in _local_3)
                        {
                            if (_local_8 != "_cmd")
                            {
                                this.loadedAVData[_local_8] = _local_3[_local_8];
                            };
                            if (_local_8 == "invars")
                            {
                                this.invVars = _local_3[_local_8].split(",");
                            };
                        };
                        return;
                    case "mod_response":
                        this.buddylistControl.Moderator_PvtMessage_Response(_local_3);
                        return;
                    case "refreshBrowser":
                        this.refreshBrowser(_local_3.period);
                        return;
                };
            };
        }

        public function refreshBrowser(_arg_1:*):*
        {
            trace("Caliing refresh browser..");
            var _local_2:* = new Timer((_arg_1 * 1000));
            _local_2.addEventListener(TimerEvent.TIMER, this.refreshNow);
            _local_2.start();
        }

        public function refreshNow(_arg_1:TimerEvent):*
        {
            _arg_1.currentTarget.stop();
            var _local_2:* = ExternalInterface.call("window.location.href.toString");
            if (_local_2)
            {
                navigateToURL(new URLRequest(_local_2), "_self");
            };
        }

        public function getWindowByName(_arg_1:String):*
        {
            var _local_2:* = 0;
            while (_local_2 < this.popupWindows.length)
            {
                if (this.popupWindows[_local_2].popupName == _arg_1)
                {
                    return (this.popupWindows[_local_2]);
                };
                _local_2++;
            };
            return (false);
        }

        private function onJoinRoom(_arg_1:SFSEvent):void
        {
            if (_arg_1.params.room.getName() == "Transition")
            {
                if (this.targetRoomID > 0)
                {
                    if (((this.mc_scene.sceneRef) && (this.mc_scene.sceneRef.isReady)))
                    {
                        this.joinroom(this.targetRoomID);
                    };
                    this.targetRoomID = 0;
                };
                return;
            };
            if (_arg_1.params.room.getName() != "Welcome")
            {
                this.mc_scene.joinroom(_arg_1.params.room);
            }
            else
            {
                if (_arg_1.params.room.getName() != "GamesRoom")
                {
                    if (!_arg_1.params.room.isGame())
                    {
                        this.hasJoinedRoom = true;
                        if (((this.loggingin) && (this.initialResourceLoad)))
                        {
                            this.loggedinfn();
                        };
                        if ((((startAtHome) && (this.myHomeAddr)) && (this.mc_scene.sceneRef)))
                        {
                            this.mc_scene.joinhome();
                        };
                    };
                };
            };
        }

        private function onJoinRoomError(_arg_1:SFSEvent):void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            if (_arg_1.params.error.indexOf("full") > -1)
            {
                this.showmsg(this.langObj.getText("fdb06"));
                _local_2 = this.sfs.getAllRooms();
                _local_3 = this.sfs.activeRoomId;
                _local_4 = 0;
                _local_5 = false;
                _local_6 = ["Jungle", "Volcano"];
                for (_local_7 in _local_2)
                {
                    if (_local_2[_local_7].getId() == _local_3)
                    {
                        _local_4 = _local_7;
                    };
                };
                _local_7 = (_local_4 + 1);
                while (_local_7 < _local_2.length)
                {
                    if (((_local_2[_local_7].getName().indexOf(_local_6[(this.myTribe - 1)]) > -1) && (_local_2[_local_7].getUserCount() < _local_2[_local_7].getMaxUsers())))
                    {
                        this.mc_scene.loadNewRoom(_local_2[_local_7].getName());
                        _local_5 = true;
                        break;
                    };
                    _local_7++;
                };
                if (!_local_5)
                {
                    _local_7 = (_local_4 - 1);
                    while (_local_7 >= 0)
                    {
                        if (((_local_2[_local_7].getName().indexOf(_local_6[(this.myTribe - 1)]) > -1) && (_local_2[_local_7].getUserCount() < _local_2[_local_7].getMaxUsers())))
                        {
                            this.mc_scene.loadNewRoom(_local_2[_local_7].getName());
                            _local_5 = true;
                            break;
                        };
                        _local_7--;
                    };
                };
                this.sfs.getRoomList();
            }
            else
            {
                this.showmsg(_arg_1.params.error);
            };
        }

        private function onLogoutHandler(_arg_1:SFSEvent):void
        {
            this.shuttingDown = true;
            this.logoutfunctions();
        }

        private function onRandomKeyHandler(_arg_1:SFSEvent):void
        {
            this.key = _arg_1.params.key;
            if (this.loginAfterConnect)
            {
                this.login.quicklogin();
            };
        }

        private function onsfsModeratorevent(_arg_1:SFSEvent):void
        {
            this.showmsg(((("Moderator " + _arg_1.params.sender.getName()) + " said : ") + _arg_1.params.message));
        }

        private function onPublicMessageHandler(_arg_1:SFSEvent):void
        {
            this.mc_interface.publicmessage(_arg_1.params.message, _arg_1.params.sender, _arg_1.params.roomId);
            this.mc_scene.publicmessage(_arg_1.params.message, _arg_1.params.sender, _arg_1.params.roomId);
        }

        private function onRoomAddedHandler(_arg_1:SFSEvent):void
        {
        }

        private function onRoomDeletedHandler(_arg_1:SFSEvent):void
        {
        }

        private function onRoomListupd(_arg_1:SFSEvent):void
        {
            var _local_2:*;
            this.sfs.removeEventListener(SFSEvent.onRoomListUpdate, this.onRoomListupd);
            this.sfs.autoJoin();
            if (!this.initialized)
            {
                this.initialized = true;
                this.resourceloader.addResources(["avatar1.swf", "avatar2.swf"], "avatar");
                this.resourceloader.addResources(["shared.swf", "gui.swf"], "");
                if (this.myTribe > 0)
                {
                    this.resourceloader.addResources([(("sfx_tribe" + this.myTribe) + ".swf")], "audio");
                    this.tribeAudioLoaded.push(this.myTribe);
                };
                _local_2 = getDefinitionByName("mc_progress");
                this.preloaderRef = addChildAt(new (_local_2)(), getChildIndex(this.login));
                this.preloaderRef.percentagetxt.text = "0%";
                this.preloaderRef.x = ((this.stageScale[0] / 2) - 8);
                this.preloaderRef.y = ((this.stageScale[1] / 2) - 16);
            }
            else
            {
                this.loggedinfn();
            };
        }

        private function onRoomVariablesUpdate(_arg_1:SFSEvent):void
        {
            this.mc_scene.sceneRef.roomVarUpdate(_arg_1.params.changedVars);
        }

        private function onUserCountChange(_arg_1:SFSEvent):void
        {
        }

        private function onUserEnterRoom(_arg_1:SFSEvent):void
        {
            if (this.mc_scene.sceneRef)
            {
                this.mc_scene.sceneRef.userjoinroom(_arg_1.params.user, _arg_1.params.roomId);
            };
        }

        private function onUserLeaveRoom(_arg_1:SFSEvent):void
        {
            if (this.mc_scene.sceneRef)
            {
                this.mc_scene.sceneRef.userleaveroom(_arg_1.params.userId, _arg_1.params.roomId, _arg_1.params.userName);
            };
        }

        private function onUserVariablesUpdateHandler(_arg_1:SFSEvent):void
        {
            if (this.mc_scene.sceneRef)
            {
                this.mc_scene.sceneRef.uservarupdate(_arg_1.params.user, _arg_1.params.changedVars);
            };
        }

        private function onObjectReceivedHandler(_arg_1:SFSEvent):void
        {
            if (this.mc_scene.sceneRef)
            {
                this.mc_scene.sceneRef.objectReceived(_arg_1.params.obj, _arg_1.params.sender);
            };
        }

        private function initInterface():*
        {
            var _local_1:* = true;
            if (!this.initGUI)
            {
                this.buddylistControl.mc_interface = this.mc_interface;
                this.mc_interface.setstageref(this.thisref);
                this.mc_interface.loadPanels();
                this.initGUI = true;
                _local_1 = false;
            };
            if (!this.loadedAVData)
            {
                this.showmsg("AVATAR DATA NOT AVAILABLE.");
                return;
            };
            this.mc_interface.setcredit(this.loadedAVData.cr);
            this.mc_interface.updatehappyness(Number(this.loadedAVData.hp), false);
            if (this.myTribe > 0)
            {
                this.mc_interface.initializeLogin(_local_1);
            };
        }

        public function autoTeleport():*
        {
            var _local_1:*;
            var _local_2:*;
            if (this.loadedAVData.tb == 0)
            {
                this.showmsg("Need to define character data..");
                return;
            };
            if (this.loadedAVData.dotutorial == true)
            {
                _local_1 = this.newpopup((((((this.baseURL + "panels/tutorial_toon_c") + this.custID) + "_l") + this.langObj.selectedLang) + ".swf"), "load", "tutorial_toon", false, false, {
                    "nocentre":true,
                    "openIn":this.mc_scene
                });
                this.mc_scene.visible = true;
            }
            else
            {
                if ((((startAtHome) && (this.myHomeAddr)) || (((this.previousTribe == this.myTribe) && (!(this.sceneLists.getSceneFile(lastLoginRm)))) && (this.myHomeAddr))))
                {
                    this.mc_scene.loadHome(this.myTribe, this.myHomeAddr, startInsideHome, true);
                }
                else
                {
                    if (this.sceneLists.getSceneFile(lastLoginRm))
                    {
                        if (this.hasJoinedScene == true)
                        {
                            this.mc_scene.loadNewRoom(this.sceneLists.getSceneName(lastLoginRm), false);
                        }
                        else
                        {
                            this.mc_scene.loadScene(this.sceneLists.getSceneName(lastLoginRm), true);
                        };
                    }
                    else
                    {
                        _local_2 = Number((this.previousTribe - 1));
                        if (Number(_local_2) < 0)
                        {
                            _local_2 = (this.myTribe - 1);
                        };
                        if (this.hasJoinedScene == true)
                        {
                            trace("Already logged in..");
                            this.mc_scene.loadNewRoom(startConfigs[_local_2].name, false);
                        }
                        else
                        {
                            trace(("Start config... " + startConfigs[_local_2].name));
                            this.mc_scene.loadScene(startConfigs[_local_2].name, true);
                        };
                    };
                };
                this.hasJoinedScene = true;
            };
        }

        public function signInAnimComplete():*
        {
            this.loggedinfn();
        }

        private function loggedinfn():*
        {
            if ((((this.hasJoinedRoom) && (this.login.notAnimating)) && (this.initialResourceLoad)))
            {
                if (this.preloaderRef)
                {
                    removeChild(this.preloaderRef);
                    this.preloaderRef = undefined;
                };
                this.loggingin = false;
                this.login.removeChild(this.login.bgdContainer);
                this.login.stopTween();
                this.autoTeleport();
                this.mc_interface.loggedin();
                this.mc_interface.setInv(this.loadedAVData.inv);
                if (this.custID == 2)
                {
                    this.getAltCurrency();
                };
                this.newpopup((((this.baseURL + "panels/msg_warning_l") + this.langObj.selectedLang) + ".swf"), "load", "warning", false, false, {
                    "effect":["fadein"],
                    "nocentre":true,
                    "nopreloader":true
                });
            };
        }

        public function getAltCurrency():*
        {
            var _local_1:* = {
                "cmd":"getS",
                "ext":"altCurrency"
            };
            this.sendXTmessage(_local_1);
        }

        private function onLoginHandler(_arg_1:SFSEvent):void
        {
            this.sfs.loadBuddyList();
            this.shuttingDown = false;
            this.loginAfterConnect = false;
            this.sessionMemory = {};
            if (_arg_1.params.success)
            {
                if (this.FID)
                {
                    this.login.openingAnim(3);
                }
                else
                {
                    if (this.custID == 2)
                    {
                        if (!((this.getWindowByName("characterSelect")) && (this.getWindowByName("characterSelect").contentref.animating)))
                        {
                            this.login.openingAnim(3);
                        };
                    }
                    else
                    {
                        if (this.custID == 3)
                        {
                            this.login.openingAnim(1);
                        }
                        else
                        {
                            if (((this.login.miniRegisterSeq) && (this.login.loginDetails.length > 1)))
                            {
                                this.login.openingAnim(3);
                            }
                            else
                            {
                                this.login.openingAnim();
                            };
                        };
                    };
                };
            }
            else
            {
                if (_arg_1.params.error.indexOf("#ERR") > -1)
                {
                    this.showmsg(this.langObj.getErrMsg(String(_arg_1.params.error)));
                }
                else
                {
                    this.showmsg(_arg_1.params.error);
                };
                this.login.enablelogin();
            };
        }

        private function reconnectTimerListener(_arg_1:TimerEvent):*
        {
            this.sfs.connect(this.ip, this.sfsPort);
        }

        public function Autoreconnect():*
        {
            this.sfs.connect(this.ip, this.sfsPort);
            this.debug.text = "";
            this.loginAfterConnect = true;
            this.key = undefined;
        }

        public function newpopup(_arg_1:String, _arg_2:String, _arg_3:String="", _arg_4:*=false, _arg_5:*=false, _arg_6:Object=null):*
        {
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            if (!_arg_4)
            {
                _local_7 = 0;
                while (_local_7 < this.popupWindows.length)
                {
                    if (this.popupWindows[_local_7].popupName == _arg_3)
                    {
                        return (this.popupWindows[_local_7].contentref);
                    };
                    _local_7++;
                };
            };
            switch (_arg_2)
            {
                case "load":
                    if (((_arg_6) && (_arg_6.openIn)))
                    {
                        this.popupWindows.push(_arg_6.openIn.addChild(new popupLoader()));
                    }
                    else
                    {
                        this.popupWindows.push(addChild(new popupLoader()));
                    };
                    _local_8 = this.popupWindows[(this.popupWindows.length - 1)];
                    _local_8.setData(_arg_6);
                    _local_8.loadContent(_arg_1);
                    _local_8.popupName = _arg_3;
                    _local_8.setLoadedEffect(_arg_6);
                    if (_arg_5)
                    {
                        setChildIndex(_local_8, getChildIndex(this.mc_interface));
                    };
                    return (_local_8);
                case "class":
                    this.popupWindows.push(addChild(new popupLoader()));
                    _local_8 = this.popupWindows[(this.popupWindows.length - 1)];
                    _local_8.setData(_arg_6);
                    _local_8.setContent(_arg_1);
                    _local_8.popupName = _arg_3;
                    if (_arg_5)
                    {
                        setChildIndex(_local_8, getChildIndex(this.mc_interface));
                    };
                    if (_arg_6)
                    {
                        if (_arg_6.effect)
                        {
                            _local_9 = _arg_6.effect;
                            for (_local_7 in _local_9)
                            {
                                if (_local_9 == "fadein")
                                {
                                    _local_8.contentref.alpha = 0;
                                    TweenLite.to(_local_8.contentref, 0.8, {"alpha":1});
                                };
                            };
                        };
                    };
                    return (_local_8.contentref);
            };
        }

        public function removepopup(_arg_1:*):*
        {
            var _local_2:* = 0;
            while (_local_2 < this.popupWindows.length)
            {
                if (String(this.popupWindows[_local_2].contentref).indexOf("_Preloader_") > -1)
                {
                    trace("Try publishing the popup in FP9");
                };
                if (((this.popupWindows[_local_2].contentref == _arg_1) || (this.popupWindows[_local_2].popupName == _arg_1)))
                {
                    if (((this.popupWindows[_local_2].getEffects) && (this.popupWindows[_local_2].getEffects.openIn)))
                    {
                        this.popupWindows[_local_2].getEffects.openIn.removeChild(this.popupWindows[_local_2]);
                    }
                    else
                    {
                        removeChild(this.popupWindows[_local_2]);
                    };
                    this.popupWindows.splice(_local_2, 1);
                    return;
                };
                _local_2++;
            };
        }

        public function getpopup(_arg_1:*, _arg_2:*="content"):*
        {
            var _local_3:* = 0;
            while (_local_3 < this.popupWindows.length)
            {
                if (((this.popupWindows[_local_3].contentref == _arg_1) || (this.popupWindows[_local_3].popupName == _arg_1)))
                {
                    if (_arg_2 == "content")
                    {
                        return (this.popupWindows[_local_3].contentref);
                    };
                    if (_arg_2 == "loader")
                    {
                        return (this.popupWindows[_local_3]);
                    };
                };
                _local_3++;
            };
            return (false);
        }

        public function sendXTmessage(_arg_1:*, _arg_2:*=0):*
        {
            var _local_7:*;
            var _local_3:* = _arg_1;
            var _local_4:* = _arg_1.cmd;
            var _local_5:* = _arg_1.ext;
            var _local_6:* = _arg_1.rid;
            if (!_local_6)
            {
                _local_6 = -1;
            };
            switch (_arg_2)
            {
                case 0:
                    _local_7 = "xml";
                    _arg_1.cmd = undefined;
                    _arg_1.ext = undefined;
                    _arg_1.rid = undefined;
                    break;
                case 1:
                    _local_7 = "json";
                    delete _arg_1.cmd;
                    delete _arg_1.ext;
                    delete _arg_1.rid;
                    break;
            };
            this.sfs.sendXtMessage(_local_5, _local_4, _local_3, _local_7, _local_6);
        }

        public function getEgo():*
        {
            return (this.sfs.getRoom(this.sfs.getActiveRoom().getId()).getUser(this.sfs.myUserId));
        }

        public function logout():*
        {
            this.sfs.logout();
        }

        public function joinroom(_arg_1:*):*
        {
            var _local_2:*;
            if (((this.sfs.getRoom(this.sfs.activeRoomId)) && ((this.sfs.getRoom(this.sfs.activeRoomId).getName() == "Transition") || (this.sfs.getRoom(this.sfs.activeRoomId).getName() == "Welcome"))))
            {
                this.sfs.joinRoom(_arg_1);
                if (((this.sfs.getActiveRoom() == null) || (this.sfs.getActiveRoom().isGame())))
                {
                    _local_2 = this.sfs.getRoomByName("GamesRoom");
                    this.sfs.leaveRoom(_local_2.getId());
                };
            }
            else
            {
                this.targetRoomID = _arg_1;
            };
        }

        public function walkto(_arg_1:*):*
        {
        }

        public function showmsg(_arg_1:*):*
        {
            this.msgWindow = addChild(new mc_msg());
            this.msgWindow.settext(_arg_1, this.thisref);
            this.msgWindow.header.text = this.langObj.getText("gui54");
            this.msgWindow.bt_ok.setText(this.langObj.getText("gui17"));
            this.langObj.setFormat(this.msgWindow.header);
        }

        public function getNewPzlVar():*
        {
            return (this.getNewEntry(this.pzlVars, this.prvpzlVars));
        }

        public function getNewEntry(_arg_1:*, _arg_2:*):*
        {
            var _local_5:*;
            var _local_6:*;
            var _local_3:* = [];
            var _local_4:* = 0;
            while (_local_4 < _arg_1.length)
            {
                _local_5 = false;
                for (_local_6 in _arg_2)
                {
                    if (_arg_1[_local_4] == _arg_2[_local_6])
                    {
                        _local_5 = true;
                        break;
                    };
                };
                if (!_local_5)
                {
                    _local_3.push(_arg_1[_local_4]);
                };
                _local_4++;
            };
            return (_local_3);
        }

        public function clone(_arg_1:Object):*
        {
            var _local_2:ByteArray = new ByteArray();
            _local_2.writeObject(_arg_1);
            _local_2.position = 0;
            return (_local_2.readObject());
        }

        public function repText(_arg_1:String, _arg_2:*=null, _arg_3:Array=null):*
        {
            var _local_4:*;
            if (_arg_1.indexOf("%rep1%") == -1)
            {
                return (_arg_1);
            };
            _arg_1 = ((_arg_1.substr(0, _arg_1.indexOf("%rep1%")) + _arg_2) + _arg_1.substr((_arg_1.indexOf("%rep1%") + 6), _arg_1.length));
            if (_arg_3)
            {
                for (_local_4 in _arg_3)
                {
                    _arg_1 = ((_arg_1.substr(0, _arg_1.indexOf((("%rep" + (_local_4 + 2)) + "%"))) + _arg_3[_local_4]) + _arg_1.substr((_arg_1.indexOf((("%rep" + (_local_4 + 2)) + "%")) + 6), _arg_1.length));
                };
            };
            return (_arg_1);
        }

        public function checkExistInArray(_arg_1:Array, _arg_2:*):*
        {
            var _local_3:* = 0;
            while (_local_3 < _arg_1.length)
            {
                if (_arg_1[_local_3] == _arg_2)
                {
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        public function updateHealth(_arg_1:Number, _arg_2:Number):*
        {
            var _local_3:* = this.loadedAVData.skill[0];
            if ((_arg_1 - Number(_local_3)) > 100)
            {
                this.showmsg("Error with updating experience.. Experience increase too much!");
            }
            else
            {
                this.loadedAVData.skill = [_arg_1, _arg_2];
            };
        }

        public function destroyInstance():*
        {
            this.destroy(this.thisref);
            this.visible = false;
            trace("Destroyed.");
        }

        public function destroy(_arg_1:*):*
        {
            trace("Destroy called.");
            var _local_2:* = 0;
            while (_arg_1.numChildren > 0)
            {
                _local_2++;
                if (_local_2 > 500) break;
                if ((_arg_1.getChildAt(0) is MovieClip))
                {
                    _arg_1.getChildAt(0).stop();
                };
                if ((_arg_1.getChildAt(0) is DisplayObjectContainer))
                {
                    this.destroy(_arg_1.getChildAt(0));
                };
                _arg_1.removeChildAt(0);
            };
        }

        internal function frame3():*
        {
            this.initMain();
        }


    }
}//package com.cocolani

//------------------------------------------------------------
//com.cocolani.infomsg

package com.cocolani
{
    import com.cocolani.panels.popup;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.display.MovieClip;
    import flash.text.TextFieldAutoSize;
    import flash.events.MouseEvent;
    import flash.events.Event;

    public class infomsg extends popup 
    {

        public var header:TextField;
        internal var thisref:*;
        internal var textFormat:* = new TextFormat();
        internal var entryText:* = null;
        public var thetext:TextField;
        public var bt_ok:MovieClip;

        public function infomsg()
        {
            this.thisref = this;
            this.thetext.autoSize = TextFieldAutoSize.LEFT;
            this.bt_ok.addEventListener(MouseEvent.CLICK, this.closeme);
            this.textFormat.size = 18;
            this.thetext.setTextFormat(this.textFormat);
            addEventListener(Event.ADDED_TO_STAGE, this.init);
        }

        public function init(_arg_1:Event):*
        {
            if (_arg_1.currentTarget.stage.getChildAt(0).statusType > 6)
            {
                this.thetext.selectable = true;
            };
        }

        public function settext(_arg_1:*, _arg_2:*):*
        {
            _arg_2.langObj.setTextJustify(this.thetext, _arg_1);
            this.bt_ok.setText(_arg_2.langObj.getText("gui17"));
            this.entryText = _arg_1;
            this.adjustTextSize(this.thetext);
        }

        public function closeme(_arg_1:MouseEvent):*
        {
            this.thisref.parent.removeChild(this.thisref);
        }

        public function adjustTextSize(_arg_1:TextField):*
        {
            var _local_2:* = 0;
            while (_arg_1.textHeight > 90)
            {
                this.textFormat.size--;
                _arg_1.setTextFormat(this.textFormat);
                this.thisref.stage.getChildAt(0).langObj.setTextJustify(this.thetext, this.entryText);
                _local_2++;
                if (_local_2 > 100) break;
            };
        }


    }
}//package com.cocolani

//------------------------------------------------------------
//com.cocolani.popupLoader

package com.cocolani
{
    import flash.display.MovieClip;
    import flash.net.URLRequest;
    import flash.net.URLLoader;
    import flash.display.Loader;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import flash.events.ProgressEvent;
    import flash.events.IOErrorEvent;
    import com.greensock.TweenLite;
    import fl.transitions.Tween;
    import fl.transitions.easing.None;
    import fl.transitions.easing.*;

    public class popupLoader extends MovieClip 
    {

        public var stageref:*;
        public var tweenOn:* = true;
        public var thisref:*;
        private var preloaderref:*;
        public var contentref:*;
        public var mydata:*;
        private var urlREQ:URLRequest;
        private var urlLoader:URLLoader;
        public var loader:Loader;
        public var popupName:String;
        public var ratio:*;
        public var myTween:Array;
        public var loadData:*;
        private var effects:*;

        public function popupLoader()
        {
            this.thisref = this;
            this.loader = new Loader();
            this.myTween = [];
            this.loadData = {};
            super();
            addEventListener(Event.ADDED_TO_STAGE, this.init);
        }

        public function init(_arg_1:Event):*
        {
            this.stageref = this.thisref.stage.getChildAt(0);
            this.ratio = this.stageref.stageRatio;
        }

        public function centre():*
        {
            if (((this.loadData) && (this.loadData.nocentre)))
            {
                return;
            };
            this.thisref.x = ((this.stageref.stageScale[0] / 2) - (this.thisref.width / 2));
            this.thisref.y = ((this.stageref.stageScale[1] / 2) - (this.thisref.height / 2));
            if (this.popupName == "registration")
            {
                this.thisref.x = 0;
                this.thisref.y = 0;
            };
            if (this.popupName == "store")
            {
                this.thisref.x = (this.stageref.stageScale[0] / 2);
                this.thisref.y = (this.stageref.stageScale[1] / 2);
            };
        }

        public function setData(_arg_1:*):*
        {
            this.loadData = _arg_1;
        }

        public function setContent(_arg_1:*):*
        {
            var _local_2:* = getDefinitionByName(_arg_1);
            this.contentref = addChild(new (_local_2)());
            this.centre();
        }

        public function loadContent(_arg_1:*):*
        {
            var _local_3:*;
            var _local_2:* = new LoaderContext();
            if ((((this.loadData) && (this.loadData.classes)) && (this.loadData.classes == "global")))
            {
                _local_2.applicationDomain = ApplicationDomain.currentDomain;
            };
            addChild(this.loader);
            if (((!(this.loadData)) || ((this.loadData) && (!(this.loadData.nopreloader)))))
            {
                _local_3 = getDefinitionByName("mc_progress");
                this.preloaderref = addChild(new (_local_3)());
                this.preloaderref.percentagetxt.text = "0%";
                this.preloaderref.x = ((((this.thisref.stage.stageWidth * this.ratio[0]) / 2) - (this.thisref.width / 2)) + 20);
                this.preloaderref.y = (((this.thisref.stage.stageHeight * this.ratio[1]) / 2) - (this.thisref.height / 2));
            };
            this.urlREQ = new URLRequest(_arg_1);
            if (((!(this.loadData)) || ((this.loadData) && (!(this.loadData.nopreloader)))))
            {
                this.loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.loaderprogress);
            };
            this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.loadererror);
            this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.finloading);
            this.loader.contentLoaderInfo.addEventListener(Event.INIT, this.initload);
            this.loader.load(this.urlREQ, _local_2);
        }

        public function setLoadedEffect(_arg_1:*):*
        {
            this.effects = _arg_1;
        }

        public function get getEffects():*
        {
            return (this.effects);
        }

        private function loadererror(_arg_1:IOErrorEvent):*
        {
            trace(("Error loading " + _arg_1));
        }

        private function loaderprogress(_arg_1:ProgressEvent):*
        {
            if (this.preloaderref)
            {
                this.preloaderref.percentagetxt.text = (Math.round(((_arg_1.bytesLoaded / _arg_1.bytesTotal) * 100)) + "%");
            };
        }

        private function initload(e:Event):*
        {
            var myeffects:* = undefined;
            var i:* = undefined;
            if (((!(this.loadData)) || ((this.loadData) && (!(this.loadData.nopreloader)))))
            {
                removeChild(this.preloaderref);
                this.preloaderref = undefined;
            };
            this.contentref = this.loader.content;
            this.centre();
            if (this.effects)
            {
                if (this.effects.effect)
                {
                    myeffects = this.effects.effect;
                    for (i in myeffects)
                    {
                        if (myeffects == "fadein")
                        {
                            this.thisref.alpha = 0;
                            TweenLite.to(this.thisref, 0.8, {"alpha":1});
                        };
                    };
                };
                if (this.effects.initVars)
                {
                    for (i in this.effects.initVars)
                    {
                        try
                        {
                            this.contentref[i] = this.effects.initVars[i];
                        }
                        catch(E:Error)
                        {
                            trace((("Cannot initialize variable " + i) + " in initialization for popup"));
                        };
                    };
                };
            }
            else
            {
                if (this.tweenOn)
                {
                    this.myTween[0] = new Tween(this.thisref, "scaleX", None.easeOut, 0.3, 1, 0.5, true);
                    this.myTween[1] = new Tween(this.thisref, "scaleY", None.easeOut, 0.3, 1, 0.5, true);
                    this.myTween[2] = new Tween(this.thisref, "alpha", None.easeOut, 0, 1, 0.5, true);
                };
            };
            var readyEvent:* = new Event("ready");
            this.thisref.dispatchEvent(readyEvent);
        }

        private function finloading(_arg_1:Event):*
        {
        }

        private function checkresponse(_arg_1:Event):*
        {
            if (_arg_1.type == "YES")
            {
            };
        }


    }
}//package com.cocolani

//------------------------------------------------------------
//com.cocolani.preloader

package com.cocolani
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.display.LoaderInfo;
    import flash.net.URLRequest;
    import flash.display.Loader;
    import flash.events.ProgressEvent;
    import flash.events.IOErrorEvent;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;

    public class preloader extends MovieClip 
    {

        public var load_bar:MovieClip;
        internal var totalWidth:* = 200;
        internal var thisref:*;
        internal var stageref:*;
        internal var baseSize:* = 0.2;
        internal var resourcesLoaded:* = 0;
        internal var resourceInit:* = false;
        internal var langID:* = 0;
        internal var custID:* = 0;
        internal var resourcesToLoad:*;
        internal var loaderObjects:*;
        internal var totalLoaderCount:* = 0;
        internal var totalLoadedCount:* = 0;

        public function preloader()
        {
            this.thisref = this;
            this.resourcesToLoad = [];
            this.loaderObjects = [];
            super();
            this.load_bar.width = 0;
            this.thisref.parent.stop();
            var _local_1:* = addEventListener(Event.ENTER_FRAME, this.chkloading);
            addEventListener(Event.ADDED_TO_STAGE, this.init);
        }

        private function init(_arg_1:Event):*
        {
            this.stageref = _arg_1.currentTarget.stage.getChildAt(0);
            this.langID = this.stageref.langObj.selectedLang;
            if (LoaderInfo(_arg_1.currentTarget.stage.loaderInfo).parameters["lang"])
            {
                this.langID = Number(LoaderInfo(_arg_1.currentTarget.stage.loaderInfo).parameters["lang"]);
            };
            this.loadExtra();
        }

        private function loadExtra():*
        {
            var _local_2:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            var _local_1:* = stage;
            if (LoaderInfo(_local_1.loaderInfo).parameters["baseURL"])
            {
                _local_2 = ((LoaderInfo(_local_1.loaderInfo).parameters["baseURL"] + "/") + LoaderInfo(_local_1.loaderInfo).parameters["swfURL"]);
            }
            else
            {
                _local_2 = "swf/";
            };
            if (LoaderInfo(_local_1.loaderInfo).parameters["cid"])
            {
                this.custID = LoaderInfo(_local_1.loaderInfo).parameters["cid"];
            }
            else
            {
                this.custID = _local_1.getChildAt(0).custID;
            };
            if (this.custID < 2)
            {
                this.resourcesToLoad.push("lang/registerbt_l");
            };
            var _local_3:* = new URLRequest((_local_2 + "panels/login_bgd.swf"));
            var _local_4:* = new Loader();
            this.stageref.preloadedObjects.push(_local_4);
            _local_4.load(_local_3);
            _local_4.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.chkResourceLoad);
            _local_4.contentLoaderInfo.addEventListener(Event.INIT, this.resourcesInit);
            _local_4.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.resourcesFailed);
            var _local_5:* = 0;
            while (_local_5 < this.resourcesToLoad.length)
            {
                this.loaderObjects.push(new Loader());
                _local_8 = this.loaderObjects[(this.loaderObjects.length - 1)];
                _local_8.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.chkResourceLoad);
                _local_8.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.resourcesFailed);
                _local_8.contentLoaderInfo.addEventListener(Event.INIT, this.resourcesInit);
                _local_5++;
            };
            this.totalLoaderCount = this.resourcesToLoad.length;
            var _local_6:* = new LoaderContext();
            _local_6.applicationDomain = ApplicationDomain.currentDomain;
            var _local_7:* = 0;
            while (_local_7 < this.loaderObjects.length)
            {
                _local_9 = (((_local_2 + this.resourcesToLoad.pop()) + this.langID) + ".swf");
                _local_10 = new URLRequest(_local_9);
                this.loaderObjects[_local_7].load(_local_10, _local_6);
                _local_7++;
            };
        }

        private function resourcesFailed(_arg_1:IOErrorEvent):*
        {
            this.stageref.showmsg("Failed loading resources or invalid language.");
        }

        private function resourcesInit(_arg_1:Event):*
        {
            var _local_2:* = 0;
            while (_local_2 < this.loaderObjects.length)
            {
                if (this.loaderObjects[_local_2].contentLoaderInfo == _arg_1.currentTarget)
                {
                    this.loaderObjects[_local_2].contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, this.chkResourceLoad);
                    this.loaderObjects[_local_2].contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.resourcesFailed);
                    this.loaderObjects[_local_2].contentLoaderInfo.removeEventListener(Event.INIT, this.resourcesInit);
                    this.loaderObjects.splice(_local_2, 1);
                    this.totalLoadedCount++;
                    break;
                };
                _local_2++;
            };
            if ((((this.stageref.preloadedObjects[0].contentLoaderInfo.bytesLoaded == this.stageref.preloadedObjects[0].contentLoaderInfo.bytesTotal) && (this.stageref.preloadedObjects[0].contentLoaderInfo.bytesLoaded > 0)) && (this.loaderObjects.length == 0)))
            {
                this.resourceInit = true;
            };
        }

        private function chkResourceLoad(_arg_1:ProgressEvent):*
        {
            var _local_6:*;
            var _local_2:* = 0;
            var _local_3:* = 0;
            while (_local_3 < this.loaderObjects.length)
            {
                _local_6 = this.loaderObjects[_local_3].contentLoaderInfo;
                _local_2 = (_local_2 + (_local_6.bytesLoaded / _local_6.bytesTotal));
                _local_3++;
            };
            _local_2 = (_local_2 + this.totalLoadedCount);
            var _local_4:* = (this.stageref.preloadedObjects[0].contentLoaderInfo.bytesLoaded / this.stageref.preloadedObjects[0].contentLoaderInfo.bytesTotal);
            var _local_5:* = (_local_2 / this.totalLoaderCount);
            this.resourcesLoaded = (((_local_4 * (1 / (this.totalLoaderCount + 1))) + ((_local_5 * 1) / (this.totalLoaderCount + 1))) * (1 - this.baseSize));
        }

        private function chkloading(_arg_1:Event):*
        {
            this.load_bar.width = ((this.resourcesLoaded + ((this.thisref.parent.loaderInfo.bytesLoaded / this.thisref.parent.loaderInfo.bytesTotal) * this.baseSize)) * this.totalWidth);
            if (((this.resourceInit) && (this.thisref.parent.loaderInfo.bytesLoaded == this.thisref.parent.loaderInfo.bytesTotal)))
            {
                removeEventListener(Event.ENTER_FRAME, this.chkloading);
                this.thisref.parent.gotoAndStop(3);
            };
        }


    }
}//package com.cocolani

//------------------------------------------------------------
//com.cocolani.resourceLoader

package com.cocolani
{
    import flash.events.EventDispatcher;
    import flash.system.LoaderContext;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.events.HTTPStatusEvent;
    import flash.system.ApplicationDomain;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import flash.events.*;

    public class resourceLoader extends EventDispatcher 
    {

        public static const UPDATE_LOADER:String = "update_loader";
        public static const LOADING_FIN:String = "loading_fin";
        public static const FILE_FIN:String = "file_fin";

        private var _resources:Array = [];
        internal var _resourcetype:String;
        internal var resourceCatalogue:* = new Array();
        private var resourceloader_loaderArr:* = new Array();
        internal var _resourcecount:* = 0;
        internal var resourceLoadingState:Boolean = false;
        internal var classlist:* = [];
        internal var loaderContext:LoaderContext;
        internal var urlbase:String = "/";
        internal var thisref:*;
        internal var rootref:*;
        private var loading:Boolean = false;
        private var loadedResources:Array;
        private var indexIDs:Array;

        public function resourceLoader(_arg_1:Array, _arg_2:String="", _arg_3:*=""):void
        {
            this.rootref = _arg_3;
            this.thisref = this;
            if (((!(_arg_1 == null)) && (_arg_1.length > 0)))
            {
                this.addResources(_arg_1, _arg_2);
            };
        }

        public function addResources(_arg_1:Array, _arg_2:String="", _arg_3:String=null):*
        {
            if (this.indexIDs == null)
            {
                this.indexIDs = [];
            };
            var _local_4:* = 0;
            while (_local_4 < _arg_1.length)
            {
                if (this.checkIfExists(_arg_1[_local_4]))
                {
                    trace((("Resource " + _arg_1[_local_4]) + " already exists."));
                }
                else
                {
                    this.indexIDs.push(_arg_3);
                    this.resourceCatalogue.push(_arg_1[_local_4]);
                    this._resourcetype = _arg_2;
                    this.urlbase = "";
                    switch (_arg_2)
                    {
                        case "obj":
                            this.urlbase = "obj/";
                            break;
                        case "audio":
                            this.urlbase = "aud/";
                            break;
                        case "lang":
                            this.urlbase = "lang/";
                            break;
                        case "none":
                            this.urlbase = "";
                            break;
                        case "panels":
                            this.urlbase = "panels/";
                            break;
                        case "cust":
                            this.urlbase = "cust/";
                            break;
                    };
                    _arg_1[_local_4] = (this.urlbase + _arg_1[_local_4]);
                    this._resources.push(_arg_1[_local_4]);
                };
                _local_4++;
            };
            if (this._resources.length > 0)
            {
                this.loading = true;
                this.loadresources();
            };
        }

        public function checkIfExists(_arg_1:*):*
        {
            var _local_2:* = false;
            var _local_3:* = 0;
            while (_local_3 < this.resourceCatalogue.length)
            {
                if (this.resourceCatalogue[_local_3] == _arg_1)
                {
                    _local_2 = true;
                };
                _local_3++;
            };
            return (_local_2);
        }

        public function setListeners(_arg_1:*):*
        {
            _arg_1.contentLoaderInfo.addEventListener(Event.INIT, this.loadingInitListener);
            _arg_1.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.ioErrorListener);
            _arg_1.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.loadingSectionListener);
            _arg_1.contentLoaderInfo.addEventListener(Event.COMPLETE, this.complListener);
            _arg_1.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS, this.httpStatusHandler);
        }

        public function complListener(_arg_1:Event):*
        {
        }

        public function ioErrorListener(_arg_1:IOErrorEvent):*
        {
            trace(("IO ERROR " + _arg_1));
            var _local_2:* = 0;
            while (_local_2 < this.resourceloader_loaderArr.length)
            {
                if (this.resourceloader_loaderArr[_local_2].contentLoaderInfo == _arg_1.target)
                {
                    if (this.rootref.statusType > 6)
                    {
                        this.rootref.showmsg(((("Could not load " + _arg_1.text) + " URL : ") + this.resourceloader_loaderArr[_local_2].contentLoaderInfo.loaderURL));
                    };
                    this.resourceloader_loaderArr.splice(_local_2, 1);
                    break;
                };
                _local_2++;
            };
            if (this.resourceloader_loaderArr.length == 0)
            {
                this.resourceLoadingState = false;
                this.loading = false;
                this.thisref.dispatchEvent(new Event(resourceLoader.LOADING_FIN));
            };
        }

        public function loadresources():*
        {
            var _local_1:*;
            this.resourceLoadingState = true;
            this.loading = true;
            this.loaderContext = new LoaderContext();
            this.loaderContext.applicationDomain = ApplicationDomain.currentDomain;
            while (this._resources.length > 0)
            {
                _local_1 = this.resourceloader_loaderArr[(this.resourceloader_loaderArr.push(new Loader()) - 1)];
                this.setListeners(_local_1);
                if (this.rootref.baseURL)
                {
                    _local_1.load(new URLRequest((this.rootref.baseURL + this._resources.shift())), this.loaderContext);
                }
                else
                {
                    _local_1.load(new URLRequest(this._resources.shift()), this.loaderContext);
                };
            };
        }

        public function getqueu():*
        {
            return (this._resources);
        }

        public function loadingSectionListener(_arg_1:Event):*
        {
            var _local_2:* = new ProgressEvent(resourceLoader.UPDATE_LOADER);
            var _local_3:* = 0;
            var _local_4:* = 0;
            var _local_5:* = 0;
            while (_local_5 < this.resourceloader_loaderArr.length)
            {
                _local_3 = (_local_3 + this.resourceloader_loaderArr[_local_5].contentLoaderInfo.bytesLoaded);
                _local_4 = (_local_4 + this.resourceloader_loaderArr[_local_5].contentLoaderInfo.bytesTotal);
                _local_5++;
            };
            _local_2.bytesLoaded = _local_3;
            _local_2.bytesTotal = _local_4;
            this.thisref.dispatchEvent(_local_2);
        }

        public function getLoading():*
        {
            return ([this.resourceloader_loaderArr.length, this._resourcecount]);
        }

        private function httpStatusHandler(_arg_1:HTTPStatusEvent):void
        {
        }

        public function loadingInitListener(_arg_1:Event):*
        {
            if (this.loadedResources == null)
            {
                this.loadedResources = [];
            };
            if (this.indexIDs.length > 0)
            {
                this.loadedResources[this.indexIDs.shift()] = _arg_1.target.content;
            };
            this.thisref.dispatchEvent(new Event(resourceLoader.FILE_FIN));
            var _local_2:* = 0;
            while (_local_2 < this.resourceloader_loaderArr.length)
            {
                if (this.resourceloader_loaderArr[_local_2].contentLoaderInfo == _arg_1.target)
                {
                    this.resourceloader_loaderArr.splice(_local_2, 1);
                    break;
                };
                _local_2++;
            };
            if (this.resourceloader_loaderArr.length == 0)
            {
                this.loading = false;
                this.resourceLoadingState = false;
                this.thisref.dispatchEvent(new Event(resourceLoader.LOADING_FIN));
            };
        }

        public function getResource(_arg_1:String):*
        {
            return (this.loadedResources[_arg_1]);
        }


    }
}//package com.cocolani

//------------------------------------------------------------
//com.cocolani.sceneInteractive

package com.cocolani
{
    import flash.display.MovieClip;
    import flash.filters.GlowFilter;
    import flash.filters.BitmapFilterQuality;
    import flash.events.Event;
    import flash.events.MouseEvent;

    public dynamic class sceneInteractive extends MovieClip 
    {

        internal var selectFilter:* = new GlowFilter(0xFFFFFF, 1, 8, 8, 2, BitmapFilterQuality.MEDIUM, false, false);
        internal var unselectFilter:* = new GlowFilter(0, 1, 1.5, 1.5, 25, BitmapFilterQuality.MEDIUM, false, false);
        public var thisref:*;
        public var stageref:*;
        internal var hasBlackBorder:* = false;
        public var sceneObjId:* = 0;
        public var distanceToActive:* = 200;
        public var internalFunctions:* = false;

        public function sceneInteractive()
        {
            this.thisref = this;
            super();
            this.thisref.filters = [];
            this.setInteractive();
            addEventListener(Event.ADDED_TO_STAGE, this.init);
        }

        public function init(_arg_1:Event):*
        {
            this.stageref = this.thisref.stage.getChildAt(0);
        }

        public function setBorder():*
        {
            this.hasBlackBorder = true;
            filters = [this.unselectFilter];
        }

        public function setInteractive():*
        {
            addEventListener(MouseEvent.MOUSE_OVER, this.mousecatcher);
            addEventListener(MouseEvent.MOUSE_OUT, this.mousecatcher);
            addEventListener(MouseEvent.CLICK, this.mousecatcher);
            buttonMode = true;
        }

        public function removeInteractive():*
        {
            removeEventListener(MouseEvent.MOUSE_OVER, this.mousecatcher);
            removeEventListener(MouseEvent.MOUSE_OUT, this.mousecatcher);
            removeEventListener(MouseEvent.CLICK, this.mousecatcher);
            buttonMode = false;
        }

        public function gotClick():*
        {
        }

        public function mousecatcher(_arg_1:MouseEvent):*
        {
            if ((((!(this.stageref.getChildByName("mc_scene"))) || (this.distanceToActive == -1)) || (this.stageref.mc_scene.sceneRef.getDistanceToObject(this.thisref) <= this.distanceToActive)))
            {
                buttonMode = true;
                if (_arg_1.type == "mouseOver")
                {
                    if (this.hasBlackBorder)
                    {
                        filters = [this.unselectFilter, this.selectFilter];
                    }
                    else
                    {
                        filters = [this.selectFilter];
                    };
                }
                else
                {
                    if (_arg_1.type == "click")
                    {
                        if (this.stageref.mc_interface.speechHandlerRef)
                        {
                            this.stageref.mc_interface.speechHandlerRef.shutdown();
                        };
                        this.stageref.mc_scene.sceneRef.roomObjClicked(this.thisref);
                        if (this.internalFunctions)
                        {
                            this.gotClick();
                        };
                    }
                    else
                    {
                        if (this.hasBlackBorder)
                        {
                            filters = [this.unselectFilter];
                        }
                        else
                        {
                            filters = [];
                        };
                    };
                };
            }
            else
            {
                buttonMode = false;
                if (this.hasBlackBorder)
                {
                    filters = [this.unselectFilter];
                }
                else
                {
                    filters = [];
                };
            };
        }


    }
}//package com.cocolani

//------------------------------------------------------------
//com.cocolani.sceneListings

package com.cocolani
{
    public class sceneListings 
    {

        internal var rootref:*;
        internal var sceneList:XML = <xml>
<Scenelist>
<Room name="Welcome">
</Room>
<Room name="Jungle">
  <File>jungle1.swf</File>
  <Tribe>1</Tribe>
</Room>
<Room name="Jungle Room 2">
  <File>jungle2.swf</File>
  <Tribe>1</Tribe>

</Room>
<Room name="Jungle Bridge">
  <File>jungle3.swf</File>
  <Tribe>1</Tribe>
</Room>
<Room name="Jungle Temple">
  <File>jungle_temple.swf</File>
  <Tribe>1</Tribe>
</Room>

<Room name="Jungle Corridor 1">
  <File>jungle_temple_corridor1.swf</File>
  <Tribe>1</Tribe>
</Room>
<Room name="Jungle Corridor 2">
  <File>jungle_temple_corridor2.swf</File>
  <Tribe>1</Tribe>
</Room>
<Room name="Jungle Centre">

  <File>jungle_village.swf</File>
  <Tribe>1</Tribe>
</Room>
<Room name="Jungle Furniture">
  <File>jungle_furniturestore.swf</File>
  <Tribe>1</Tribe>
</Room>
<Room name="GamesRoom">
</Room>

<Room name="Jungle Pathway 1">
  <File>jungle_path1.swf</File>
  <Tribe>1</Tribe>
</Room>
<Room name="Jungle Pathway 2">
<File>jungle_path2.swf</File>
  <Tribe>1</Tribe>
</Room>
<Room name="Jungle Swimming">
  <File>jungle_leisure.swf</File>

  <Tribe>1</Tribe>
</Room>
<Room name="Volcano Bridge">
  <File>volcano_bridge.swf</File>
  <Tribe>2</Tribe>
</Room>
<Room name="Volcano Centre">
  <File>volcano_village.swf</File>
  <Tribe>2</Tribe>

</Room>
<Room name="Volcano Pathway 1">
  <File>volcano_path1.swf</File>
  <Tribe>2</Tribe>
</Room>
<Room name="Volcano Pathway 2">
  <File>volcano_path2.swf</File>
  <Tribe>2</Tribe>
</Room>
<Room name="Transition">
</Room>
<Room name="Volcano Leisure">
  <File>volcano_leisure.swf</File>
  <Tribe>2</Tribe>
</Room>
<Room name="Volcano Junkyard 1">
  <File>volcano_junkyard1.swf</File>

  <Tribe>2</Tribe>
</Room>
<Room name="Volcano Junkyard 2">
  <File>volcano_junkyard2.swf</File>
  <Tribe>2</Tribe>
</Room>
<Room name="Volcano Tunnel 1">
  <File>volcano_tunnel1.swf</File>
  <Tribe>2</Tribe>

</Room>
<Room name="Volcano Tunnel 2">
  <File>volcano_tunnel2.swf</File>
  <Tribe>2</Tribe>
</Room>
<Room name="Volcano Tunnel 3">
  <File>volcano_tunnel3.swf</File>
  <Tribe>2</Tribe>
</Room>

<Room name="Volcano Tunnel 4">
  <File>volcano_tunnel4.swf</File>
  <Tribe>2</Tribe>
</Room>
<Room name="Volcano Tunnel 5">
  <File>volcano_tunnel5.swf</File>
  <Tribe>2</Tribe>
</Room>
<Room name="Volcano Temple 1">

  <File>volcano_temple1.swf</File>
  <Tribe>2</Tribe>
</Room>
<Room name="Volcano Temple 2">
  <File>volcano_temple2.swf</File>
  <Tribe>2</Tribe>
</Room>
<Room name="Volcano Mountain 1">
  <File>volcano_mountain1.swf</File>

  <Tribe>2</Tribe>
</Room>
<Room name="Volcano Mountain 2">
  <File>volcano_mountain2.swf</File>
  <Tribe>2</Tribe>
</Room>
<Room name="Volcano Mountain 3">
  <File>volcano_mountain3.swf</File>
  <Tribe>2</Tribe>

</Room>
<Room name="Volcano Mountain 4">
  <File>volcano_mountain4.swf</File>
  <Tribe>2</Tribe>
</Room>
<Room name="Volcano Mountain 5">
  <File>volcano_mountain5.swf</File>
  <Tribe>2</Tribe>
</Room>

<Room name="Battle Zone1">
  <File>noman_midbridge.swf</File>
</Room>
<Room name="Volcano Furniture">
  <File>volcano_furniture.swf</File>
  <Tribe>2</Tribe>
</Room>
<Room name="Tutorial Island1">
	<File>tutorial_island.swf</File>
</Room>
<Room name="Summer Beach">
	<File>noman_summerbeach.swf</File>
</Room>
<Room name="Marbles Game">
	<File>noman_marbles.swf</File>
</Room>
<Room name="Backgammon Room">
	<Access>0</Access>
</Room>
<Room name="Connect4 Room">
	<Access>0</Access>
</Room>
<Room name="Jungle Pathway 3">
  <File>jungle_path3.swf</File>
  <Tribe>1</Tribe>
</Room>
<Room name="Jungle Pathway 4">
  <File>jungle_path4.swf</File>

  <Tribe>1</Tribe>
</Room>
<Room name="Jungle Pathway 5">
  <File>jungle_path5.swf</File>
  <Tribe>1</Tribe>
</Room>
<Room name="Jungle Pathway 6">
  <File>jungle_path6.swf</File>
  <Tribe>1</Tribe>

</Room>
<Room name="Jungle Pathway 7">
  <File>jungle_path7.swf</File>
  <Tribe>1</Tribe>
</Room>
<Room name="Jungle Turn">
  <File>jungle_turn.swf</File>
  <Tribe>1</Tribe>
</Room>

<Room name="Jungle Lighthouse">
  <File>jungle_lighthouse.swf</File>
  <Tribe>1</Tribe>
</Room>
<Room name="Jungle Corridor 4">
  <File>jungle_temple_corridor4.swf</File>
  <Tribe>1</Tribe>
</Room>
<Room name="Jungle Corridor 3">

  <File>jungle_temple_corridor3.swf</File>
  <Tribe>1</Tribe>
</Room>
<Room name="Jungle Spare 1">
  <Tribe>1</Tribe>
</Room>
<Room name="Test Sandbox">
	<File>testSandbox.swf</File>
  <Tribe>1</Tribe>
</Room>
<Room name="Jungle Leisure Outlet">
	<File>jungle_leisure_outlet.swf</File>
  <Tribe>1</Tribe>
</Room>
</Scenelist>

</xml>
        ;

        public function sceneListings(_arg_1:*)
        {
            this.rootref = _arg_1;
        }

        public function getSceneFile(id:Number):*
        {
            try
            {
                if (this.sceneList.Scenelist.Room[(id - 1)].File)
                {
                    return (String(this.sceneList.Scenelist.Room[(id - 1)].File));
                };
            }
            catch(e:Error)
            {
                return (false);
            };
        }

        public function getSceneName(id:Number):*
        {
            try
            {
                if (this.sceneList.Scenelist.Room[(id - 1)].File)
                {
                    return (String(this.sceneList.Scenelist.Room[(id - 1)].@name));
                };
            }
            catch(e:Error)
            {
                return (false);
            };
        }

        public function getName(id:Number):*
        {
            try
            {
                if (this.sceneList.Scenelist.Room[(id - 1)].File)
                {
                    return (String(this.sceneList.Scenelist.Room[(id - 1)].@name));
                };
            }
            catch(e:Error)
            {
                return (false);
            };
        }

        public function getTribe(_arg_1:String):*
        {
            var _local_2:*;
            for (_local_2 in this.sceneList.Scenelist.Room)
            {
                if (String(this.sceneList.Scenelist.Room[_local_2].@name) == _arg_1)
                {
                    return (this.sceneList.Scenelist.Room[_local_2].Tribe);
                };
            };
            return (false);
        }

        public function getFileByRoom(_arg_1:String):*
        {
            var _local_2:*;
            if (_arg_1.indexOf("home_tribe") > -1)
            {
                return (_arg_1);
            };
            for (_local_2 in this.sceneList.Scenelist.Room)
            {
                if (String(this.sceneList.Scenelist.Room[_local_2].@name) == _arg_1)
                {
                    return (String(this.sceneList.Scenelist.Room[_local_2].File));
                };
            };
            this.rootref.showmsg(("Invalid room name :" + _arg_1));
            return (false);
        }

        public function getTribeByFile(_arg_1:String):*
        {
            var _local_2:*;
            for (_local_2 in this.sceneList.Scenelist.Room)
            {
                if (String(this.sceneList.Scenelist.Room[_local_2].File) == _arg_1)
                {
                    return (Number(this.sceneList.Scenelist.Room[_local_2].Tribe));
                };
            };
            return (false);
        }

        public function getZoneSceneName(_arg_1:Number):*
        {
            var _local_3:*;
            var _local_2:* = this.rootref.sfs.getAllRooms();
            for (_local_3 in _local_2)
            {
                if (_local_2[_local_3].getId() == _arg_1)
                {
                    return (_local_2[_local_3].getName());
                };
            };
            return (false);
        }

        public function getIDFromSFS(_arg_1:Number):*
        {
            var _local_3:*;
            var _local_2:* = this.rootref.sfs.getRoom(_arg_1).getName();
            for (_local_3 in this.sceneList.Scenelist.Room)
            {
                if (this.sceneList.Scenelist.Room[_local_3].@name == _local_2)
                {
                    return (Number(_local_3) + 1);
                };
            };
        }

        public function getID(_arg_1:String):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            if (_arg_1.indexOf("home_tribe") > -1)
            {
                return (-1);
            };
            _local_2 = this.rootref.sfs.getAllRooms();
            for (_local_3 in this.sceneList.Scenelist.Room)
            {
                if (this.sceneList.Scenelist.Room[_local_3].@name == _arg_1)
                {
                    for (_local_4 in _local_2)
                    {
                        if (_local_2[_local_4].getName() == _arg_1)
                        {
                            return (_local_2[_local_4].getId());
                        };
                    };
                };
            };
            this.rootref.showmsg(("Invalid room name on SFS:" + _arg_1));
            return (false);
        }


    }
}//package com.cocolani

//------------------------------------------------------------
//com.cocolani.sceneloader

package com.cocolani
{
    import flash.display.Sprite;
    import flash.system.LoaderContext;
    import flash.display.MovieClip;
    import flash.display.Shape;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import flash.net.LocalConnection;
    import flash.events.MouseEvent;
    import flash.system.ApplicationDomain;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;
    import flash.external.ExternalInterface;
    import com.gsolo.encryption.MD5;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.display.Bitmap;
    import flash.display.PixelSnapping;
    import fl.transitions.Tween;
    import fl.transitions.easing.None;
    import fl.transitions.TweenEvent;
    import flash.utils.getTimer;
    import flash.geom.Point;
    import flash.events.*;

    public class sceneloader extends Sprite 
    {

        internal var thisref:*;
        internal var loadHomeOtherTribe:* = false;
        internal var context:LoaderContext;
        private var preloaderRef:*;
        public var sceneHolder:MovieClip;
        public var speechHolder:Sprite;
        public var clickPadShp:Shape;
        public var clickPad:Sprite;
        public var clickEnable:Boolean = false;
        public var foreElements:Sprite;
        internal var sceneLoader:Loader;
        internal var gameLoader:Loader;
        internal var gameLoaderProgress:*;
        internal var gameMask:Shape;
        internal var urlReq:URLRequest;
        internal var fadetw:*;
        internal var bitmapct:*;
        public var sceneRef:*;
        public var gameRef:*;
        private var loadingRoomID:*;
        public var loadNewRoomID:*;
        public var previousRoomID:*;
        public var loadHomeID:*;
        public var loadTribeID:*;
        public var loadInternalHome:*;
        public var loadInitProps:*;
        public var loadExtraResources:* = false;
        public var saveFNProps:*;
        private var firstLoad:Boolean = true;
        public var sceneEnabled:Boolean = true;
        public var lastClickOnPad:*;
        private var maxClickTime:* = 600;
        internal var receivingLC:LocalConnection;
        internal var sendingLC:LocalConnection;
        internal var gameProps:Object;

        public function sceneloader()
        {
            this.thisref = this;
            this.sceneHolder = new MovieClip();
            this.speechHolder = new Sprite();
            this.clickPadShp = new Shape();
            this.clickPad = new Sprite();
            this.foreElements = new Sprite();
            this.sceneLoader = new Loader();
            this.gameMask = new Shape();
            this.saveFNProps = [];
            this.sendingLC = new LocalConnection();
            super();
            this.thisref.visible = false;
            this.clickPad.addChild(this.clickPadShp);
            this.sceneHolder.addChild(this.clickPad);
            this.clickPad.graphics.beginFill(0x999999, 0.5);
            this.clickPad.graphics.drawRect(0, 0, this.thisref.stage.getChildAt(0).stageScale[0], this.thisref.stage.getChildAt(0).stageScale[1]);
            this.clickPad.graphics.endFill();
            this.clickPad.cacheAsBitmap = true;
            addChild(this.sceneHolder);
            addChild(this.speechHolder);
            addChild(this.foreElements);
            this.gameMask.graphics.beginFill(0xFFFFFF);
            this.gameMask.graphics.drawRect(0, 0, 600, 400);
            this.gameMask.graphics.endFill();
            this.speechHolder.mouseEnabled = true;
            this.speechHolder.mouseChildren = true;
            this.speechHolder.addEventListener(MouseEvent.CLICK, this.clickthroughSpeech);
            this.sceneHolder.x = 0;
            this.sceneHolder.y = 0;
            this.sceneLoader.mouseEnabled = false;
            this.context = new LoaderContext();
            this.context.applicationDomain = ApplicationDomain.currentDomain;
            this.sceneLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.erroropen);
            this.sceneLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.loadProgress);
            this.sceneLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.finloading);
            this.sceneLoader.contentLoaderInfo.addEventListener(Event.INIT, this.init);
            this.sceneLoader.contentLoaderInfo.addEventListener(Event.OPEN, this.opennew);
        }

        public function addInventoryItem():*
        {
            if (this.sceneEnabled)
            {
                this.sceneRef.addInventoryItem();
            };
        }

        public function placeFurniture(_arg_1:*):*
        {
            if (this.sceneEnabled)
            {
                this.sceneRef.placeFurniture(_arg_1);
            };
        }

        public function adjustFurniture(_arg_1:*):*
        {
            if (this.sceneEnabled)
            {
                this.sceneRef.adjustFurniture(_arg_1);
            };
        }

        public function removeFurniture(_arg_1:*):*
        {
            if (this.sceneEnabled)
            {
                this.sceneRef.removeFurniture(_arg_1);
            };
        }

        public function battleExit(_arg_1:Boolean=false):*
        {
            var _local_2:* = this.thisref.stage.getChildAt(0);
            if (_arg_1)
            {
                if (_local_2.myTribe == 1)
                {
                    this.loadNewRoom("Jungle Centre");
                }
                else
                {
                    if (_local_2.myTribe == 2)
                    {
                        this.loadNewRoom("Volcano Centre");
                    };
                };
            }
            else
            {
                if ((((this.previousRoomID) && (_local_2.sceneLists.getZoneSceneName(this.previousRoomID))) && (_local_2.sceneLists.getZoneSceneName(this.previousRoomID).indexOf("home") == -1)))
                {
                    this.loadNewRoom(_local_2.sceneLists.getZoneSceneName(this.previousRoomID));
                }
                else
                {
                    this.loadNewRoom("Battle Zone1");
                };
            };
        }

        public function loadGame(_arg_1:*, _arg_2:Object=null):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            if (!this.gameLoader)
            {
                this.clickEnable = false;
                this.gameLoader = new Loader();
                addChild(this.gameLoader);
                this.gameLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.loadProgressGame);
                this.gameLoader.contentLoaderInfo.addEventListener(Event.INIT, this.initgame);
                this.gameLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.erroropen);
                trace(("load game " + _arg_1));
                addChild(this.gameMask);
                this.gameLoader.mask = this.gameMask;
                this.gameProps = _arg_2;
                if (!((_arg_2) && (_arg_2.AS3)))
                {
                    if (!this.receivingLC)
                    {
                        this.receivingLC = new LocalConnection();
                        this.receivingLC.connect("cocolaniConnector");
                        this.receivingLC.client = this.thisref;
                    };
                    if (!this.sendingLC)
                    {
                        this.sendingLC = new LocalConnection();
                    };
                };
                _local_3 = "";
                if (((!(_arg_2)) || ((_arg_2) && (!(_arg_2.langOverride)))))
                {
                    _local_3 = this.thisref.stage.getChildAt(0).langObj.getLangExtension();
                };
                _local_4 = new URLRequest(((((this.thisref.stage.getChildAt(0).baseURL + "games/") + _arg_1) + _local_3) + ".swf"));
                this.gameLoader.unload();
                this.gameLoader.load(_local_4, this.context);
                _local_5 = getDefinitionByName("mc_progress");
                this.gameLoaderProgress = addChild(new (_local_5)());
                this.gameLoaderProgress.percentagetxt.text = "0%";
                if (((_arg_2) && (_arg_2.size)))
                {
                    this.gameMask.width = _arg_2.size[0];
                    this.gameMask.height = _arg_2.size[1];
                    this.gameLoader.x = ((this.thisref.stage.getChildAt(0).stageScale[0] - _arg_2.size[0]) / 2);
                    this.gameLoader.y = ((this.thisref.stage.getChildAt(0).stageScale[1] - _arg_2.size[1]) / 2);
                    this.gameLoader.y = (this.gameLoader.y - 40);
                }
                else
                {
                    this.gameLoader.x = ((this.thisref.stage.getChildAt(0).stageScale[0] - 600) / 2);
                    this.gameLoader.y = ((this.thisref.stage.getChildAt(0).stageScale[1] - 400) / 2);
                    this.gameLoader.y = (this.gameLoader.y - 40);
                    this.gameMask.width = 600;
                    this.gameMask.height = 400;
                };
                if (((_arg_2) && (_arg_2.xOffset)))
                {
                    this.gameLoader.x = (this.gameLoader.x + _arg_2.xOffset);
                };
                if (((_arg_2) && (_arg_2.yOffset)))
                {
                    this.gameLoader.y = (this.gameLoader.y + _arg_2.yOffset);
                };
                this.gameMask.x = this.gameLoader.x;
                this.gameMask.y = this.gameLoader.y;
                this.gameLoaderProgress.x = ((this.thisref.stage.getChildAt(0).stageScale[0] / 2) - (this.gameLoaderProgress.width / 2));
                this.gameLoaderProgress.y = ((this.thisref.stage.getChildAt(0).stageScale[1] / 2) - (this.gameLoaderProgress.height / 2));
                return (this.gameLoader);
            };
            trace("There is already a game being loaded!");
            return (this.gameLoader);
        }

        public function broadcastGameSound(_arg_1:*):*
        {
            this.sendingLC.send("cocolaniConnectorFrm", "setsound", this.thisref.stage.getChildAt(0).mc_interface.audio.audioMain);
        }

        private function initgame(_arg_1:Event):*
        {
            this.gameRef = _arg_1.target.content;
            trace("INIT GAME....");
            this.gameLoader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, this.loadProgressGame);
            this.gameLoader.contentLoaderInfo.removeEventListener(Event.INIT, this.initgame);
            this.gameLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.erroropen);
            removeChild(this.gameLoaderProgress);
            this.gameLoaderProgress = undefined;
            dispatchEvent(new Event("gameLoaded"));
        }

        public function gameReply(_arg_1:Object):*
        {
            if (((this.gameProps) && (this.gameProps.AS3)))
            {
                this.gameRef.sendResponse(_arg_1);
            }
            else
            {
                if (((this.loadInitProps) && (this.loadInitProps.gameID)))
                {
                    this.sceneRef.sendResponse(_arg_1);
                }
                else
                {
                    this.sendingLC.send("cocolaniConnectorFrm", "highScoreResponse", _arg_1.hs);
                };
            };
        }

        public function gamesAS3Connector(_arg_1:*=null, _arg_2:*=null, _arg_3:*=null, _arg_4:*=null):*
        {
            if (_arg_1 == "SHUTDOWN")
            {
                this.gameShutdown();
                this.clickEnable = true;
                this.gameRef = undefined;
                removeChild(this.gameLoader);
                this.gameLoader.unload();
                this.gameLoader = undefined;
                removeChild(this.gameMask);
                if (this.sceneRef)
                {
                    this.sceneRef.gameObjectClosed();
                };
            }
            else
            {
                if (_arg_1 == "GAMELOADED")
                {
                    this.gameInitialized(_arg_2);
                    return (true);
                };
                this.gamesConnector(_arg_1, _arg_2, _arg_3, _arg_4);
            };
        }

        private function gameInitialized(_arg_1:*):*
        {
            var _local_3:*;
            var _local_2:* = this.thisref.stage.getChildAt(0).loadedAVData.gam;
            if (_local_2 == "")
            {
                _local_2 = [];
            }
            else
            {
                _local_2 = _local_2.split(",");
            };
            this.thisref.stage.getChildAt(0).sendXTmessage({
                "ext":"nav",
                "cmd":"setBusy",
                "t":1
            }, 1);
            if (!this.thisref.stage.getChildAt(0).checkExistInArray(_local_2, _arg_1))
            {
                _local_2.push(_arg_1);
                _local_3 = {
                    "cmd":"plygame",
                    "ext":"gameManager",
                    "id":_arg_1
                };
                this.thisref.stage.getChildAt(0).sendXTmessage(_local_3);
                this.thisref.stage.getChildAt(0).loadedAVData.gam = _local_2.join(",");
                this.thisref.stage.getChildAt(0).mc_interface.playerPopupRef.rewardsContainer.updateStats();
            };
        }

        private function gameShutdown():*
        {
            if (!this.thisref.stage.getChildAt(0).shuttingDown)
            {
                this.thisref.stage.getChildAt(0).sendXTmessage({
                    "ext":"nav",
                    "cmd":"setBusy",
                    "t":undefined
                }, 1);
            };
        }

        public function gamesConnector(param1:*, param2:*=null, param3:*=null, param4:*=null):*
        {
            var req:* = undefined;
            if (param1 == "SHUTDOWN")
            {
                this.gameShutdown();
                this.clickEnable = true;
                this.gameLoader.unload();
                this.receivingLC.close();
                this.gameRef = undefined;
                this.receivingLC = undefined;
                removeChild(this.gameLoader);
                this.gameLoader = undefined;
                removeChild(this.gameMask);
                if (this.sceneRef)
                {
                    try
                    {
                        this.sceneRef.gameObjectClosed();
                        if (this.thisref.stage.getChildAt(0).mc_interface.speechHandlerRef)
                        {
                            this.thisref.stage.getChildAt(0).mc_interface.speechHandlerRef.endgameEvent();
                        };
                    }
                    catch(e:Error)
                    {
                        trace(((("Warning, SHUTDOWN functions hazard exists when shutting down elements during a shutdown. SHUTDOWN = " + thisref.stage.getChildAt(0).shuttingDown) + " .. Error = ") + e));
                    };
                };
            }
            else
            {
                if (param1 == "COLLECTREWARDS")
                {
                    req = new Object();
                    req.cmd = "collectRewards";
                    req.ext = "gameManager";
                    req.rwd = param2;
                    req.gid = param3;
                }
                else
                {
                    if (param1 == "HIGHSCORE")
                    {
                        req = new Object();
                        req.cmd = "submitHS";
                        req.ext = "gameManager";
                        req.hs = param2;
                        req.win = param3;
                        req.gid = param4;
                        req.prm = new Date().getTime();
                        req.agent = String(ExternalInterface.call("window.navigator.userAgent.toString"));
                        req.prm2 = MD5.encrypt((((req.hs + "IPledgePeaceAndLoveOnEarth") + req.prm) + this.thisref.stage.getChildAt(0).sfs.myUserId));
                        this.thisref.stage.getChildAt(0).sendXTmessage(req);
                        if (this.thisref.stage.getChildAt(0).mc_interface.speechHandlerRef)
                        {
                            this.thisref.stage.getChildAt(0).mc_interface.speechHandlerRef.fingameEvent(param2, param3);
                        };
                        if (this.sceneRef)
                        {
                            this.sceneRef.gameMessage(param1, param2, param3, param4);
                        };
                    }
                    else
                    {
                        if (param1 == "SENDHACK")
                        {
                            req = new Object();
                            req.cmd = "hack";
                            req.gid = param2;
                            req.hs = param3;
                            req.ext = "gameManager";
                            this.thisref.stage.getChildAt(0).sendXTmessage(req);
                        }
                        else
                        {
                            if (param1 == "GETSCORES")
                            {
                                req = new Object();
                                req.cmd = "getHS";
                                req.ext = "gameManager";
                                req.gid = param2;
                                this.thisref.stage.getChildAt(0).sendXTmessage(req);
                            }
                            else
                            {
                                if (param1 == "SCENEMESSAGE")
                                {
                                    if (this.thisref.sceneRef)
                                    {
                                        this.thisref.sceneRef.gameMessage(param2, param3, param4);
                                    };
                                }
                                else
                                {
                                    if (param1 == "getaudio")
                                    {
                                        this.sendingLC.send("cocolaniConnectorFrm", "setsound", this.thisref.stage.getChildAt(0).mc_interface.audio.audioMain);
                                    }
                                    else
                                    {
                                        if (param1 == "GAMELOADED")
                                        {
                                            this.gameInitialized(param2);
                                            this.sendingLC.send("cocolaniConnectorFrm", "permToPlay", true);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        private function loadProgressGame(_arg_1:ProgressEvent):*
        {
            if (this.gameLoaderProgress)
            {
                this.gameLoaderProgress.percentagetxt.text = (Math.round(((_arg_1.bytesLoaded / _arg_1.bytesTotal) * 100)) + "%");
            };
        }

        public function loadHome(_arg_1:*, _arg_2:*, _arg_3:*=false, _arg_4:Boolean=false):*
        {
            var _local_6:*;
            var _local_5:* = this.thisref.stage.getChildAt(0);
            if ((((!(_arg_4)) && (!(_local_5.currentTribe == _arg_1))) && (_local_5.statusType < 7)))
            {
                _local_5.showmsg(_local_5.langObj.getText("hom32"));
                return;
            };
            this.loadNewRoomID = undefined;
            this.loadInitProps = null;
            this.loadHomeID = _arg_2;
            this.loadTribeID = _arg_1;
            this.loadInternalHome = _arg_3;
            this.thisref.stage.getChildAt(0).currentTribe = _arg_1;
            if (this.sceneRef)
            {
                _local_6 = new BitmapData(945, 600, false, 0);
                _local_6.draw(this.sceneLoader, null, null, null, new Rectangle(0, 0, 945, 600), true);
                this.bitmapct = new Bitmap(_local_6, PixelSnapping.NEVER, true);
                this.sceneRef.shutdown();
                this.thisref.stage.getChildAt(0).mc_interface.scroller.disableScroller();
                if (this.thisref.stage.getChildAt(0).sfs.activeRoomId)
                {
                    if (this.thisref.stage.getChildAt(0).sfs.activeRoomId != this.loadingRoomID)
                    {
                        this.thisref.stage.getChildAt(0).sfs.leaveRoom(this.thisref.stage.getChildAt(0).sfs.activeRoomId);
                    };
                };
                this.thisref.stage.getChildAt(0).sfs.joinRoom(_local_5.sceneLists.getID("Transition"));
                if ((((this.loadingRoomID) && (this.loadingRoomID > 0)) && (!(this.thisref.stage.getChildAt(0).sfs.activeRoomId == this.loadingRoomID))))
                {
                    this.thisref.stage.getChildAt(0).sfs.leaveRoom(this.loadingRoomID);
                };
            };
            if (_arg_3)
            {
                this.loadScene((("home_tribe" + _arg_1) + "_interior.swf"), _arg_4);
            }
            else
            {
                this.loadScene((("home_tribe" + _arg_1) + "_exterior.swf"), _arg_4);
            };
            this.thisref.stage.getChildAt(0).mc_interface.disableForLoad();
        }

        public function getEgoReference():*
        {
            var _local_1:* = this.thisref.stage.getChildAt(0);
            var _local_2:* = _local_1.sfs.getActiveRoom();
            return (_local_2.getUser(_local_1.sfs.myUserId));
        }

        public function exitFullScreenGame():*
        {
            var _local_1:*;
            if (this.previousRoomID > 0)
            {
                _local_1 = this.thisref.stage.getChildAt(0);
                this.loadNewRoom(_local_1.sceneLists.getSceneName(this.previousRoomID), false);
            };
        }

        public function getRootRoomID():*
        {
            return (this.loadingRoomID);
        }

        public function loadNewRoom(_arg_1:*, _arg_2:*=false, _arg_3:Object=undefined):*
        {
            var _local_4:* = this.thisref.stage.getChildAt(0);
            if (((!(_arg_2)) && (_arg_1 == _local_4.sfs.getActiveRoom().getName())))
            {
                _local_4.showmsg(_local_4.langObj.getText("err09"));
                return;
            };
            this.loadInitProps = _arg_3;
            this.loadHomeID = null;
            var _local_5:* = new BitmapData(945, 600, false, 0);
            _local_5.draw(this.sceneLoader, null, null, null, new Rectangle(0, 0, 945, 600), true);
            this.bitmapct = new Bitmap(_local_5, PixelSnapping.NEVER, true);
            this.sceneRef.shutdown();
            this.thisref.stage.getChildAt(0).mc_interface.scroller.disableScroller();
            if (this.thisref.stage.getChildAt(0).sfs.activeRoomId)
            {
                if (this.thisref.stage.getChildAt(0).sfs.activeRoomId != this.loadingRoomID)
                {
                    this.thisref.stage.getChildAt(0).sfs.leaveRoom(this.thisref.stage.getChildAt(0).sfs.activeRoomId);
                };
            };
            this.thisref.stage.getChildAt(0).sfs.joinRoom(_local_4.sceneLists.getID("Transition"));
            if (this.thisref.stage.getChildAt(0).sfs.getRoom(this.loadingRoomID).getName() == "GamesRoom")
            {
                this.thisref.stage.getChildAt(0).sfs.leaveRoom(this.loadingRoomID);
            };
            this.loadScene(_arg_1, false, _arg_2);
            this.thisref.stage.getChildAt(0).mc_interface.disableForLoad();
        }

        public function loadScene(_arg_1:*, _arg_2:Boolean=false, _arg_3:Boolean=false):*
        {
            var _local_5:*;
            var _local_8:*;
            var _local_9:*;
            var _local_4:* = this.thisref.stage.getChildAt(0);
            this.sceneRef = undefined;
            if (!_arg_3)
            {
                trace(("Load room " + _arg_1));
                _local_5 = _local_4.sceneLists.getFileByRoom(_arg_1);
                trace(("RETRIEVED FILENAME HERE: " + _local_5));
            }
            else
            {
                if (((this.loadInitProps) && (this.loadInitProps.gameID == 19)))
                {
                    _local_5 = "yek_skiing.swf";
                }
                else
                {
                    _local_5 = "war1/war.swf";
                };
            };
            this.previousRoomID = this.loadingRoomID;
            this.loadingRoomID = _local_4.sceneLists.getID(_arg_1);
            var _local_6:* = 1;
            if (!this.loadExtraResources)
            {
                if (this.sceneRef)
                {
                    this.sceneRef.removeEventListener(MouseEvent.MOUSE_DOWN, this.gotclick);
                };
                this.thisref.visible = true;
                if (!contains(this.sceneHolder))
                {
                    addChild(this.sceneHolder);
                };
                this.sceneLoader.unload();
                if (this.preloaderRef)
                {
                    removeChild(this.preloaderRef);
                    this.preloaderRef = undefined;
                };
                _local_8 = getDefinitionByName("mc_progress2");
                this.preloaderRef = addChild(new (_local_8)());
                if (!_arg_2)
                {
                    this.preloaderRef.bgd.visible = false;
                    _local_9 = new Shape();
                    _local_9.graphics.beginFill(0);
                    _local_9.graphics.drawRect(0, 0, 945, 600);
                    _local_9.graphics.endFill();
                    _local_9.alpha = 0;
                    this.preloaderRef.addChildAt(_local_9, 0);
                    this.fadetw = new Tween(_local_9, "alpha", None.easeNone, 0, 0.7, 4, false);
                    this.preloaderRef.addChildAt(this.bitmapct, 0);
                };
                this.preloaderRef.percentagetxt.text = "0%";
                this.preloaderRef.gotoAndStop(1);
                this.preloaderRef.gfx.maskReveal.y = 80;
                if (((this.firstLoad) && (this.thisref.stage.getChildAt(0).MOTD)))
                {
                    _local_4.langObj.setTextJustify(this.preloaderRef.MOTD, this.thisref.stage.getChildAt(0).MOTD, {
                        "htmlText":true,
                        "forceAlign":"center"
                    });
                    this.firstLoad = false;
                }
                else
                {
                    this.preloaderRef.MOTD.text = "";
                };
                if (!this.sceneHolder.contains(this.sceneLoader))
                {
                    this.sceneHolder.addChild(this.sceneLoader);
                };
            };
            var _local_7:* = _local_4.sceneLists.getTribeByFile(_local_5);
            if (((_local_7 > 0) && (_local_4.tribeAudioLoaded.indexOf(_local_7) == -1)))
            {
                _local_4.tribeAudioLoaded.push(_local_7);
                _local_4.resourceloader.addResources([(("sfx_tribe" + _local_7) + ".swf")], "audio");
                this.loadExtraResources = true;
                this.saveFNProps = [this.loadScene, [_arg_1, _arg_2, _arg_3]];
                this.waitForResourceLoad();
            }
            else
            {
                if (!_arg_3)
                {
                    this.urlReq = new URLRequest(((this.thisref.stage.getChildAt(0).baseURL + "scenes/") + _local_5));
                }
                else
                {
                    this.urlReq = new URLRequest(((this.thisref.stage.getChildAt(0).baseURL + "games/") + _local_5));
                };
                this.sceneLoader.load(this.urlReq, this.context);
                this.thisref.stage.getChildAt(0).mc_interface.hidePanel("speechHandler");
            };
        }

        private function waitForResourceLoad():*
        {
            var _local_1:* = this.thisref.stage.getChildAt(0);
            _local_1.resourceloader.addEventListener("update_loader", this.updateProgress);
            _local_1.resourceloader.addEventListener("loading_fin", this.finishResourceLoading);
        }

        private function updateProgress(_arg_1:ProgressEvent):*
        {
            if (this.preloaderRef)
            {
                this.preloaderRef.percentagetxt.text = (Math.round(((_arg_1.bytesLoaded / _arg_1.bytesTotal) * 100)) + "%");
            };
        }

        private function finishResourceLoading(_arg_1:Event):*
        {
            var _local_2:* = this.thisref.stage.getChildAt(0);
            _local_2.resourceloader.removeEventListener("update_loader", this.updateProgress);
            _local_2.resourceloader.removeEventListener("loading_fin", this.finishResourceLoading);
            this.saveFNProps[0].apply(null, this.saveFNProps[1]);
            this.saveFNProps = [];
            this.loadExtraResources = false;
        }

        private function finloading(_arg_1:Event):*
        {
            this.sceneRef = _arg_1.target.content;
        }

        private function init(_arg_1:Event):*
        {
            this.sceneRef = _arg_1.target.content;
            this.sceneRef.x = 0;
            this.clickPad.addEventListener(MouseEvent.MOUSE_DOWN, this.gotclick);
            this.clickEnable = true;
            if (((this.loadingRoomID == -1) && (this.thisref.stage.getChildAt(0).hasJoinedRoom)))
            {
                this.joinhome();
            }
            else
            {
                if (this.sceneRef.isReady)
                {
                    this.thisref.stage.getChildAt(0).joinroom(this.loadingRoomID);
                };
            };
            if (this.loadInitProps)
            {
                if (this.loadInitProps.battlegame)
                {
                    this.sceneRef.setGameType(this.loadInitProps.battle);
                    this.sceneRef.setGameProps(this.loadInitProps);
                };
            };
        }

        public function sceneReady():*
        {
            this.thisref.stage.getChildAt(0).joinroom(this.loadingRoomID);
        }

        public function joinhome():*
        {
            var _local_1:* = {};
            _local_1.cmd = "home";
            _local_1.ext = "home";
            _local_1.hid = this.loadHomeID;
            _local_1.tid = this.loadTribeID;
            if (this.loadInternalHome)
            {
                _local_1.ins = true;
            };
            this.thisref.stage.getChildAt(0).sendXTmessage(_local_1);
        }

        public function joinroom(_arg_1:*):*
        {
            var _local_2:*;
            var _local_3:*;
            if (((((_arg_1.isGame() == false) && (!(_arg_1.getName() == "GamesRoom"))) && (!(_arg_1.getName() == "Transition"))) && (!(_arg_1.getVariable("gam")))))
            {
                this.loadingRoomID = _arg_1.getId();
            };
            if (_arg_1.getVariable("gam") == 1)
            {
                this.sceneRef.gameRoomJoined(_arg_1);
                return;
            };
            if (((this.preloaderRef) && (this.sceneRef.isReady)))
            {
                this.preloaderRef.gotoAndStop(2);
            };
            if (((!(isNaN(_arg_1.getVariable("tb")))) && (!(this.thisref.stage.getChildAt(0).currentTribe == _arg_1.getVariable("tb")))))
            {
                this.thisref.stage.getChildAt(0).currentTribe = _arg_1.getVariable("tb");
                this.thisref.stage.getChildAt(0).mc_interface.bt_currency.refreshCredit();
                if (((this.thisref.stage.getChildAt(0).mc_interface.playerPopupRef) && (this.thisref.stage.getChildAt(0).mc_interface.playerPopupRef.mapContainer)))
                {
                    this.thisref.stage.getChildAt(0).mc_interface.playerPopupRef.mapContainer.updateTribe();
                };
            };
            this.sceneRef.joinRoom(_arg_1);
            this.thisref.stage.getChildAt(0).mc_interface.enableForLoad();
            if (((_arg_1.isGame() == false) && (!(_arg_1.getName() == "GamesRoom"))))
            {
                this.thisref.stage.frameRate = 20;
                _local_2 = (_arg_1.getVariable("tb") == this.thisref.stage.getChildAt(0).myTribe);
                if (((this.loadHomeID) && (!(isNaN(this.thisref.stage.getChildAt(0).myHomeAddr)))))
                {
                    _local_3 = ((_arg_1.getName().substr(4, 2) == "In") ? true : false);
                    if ((((!(_local_3)) && (int((this.thisref.stage.getChildAt(0).myHomeAddr / 3)) == Number(_arg_1.getVariable("addr")))) && (_local_2)))
                    {
                        this.thisref.stage.getChildAt(0).mc_interface.bt_home.visible = false;
                    }
                    else
                    {
                        if ((((_local_3) && (Number(_arg_1.getVariable("addr")) == Number(this.thisref.stage.getChildAt(0).myHomeAddr))) && (_local_2)))
                        {
                            this.thisref.stage.getChildAt(0).mc_interface.bt_home.visible = false;
                        }
                        else
                        {
                            this.thisref.stage.getChildAt(0).mc_interface.bt_home.visible = true;
                        };
                    };
                }
                else
                {
                    if (!isNaN(this.thisref.stage.getChildAt(0).myHomeAddr))
                    {
                        this.thisref.stage.getChildAt(0).mc_interface.bt_home.visible = true;
                    };
                };
            }
            else
            {
                this.thisref.stage.frameRate = 25;
                this.thisref.stage.getChildAt(0).mc_interface.bt_home.visible = true;
            };
        }

        private function loadProgress(_arg_1:ProgressEvent):*
        {
            this.preloaderRef.percentagetxt.text = (Math.round(((_arg_1.bytesLoaded / _arg_1.bytesTotal) * 100)) + "%");
            this.preloaderRef.gfx.maskReveal.y = (80 - (130 * (_arg_1.bytesLoaded / _arg_1.bytesTotal)));
        }

        private function erroropen(_arg_1:IOErrorEvent):*
        {
            this.clickEnable = false;
            this.thisref.stage.getChildAt(0).showmsg(("THERE WAS A LOAD ERROR : " + _arg_1));
        }

        public function removePreloader():*
        {
            this.sceneRef.setupScrollers();
            this.fadetw = new Tween(this.preloaderRef, "alpha", None.easeNone, 1, 0, 3, false);
            this.fadetw.addEventListener(TweenEvent.MOTION_FINISH, this.finclosePreloader);
        }

        private function finclosePreloader(_arg_1:TweenEvent):*
        {
            removeChild(this.preloaderRef);
            this.preloaderRef = undefined;
        }

        private function opennew(_arg_1:Event):*
        {
        }

        public function gotclick(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            if (((!(this.lastClickOnPad)) || ((this.lastClickOnPad) && ((getTimer() - this.lastClickOnPad) > this.maxClickTime))))
            {
                if (((this.clickEnable) && (this.sceneEnabled)))
                {
                    if (this.sceneRef)
                    {
                        this.lastClickOnPad = getTimer();
                        _local_2 = this.sceneRef.globalToLocal(new Point(_arg_1.stageX, _arg_1.stageY));
                        _local_2.x = Math.round(_local_2.x);
                        _local_2.y = Math.round(_local_2.y);
                        this.sceneRef.walkAV(_local_2);
                        if (this.thisref.stage.getChildAt(0).mc_interface.speechHandlerRef)
                        {
                            this.thisref.stage.getChildAt(0).mc_interface.speechHandlerRef.shutdown();
                        };
                    };
                };
            };
        }

        private function clickthroughSpeech(_arg_1:MouseEvent):*
        {
            this.gotclick(_arg_1);
        }

        public function playerAction(_arg_1:*):*
        {
            if (this.sceneEnabled)
            {
                this.sceneRef.userAction(_arg_1);
            };
        }

        public function publicmessage(_arg_1:*, _arg_2:*, _arg_3:*):*
        {
            if (((this.sceneEnabled) && (this.sceneRef)))
            {
                this.sceneRef.usermessage(_arg_1, _arg_2, _arg_3);
            };
        }

        public function setPreloaderMessage(_arg_1:String):*
        {
            if (this.preloaderRef)
            {
                this.preloaderRef.MOTD.htmlText = _arg_1;
            };
        }

        public function setPreloaderAttrib(_arg_1:Object):*
        {
            if (this.preloaderRef)
            {
                switch (_arg_1.type)
                {
                    case "updatePerc":
                        this.preloaderRef.percentagetxt.text = (_arg_1.perc + "%");
                        return;
                };
            };
        }

        public function logout():*
        {
            this.firstLoad = true;
            this.thisref.stage.frameRate = 20;
            if (this.receivingLC)
            {
                if (this.sendingLC)
                {
                    this.sendingLC.send("cocolaniConnectorFrm", "SHUTDOWN");
                };
                this.gamesConnector("SHUTDOWN");
            };
            this.loadHomeID = undefined;
            this.loadTribeID = undefined;
            this.loadInitProps = {};
            if (((this.gameMask) && (getChildByName("gameMask"))))
            {
                removeChild(this.gameMask);
            };
            this.clickPad.removeEventListener(MouseEvent.MOUSE_DOWN, this.gotclick);
            if (this.sceneRef)
            {
                this.sceneRef.shutdown();
            };
            this.thisref.stage.getChildAt(0).mc_interface.scroller.disableScroller();
            this.sceneRef = undefined;
            this.thisref.visible = false;
            this.clickEnable = false;
            if (this.gameLoaderProgress)
            {
                removeChild(this.gameLoaderProgress);
            };
            if (this.gameLoader)
            {
                this.gameLoader.unload();
                removeChild(this.gameLoader);
            };
            this.gameLoader = undefined;
            this.sceneLoader.unload();
            this.thisref.stage.getChildAt(0).resourceloader.removeEventListener("update_loader", this.updateProgress);
            this.thisref.stage.getChildAt(0).resourceloader.removeEventListener("loading_fin", this.finishResourceLoading);
            this.loadExtraResources = false;
            this.saveFNProps = [];
        }


    }
}//package com.cocolani

//------------------------------------------------------------
//com.cocolani.sceneObject

package com.cocolani
{
    import flash.display.MovieClip;
    import flash.geom.Point;
    import flash.filters.GlowFilter;
    import flash.filters.BitmapFilterQuality;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.display.Shape;

    public dynamic class sceneObject extends MovieClip 
    {

        public var thisref:*;
        public var objid:*;
        public var thisYcoord:Point;
        public var stageRef:*;
        public var sceneRef:*;
        public var seating:*;
        public var handlesOptions:* = false;
        internal var requiresLayering:*;
        internal var hasBlackBorder:* = false;
        internal var unselectFilter:*;
        internal var selectFilter2:*;
        public var ownsInteractity:* = false;
        protected var objSeperated:* = false;
        public var distanceToActive:* = 200;
        public var internalFunctions:* = false;

        public function sceneObject()
        {
            this.thisref = this;
            this.seating = [];
            this.unselectFilter = new GlowFilter(0, 1, 1.5, 1.5, 25, BitmapFilterQuality.MEDIUM, false, false);
            this.selectFilter2 = new GlowFilter(0xFFFFFF, 1, 8, 8, 2, BitmapFilterQuality.MEDIUM, false, false);
            super();
            stop();
            if (getChildByName("yline"))
            {
                this.thisref.yline.visible = false;
            }
            else
            {
                trace(("No yline present in object:" + this.thisref.name));
                this.thisref.alpha = 0.5;
            };
            addEventListener(Event.ADDED_TO_STAGE, this.init);
            mouseEnabled = false;
            mouseChildren = false;
        }

        public function optionResult(_arg_1:*):*
        {
            if (this.stageRef.mc_scene.sceneRef)
            {
                this.stageRef.mc_scene.sceneRef.hideOptions();
                if (_arg_1 == 7)
                {
                };
            };
        }

        public function get mySeating():*
        {
            return ([1]);
        }

        public function updateY():*
        {
            this.thisYcoord = this.thisref.localToGlobal(new Point(this.thisref.yline.x, this.thisref.yline.y));
            if (this.sceneRef)
            {
                this.sceneRef.setObjY(this.thisref, this.thisYcoord.y);
            };
        }

        public function gotClick():*
        {
        }

        private function init(_arg_1:Event):*
        {
            if (!this.thisref.stage.getChildAt(0).getChildByName("mc_scene"))
            {
                trace("SORRY THESE OBJECTS CANNOT RUN IN STANDALONE MODE.");
                return;
            };
            if (!this.thisref.getChildByName("yline"))
            {
                trace((("Warning : " + this.thisref.name) + " is missing a yline."));
            }
            else
            {
                this.thisYcoord = this.thisref.localToGlobal(new Point(this.thisref.yline.x, this.thisref.yline.y));
            };
            this.stageRef = this.thisref.stage.getChildAt(0);
            this.sceneRef = this.stageRef.mc_scene.sceneRef;
            if (this.thisref.parent.getChildByName("background"))
            {
                this.thisref.parent.setObjY(this.thisref, this.thisYcoord.y);
            };
            this.seating = this.mySeating;
            this.initSettings();
        }

        private function initSettings():*
        {
            if (this.getoptions().length > 1)
            {
                this.handlesOptions = true;
                this.setInteractive();
            };
        }

        public function setBorder():*
        {
            this.hasBlackBorder = true;
            this.thisref.filters = [this.unselectFilter];
        }

        private function clickthrough(_arg_1:MouseEvent):*
        {
            if (_arg_1.type == "click")
            {
                this.stageRef.mc_scene.gotclick(_arg_1);
            };
        }

        public function setChildren(_arg_1:Array):*
        {
            var _local_3:*;
            var _local_4:*;
            mouseChildren = true;
            mouseEnabled = false;
            var _local_2:* = 0;
            while (_local_2 < numChildren)
            {
                _local_3 = false;
                _local_4 = 0;
                while (_local_4 < _arg_1.length)
                {
                    if (getChildAt(_local_2).name == _arg_1[_local_4])
                    {
                        _local_3 = true;
                        this.thisref.getChildAt(_local_2).mouseEnabled = true;
                        this.thisref.getChildAt(_local_2).mouseChildren = false;
                        trace(("found child on " + this.thisref.name));
                        break;
                    };
                    _local_4++;
                };
                if (!_local_3)
                {
                    if ((this.thisref.getChildAt(_local_2) is Shape))
                    {
                        trace((("PROBLEM -- THERE IS A SHAPE IN THE OBJECT CALLED " + this.thisref.name) + ". CLICKING ON THIS WILL NOT PASS THROUGH TO LOWER LAYERS!"));
                    }
                    else
                    {
                        this.thisref.getChildAt(_local_2).addEventListener(MouseEvent.CLICK, this.clickthrough);
                        this.thisref.getChildAt(_local_2).mouseEnabled = false;
                        this.thisref.getChildAt(_local_2).mouseChildren = false;
                    };
                };
                _local_2++;
            };
        }

        public function setInteractive():*
        {
            mouseEnabled = true;
            this.ownsInteractity = true;
            this.thisref.addEventListener(MouseEvent.MOUSE_OVER, this.mousecatcher);
            addEventListener(MouseEvent.MOUSE_OUT, this.mousecatcher);
            addEventListener(MouseEvent.CLICK, this.mousecatcher);
            this.thisref.buttonMode = true;
            if (this.hasBlackBorder)
            {
                this.thisref.filters = [this.unselectFilter];
            }
            else
            {
                this.thisref.filters = [];
            };
        }

        public function removeInteractive():*
        {
            mouseEnabled = true;
            this.ownsInteractity = false;
            this.thisref.removeEventListener(MouseEvent.MOUSE_OVER, this.mousecatcher);
            removeEventListener(MouseEvent.MOUSE_OUT, this.mousecatcher);
            removeEventListener(MouseEvent.CLICK, this.mousecatcher);
            this.thisref.buttonMode = false;
            if (this.hasBlackBorder)
            {
                this.thisref.filters = [this.unselectFilter];
            }
            else
            {
                this.thisref.filters = [];
            };
        }

        public function getoptions():*
        {
            var _local_1:* = [];
            _local_1.push({"id":5});
            return (_local_1);
        }

        public function mousecatcher(_arg_1:MouseEvent):*
        {
            this.sceneRef = this.stageRef.mc_scene.sceneRef;
            if ((((!(this.stageRef.getChildByName("mc_scene"))) || (this.distanceToActive == -1)) || (this.sceneRef.getDistanceToObject(this.thisref) <= this.distanceToActive)))
            {
                buttonMode = true;
                if (_arg_1.type == "mouseOver")
                {
                    if (this.hasBlackBorder)
                    {
                        _arg_1.currentTarget.filters = [this.unselectFilter, this.selectFilter2];
                    }
                    else
                    {
                        _arg_1.currentTarget.filters = [this.selectFilter2];
                    };
                }
                else
                {
                    if (_arg_1.type == "click")
                    {
                        if (this.stageRef.mc_interface.speechHandlerRef)
                        {
                            this.stageRef.mc_interface.speechHandlerRef.shutdown();
                        };
                        if (this.handlesOptions)
                        {
                            this.stageRef.mc_scene.sceneRef.newOptions(this.thisref, this.getoptions());
                        }
                        else
                        {
                            this.stageRef.mc_scene.sceneRef.roomObjClicked(this.thisref);
                        };
                        if (this.internalFunctions)
                        {
                            this.gotClick();
                        };
                    }
                    else
                    {
                        if (this.hasBlackBorder)
                        {
                            _arg_1.currentTarget.filters = [this.unselectFilter];
                        }
                        else
                        {
                            _arg_1.currentTarget.filters = [];
                        };
                    };
                };
            }
            else
            {
                buttonMode = false;
                if (this.hasBlackBorder)
                {
                    _arg_1.currentTarget.filters = [this.unselectFilter];
                }
                else
                {
                    _arg_1.currentTarget.filters = [];
                };
                if (_arg_1.type == "click")
                {
                    this.stageRef.mc_scene.gotclick(_arg_1);
                };
            };
        }

        public function isinfrontof(_arg_1:*):*
        {
            return (_arg_1 > this.thisYcoord);
        }

        public function getY():*
        {
            return (this.thisYcoord.y);
        }

        public function enableMouse():*
        {
            mouseEnabled = true;
        }


    }
}//package com.cocolani

//------------------------------------------------------------
//com.cocolani.sceneObjectSit

package com.cocolani
{
    import flash.events.MouseEvent;
    import flash.geom.Point;

    public class sceneObjectSit extends sceneObject 
    {

        public var seatinglist:* = [];
        public var seatID:*;
        public var myDir:* = 1;
        public var sitDistance:* = 80;
        public var handlesSeating:* = false;

        public function sceneObjectSit()
        {
            ownsInteractity = true;
        }

        public function commonSceneObjClick(_arg_1:*):*
        {
        }

        override public function optionResult(_arg_1:*):*
        {
            var _local_2:*;
            var _local_3:*;
            if (stageRef.mc_scene.sceneRef)
            {
                stageRef.mc_scene.sceneRef.hideOptions();
                if (_arg_1 == 7)
                {
                    if (((this.sitDistance == -1) || (stageRef.mc_scene.sceneRef.getDistanceToObject(thisref) <= this.sitDistance)))
                    {
                        if (this.handlesSeating)
                        {
                            this.commonSceneObjClick(_arg_1);
                        }
                        else
                        {
                            _local_2 = this.getSpareSeat();
                            if (_local_2.length > 0)
                            {
                                stageRef.mc_scene.sceneRef.avatarSit(stageRef.mc_scene.sceneRef.egoref, thisref, _local_2[0]);
                                _local_3 = {};
                                _local_3.stob = this.seatID;
                                _local_3.stsid = _local_2[0];
                                stageRef.sendXTmessage({
                                    "ext":"nav",
                                    "cmd":"sit",
                                    "t":_local_3
                                }, 1);
                                this.setInteractiveChildren();
                            }
                            else
                            {
                                stageRef.showmsg(stageRef.langObj.getText("com09"));
                            };
                        };
                    }
                    else
                    {
                        stageRef.mc_interface.feedback.revealmessage(stageRef.langObj.getText("com00"), "");
                    };
                }
                else
                {
                    if (_arg_1 == 8)
                    {
                        stageRef.mc_scene.sceneRef.avatarStand(stageRef.mc_scene.sceneRef.egoref, thisref);
                        _local_3 = {};
                        _local_3.stob = undefined;
                        _local_3.stsid = undefined;
                        stageRef.sendXTmessage({
                            "ext":"nav",
                            "cmd":"sit",
                            "t":_local_3
                        }, 1);
                        trace("Stand up....");
                    };
                };
            };
        }

        public function setInteractiveChildren():*
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:*;
            if (ownsInteractity)
            {
                if (this.seatinglist.length > 0)
                {
                    objSeperated = true;
                    mouseEnabled = true;
                    mouseChildren = true;
                    removeEventListener(MouseEvent.MOUSE_OVER, mousecatcher);
                    removeEventListener(MouseEvent.MOUSE_OUT, mousecatcher);
                    removeEventListener(MouseEvent.CLICK, mousecatcher);
                    thisref.buttonMode = false;
                    _local_1 = ["fgd", "bgd"];
                    _local_2 = 0;
                    while (_local_2 < _local_1.length)
                    {
                        _local_3 = getChildByName(_local_1[_local_2]);
                        if (_local_3)
                        {
                            _local_3.addEventListener(MouseEvent.MOUSE_OVER, mousecatcher);
                            _local_3.addEventListener(MouseEvent.MOUSE_OUT, mousecatcher);
                            _local_3.addEventListener(MouseEvent.CLICK, mousecatcher);
                            _local_3.mouseChildren = false;
                            _local_3.buttonMode = true;
                        };
                        _local_2++;
                    };
                }
                else
                {
                    mouseChildren = false;
                    addEventListener(MouseEvent.MOUSE_OVER, mousecatcher);
                    addEventListener(MouseEvent.MOUSE_OUT, mousecatcher);
                    addEventListener(MouseEvent.CLICK, mousecatcher);
                    thisref.buttonMode = true;
                    _local_1 = ["fgd", "bgd"];
                    _local_2 = 0;
                    while (_local_2 < _local_1.length)
                    {
                        _local_3 = getChildByName(_local_1[_local_2]);
                        _local_3.removeEventListener(MouseEvent.MOUSE_OVER, mousecatcher);
                        _local_3.removeEventListener(MouseEvent.MOUSE_OUT, mousecatcher);
                        _local_3.removeEventListener(MouseEvent.CLICK, mousecatcher);
                        _local_2++;
                    };
                };
            };
        }

        public function releaseSeat(_arg_1:*=1):*
        {
            this.seatinglist[_arg_1] = undefined;
            this.destroy();
        }

        public function destroy():*
        {
        }

        public function releaseAV(_arg_1:*):*
        {
            var _local_2:*;
            for (_local_2 in this.seatinglist)
            {
                if (_arg_1.sfsAV.getId() == this.seatinglist[_local_2].sfsAV.getId())
                {
                    this.releaseSeat(_local_2);
                };
            };
        }

        public function avSit(_arg_1:*, _arg_2:*):*
        {
            trace(("sitpos 1 = " + thisref.sitpos1));
            trace(("seating list = " + this.seatinglist));
            this.seatinglist[_arg_2] = _arg_1;
            thisref.sitpos1.addChild(_arg_1);
            _arg_1.x = 0;
            _arg_1.y = 0;
            this.setInteractiveChildren();
        }

        public function avStand(_arg_1:*):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_2:* = false;
            for (_local_3 in this.seatinglist)
            {
                if (this.seatinglist[_local_3])
                {
                    if (this.seatinglist[_local_3].sfsAV.getName() == _arg_1.sfsAV.getName())
                    {
                        _local_4 = _local_3;
                        thisref[("sitpos" + _local_4)].removeChild(this.seatinglist[_local_4]);
                        _local_5 = thisref.localToGlobal(new Point(thisref[("standpos" + _local_4)].x, thisref[("standpos" + _local_4)].y));
                        _local_5 = stageRef.mc_scene.sceneRef.globalToLocal(_local_5);
                        _arg_1.x = _local_5.x;
                        _arg_1.y = _local_5.y;
                        this.seatinglist[_local_4] = undefined;
                        _local_2 = true;
                    };
                };
            };
            if (!_local_2)
            {
                thisref.stage.getChildAt(0).showmsg("Problem in object. Please contact technical support.>");
            };
        }

        override public function get mySeating():*
        {
            return ([1]);
        }

        override public function getoptions():*
        {
            var _local_1:* = [];
            if ((((!(stageRef.mc_scene.sceneRef)) || (stageRef.mc_scene.sceneRef.egoref.isSitting == false)) || (this.isEgoSittingHere())))
            {
                if (this.isEgoSitting())
                {
                    _local_1.push({"id":8});
                }
                else
                {
                    if (this.getSpareSeat().length > 0)
                    {
                        _local_1.push({"id":7});
                    };
                };
            };
            _local_1.push({"id":5});
            return (_local_1);
        }

        public function getSpareSeat():*
        {
            var _local_2:*;
            var _local_1:* = [];
            for (_local_2 in this.mySeating)
            {
                if (!this.seatinglist[this.mySeating[_local_2]])
                {
                    _local_1.push(this.mySeating[_local_2]);
                };
            };
            return (_local_1);
        }

        public function isEgoSittingHere():*
        {
            var _local_1:*;
            for (_local_1 in this.seatinglist)
            {
                if (this.seatinglist[_local_1].isego)
                {
                    return (true);
                };
            };
            return (false);
        }

        public function isEgoSitting():*
        {
            var _local_1:*;
            for (_local_1 in this.seatinglist)
            {
                if (stageRef.mc_scene.sceneRef.egoref == this.seatinglist[_local_1])
                {
                    return (true);
                };
            };
            return (false);
        }


    }
}//package com.cocolani

//------------------------------------------------------------
//com.cocolani.signin

package com.cocolani
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.text.TextFormat;
    import flash.events.FocusEvent;
    import flash.external.ExternalInterface;
    import flash.utils.getDefinitionByName;
    import flash.display.LoaderInfo;
    import fl.transitions.Tween;
    import fl.transitions.easing.None;
    import fl.transitions.TweenEvent;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;
    import flash.events.IOErrorEvent;
    import com.gsolo.encryption.MD5;
    import flash.net.URLRequest;
    import flash.net.URLLoader;
    import flash.net.URLVariables;
    import flash.events.*;
    import fl.transitions.easing.*;

    public class signin extends MovieClip 
    {

        protected static const WINDOW_OPEN_FUNCTION:String = "window.open";

        public var utext:TextField;
        public var ptext:TextField;
        public var password:TextField;
        public var bt_forgotpassword:bt_loginstandard;
        public var username:TextField;
        public var bt_login:bt_loginstandard;
        public var tgt:MovieClip;
        internal var sfsref:*;
        internal var thisref:*;
        internal var loginbtEnabled:* = true;
        public var loginDetails:*;
        public var customLoginDetails:*;
        private var customLoginXML:XML;
        internal var stageref:*;
        internal var mytw:*;
        public var bgd:*;
        public var bgdRef:*;
        public var bgdContainer:*;
        public var notAnimating:Boolean = false;
        public var miniRegisterSeq:* = false;
        public var loginBeenSent:* = false;

        public function signin()
        {
            this.thisref = this;
            this.loginDetails = [];
            this.customLoginDetails = {};
            super();
            this.password.displayAsPassword = true;
            this.bt_login.disable(true);
            this.bt_forgotpassword.addEventListener(MouseEvent.CLICK, this.forgotPassword);
            addEventListener(Event.ADDED_TO_STAGE, this.translate);
            var _local_1:* = new TextFormat();
            var _local_2:* = new TextFormat();
            _local_1.size = 30;
            _local_2.size = 33;
            this.bt_login.setTextFormat(_local_1, _local_2);
            addEventListener(Event.ADDED_TO_STAGE, this.init);
            this.username.addEventListener(FocusEvent.FOCUS_IN, this.focusField);
            this.password.addEventListener(FocusEvent.FOCUS_IN, this.focusField);
        }

        public static function openWindow(_arg_1:String, _arg_2:String="_blank", _arg_3:String=""):void
        {
            ExternalInterface.call(WINDOW_OPEN_FUNCTION, _arg_1, _arg_2, _arg_3);
        }


        public function getCharData():*
        {
            return ({
                "usr":"dan",
                "pass":"dan"
            });
        }

        private function forgotPassword(_arg_1:MouseEvent):*
        {
            if (this.thisref.stage.getChildAt(0).langObj.selectedLang == 0)
            {
                openWindow("admin/psw_lost_manager.php", "new", "status=1,toolbar=0,width=550,height=350");
            }
            else
            {
                openWindow(("admin/psw_lost_manager.php?lang=" + this.thisref.stage.getChildAt(0).langObj.getLangExtensionWeb()), "new", "status=1,toolbar=0,width=550,height=350");
            };
        }

        private function focusField(_arg_1:FocusEvent):*
        {
            _arg_1.currentTarget.setSelection(0, _arg_1.currentTarget.text.length);
        }

        public function hideLoginText():*
        {
            this.utext.visible = false;
            this.username.visible = false;
            this.ptext.visible = false;
            this.password.visible = false;
            this.bt_login.visible = false;
            this.bt_forgotpassword.visible = false;
        }

        public function openingAnim(_arg_1:*=0):*
        {
            if (_arg_1 == 0)
            {
                this.notAnimating = false;
                this.tgt.gotoAndPlay(2);
                this.hideLoginText();
            }
            else
            {
                if (_arg_1 == 1)
                {
                    this.actionComplete(2);
                }
                else
                {
                    if (_arg_1 == 2)
                    {
                        this.notAnimating = true;
                        this.thisref.stage.getChildAt(0).signInAnimComplete();
                    }
                    else
                    {
                        if (_arg_1 == 3)
                        {
                            this.bgd.bgd.doors.gotoAndPlay(2);
                        }
                        else
                        {
                            if (_arg_1 == 5)
                            {
                                this.tgt.gotoAndStop("animateIn");
                                this.hideLoginText();
                            }
                            else
                            {
                                if (_arg_1 == 6)
                                {
                                    this.notAnimating = true;
                                    this.utext.visible = true;
                                    this.username.visible = true;
                                    this.ptext.visible = true;
                                    this.password.visible = true;
                                    this.bt_login.visible = true;
                                    this.bt_forgotpassword.visible = true;
                                    this.actionComplete(1);
                                }
                                else
                                {
                                    if (_arg_1 == 7)
                                    {
                                        this.tgt.gotoAndPlay("animateIn");
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        private function init(_arg_1:Event):*
        {
            var _local_2:*;
            var _local_3:*;
            this.stageref = _arg_1.currentTarget.stage.getChildAt(0);
            this.stageref.langObj.setFormat(this.username);
            this.stageref.langObj.setFormat(this.password);
            this.stageref.langObj.setFormat(this.ptext, {
                "enlarge":true,
                "noalign":true
            });
            this.stageref.langObj.setFormat(this.utext, {
                "enlarge":true,
                "noalign":true
            });
            if (((this.stageref.custID < 2) && (!(this.stageref.FID))))
            {
                _local_2 = getDefinitionByName(("bt_register_l" + this.stageref.langObj.selectedLang));
                _local_3 = addChild(new (_local_2)());
                _local_3.x = 729;
                _local_3.y = 483;
                _local_3.scaleX = 0.747;
                _local_3.scaleY = 0.773;
                _local_3.name = "bt_register";
                _local_3.addEventListener(MouseEvent.CLICK, this.registerme);
            }
            else
            {
                if (this.stageref.FID)
                {
                    this.hideLoginText();
                    this.tgt.visible = false;
                }
                else
                {
                    if (this.stageref.custID == 3)
                    {
                        visible = false;
                        this.tgt.visible = false;
                        this.hideLoginText();
                        if (LoaderInfo(stage.loaderInfo).parameters["uid"])
                        {
                            this.username.text = LoaderInfo(stage.loaderInfo).parameters["uid"];
                            this.password.text = LoaderInfo(stage.loaderInfo).parameters["uip"];
                        };
                        this.password.maxChars = 40;
                        trace(("username : " + this.username.text));
                        if (((this.username.text.length == 0) && (this.thisref.stage.getChildAt(0).rootURL == "")))
                        {
                            trace("setting def credentials");
                            this.username.text = "coco-m3com1";
                            this.password.text = "d6e628a2d8ef0940a1d049ed601dfeaa2358547e";
                        };
                        this.tgt.stop();
                    };
                };
            };
            this.actionComplete(0);
            if (((this.stageref.zoneSelectorRqd) && (this.stageref.custID < 3)))
            {
                this.openingAnim(5);
            }
            else
            {
                this.tgt.stop();
            };
        }

        public function fadeout():*
        {
            this.mytw = new Tween(this.thisref, "alpha", None.easeNone, 1, 0, 18, false);
            this.mytw.addEventListener(TweenEvent.MOTION_FINISH, this.finTween);
            this.openingAnim(2);
        }

        private function finTween(_arg_1:TweenEvent):*
        {
            this.stopTween();
        }

        public function stopTween():*
        {
            if (this.mytw)
            {
                this.mytw.removeEventListener(TweenEvent.MOTION_FINISH, this.finTween);
                this.mytw.stop();
                this.mytw = undefined;
            };
            this.thisref.visible = false;
            this.thisref.alpha = 1;
            if (this.bgd)
            {
                this.bgd.bgd.doors.gotoAndStop(1);
                this.tgt.gotoAndStop(1);
            };
        }

        private function addGfx(_arg_1:*):*
        {
            this.bgdRef = _arg_1.preloadedObjects[0];
            this.bgdContainer = addChildAt(this.bgdRef, 0);
            this.bgd = this.bgdContainer.content;
            if (!this.bgd)
            {
                _arg_1.showmsg(("WARNING !! BACKGROUND HAS NO CONTENT : " + this.bgd));
                _arg_1.showmsg(("Container desc : " + this.bgdRef));
                _arg_1.showmsg(((("% loaded : " + this.bgdRef.contentLoaderInfo.bytesLoaded) + " / ") + this.bgdRef.contentLoaderInfo.bytesTotal));
            };
            _arg_1.preloadedObjects = undefined;
        }

        private function translate(_arg_1:Event):*
        {
            this.addGfx(_arg_1.currentTarget.stage.getChildAt(0));
            var _local_2:* = _arg_1.currentTarget.stage.getChildAt(0).langObj;
            this.utext.text = _local_2.getText("login01");
            this.ptext.text = _local_2.getText("login02");
            if (this.bt_login.getChildByName("thetext"))
            {
                this.bt_login.thetext.text = _local_2.getText("login03");
                this.bt_login.mytext = _local_2.getText("login03");
                this.bt_forgotpassword.thetext.text = _local_2.getText("login05");
            };
        }

        private function checkkeys(_arg_1:KeyboardEvent):*
        {
            if (_arg_1.charCode == Keyboard.ENTER)
            {
                if ((((this.thisref.stage.focus.name == "bt_login") || (this.thisref.stage.focus.name == "username")) || (this.thisref.stage.focus.name == "password")))
                {
                    this.signinfn();
                };
            };
        }

        public function enablelogin():*
        {
            if (this.notAnimating)
            {
                if (((!(this.stageref.custID == 3)) && (this.tgt.visible)))
                {
                    this.bt_login.addEventListener(MouseEvent.CLICK, this.signuserin);
                    this.bt_login.enable();
                    addEventListener(KeyboardEvent.KEY_DOWN, this.checkkeys);
                    this.utext.visible = true;
                    this.username.visible = true;
                    this.ptext.visible = true;
                    this.password.visible = true;
                    this.bt_login.visible = true;
                    this.bt_forgotpassword.visible = true;
                };
            };
        }

        public function clearLogin():*
        {
            this.username.text = "";
            this.password.text = "";
            this.loginDetails = [];
            this.miniRegisterSeq = false;
            this.loginBeenSent = false;
        }

        public function disablelogin():*
        {
            this.bt_login.removeEventListener(MouseEvent.CLICK, this.signuserin);
            this.bt_login.disable(true);
        }

        public function registerme(_arg_1:MouseEvent):*
        {
            var _local_2:* = this.thisref.stage.getChildAt(0).newpopup((this.thisref.stage.getChildAt(0).baseURL + "panels/registration.swf"), "load", "registration");
            _local_2.tweenOn = false;
        }

        public function miniregisterme():*
        {
            var _local_1:* = "panels/register_avatar.swf";
            if (this.stageref.FID)
            {
                _local_1 = "panels/register_avatar_fb.swf";
            };
            var _local_2:* = this.thisref.stage.getChildAt(0).newpopup((this.thisref.stage.getChildAt(0).baseURL + _local_1), "load", "registration");
            _local_2.tweenOn = false;
        }

        private function errorloadCharacterXML(_arg_1:IOErrorEvent):*
        {
            trace(("Problem loading custom login XML " + _arg_1));
        }

        private function loadedCharacterXML(_arg_1:Event):*
        {
            var _local_2:*;
            var _local_3:*;
            this.customLoginXML = new XML(_arg_1.currentTarget.data);
            if (this.customLoginXML.acct.err.length() > 0)
            {
                trace("Incorrect username or password error...hmmm");
                _local_2 = this.stageref.langObj.getText("srv1");
                this.stageref.showmsg(_local_2);
                this.enablelogin();
            }
            else
            {
                if (this.customLoginXML.acct.usr.length() == 0)
                {
                    this.miniRegisterSeq = true;
                    trace("no users detected..");
                }
                else
                {
                    for (_local_3 in this.customLoginXML.acct.usr)
                    {
                        trace(("User " + this.customLoginXML.acct.usr[_local_3].nm));
                    };
                };
                if (this.stageref.FID)
                {
                    this.actionComplete(2);
                }
                else
                {
                    this.openingAnim(0);
                };
            };
        }

        public function getCustomLoginData():*
        {
            return (this.customLoginXML);
        }

        public function quicklogin():*
        {
            var _local_1:String;
            if (((this.stageref.custID == 3) && (this.stageref.getpopup("cust3_splash"))))
            {
                return;
            };
            if (((this.stageref.custID < 2) && (!(this.stageref.FID))))
            {
                this.signinfn(true);
                return;
            };
            if (!this.loginBeenSent)
            {
                if (this.stageref.sfs.isConnected)
                {
                    if (this.stageref.key)
                    {
                        if (this.stageref.FID)
                        {
                            this.password.text = (("%<>%" + this.stageref.FID) + this.stageref.FAccessToken.substr((this.stageref.FAccessToken.length - 32), 32));
                            if (!this.stageref.FBVerified)
                            {
                                this.stageref.loginAfterConnect = true;
                                this.stageref.checkFB();
                                return;
                            };
                        };
                        if (this.stageref.custID == 3)
                        {
                            this.customLoginDetails = {
                                "user":this.username.text,
                                "pass":this.password.text
                            };
                        };
                        _local_1 = MD5.encrypt((this.stageref.key + this.password.text));
                        this.sfsref = this.stageref.sfs;
                        this.sfsref.login(this.stageref.zoneName, this.username.text, _local_1);
                        this.loginBeenSent = true;
                    };
                }
                else
                {
                    this.thisref.stage.getChildAt(0).Autoreconnect();
                };
            };
        }

        public function signinfn(_arg_1:*=false):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:String;
            if (((_arg_1) || (((!(this.bt_login.currentFrame == 4)) && (this.username.text.length >= 2)) && (this.password.text.length >= 2))))
            {
                this.disablelogin();
                if (this.stageref.customLogin)
                {
                    _local_2 = new URLRequest((this.stageref.DBURL + "plogin.php"));
                    _local_3 = new URLLoader();
                    _local_3.addEventListener(IOErrorEvent.IO_ERROR, this.errorloadCharacterXML);
                    _local_3.addEventListener(Event.COMPLETE, this.loadedCharacterXML);
                    _local_4 = new URLVariables();
                    if (this.stageref.FID)
                    {
                        _local_4.FID = this.stageref.FID;
                    }
                    else
                    {
                        _local_4.usr = this.username.text;
                    };
                    _local_4.pass = MD5.encrypt((this.password.text + "switch%"));
                    _local_2.data = _local_4;
                    _local_2.method = "post";
                    _local_3.load(_local_2);
                }
                else
                {
                    this.sfsref = this.thisref.stage.getChildAt(0).sfs;
                    if (this.sfsref.isConnected)
                    {
                        if (this.thisref.stage.getChildAt(0).key)
                        {
                            _local_5 = MD5.encrypt((this.thisref.stage.getChildAt(0).key + this.password.text));
                            this.sfsref.login(this.thisref.stage.getChildAt(0).zoneName, this.username.text, _local_5);
                        }
                        else
                        {
                            this.stageref.loginAfterConnect = true;
                        };
                    }
                    else
                    {
                        this.thisref.stage.getChildAt(0).Autoreconnect();
                    };
                };
                if (this.stageref.custID >= 2)
                {
                    this.loginDetails = [this.username.text, _local_5];
                };
            };
        }

        public function actionComplete(_arg_1:*, _arg_2:*=0):*
        {
            var _local_3:*;
            var _local_4:*;
            switch (_arg_1)
            {
                case 0:
                    if (((this.stageref.custID == 2) || (this.stageref.FID)))
                    {
                        this.stageref.customLogin = true;
                    };
                    if (((!(this.stageref.zoneSelectorRqd)) && (!(this.stageref.customLogin))))
                    {
                        this.stageref.connectSFS();
                        this.notAnimating = true;
                    };
                    if ((((this.stageref.zoneSelectorRqd) && (!(this.stageref.customLogin))) && (!(this.stageref.FID))))
                    {
                        _local_3 = this.stageref.newpopup((this.stageref.baseURL + "panels/zone_selector.swf"), "load", "zoneSelector", false, false);
                        _local_3.tweenOn = false;
                    }
                    else
                    {
                        if (this.stageref.FID)
                        {
                            this.stageref.connectSFS();
                            this.username.text = this.stageref.FID;
                            this.signinfn(true);
                        }
                        else
                        {
                            if (this.stageref.customLogin)
                            {
                                this.hideLoginText();
                                this.openingAnim(7);
                            };
                        };
                    };
                    return;
                case 1:
                    if (this.stageref.customLogin)
                    {
                        this.enablelogin();
                    }
                    else
                    {
                        if (this.stageref.sfs.isConnected)
                        {
                            this.enablelogin();
                        };
                    };
                    return;
                case 2:
                    if (this.miniRegisterSeq)
                    {
                        this.miniregisterme();
                    }
                    else
                    {
                        if (((this.stageref.customLogin) && (!(this.stageref.getpopup("characterSelect")))))
                        {
                            _local_4 = this.stageref.newpopup((this.stageref.baseURL + "panels/char_selector.swf"), "load", "characterSelect", false, false, {"nocentre":true});
                            _local_4.tweenOn = false;
                        }
                        else
                        {
                            if (((this.bgd) && (!(this.miniRegisterSeq))))
                            {
                                this.bgd.bgd.doors.gotoAndPlay(2);
                            }
                            else
                            {
                                if (this.miniRegisterSeq)
                                {
                                    this.miniregisterme();
                                };
                            };
                        };
                    };
                    return;
                case 3:
                    if (this.stageref.zoneSelectorRqd)
                    {
                        _local_3 = this.stageref.newpopup((this.stageref.baseURL + "panels/zone_selector.swf"), "load", "zoneSelector", false, false);
                    }
                    else
                    {
                        this.stageref.showmsg(("current phase : " + _arg_2));
                        if (_arg_2 == 0)
                        {
                            this.quicklogin();
                        }
                        else
                        {
                            trace("To do... investigate when this occurs...");
                            if (this.stageref.loginAfterConnect == false)
                            {
                            };
                        };
                    };
                    return;
                case 4:
                    if (((this.stageref.custID == 3) || (this.stageref.customLogin)))
                    {
                        this.quicklogin();
                    }
                    else
                    {
                        if (this.stageref.FID)
                        {
                            this.quicklogin();
                        }
                        else
                        {
                            if (this.stageref.sfs.isConnected == false)
                            {
                                this.stageref.connectSFS();
                            };
                            this.openingAnim(7);
                        };
                    };
                    return;
                case 5:
                    this.actionComplete(3, 0);
                    return;
                case 6:
                    this.miniRegisterSeq = true;
                    this.actionComplete(2);
                    return;
            };
        }

        public function relog():*
        {
            this.signinfn(true);
        }

        private function signuserin(_arg_1:MouseEvent):*
        {
            removeEventListener(KeyboardEvent.KEY_DOWN, this.checkkeys);
            this.signinfn();
        }


    }
}//package com.cocolani

//------------------------------------------------------------
//com.greensock.core.PropTween

package com.greensock.core
{
    public class PropTween 
    {

        public var target:Object;
        public var property:String;
        public var start:Number;
        public var change:Number;
        public var name:String;
        public var priority:int;
        public var isPlugin:Boolean;
        public var nextNode:PropTween;
        public var prevNode:PropTween;

        public function PropTween(_arg_1:Object, _arg_2:String, _arg_3:Number, _arg_4:Number, _arg_5:String, _arg_6:Boolean, _arg_7:PropTween=null, _arg_8:int=0)
        {
            this.target = _arg_1;
            this.property = _arg_2;
            this.start = _arg_3;
            this.change = _arg_4;
            this.name = _arg_5;
            this.isPlugin = _arg_6;
            if (_arg_7)
            {
                _arg_7.prevNode = this;
                this.nextNode = _arg_7;
            };
            this.priority = _arg_8;
        }

    }
}//package com.greensock.core

//------------------------------------------------------------
//com.greensock.core.SimpleTimeline

package com.greensock.core
{
    public class SimpleTimeline extends TweenCore 
    {

        protected var _firstChild:TweenCore;
        protected var _lastChild:TweenCore;
        public var autoRemoveChildren:Boolean;

        public function SimpleTimeline(_arg_1:Object=null)
        {
            super(0, _arg_1);
        }

        public function addChild(_arg_1:TweenCore):void
        {
            if (((!(_arg_1.gc)) && (_arg_1.timeline)))
            {
                _arg_1.timeline.remove(_arg_1, true);
            };
            _arg_1.timeline = this;
            if (_arg_1.gc)
            {
                _arg_1.setEnabled(true, true);
            };
            if (this._firstChild)
            {
                this._firstChild.prevNode = _arg_1;
            };
            _arg_1.nextNode = this._firstChild;
            this._firstChild = _arg_1;
            _arg_1.prevNode = null;
        }

        public function remove(_arg_1:TweenCore, _arg_2:Boolean=false):void
        {
            if (_arg_1.gc)
            {
                return;
            };
            if (!_arg_2)
            {
                _arg_1.setEnabled(false, true);
            };
            if (_arg_1.nextNode)
            {
                _arg_1.nextNode.prevNode = _arg_1.prevNode;
            }
            else
            {
                if (this._lastChild == _arg_1)
                {
                    this._lastChild = _arg_1.prevNode;
                };
            };
            if (_arg_1.prevNode)
            {
                _arg_1.prevNode.nextNode = _arg_1.nextNode;
            }
            else
            {
                if (this._firstChild == _arg_1)
                {
                    this._firstChild = _arg_1.nextNode;
                };
            };
        }

        override public function renderTime(_arg_1:Number, _arg_2:Boolean=false, _arg_3:Boolean=false):void
        {
            var _local_5:Number;
            var _local_6:TweenCore;
            var _local_4:TweenCore = this._firstChild;
            this.cachedTotalTime = _arg_1;
            this.cachedTime = _arg_1;
            while (_local_4)
            {
                _local_6 = _local_4.nextNode;
                if (((_local_4.active) || (((_arg_1 >= _local_4.cachedStartTime) && (!(_local_4.cachedPaused))) && (!(_local_4.gc)))))
                {
                    if (!_local_4.cachedReversed)
                    {
                        _local_4.renderTime(((_arg_1 - _local_4.cachedStartTime) * _local_4.cachedTimeScale), _arg_2, false);
                    }
                    else
                    {
                        _local_5 = ((_local_4.cacheIsDirty) ? _local_4.totalDuration : _local_4.cachedTotalDuration);
                        _local_4.renderTime((_local_5 - ((_arg_1 - _local_4.cachedStartTime) * _local_4.cachedTimeScale)), _arg_2, false);
                    };
                };
                _local_4 = _local_6;
            };
        }

        public function get rawTime():Number
        {
            return (this.cachedTotalTime);
        }


    }
}//package com.greensock.core

//------------------------------------------------------------
//com.greensock.core.TweenCore

package com.greensock.core
{
    import com.greensock.TweenLite;
    import com.greensock.*;

    public class TweenCore 
    {

        public static const version:Number = 1.13;
        protected static var _classInitted:Boolean;

        protected var _delay:Number;
        protected var _hasUpdate:Boolean;
        protected var _rawPrevTime:Number = -1;
        protected var _pauseTime:Number;
        public var vars:Object;
        public var active:Boolean;
        public var gc:Boolean;
        public var initted:Boolean;
        public var timeline:SimpleTimeline;
        public var cachedStartTime:Number;
        public var cachedTime:Number;
        public var cachedTotalTime:Number;
        public var cachedDuration:Number;
        public var cachedTotalDuration:Number;
        public var cachedTimeScale:Number;
        public var cachedReversed:Boolean;
        public var nextNode:TweenCore;
        public var prevNode:TweenCore;
        public var cacheIsDirty:Boolean;
        public var cachedPaused:Boolean;
        public var data:*;

        public function TweenCore(_arg_1:Number=0, _arg_2:Object=null)
        {
            this.vars = ((_arg_2) || ({}));
            this.cachedDuration = (this.cachedTotalDuration = ((_arg_1) || (0)));
            this._delay = ((this.vars.delay) || (0));
            this.cachedTimeScale = ((this.vars.timeScale) || (1));
            this.active = Boolean((((_arg_1 == 0) && (this._delay == 0)) && (!(this.vars.immediateRender == false))));
            this.cachedTotalTime = (this.cachedTime = 0);
            this.data = this.vars.data;
            if (!_classInitted)
            {
                if (isNaN(TweenLite.rootFrame))
                {
                    TweenLite.initClass();
                    _classInitted = true;
                }
                else
                {
                    return;
                };
            };
            var _local_3:SimpleTimeline = ((this.vars.timeline is SimpleTimeline) ? this.vars.timeline : ((this.vars.useFrames) ? TweenLite.rootFramesTimeline : TweenLite.rootTimeline));
            this.cachedStartTime = (_local_3.cachedTotalTime + this._delay);
            _local_3.addChild(this);
            if (this.vars.reversed)
            {
                this.cachedReversed = true;
            };
            if (this.vars.paused)
            {
                this.paused = true;
            };
        }

        public function play():void
        {
            this.reversed = false;
            this.paused = false;
        }

        public function pause():void
        {
            this.paused = true;
        }

        public function resume():void
        {
            this.paused = false;
        }

        public function restart(_arg_1:Boolean=false, _arg_2:Boolean=true):void
        {
            this.reversed = false;
            this.paused = false;
            this.setTotalTime(((_arg_1) ? -(this._delay) : 0), _arg_2);
        }

        public function reverse(_arg_1:Boolean=true):void
        {
            this.reversed = true;
            if (_arg_1)
            {
                this.paused = false;
            }
            else
            {
                if (this.gc)
                {
                    this.setEnabled(true, false);
                };
            };
        }

        public function renderTime(_arg_1:Number, _arg_2:Boolean=false, _arg_3:Boolean=false):void
        {
        }

        public function complete(_arg_1:Boolean=false, _arg_2:Boolean=false):void
        {
            if (!_arg_1)
            {
                this.renderTime(this.cachedTotalDuration, _arg_2, false);
                return;
            };
            if (this.timeline.autoRemoveChildren)
            {
                this.setEnabled(false, false);
            }
            else
            {
                this.active = false;
            };
            if (!_arg_2)
            {
                if ((((this.vars.onComplete) && (this.cachedTotalTime == this.cachedTotalDuration)) && (!(this.cachedReversed))))
                {
                    this.vars.onComplete.apply(null, this.vars.onCompleteParams);
                }
                else
                {
                    if ((((this.cachedReversed) && (this.cachedTotalTime == 0)) && (this.vars.onReverseComplete)))
                    {
                        this.vars.onReverseComplete.apply(null, this.vars.onReverseCompleteParams);
                    };
                };
            };
        }

        public function invalidate():void
        {
        }

        public function setEnabled(_arg_1:Boolean, _arg_2:Boolean=false):Boolean
        {
            if (_arg_1)
            {
                this.active = Boolean((((!(this.cachedPaused)) && (this.cachedTotalTime > 0)) && (this.cachedTotalTime < this.cachedTotalDuration)));
                if (((!(_arg_2)) && (this.gc)))
                {
                    this.timeline.addChild(this);
                };
            }
            else
            {
                this.active = false;
                if (!_arg_2)
                {
                    this.timeline.remove(this, true);
                };
            };
            this.gc = (!(_arg_1));
            return (false);
        }

        public function kill():void
        {
            this.setEnabled(false, false);
        }

        protected function setDirtyCache(_arg_1:Boolean=true):void
        {
            var _local_2:TweenCore = ((_arg_1) ? this : this.timeline);
            while (_local_2)
            {
                _local_2.cacheIsDirty = true;
                _local_2 = _local_2.timeline;
            };
        }

        protected function setTotalTime(_arg_1:Number, _arg_2:Boolean=false):void
        {
            var _local_3:Number;
            var _local_4:Number;
            if (this.timeline)
            {
                _local_3 = (((this._pauseTime) || (this._pauseTime == 0)) ? this._pauseTime : this.timeline.cachedTotalTime);
                if (this.cachedReversed)
                {
                    _local_4 = ((this.cacheIsDirty) ? this.totalDuration : this.cachedTotalDuration);
                    this.cachedStartTime = (_local_3 - ((_local_4 - _arg_1) / this.cachedTimeScale));
                }
                else
                {
                    this.cachedStartTime = (_local_3 - (_arg_1 / this.cachedTimeScale));
                };
                if (!this.timeline.cacheIsDirty)
                {
                    this.setDirtyCache(false);
                };
                if (this.cachedTotalTime != _arg_1)
                {
                    this.renderTime(_arg_1, _arg_2, false);
                };
            };
        }

        public function get delay():Number
        {
            return (this._delay);
        }

        public function set delay(_arg_1:Number):void
        {
            this.startTime = (this.startTime + (_arg_1 - this._delay));
            this._delay = _arg_1;
        }

        public function get duration():Number
        {
            return (this.cachedDuration);
        }

        public function set duration(_arg_1:Number):void
        {
            this.cachedDuration = (this.cachedTotalDuration = _arg_1);
            this.setDirtyCache(false);
        }

        public function get totalDuration():Number
        {
            return (this.cachedTotalDuration);
        }

        public function set totalDuration(_arg_1:Number):void
        {
            this.duration = _arg_1;
        }

        public function get currentTime():Number
        {
            return (this.cachedTime);
        }

        public function set currentTime(_arg_1:Number):void
        {
            this.setTotalTime(_arg_1, false);
        }

        public function get totalTime():Number
        {
            return (this.cachedTotalTime);
        }

        public function set totalTime(_arg_1:Number):void
        {
            this.setTotalTime(_arg_1, false);
        }

        public function get startTime():Number
        {
            return (this.cachedStartTime);
        }

        public function set startTime(_arg_1:Number):void
        {
            var _local_2:Boolean = Boolean(((!(this.timeline == null)) && ((!(_arg_1 == this.cachedStartTime)) || (this.gc))));
            this.cachedStartTime = _arg_1;
            if (_local_2)
            {
                this.timeline.addChild(this);
            };
        }

        public function get reversed():Boolean
        {
            return (this.cachedReversed);
        }

        public function set reversed(_arg_1:Boolean):void
        {
            if (_arg_1 != this.cachedReversed)
            {
                this.cachedReversed = _arg_1;
                this.setTotalTime(this.cachedTotalTime, true);
            };
        }

        public function get paused():Boolean
        {
            return (this.cachedPaused);
        }

        public function set paused(_arg_1:Boolean):void
        {
            if (((!(_arg_1 == this.cachedPaused)) && (this.timeline)))
            {
                if (_arg_1)
                {
                    this._pauseTime = this.timeline.rawTime;
                }
                else
                {
                    this.cachedStartTime = (this.cachedStartTime + (this.timeline.rawTime - this._pauseTime));
                    this._pauseTime = NaN;
                    this.setDirtyCache(false);
                };
                this.cachedPaused = _arg_1;
                this.active = Boolean((((!(this.cachedPaused)) && (this.cachedTotalTime > 0)) && (this.cachedTotalTime < this.cachedTotalDuration)));
            };
            if (((!(_arg_1)) && (this.gc)))
            {
                this.setTotalTime(this.cachedTotalTime, false);
                this.setEnabled(true, false);
            };
        }


    }
}//package com.greensock.core

//------------------------------------------------------------
//com.greensock.TweenLite

package com.greensock
{
    import com.greensock.core.TweenCore;
    import flash.utils.Dictionary;
    import com.greensock.core.SimpleTimeline;
    import flash.display.Shape;
    import com.greensock.core.PropTween;
    import flash.utils.getTimer;
    import flash.events.Event;
    import flash.events.*;
    import com.greensock.core.*;
    import flash.display.*;
    import flash.utils.*;
    import com.greensock.plugins.*;

    public class TweenLite extends TweenCore 
    {

        public static const version:Number = 11.2;
        public static var plugins:Object = {};
        public static var fastEaseLookup:Dictionary = new Dictionary(false);
        public static var onPluginEvent:Function;
        public static var killDelayedCallsTo:Function = TweenLite.killTweensOf;
        public static var defaultEase:Function = TweenLite.easeOut;
        public static var overwriteManager:Object;
        public static var rootFrame:Number;
        public static var rootTimeline:SimpleTimeline;
        public static var rootFramesTimeline:SimpleTimeline;
        public static var masterList:Dictionary = new Dictionary(false);
        private static var _shape:Shape = new Shape();
        protected static var _reservedProps:Object = {
            "ease":1,
            "delay":1,
            "overwrite":1,
            "onComplete":1,
            "onCompleteParams":1,
            "useFrames":1,
            "runBackwards":1,
            "startAt":1,
            "onUpdate":1,
            "onUpdateParams":1,
            "roundProps":1,
            "onStart":1,
            "onStartParams":1,
            "onInit":1,
            "onInitParams":1,
            "onReverseComplete":1,
            "onReverseCompleteParams":1,
            "onRepeat":1,
            "onRepeatParams":1,
            "proxiedEase":1,
            "easeParams":1,
            "yoyo":1,
            "onCompleteListener":1,
            "onUpdateListener":1,
            "onStartListener":1,
            "onReverseCompleteListener":1,
            "onRepeatListener":1,
            "orientToBezier":1,
            "timeScale":1,
            "immediateRender":1,
            "repeat":1,
            "repeatDelay":1,
            "timeline":1,
            "data":1,
            "paused":1
        };

        public var target:Object;
        public var propTweenLookup:Object;
        public var ratio:Number = 0;
        public var cachedPT1:PropTween;
        protected var _ease:Function;
        protected var _overwrite:uint;
        protected var _overwrittenProps:Object;
        protected var _hasPlugins:Boolean;
        protected var _notifyPluginsOfEnabled:Boolean;

        public function TweenLite(_arg_1:Object, _arg_2:Number, _arg_3:Object)
        {
            var _local_5:TweenLite;
            super(_arg_2, _arg_3);
            this.target = _arg_1;
            if (((this.target is TweenCore) && ("timeScale" in this.vars)))
            {
                this.cachedTimeScale = 1;
            };
            this.propTweenLookup = {};
            this._ease = defaultEase;
            this._overwrite = (((!(Number(_arg_3.overwrite) > -1)) || ((!(overwriteManager.enabled)) && (_arg_3.overwrite > 1))) ? overwriteManager.mode : int(_arg_3.overwrite));
            var _local_4:Array = masterList[_arg_1];
            if (!_local_4)
            {
                masterList[_arg_1] = [this];
            }
            else
            {
                if (this._overwrite == 1)
                {
                    for each (_local_5 in _local_4)
                    {
                        if (!_local_5.gc)
                        {
                            _local_5.setEnabled(false, false);
                        };
                    };
                    masterList[_arg_1] = [this];
                }
                else
                {
                    _local_4[_local_4.length] = this;
                };
            };
            if (((this.active) || (this.vars.immediateRender)))
            {
                this.renderTime(0, false, true);
            };
        }

        public static function initClass():void
        {
            rootFrame = 0;
            rootTimeline = new SimpleTimeline(null);
            rootFramesTimeline = new SimpleTimeline(null);
            rootTimeline.cachedStartTime = (getTimer() * 0.001);
            rootFramesTimeline.cachedStartTime = rootFrame;
            rootTimeline.autoRemoveChildren = true;
            rootFramesTimeline.autoRemoveChildren = true;
            _shape.addEventListener(Event.ENTER_FRAME, updateAll, false, 0, true);
            if (overwriteManager == null)
            {
                overwriteManager = {
                    "mode":1,
                    "enabled":false
                };
            };
        }

        public static function to(_arg_1:Object, _arg_2:Number, _arg_3:Object):TweenLite
        {
            return (new TweenLite(_arg_1, _arg_2, _arg_3));
        }

        public static function from(_arg_1:Object, _arg_2:Number, _arg_3:Object):TweenLite
        {
            _arg_3.runBackwards = true;
            if (!("immediateRender" in _arg_3))
            {
                _arg_3.immediateRender = true;
            };
            return (new TweenLite(_arg_1, _arg_2, _arg_3));
        }

        public static function delayedCall(_arg_1:Number, _arg_2:Function, _arg_3:Array=null, _arg_4:Boolean=false):TweenLite
        {
            return (new TweenLite(_arg_2, 0, {
                "delay":_arg_1,
                "onComplete":_arg_2,
                "onCompleteParams":_arg_3,
                "immediateRender":false,
                "useFrames":_arg_4,
                "overwrite":0
            }));
        }

        protected static function updateAll(_arg_1:Event=null):void
        {
            var _local_2:Dictionary;
            var _local_3:Object;
            var _local_4:Array;
            var _local_5:int;
            rootTimeline.renderTime((((getTimer() * 0.001) - rootTimeline.cachedStartTime) * rootTimeline.cachedTimeScale), false, false);
            rootFrame++;
            rootFramesTimeline.renderTime(((rootFrame - rootFramesTimeline.cachedStartTime) * rootFramesTimeline.cachedTimeScale), false, false);
            if (!(rootFrame % 60))
            {
                _local_2 = masterList;
                for (_local_3 in _local_2)
                {
                    _local_4 = _local_2[_local_3];
                    _local_5 = _local_4.length;
                    while (_local_5--)
                    {
                        if (TweenLite(_local_4[_local_5]).gc)
                        {
                            _local_4.splice(_local_5, 1);
                        };
                    };
                    if (_local_4.length == 0)
                    {
                        delete _local_2[_local_3];
                    };
                };
            };
        }

        public static function killTweensOf(_arg_1:Object, _arg_2:Boolean=false):void
        {
            var _local_3:Array;
            var _local_4:int;
            if ((_arg_1 in masterList))
            {
                _local_3 = masterList[_arg_1];
                _local_4 = _local_3.length;
                while (_local_4--)
                {
                    if (!TweenLite(_local_3[_local_4]).gc)
                    {
                        if (_arg_2)
                        {
                            TweenLite(_local_3[_local_4]).complete(false, false);
                        }
                        else
                        {
                            TweenLite(_local_3[_local_4]).setEnabled(false, false);
                        };
                    };
                };
                delete masterList[_arg_1];
            };
        }

        protected static function easeOut(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number):Number
        {
            return (1 - ((_arg_1 = (1 - (_arg_1 / _arg_4))) * _arg_1));
        }


        protected function init():void
        {
            var _local_1:String;
            var _local_2:int;
            var _local_3:*;
            var _local_4:Boolean;
            var _local_5:Array;
            var _local_6:PropTween;
            if (this.vars.onInit)
            {
                this.vars.onInit.apply(null, this.vars.onInitParams);
            };
            if (typeof(this.vars.ease) == "function")
            {
                this._ease = this.vars.ease;
            };
            if (this.vars.easeParams)
            {
                this.vars.proxiedEase = this._ease;
                this._ease = this.easeProxy;
            };
            this.cachedPT1 = null;
            this.propTweenLookup = {};
            for (_local_1 in this.vars)
            {
                if (!((_local_1 in _reservedProps) && (!((_local_1 == "timeScale") && (this.target is TweenCore)))))
                {
                    if (((_local_1 in plugins) && ((_local_3 = new ((plugins[_local_1] as Class))()).onInitTween(this.target, this.vars[_local_1], this))))
                    {
                        this.cachedPT1 = new PropTween(_local_3, "changeFactor", 0, 1, ((_local_3.overwriteProps.length == 1) ? _local_3.overwriteProps[0] : "_MULTIPLE_"), true, this.cachedPT1);
                        if (this.cachedPT1.name == "_MULTIPLE_")
                        {
                            _local_2 = _local_3.overwriteProps.length;
                            while (_local_2--)
                            {
                                this.propTweenLookup[_local_3.overwriteProps[_local_2]] = this.cachedPT1;
                            };
                        }
                        else
                        {
                            this.propTweenLookup[this.cachedPT1.name] = this.cachedPT1;
                        };
                        if (_local_3.priority)
                        {
                            this.cachedPT1.priority = _local_3.priority;
                            _local_4 = true;
                        };
                        if (((_local_3.onDisable) || (_local_3.onEnable)))
                        {
                            this._notifyPluginsOfEnabled = true;
                        };
                        this._hasPlugins = true;
                    }
                    else
                    {
                        this.cachedPT1 = new PropTween(this.target, _local_1, Number(this.target[_local_1]), ((typeof(this.vars[_local_1]) == "number") ? (Number(this.vars[_local_1]) - this.target[_local_1]) : Number(this.vars[_local_1])), _local_1, false, this.cachedPT1);
                        this.propTweenLookup[_local_1] = this.cachedPT1;
                    };
                };
            };
            if (_local_4)
            {
                onPluginEvent("onInit", this);
            };
            if (this.vars.runBackwards)
            {
                _local_6 = this.cachedPT1;
                while (_local_6)
                {
                    _local_6.start = (_local_6.start + _local_6.change);
                    _local_6.change = -(_local_6.change);
                    _local_6 = _local_6.nextNode;
                };
            };
            _hasUpdate = Boolean((!(this.vars.onUpdate == null)));
            if (this._overwrittenProps)
            {
                this.killVars(this._overwrittenProps);
                if (this.cachedPT1 == null)
                {
                    this.setEnabled(false, false);
                };
            };
            if (((((this._overwrite > 1) && (this.cachedPT1)) && (_local_5 = masterList[this.target])) && (_local_5.length > 1)))
            {
                if (overwriteManager.manageOverwrites(this, this.propTweenLookup, _local_5, this._overwrite))
                {
                    this.init();
                };
            };
            this.initted = true;
        }

        override public function renderTime(_arg_1:Number, _arg_2:Boolean=false, _arg_3:Boolean=false):void
        {
            var _local_4:Boolean;
            var _local_5:Number = this.cachedTime;
            if (_arg_1 >= this.cachedDuration)
            {
                this.cachedTotalTime = (this.cachedTime = this.cachedDuration);
                this.ratio = 1;
                _local_4 = true;
                if (this.cachedDuration == 0)
                {
                    if ((((_arg_1 == 0) || (_rawPrevTime < 0)) && (!(_rawPrevTime == _arg_1))))
                    {
                        _arg_3 = true;
                    };
                    _rawPrevTime = _arg_1;
                };
            }
            else
            {
                if (_arg_1 <= 0)
                {
                    this.cachedTotalTime = (this.cachedTime = (this.ratio = 0));
                    if (_arg_1 < 0)
                    {
                        this.active = false;
                        if (this.cachedDuration == 0)
                        {
                            if (_rawPrevTime > 0)
                            {
                                _arg_3 = true;
                                _local_4 = true;
                            };
                            _rawPrevTime = _arg_1;
                        };
                    };
                    if (((this.cachedReversed) && (!(_local_5 == 0))))
                    {
                        _local_4 = true;
                    };
                }
                else
                {
                    this.cachedTotalTime = (this.cachedTime = _arg_1);
                    this.ratio = this._ease(_arg_1, 0, 1, this.cachedDuration);
                };
            };
            if (((this.cachedTime == _local_5) && (!(_arg_3))))
            {
                return;
            };
            if (!this.initted)
            {
                this.init();
                if (((!(_local_4)) && (this.cachedTime)))
                {
                    this.ratio = this._ease(this.cachedTime, 0, 1, this.cachedDuration);
                };
            };
            if (((!(this.active)) && (!(this.cachedPaused))))
            {
                this.active = true;
            };
            if (((((_local_5 == 0) && (this.vars.onStart)) && (!(this.cachedTime == 0))) && (!(_arg_2))))
            {
                this.vars.onStart.apply(null, this.vars.onStartParams);
            };
            var _local_6:PropTween = this.cachedPT1;
            while (_local_6)
            {
                _local_6.target[_local_6.property] = (_local_6.start + (this.ratio * _local_6.change));
                _local_6 = _local_6.nextNode;
            };
            if (((_hasUpdate) && (!(_arg_2))))
            {
                this.vars.onUpdate.apply(null, this.vars.onUpdateParams);
            };
            if (_local_4)
            {
                if (((this._hasPlugins) && (this.cachedPT1)))
                {
                    onPluginEvent("onComplete", this);
                };
                complete(true, _arg_2);
            };
        }

        public function killVars(_arg_1:Object, _arg_2:Boolean=true):Boolean
        {
            var _local_3:String;
            var _local_4:PropTween;
            var _local_5:Boolean;
            if (this._overwrittenProps == null)
            {
                this._overwrittenProps = {};
            };
            for (_local_3 in _arg_1)
            {
                if ((_local_3 in this.propTweenLookup))
                {
                    _local_4 = this.propTweenLookup[_local_3];
                    if (((_local_4.isPlugin) && (_local_4.name == "_MULTIPLE_")))
                    {
                        _local_4.target.killProps(_arg_1);
                        if (_local_4.target.overwriteProps.length == 0)
                        {
                            _local_4.name = "";
                        };
                    };
                    if (_local_4.name != "_MULTIPLE_")
                    {
                        if (_local_4.nextNode)
                        {
                            _local_4.nextNode.prevNode = _local_4.prevNode;
                        };
                        if (_local_4.prevNode)
                        {
                            _local_4.prevNode.nextNode = _local_4.nextNode;
                        }
                        else
                        {
                            if (this.cachedPT1 == _local_4)
                            {
                                this.cachedPT1 = _local_4.nextNode;
                            };
                        };
                        if (((_local_4.isPlugin) && (_local_4.target.onDisable)))
                        {
                            _local_4.target.onDisable();
                            if (_local_4.target.activeDisable)
                            {
                                _local_5 = true;
                            };
                        };
                        delete this.propTweenLookup[_local_3];
                    };
                };
                if (_arg_2)
                {
                    this._overwrittenProps[_local_3] = 1;
                };
            };
            return (_local_5);
        }

        override public function invalidate():void
        {
            if (((this._notifyPluginsOfEnabled) && (this.cachedPT1)))
            {
                onPluginEvent("onDisable", this);
            };
            this.cachedPT1 = null;
            this._overwrittenProps = null;
            _hasUpdate = (this.initted = (this.active = (this._notifyPluginsOfEnabled = false)));
            this.propTweenLookup = {};
        }

        override public function setEnabled(_arg_1:Boolean, _arg_2:Boolean=false):Boolean
        {
            var _local_3:Array;
            if (_arg_1)
            {
                _local_3 = TweenLite.masterList[this.target];
                if (!_local_3)
                {
                    TweenLite.masterList[this.target] = [this];
                }
                else
                {
                    _local_3[_local_3.length] = this;
                };
            };
            super.setEnabled(_arg_1, _arg_2);
            if (((this._notifyPluginsOfEnabled) && (this.cachedPT1)))
            {
                return (onPluginEvent(((_arg_1) ? "onEnable" : "onDisable"), this));
            };
            return (false);
        }

        protected function easeProxy(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number):Number
        {
            return (this.vars.proxiedEase.apply(null, arguments.concat(this.vars.easeParams)));
        }


    }
}//package com.greensock

//------------------------------------------------------------
//com.gsolo.encryption.MD5

package com.gsolo.encryption
{
    public class MD5 
    {

        public static const HEX_FORMAT_LOWERCASE:uint = 0;
        public static const HEX_FORMAT_UPPERCASE:uint = 1;
        public static const BASE64_PAD_CHARACTER_DEFAULT_COMPLIANCE:String = "";
        public static const BASE64_PAD_CHARACTER_RFC_COMPLIANCE:String = "=";
        public static var hexcase:uint = 0;
        public static var b64pad:String = "";


        public static function encrypt(_arg_1:String):String
        {
            return (hex_md5(_arg_1));
        }

        public static function hex_md5(_arg_1:String):String
        {
            return (rstr2hex(rstr_md5(str2rstr_utf8(_arg_1))));
        }

        public static function b64_md5(_arg_1:String):String
        {
            return (rstr2b64(rstr_md5(str2rstr_utf8(_arg_1))));
        }

        public static function any_md5(_arg_1:String, _arg_2:String):String
        {
            return (rstr2any(rstr_md5(str2rstr_utf8(_arg_1)), _arg_2));
        }

        public static function hex_hmac_md5(_arg_1:String, _arg_2:String):String
        {
            return (rstr2hex(rstr_hmac_md5(str2rstr_utf8(_arg_1), str2rstr_utf8(_arg_2))));
        }

        public static function b64_hmac_md5(_arg_1:String, _arg_2:String):String
        {
            return (rstr2b64(rstr_hmac_md5(str2rstr_utf8(_arg_1), str2rstr_utf8(_arg_2))));
        }

        public static function any_hmac_md5(_arg_1:String, _arg_2:String, _arg_3:String):String
        {
            return (rstr2any(rstr_hmac_md5(str2rstr_utf8(_arg_1), str2rstr_utf8(_arg_2)), _arg_3));
        }

        public static function md5_vm_test():Boolean
        {
            return (hex_md5("abc") == "900150983cd24fb0d6963f7d28e17f72");
        }

        public static function rstr_md5(_arg_1:String):String
        {
            return (binl2rstr(binl_md5(rstr2binl(_arg_1), (_arg_1.length * 8))));
        }

        public static function rstr_hmac_md5(_arg_1:String, _arg_2:String):String
        {
            var _local_3:Array = rstr2binl(_arg_1);
            if (_local_3.length > 16)
            {
                _local_3 = binl_md5(_local_3, (_arg_1.length * 8));
            };
            var _local_4:Array = new Array(16);
            var _local_5:Array = new Array(16);
            var _local_6:Number = 0;
            while (_local_6 < 16)
            {
                _local_4[_local_6] = (_local_3[_local_6] ^ 0x36363636);
                _local_5[_local_6] = (_local_3[_local_6] ^ 0x5C5C5C5C);
                _local_6++;
            };
            var _local_7:Array = binl_md5(_local_4.concat(rstr2binl(_arg_2)), (0x0200 + (_arg_2.length * 8)));
            return (binl2rstr(binl_md5(_local_5.concat(_local_7), (0x0200 + 128))));
        }

        public static function rstr2hex(_arg_1:String):String
        {
            var _local_4:Number;
            var _local_2:String = ((hexcase) ? "0123456789ABCDEF" : "0123456789abcdef");
            var _local_3:* = "";
            var _local_5:Number = 0;
            while (_local_5 < _arg_1.length)
            {
                _local_4 = _arg_1.charCodeAt(_local_5);
                _local_3 = (_local_3 + (_local_2.charAt(((_local_4 >>> 4) & 0x0F)) + _local_2.charAt((_local_4 & 0x0F))));
                _local_5++;
            };
            return (_local_3);
        }

        public static function rstr2b64(_arg_1:String):String
        {
            var _local_6:Number;
            var _local_7:Number;
            var _local_2:* = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
            var _local_3:* = "";
            var _local_4:Number = _arg_1.length;
            var _local_5:Number = 0;
            while (_local_5 < _local_4)
            {
                _local_6 = (((_arg_1.charCodeAt(_local_5) << 16) | (((_local_5 + 1) < _local_4) ? (_arg_1.charCodeAt((_local_5 + 1)) << 8) : 0)) | (((_local_5 + 2) < _local_4) ? _arg_1.charCodeAt((_local_5 + 2)) : 0));
                _local_7 = 0;
                while (_local_7 < 4)
                {
                    if (((_local_5 * 8) + (_local_7 * 6)) > (_arg_1.length * 8))
                    {
                        _local_3 = (_local_3 + b64pad);
                    }
                    else
                    {
                        _local_3 = (_local_3 + _local_2.charAt(((_local_6 >>> (6 * (3 - _local_7))) & 0x3F)));
                    };
                    _local_7++;
                };
                _local_5 = (_local_5 + 3);
            };
            return (_local_3);
        }

        public static function rstr2any(_arg_1:String, _arg_2:String):String
        {
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:Array;
            var _local_3:Number = _arg_2.length;
            var _local_4:Array = [];
            var _local_9:Array = new Array((_arg_1.length / 2));
            _local_5 = 0;
            while (_local_5 < _local_9.length)
            {
                _local_9[_local_5] = ((_arg_1.charCodeAt((_local_5 * 2)) << 8) | _arg_1.charCodeAt(((_local_5 * 2) + 1)));
                _local_5++;
            };
            while (_local_9.length > 0)
            {
                _local_8 = [];
                _local_7 = 0;
                _local_5 = 0;
                while (_local_5 < _local_9.length)
                {
                    _local_7 = ((_local_7 << 16) + _local_9[_local_5]);
                    _local_6 = Math.floor((_local_7 / _local_3));
                    _local_7 = (_local_7 - (_local_6 * _local_3));
                    if (((_local_8.length > 0) || (_local_6 > 0)))
                    {
                        _local_8[_local_8.length] = _local_6;
                    };
                    _local_5++;
                };
                _local_4[_local_4.length] = _local_7;
                _local_9 = _local_8;
            };
            var _local_10:* = "";
            _local_5 = (_local_4.length - 1);
            while (_local_5 >= 0)
            {
                _local_10 = (_local_10 + _arg_2.charAt(_local_4[_local_5]));
                _local_5--;
            };
            return (_local_10);
        }

        public static function str2rstr_utf8(_arg_1:String):String
        {
            var _local_4:Number;
            var _local_5:Number;
            var _local_2:* = "";
            var _local_3:Number = -1;
            while (++_local_3 < _arg_1.length)
            {
                _local_4 = _arg_1.charCodeAt(_local_3);
                _local_5 = (((_local_3 + 1) < _arg_1.length) ? _arg_1.charCodeAt((_local_3 + 1)) : 0);
                if (((((0xD800 <= _local_4) && (_local_4 <= 56319)) && (0xDC00 <= _local_5)) && (_local_5 <= 57343)))
                {
                    _local_4 = ((0x10000 + ((_local_4 & 0x03FF) << 10)) + (_local_5 & 0x03FF));
                    _local_3++;
                };
                if (_local_4 <= 127)
                {
                    _local_2 = (_local_2 + String.fromCharCode(_local_4));
                }
                else
                {
                    if (_local_4 <= 2047)
                    {
                        _local_2 = (_local_2 + String.fromCharCode((0xC0 | ((_local_4 >>> 6) & 0x1F)), (0x80 | (_local_4 & 0x3F))));
                    }
                    else
                    {
                        if (_local_4 <= 0xFFFF)
                        {
                            _local_2 = (_local_2 + String.fromCharCode((0xE0 | ((_local_4 >>> 12) & 0x0F)), (0x80 | ((_local_4 >>> 6) & 0x3F)), (0x80 | (_local_4 & 0x3F))));
                        }
                        else
                        {
                            if (_local_4 <= 2097151)
                            {
                                _local_2 = (_local_2 + String.fromCharCode((0xF0 | ((_local_4 >>> 18) & 0x07)), (0x80 | ((_local_4 >>> 12) & 0x3F)), (0x80 | ((_local_4 >>> 6) & 0x3F)), (0x80 | (_local_4 & 0x3F))));
                            };
                        };
                    };
                };
            };
            return (_local_2);
        }

        public static function str2rstr_utf16le(_arg_1:String):String
        {
            var _local_2:* = "";
            var _local_3:Number = 0;
            while (_local_3 < _arg_1.length)
            {
                _local_2 = (_local_2 + String.fromCharCode((_arg_1.charCodeAt(_local_3) & 0xFF), ((_arg_1.charCodeAt(_local_3) >>> 8) & 0xFF)));
                _local_3++;
            };
            return (_local_2);
        }

        public static function str2rstr_utf16be(_arg_1:String):String
        {
            var _local_2:* = "";
            var _local_3:Number = 0;
            while (_local_3 < _arg_1.length)
            {
                _local_2 = (_local_2 + String.fromCharCode(((_arg_1.charCodeAt(_local_3) >>> 8) & 0xFF), (_arg_1.charCodeAt(_local_3) & 0xFF)));
                _local_3++;
            };
            return (_local_2);
        }

        public static function rstr2binl(_arg_1:String):Array
        {
            var _local_2:Array = new Array((_arg_1.length >> 2));
            var _local_3:Number = 0;
            while (_local_3 < _local_2.length)
            {
                _local_2[_local_3] = 0;
                _local_3++;
            };
            _local_3 = 0;
            while (_local_3 < (_arg_1.length * 8))
            {
                _local_2[(_local_3 >> 5)] = (_local_2[(_local_3 >> 5)] | ((_arg_1.charCodeAt((_local_3 / 8)) & 0xFF) << (_local_3 % 32)));
                _local_3 = (_local_3 + 8);
            };
            return (_local_2);
        }

        public static function binl2rstr(_arg_1:Array):String
        {
            var _local_2:* = "";
            var _local_3:Number = 0;
            while (_local_3 < (_arg_1.length * 32))
            {
                _local_2 = (_local_2 + String.fromCharCode(((_arg_1[(_local_3 >> 5)] >>> (_local_3 % 32)) & 0xFF)));
                _local_3 = (_local_3 + 8);
            };
            return (_local_2);
        }

        public static function binl_md5(_arg_1:Array, _arg_2:Number):Array
        {
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:Number;
            var _local_11:Number;
            _arg_1[(_arg_2 >> 5)] = (_arg_1[(_arg_2 >> 5)] | (128 << (_arg_2 % 32)));
            _arg_1[((((_arg_2 + 64) >>> 9) << 4) + 14)] = _arg_2;
            var _local_3:Number = 1732584193;
            var _local_4:Number = -271733879;
            var _local_5:Number = -1732584194;
            var _local_6:Number = 271733878;
            var _local_7:Number = 0;
            while (_local_7 < _arg_1.length)
            {
                _local_8 = _local_3;
                _local_9 = _local_4;
                _local_10 = _local_5;
                _local_11 = _local_6;
                _local_3 = md5_ff(_local_3, _local_4, _local_5, _local_6, _arg_1[(_local_7 + 0)], 7, -680876936);
                _local_6 = md5_ff(_local_6, _local_3, _local_4, _local_5, _arg_1[(_local_7 + 1)], 12, -389564586);
                _local_5 = md5_ff(_local_5, _local_6, _local_3, _local_4, _arg_1[(_local_7 + 2)], 17, 606105819);
                _local_4 = md5_ff(_local_4, _local_5, _local_6, _local_3, _arg_1[(_local_7 + 3)], 22, -1044525330);
                _local_3 = md5_ff(_local_3, _local_4, _local_5, _local_6, _arg_1[(_local_7 + 4)], 7, -176418897);
                _local_6 = md5_ff(_local_6, _local_3, _local_4, _local_5, _arg_1[(_local_7 + 5)], 12, 1200080426);
                _local_5 = md5_ff(_local_5, _local_6, _local_3, _local_4, _arg_1[(_local_7 + 6)], 17, -1473231341);
                _local_4 = md5_ff(_local_4, _local_5, _local_6, _local_3, _arg_1[(_local_7 + 7)], 22, -45705983);
                _local_3 = md5_ff(_local_3, _local_4, _local_5, _local_6, _arg_1[(_local_7 + 8)], 7, 1770035416);
                _local_6 = md5_ff(_local_6, _local_3, _local_4, _local_5, _arg_1[(_local_7 + 9)], 12, -1958414417);
                _local_5 = md5_ff(_local_5, _local_6, _local_3, _local_4, _arg_1[(_local_7 + 10)], 17, -42063);
                _local_4 = md5_ff(_local_4, _local_5, _local_6, _local_3, _arg_1[(_local_7 + 11)], 22, -1990404162);
                _local_3 = md5_ff(_local_3, _local_4, _local_5, _local_6, _arg_1[(_local_7 + 12)], 7, 1804603682);
                _local_6 = md5_ff(_local_6, _local_3, _local_4, _local_5, _arg_1[(_local_7 + 13)], 12, -40341101);
                _local_5 = md5_ff(_local_5, _local_6, _local_3, _local_4, _arg_1[(_local_7 + 14)], 17, -1502002290);
                _local_4 = md5_ff(_local_4, _local_5, _local_6, _local_3, _arg_1[(_local_7 + 15)], 22, 1236535329);
                _local_3 = md5_gg(_local_3, _local_4, _local_5, _local_6, _arg_1[(_local_7 + 1)], 5, -165796510);
                _local_6 = md5_gg(_local_6, _local_3, _local_4, _local_5, _arg_1[(_local_7 + 6)], 9, -1069501632);
                _local_5 = md5_gg(_local_5, _local_6, _local_3, _local_4, _arg_1[(_local_7 + 11)], 14, 643717713);
                _local_4 = md5_gg(_local_4, _local_5, _local_6, _local_3, _arg_1[(_local_7 + 0)], 20, -373897302);
                _local_3 = md5_gg(_local_3, _local_4, _local_5, _local_6, _arg_1[(_local_7 + 5)], 5, -701558691);
                _local_6 = md5_gg(_local_6, _local_3, _local_4, _local_5, _arg_1[(_local_7 + 10)], 9, 38016083);
                _local_5 = md5_gg(_local_5, _local_6, _local_3, _local_4, _arg_1[(_local_7 + 15)], 14, -660478335);
                _local_4 = md5_gg(_local_4, _local_5, _local_6, _local_3, _arg_1[(_local_7 + 4)], 20, -405537848);
                _local_3 = md5_gg(_local_3, _local_4, _local_5, _local_6, _arg_1[(_local_7 + 9)], 5, 568446438);
                _local_6 = md5_gg(_local_6, _local_3, _local_4, _local_5, _arg_1[(_local_7 + 14)], 9, -1019803690);
                _local_5 = md5_gg(_local_5, _local_6, _local_3, _local_4, _arg_1[(_local_7 + 3)], 14, -187363961);
                _local_4 = md5_gg(_local_4, _local_5, _local_6, _local_3, _arg_1[(_local_7 + 8)], 20, 1163531501);
                _local_3 = md5_gg(_local_3, _local_4, _local_5, _local_6, _arg_1[(_local_7 + 13)], 5, -1444681467);
                _local_6 = md5_gg(_local_6, _local_3, _local_4, _local_5, _arg_1[(_local_7 + 2)], 9, -51403784);
                _local_5 = md5_gg(_local_5, _local_6, _local_3, _local_4, _arg_1[(_local_7 + 7)], 14, 1735328473);
                _local_4 = md5_gg(_local_4, _local_5, _local_6, _local_3, _arg_1[(_local_7 + 12)], 20, -1926607734);
                _local_3 = md5_hh(_local_3, _local_4, _local_5, _local_6, _arg_1[(_local_7 + 5)], 4, -378558);
                _local_6 = md5_hh(_local_6, _local_3, _local_4, _local_5, _arg_1[(_local_7 + 8)], 11, -2022574463);
                _local_5 = md5_hh(_local_5, _local_6, _local_3, _local_4, _arg_1[(_local_7 + 11)], 16, 1839030562);
                _local_4 = md5_hh(_local_4, _local_5, _local_6, _local_3, _arg_1[(_local_7 + 14)], 23, -35309556);
                _local_3 = md5_hh(_local_3, _local_4, _local_5, _local_6, _arg_1[(_local_7 + 1)], 4, -1530992060);
                _local_6 = md5_hh(_local_6, _local_3, _local_4, _local_5, _arg_1[(_local_7 + 4)], 11, 1272893353);
                _local_5 = md5_hh(_local_5, _local_6, _local_3, _local_4, _arg_1[(_local_7 + 7)], 16, -155497632);
                _local_4 = md5_hh(_local_4, _local_5, _local_6, _local_3, _arg_1[(_local_7 + 10)], 23, -1094730640);
                _local_3 = md5_hh(_local_3, _local_4, _local_5, _local_6, _arg_1[(_local_7 + 13)], 4, 681279174);
                _local_6 = md5_hh(_local_6, _local_3, _local_4, _local_5, _arg_1[(_local_7 + 0)], 11, -358537222);
                _local_5 = md5_hh(_local_5, _local_6, _local_3, _local_4, _arg_1[(_local_7 + 3)], 16, -722521979);
                _local_4 = md5_hh(_local_4, _local_5, _local_6, _local_3, _arg_1[(_local_7 + 6)], 23, 76029189);
                _local_3 = md5_hh(_local_3, _local_4, _local_5, _local_6, _arg_1[(_local_7 + 9)], 4, -640364487);
                _local_6 = md5_hh(_local_6, _local_3, _local_4, _local_5, _arg_1[(_local_7 + 12)], 11, -421815835);
                _local_5 = md5_hh(_local_5, _local_6, _local_3, _local_4, _arg_1[(_local_7 + 15)], 16, 530742520);
                _local_4 = md5_hh(_local_4, _local_5, _local_6, _local_3, _arg_1[(_local_7 + 2)], 23, -995338651);
                _local_3 = md5_ii(_local_3, _local_4, _local_5, _local_6, _arg_1[(_local_7 + 0)], 6, -198630844);
                _local_6 = md5_ii(_local_6, _local_3, _local_4, _local_5, _arg_1[(_local_7 + 7)], 10, 1126891415);
                _local_5 = md5_ii(_local_5, _local_6, _local_3, _local_4, _arg_1[(_local_7 + 14)], 15, -1416354905);
                _local_4 = md5_ii(_local_4, _local_5, _local_6, _local_3, _arg_1[(_local_7 + 5)], 21, -57434055);
                _local_3 = md5_ii(_local_3, _local_4, _local_5, _local_6, _arg_1[(_local_7 + 12)], 6, 1700485571);
                _local_6 = md5_ii(_local_6, _local_3, _local_4, _local_5, _arg_1[(_local_7 + 3)], 10, -1894986606);
                _local_5 = md5_ii(_local_5, _local_6, _local_3, _local_4, _arg_1[(_local_7 + 10)], 15, -1051523);
                _local_4 = md5_ii(_local_4, _local_5, _local_6, _local_3, _arg_1[(_local_7 + 1)], 21, -2054922799);
                _local_3 = md5_ii(_local_3, _local_4, _local_5, _local_6, _arg_1[(_local_7 + 8)], 6, 1873313359);
                _local_6 = md5_ii(_local_6, _local_3, _local_4, _local_5, _arg_1[(_local_7 + 15)], 10, -30611744);
                _local_5 = md5_ii(_local_5, _local_6, _local_3, _local_4, _arg_1[(_local_7 + 6)], 15, -1560198380);
                _local_4 = md5_ii(_local_4, _local_5, _local_6, _local_3, _arg_1[(_local_7 + 13)], 21, 1309151649);
                _local_3 = md5_ii(_local_3, _local_4, _local_5, _local_6, _arg_1[(_local_7 + 4)], 6, -145523070);
                _local_6 = md5_ii(_local_6, _local_3, _local_4, _local_5, _arg_1[(_local_7 + 11)], 10, -1120210379);
                _local_5 = md5_ii(_local_5, _local_6, _local_3, _local_4, _arg_1[(_local_7 + 2)], 15, 718787259);
                _local_4 = md5_ii(_local_4, _local_5, _local_6, _local_3, _arg_1[(_local_7 + 9)], 21, -343485551);
                _local_3 = safe_add(_local_3, _local_8);
                _local_4 = safe_add(_local_4, _local_9);
                _local_5 = safe_add(_local_5, _local_10);
                _local_6 = safe_add(_local_6, _local_11);
                _local_7 = (_local_7 + 16);
            };
            return ([_local_3, _local_4, _local_5, _local_6]);
        }

        public static function md5_cmn(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number):Number
        {
            return (safe_add(bit_rol(safe_add(safe_add(_arg_2, _arg_1), safe_add(_arg_4, _arg_6)), _arg_5), _arg_3));
        }

        public static function md5_ff(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number):Number
        {
            return (md5_cmn(((_arg_2 & _arg_3) | ((~(_arg_2)) & _arg_4)), _arg_1, _arg_2, _arg_5, _arg_6, _arg_7));
        }

        public static function md5_gg(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number):Number
        {
            return (md5_cmn(((_arg_2 & _arg_4) | (_arg_3 & (~(_arg_4)))), _arg_1, _arg_2, _arg_5, _arg_6, _arg_7));
        }

        public static function md5_hh(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number):Number
        {
            return (md5_cmn(((_arg_2 ^ _arg_3) ^ _arg_4), _arg_1, _arg_2, _arg_5, _arg_6, _arg_7));
        }

        public static function md5_ii(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number):Number
        {
            return (md5_cmn((_arg_3 ^ (_arg_2 | (~(_arg_4)))), _arg_1, _arg_2, _arg_5, _arg_6, _arg_7));
        }

        public static function safe_add(_arg_1:Number, _arg_2:Number):Number
        {
            var _local_3:Number = ((_arg_1 & 0xFFFF) + (_arg_2 & 0xFFFF));
            var _local_4:Number = (((_arg_1 >> 16) + (_arg_2 >> 16)) + (_local_3 >> 16));
            return ((_local_4 << 16) | (_local_3 & 0xFFFF));
        }

        public static function bit_rol(_arg_1:Number, _arg_2:Number):Number
        {
            return ((_arg_1 << _arg_2) | (_arg_1 >>> (32 - _arg_2)));
        }


    }
}//package com.gsolo.encryption

//------------------------------------------------------------
//de.polygonal.ds.sort.compare.compareStringCaseInSensitive

package de.polygonal.ds.sort.compare
{
    public function compareStringCaseInSensitive(_arg_1:String, _arg_2:String):int
    {
        var _local_3:int;
        var _local_4:int;
        var _local_5:int;
        _arg_1 = _arg_1.toLowerCase();
        _arg_2 = _arg_2.toLowerCase();
        if ((_arg_1.length + _arg_2.length) > 2)
        {
            _local_3 = 0;
            _local_4 = ((_arg_1.length > _arg_2.length) ? _arg_1.length : _arg_2.length);
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _local_3 = (_arg_1.charCodeAt(_local_5) - _arg_2.charCodeAt(_local_5));
                if (_local_3 != 0) break;
                _local_5++;
            };
            return (_local_3);
        };
        return (_arg_1.charCodeAt(0) - _arg_2.charCodeAt(0));
    }

}//package de.polygonal.ds.sort.compare

//------------------------------------------------------------
//de.polygonal.ds.sort.compare.compareStringCaseInSensitiveDesc

package de.polygonal.ds.sort.compare
{
    public function compareStringCaseInSensitiveDesc(_arg_1:String, _arg_2:String):int
    {
        var _local_3:int;
        var _local_4:int;
        var _local_5:int;
        _arg_1 = _arg_1.toLowerCase();
        _arg_2 = _arg_2.toLowerCase();
        if ((_arg_1.length + _arg_2.length) > 2)
        {
            _local_3 = 0;
            _local_4 = ((_arg_1.length > _arg_2.length) ? _arg_1.length : _arg_2.length);
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _local_3 = (_arg_2.charCodeAt(_local_5) - _arg_1.charCodeAt(_local_5));
                if (_local_3 != 0) break;
                _local_5++;
            };
            return (_local_3);
        };
        return (_arg_2.charCodeAt(0) - _arg_1.charCodeAt(0));
    }

}//package de.polygonal.ds.sort.compare

//------------------------------------------------------------
//de.polygonal.ds.sort.compare.compareStringCaseSensitive

package de.polygonal.ds.sort.compare
{
    public function compareStringCaseSensitive(_arg_1:String, _arg_2:String):int
    {
        var _local_3:int;
        var _local_4:int;
        var _local_5:int;
        if ((_arg_1.length + _arg_2.length) > 2)
        {
            _local_3 = 0;
            _local_4 = ((_arg_1.length > _arg_2.length) ? _arg_1.length : _arg_2.length);
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _local_3 = (_arg_1.charCodeAt(_local_5) - _arg_2.charCodeAt(_local_5));
                if (_local_3 != 0) break;
                _local_5++;
            };
            return (_local_3);
        };
        return (_arg_1.charCodeAt(0) - _arg_2.charCodeAt(0));
    }

}//package de.polygonal.ds.sort.compare

//------------------------------------------------------------
//de.polygonal.ds.sort.compare.compareStringCaseSensitiveDesc

package de.polygonal.ds.sort.compare
{
    public function compareStringCaseSensitiveDesc(_arg_1:String, _arg_2:String):int
    {
        var _local_3:int;
        var _local_4:int;
        var _local_5:int;
        if ((_arg_1.length + _arg_2.length) > 2)
        {
            _local_3 = 0;
            _local_4 = ((_arg_1.length > _arg_2.length) ? _arg_1.length : _arg_2.length);
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _local_3 = (_arg_2.charCodeAt(_local_5) - _arg_1.charCodeAt(_local_5));
                if (_local_3 != 0) break;
                _local_5++;
            };
            return (_local_3);
        };
        return (_arg_2.charCodeAt(0) - _arg_1.charCodeAt(0));
    }

}//package de.polygonal.ds.sort.compare

//------------------------------------------------------------
//de.polygonal.ds.sort.dLinkedInsertionSort

package de.polygonal.ds.sort
{
    import de.polygonal.ds.DListNode;

    public function dLinkedInsertionSort(_arg_1:DListNode, _arg_2:Boolean=false):DListNode
    {
        var _local_4:DListNode;
        var _local_5:DListNode;
        var _local_6:DListNode;
        var _local_7:DListNode;
        var _local_8:*;
        if (!_arg_1)
        {
            return (null);
        };
        var _local_3:DListNode = _arg_1;
        if (_arg_2)
        {
            _local_5 = _local_3.next;
            while (_local_5)
            {
                _local_6 = _local_5.next;
                _local_4 = _local_5.prev;
                if (_local_4.data < _local_5.data)
                {
                    _local_7 = _local_4;
                    while (_local_7.prev)
                    {
                        if (_local_7.prev.data < _local_5.data)
                        {
                            _local_7 = _local_7.prev;
                        }
                        else
                        {
                            break;
                        };
                    };
                    if (_local_6)
                    {
                        _local_4.next = _local_6;
                        _local_6.prev = _local_4;
                    }
                    else
                    {
                        _local_4.next = null;
                    };
                    if (_local_7 == _local_3)
                    {
                        _local_5.prev = null;
                        _local_5.next = _local_7;
                        _local_7.prev = _local_5;
                        _local_3 = _local_5;
                    }
                    else
                    {
                        _local_5.prev = _local_7.prev;
                        _local_7.prev.next = _local_5;
                        _local_5.next = _local_7;
                        _local_7.prev = _local_5;
                    };
                };
                _local_5 = _local_6;
            };
            return (_local_3);
        };
        _local_5 = _local_3.next;
        while (_local_5)
        {
            _local_6 = _local_5.next;
            _local_4 = _local_5.prev;
            if (_local_4.data > _local_5.data)
            {
                _local_7 = _local_4;
                while (_local_7.prev)
                {
                    if (_local_7.prev.data > _local_5.data)
                    {
                        _local_7 = _local_7.prev;
                    }
                    else
                    {
                        break;
                    };
                };
                if (_local_6)
                {
                    _local_4.next = _local_6;
                    _local_6.prev = _local_4;
                }
                else
                {
                    _local_4.next = null;
                };
                if (_local_7 == _local_3)
                {
                    _local_5.prev = null;
                    _local_5.next = _local_7;
                    _local_7.prev = _local_5;
                    _local_3 = _local_5;
                }
                else
                {
                    _local_5.prev = _local_7.prev;
                    _local_7.prev.next = _local_5;
                    _local_5.next = _local_7;
                    _local_7.prev = _local_5;
                };
            };
            _local_5 = _local_6;
        };
        return (_local_3);
    }

}//package de.polygonal.ds.sort

//------------------------------------------------------------
//de.polygonal.ds.sort.dLinkedInsertionSortCmp

package de.polygonal.ds.sort
{
    import de.polygonal.ds.DListNode;

    public function dLinkedInsertionSortCmp(_arg_1:DListNode, _arg_2:Function, _arg_3:Boolean=false):DListNode
    {
        var _local_5:DListNode;
        var _local_6:DListNode;
        var _local_7:DListNode;
        var _local_8:DListNode;
        var _local_9:*;
        if (((!(_arg_1)) || (_arg_2 == null)))
        {
            return (null);
        };
        var _local_4:DListNode = _arg_1;
        if (_arg_3)
        {
            _local_6 = _local_4.next;
            while (_local_6)
            {
                _local_7 = _local_6.next;
                _local_5 = _local_6.prev;
                if (_arg_2(_local_5.data, _local_6.data) < 0)
                {
                    _local_8 = _local_5;
                    while (_local_8.prev)
                    {
                        if (_arg_2(_local_8.prev.data, _local_6.data) < 0)
                        {
                            _local_8 = _local_8.prev;
                        }
                        else
                        {
                            break;
                        };
                    };
                    if (_local_7)
                    {
                        _local_5.next = _local_7;
                        _local_7.prev = _local_5;
                    }
                    else
                    {
                        _local_5.next = null;
                    };
                    if (_local_8 == _local_4)
                    {
                        _local_6.prev = null;
                        _local_6.next = _local_8;
                        _local_8.prev = _local_6;
                        _local_4 = _local_6;
                    }
                    else
                    {
                        _local_6.prev = _local_8.prev;
                        _local_8.prev.next = _local_6;
                        _local_6.next = _local_8;
                        _local_8.prev = _local_6;
                    };
                };
                _local_6 = _local_7;
            };
        }
        else
        {
            _local_6 = _local_4.next;
            while (_local_6)
            {
                _local_7 = _local_6.next;
                _local_5 = _local_6.prev;
                if (_arg_2(_local_5.data, _local_6.data) > 0)
                {
                    _local_8 = _local_5;
                    while (_local_8.prev)
                    {
                        if (_arg_2(_local_8.prev.data, _local_6.data) > 0)
                        {
                            _local_8 = _local_8.prev;
                        }
                        else
                        {
                            break;
                        };
                    };
                    if (_local_7)
                    {
                        _local_5.next = _local_7;
                        _local_7.prev = _local_5;
                    }
                    else
                    {
                        _local_5.next = null;
                    };
                    if (_local_8 == _local_4)
                    {
                        _local_6.prev = null;
                        _local_6.next = _local_8;
                        _local_8.prev = _local_6;
                        _local_4 = _local_6;
                    }
                    else
                    {
                        _local_6.prev = _local_8.prev;
                        _local_8.prev.next = _local_6;
                        _local_6.next = _local_8;
                        _local_8.prev = _local_6;
                    };
                };
                _local_6 = _local_7;
            };
        };
        return (_local_4);
    }

}//package de.polygonal.ds.sort

//------------------------------------------------------------
//de.polygonal.ds.sort.dLinkedMergeSort

package de.polygonal.ds.sort
{
    import de.polygonal.ds.DListNode;

    public function dLinkedMergeSort(_arg_1:DListNode, _arg_2:Boolean=false):DListNode
    {
        var _local_4:DListNode;
        var _local_5:DListNode;
        var _local_6:DListNode;
        var _local_7:DListNode;
        var _local_9:int;
        var _local_10:int;
        var _local_11:int;
        var _local_12:int;
        if (!_arg_1)
        {
            return (null);
        };
        var _local_3:DListNode = _arg_1;
        var _local_8:int = 1;
        if (_arg_2)
        {
            while (true)
            {
                _local_4 = _local_3;
                _local_3 = (_local_7 = null);
                _local_9 = 0;
                while (_local_4)
                {
                    _local_9++;
                    _local_12 = 0;
                    _local_10 = 0;
                    _local_5 = _local_4;
                    while (_local_12 < _local_8)
                    {
                        _local_10++;
                        _local_5 = _local_5.next;
                        if (!_local_5) break;
                        _local_12++;
                    };
                    _local_11 = _local_8;
                    while (((_local_10 > 0) || ((_local_11 > 0) && (_local_5))))
                    {
                        if (_local_10 == 0)
                        {
                            _local_6 = _local_5;
                            _local_5 = _local_5.next;
                            _local_11--;
                        }
                        else
                        {
                            if (((_local_11 == 0) || (!(_local_5))))
                            {
                                _local_6 = _local_4;
                                _local_4 = _local_4.next;
                                _local_10--;
                            }
                            else
                            {
                                if ((_local_4.data - _local_5.data) >= 0)
                                {
                                    _local_6 = _local_4;
                                    _local_4 = _local_4.next;
                                    _local_10--;
                                }
                                else
                                {
                                    _local_6 = _local_5;
                                    _local_5 = _local_5.next;
                                    _local_11--;
                                };
                            };
                        };
                        if (_local_7)
                        {
                            _local_7.next = _local_6;
                        }
                        else
                        {
                            _local_3 = _local_6;
                        };
                        _local_6.prev = _local_7;
                        _local_7 = _local_6;
                    };
                    _local_4 = _local_5;
                };
                _local_7.next = null;
                if (_local_9 <= 1)
                {
                    return (_local_3);
                };
                _local_8 = (_local_8 << 1);
            };
        };
        while (true)
        {
            _local_4 = _local_3;
            _local_3 = (_local_7 = null);
            _local_9 = 0;
            while (_local_4)
            {
                _local_9++;
                _local_12 = 0;
                _local_10 = 0;
                _local_5 = _local_4;
                while (_local_12 < _local_8)
                {
                    _local_10++;
                    _local_5 = _local_5.next;
                    if (!_local_5) break;
                    _local_12++;
                };
                _local_11 = _local_8;
                while (((_local_10 > 0) || ((_local_11 > 0) && (_local_5))))
                {
                    if (_local_10 == 0)
                    {
                        _local_6 = _local_5;
                        _local_5 = _local_5.next;
                        _local_11--;
                    }
                    else
                    {
                        if (((_local_11 == 0) || (!(_local_5))))
                        {
                            _local_6 = _local_4;
                            _local_4 = _local_4.next;
                            _local_10--;
                        }
                        else
                        {
                            if ((_local_4.data - _local_5.data) <= 0)
                            {
                                _local_6 = _local_4;
                                _local_4 = _local_4.next;
                                _local_10--;
                            }
                            else
                            {
                                _local_6 = _local_5;
                                _local_5 = _local_5.next;
                                _local_11--;
                            };
                        };
                    };
                    if (_local_7)
                    {
                        _local_7.next = _local_6;
                    }
                    else
                    {
                        _local_3 = _local_6;
                    };
                    _local_6.prev = _local_7;
                    _local_7 = _local_6;
                };
                _local_4 = _local_5;
            };
            _local_7.next = null;
            if (_local_9 <= 1)
            {
                return (_local_3);
            };
            _local_8 = (_local_8 << 1);
        };
        return (null); //dead code
    }

}//package de.polygonal.ds.sort

//------------------------------------------------------------
//de.polygonal.ds.sort.dLinkedMergeSortCmp

package de.polygonal.ds.sort
{
    import de.polygonal.ds.DListNode;

    public function dLinkedMergeSortCmp(_arg_1:DListNode, _arg_2:Function, _arg_3:Boolean=false):DListNode
    {
        var _local_5:DListNode;
        var _local_6:DListNode;
        var _local_7:DListNode;
        var _local_8:DListNode;
        var _local_10:int;
        var _local_11:int;
        var _local_12:int;
        var _local_13:int;
        if (((!(_arg_1)) || (_arg_2 == null)))
        {
            return (null);
        };
        var _local_4:DListNode = _arg_1;
        var _local_9:int = 1;
        if (_arg_3)
        {
            while (true)
            {
                _local_5 = _local_4;
                _local_4 = (_local_8 = null);
                _local_10 = 0;
                while (_local_5)
                {
                    _local_10++;
                    _local_13 = 0;
                    _local_11 = 0;
                    _local_6 = _local_5;
                    while (_local_13 < _local_9)
                    {
                        _local_11++;
                        _local_6 = _local_6.next;
                        if (!_local_6) break;
                        _local_13++;
                    };
                    _local_12 = _local_9;
                    while (((_local_11 > 0) || ((_local_12 > 0) && (_local_6))))
                    {
                        if (_local_11 == 0)
                        {
                            _local_7 = _local_6;
                            _local_6 = _local_6.next;
                            _local_12--;
                        }
                        else
                        {
                            if (((_local_12 == 0) || (!(_local_6))))
                            {
                                _local_7 = _local_5;
                                _local_5 = _local_5.next;
                                _local_11--;
                            }
                            else
                            {
                                if (_arg_2(_local_5.data, _local_6.data) >= 0)
                                {
                                    _local_7 = _local_5;
                                    _local_5 = _local_5.next;
                                    _local_11--;
                                }
                                else
                                {
                                    _local_7 = _local_6;
                                    _local_6 = _local_6.next;
                                    _local_12--;
                                };
                            };
                        };
                        if (_local_8)
                        {
                            _local_8.next = _local_7;
                        }
                        else
                        {
                            _local_4 = _local_7;
                        };
                        _local_7.prev = _local_8;
                        _local_8 = _local_7;
                    };
                    _local_5 = _local_6;
                };
                _arg_1.prev = _local_8;
                _local_8.next = null;
                if (_local_10 <= 1)
                {
                    return (_local_4);
                };
                _local_9 = (_local_9 << 1);
            };
        };
        while (true)
        {
            _local_5 = _local_4;
            _local_4 = (_local_8 = null);
            _local_10 = 0;
            while (_local_5)
            {
                _local_10++;
                _local_13 = 0;
                _local_11 = 0;
                _local_6 = _local_5;
                while (_local_13 < _local_9)
                {
                    _local_11++;
                    _local_6 = _local_6.next;
                    if (!_local_6) break;
                    _local_13++;
                };
                _local_12 = _local_9;
                while (((_local_11 > 0) || ((_local_12 > 0) && (_local_6))))
                {
                    if (_local_11 == 0)
                    {
                        _local_7 = _local_6;
                        _local_6 = _local_6.next;
                        _local_12--;
                    }
                    else
                    {
                        if (((_local_12 == 0) || (!(_local_6))))
                        {
                            _local_7 = _local_5;
                            _local_5 = _local_5.next;
                            _local_11--;
                        }
                        else
                        {
                            if (_arg_2(_local_5.data, _local_6.data) <= 0)
                            {
                                _local_7 = _local_5;
                                _local_5 = _local_5.next;
                                _local_11--;
                            }
                            else
                            {
                                _local_7 = _local_6;
                                _local_6 = _local_6.next;
                                _local_12--;
                            };
                        };
                    };
                    if (_local_8)
                    {
                        _local_8.next = _local_7;
                    }
                    else
                    {
                        _local_4 = _local_7;
                    };
                    _local_7.prev = _local_8;
                    _local_8 = _local_7;
                };
                _local_5 = _local_6;
            };
            _arg_1.prev = _local_8;
            _local_8.next = null;
            if (_local_10 <= 1)
            {
                return (_local_4);
            };
            _local_9 = (_local_9 << 1);
        };
        return (null); //dead code
    }

}//package de.polygonal.ds.sort

//------------------------------------------------------------
//de.polygonal.ds.Collection

package de.polygonal.ds
{
    public interface Collection 
    {

        function contains(_arg_1:*):Boolean;
        function clear():void;
        function getIterator():Iterator;
        function get size():int;
        function isEmpty():Boolean;
        function toArray():Array;

    }
}//package de.polygonal.ds

//------------------------------------------------------------
//de.polygonal.ds.DLinkedList

package de.polygonal.ds
{
    import de.polygonal.ds.sort.dLinkedInsertionSortCmp;
    import de.polygonal.ds.sort.dLinkedMergeSortCmp;
    import de.polygonal.ds.sort.compare.compareStringCaseSensitiveDesc;
    import de.polygonal.ds.sort.compare.compareStringCaseInSensitive;
    import de.polygonal.ds.sort.compare.compareStringCaseInSensitiveDesc;
    import de.polygonal.ds.sort.compare.compareStringCaseSensitive;
    import de.polygonal.ds.sort.dLinkedInsertionSort;
    import de.polygonal.ds.sort.dLinkedMergeSort;

    public class DLinkedList implements Collection 
    {

        private var _count:int;
        public var head:DListNode;
        public var tail:DListNode;

        public function DLinkedList(... _args)
        {
            this.head = (this.tail = null);
            this._count = 0;
            if (_args.length > 0)
            {
                this.append.apply(this, _args);
            };
        }

        public function append(... _args):DListNode
        {
            var _local_4:DListNode;
            var _local_5:int;
            var _local_2:int = _args.length;
            var _local_3:DListNode = new DListNode(_args[0]);
            if (this.head)
            {
                this.tail.insertAfter(_local_3);
                this.tail = this.tail.next;
            }
            else
            {
                this.head = (this.tail = _local_3);
            };
            if (_local_2 > 1)
            {
                _local_4 = _local_3;
                _local_5 = 1;
                while (_local_5 < _local_2)
                {
                    _local_3 = new DListNode(_args[_local_5]);
                    this.tail.insertAfter(_local_3);
                    this.tail = this.tail.next;
                    _local_5++;
                };
                this._count = (this._count + _local_2);
                return (_local_4);
            };
            this._count++;
            return (_local_3);
        }

        public function prepend(... _args):DListNode
        {
            var _local_4:DListNode;
            var _local_5:int;
            var _local_2:int = _args.length;
            var _local_3:DListNode = new DListNode(_args[int((_local_2 - 1))]);
            if (this.head)
            {
                this.head.insertBefore(_local_3);
                this.head = this.head.prev;
            }
            else
            {
                this.head = (this.tail = _local_3);
            };
            if (_local_2 > 1)
            {
                _local_4 = _local_3;
                _local_5 = (_local_2 - 2);
                while (_local_5 >= 0)
                {
                    _local_3 = new DListNode(_args[_local_5]);
                    this.head.insertBefore(_local_3);
                    this.head = this.head.prev;
                    _local_5--;
                };
                this._count = (this._count + _local_2);
                return (_local_4);
            };
            this._count++;
            return (_local_3);
        }

        public function insertAfter(_arg_1:DListIterator, _arg_2:*):DListNode
        {
            var _local_3:DListNode;
            if (_arg_1.list != this)
            {
                return (null);
            };
            if (_arg_1.node)
            {
                _local_3 = new DListNode(_arg_2);
                _arg_1.node.insertAfter(_local_3);
                if (_arg_1.node == this.tail)
                {
                    this.tail = _arg_1.node.next;
                };
                this._count++;
                return (_local_3);
            };
            return (this.append(_arg_2));
        }

        public function insertBefore(_arg_1:DListIterator, _arg_2:*):DListNode
        {
            var _local_3:DListNode;
            if (_arg_1.list != this)
            {
                return (null);
            };
            if (_arg_1.node)
            {
                _local_3 = new DListNode(_arg_2);
                _arg_1.node.insertBefore(_local_3);
                if (_arg_1.node == this.head)
                {
                    this.head = this.head.prev;
                };
                this._count++;
                return (_local_3);
            };
            return (this.prepend(_arg_2));
        }

        public function remove(_arg_1:DListIterator):Boolean
        {
            if (((!(_arg_1.list == this)) || (!(_arg_1.node))))
            {
                return (false);
            };
            var _local_2:DListNode = _arg_1.node;
            if (_local_2 == this.head)
            {
                this.head = this.head.next;
            }
            else
            {
                if (_local_2 == this.tail)
                {
                    this.tail = this.tail.prev;
                };
            };
            if (_arg_1.node)
            {
                _arg_1.node = _arg_1.node.next;
            };
            if (_local_2.prev)
            {
                _local_2.prev.next = _local_2.next;
            };
            if (_local_2.next)
            {
                _local_2.next.prev = _local_2.prev;
            };
            _local_2.next = (_local_2.prev = null);
            if (this.head == null)
            {
                this.tail = null;
            };
            this._count--;
            return (true);
        }

        public function removeHead():*
        {
            var _local_1:*;
            if (this.head)
            {
                _local_1 = this.head.data;
                this.head = this.head.next;
                if (this.head)
                {
                    this.head.prev = null;
                }
                else
                {
                    this.tail = null;
                };
                this._count--;
                return (_local_1);
            };
            return (null);
        }

        public function removeTail():*
        {
            var _local_1:*;
            if (this.tail)
            {
                _local_1 = this.tail.data;
                this.tail = this.tail.prev;
                if (this.tail)
                {
                    this.tail.next = null;
                }
                else
                {
                    this.head = null;
                };
                this._count--;
                return (_local_1);
            };
            return (null);
        }

        public function merge(... _args):void
        {
            var _local_2:DLinkedList;
            _local_2 = _args[0];
            if (_local_2.head)
            {
                if (this.head)
                {
                    this.tail.next = _local_2.head;
                    _local_2.head.prev = this.tail;
                    this.tail = _local_2.tail;
                }
                else
                {
                    this.head = _local_2.head;
                    this.tail = _local_2.tail;
                };
                this._count = (this._count + _local_2.size);
            };
            var _local_3:int = _args.length;
            var _local_4:int = 1;
            while (_local_4 < _local_3)
            {
                _local_2 = _args[_local_4];
                if (_local_2.head)
                {
                    this.tail.next = _local_2.head;
                    _local_2.head.prev = this.tail;
                    this.tail = _local_2.tail;
                    this._count = (this._count + _local_2.size);
                };
                _local_4++;
            };
        }

        public function concat(... _args):DLinkedList
        {
            var _local_3:DLinkedList;
            var _local_4:DListNode;
            var _local_2:DLinkedList = new DLinkedList();
            _local_4 = this.head;
            while (_local_4)
            {
                _local_2.append(_local_4.data);
                _local_4 = _local_4.next;
            };
            var _local_5:int = _args.length;
            var _local_6:int;
            while (_local_6 < _local_5)
            {
                _local_3 = _args[_local_6];
                _local_4 = _local_3.head;
                while (_local_4)
                {
                    _local_2.append(_local_4.data);
                    _local_4 = _local_4.next;
                };
                _local_6++;
            };
            return (_local_2);
        }

        public function sort(... _args):void
        {
            var _local_2:int;
            var _local_3:Function;
            var _local_4:*;
            if (this._count <= 1)
            {
                return;
            };
            if (_args.length > 0)
            {
                _local_2 = 0;
                _local_3 = null;
                _local_4 = _args[0];
                if ((_local_4 is Function))
                {
                    _local_3 = _local_4;
                    if (_args.length > 1)
                    {
                        _local_4 = _args[1];
                        if ((_local_4 is int))
                        {
                            _local_2 = _local_4;
                        };
                    };
                }
                else
                {
                    if ((_local_4 is int))
                    {
                        _local_2 = _local_4;
                    };
                };
                if (Boolean(_local_3))
                {
                    if ((_local_2 & 0x02))
                    {
                        this.head = dLinkedInsertionSortCmp(this.head, _local_3, (_local_2 == 18));
                    }
                    else
                    {
                        this.head = dLinkedMergeSortCmp(this.head, _local_3, (_local_2 == 16));
                    };
                }
                else
                {
                    if ((_local_2 & 0x02))
                    {
                        if ((_local_2 & 0x04))
                        {
                            if (_local_2 == 22)
                            {
                                this.head = dLinkedInsertionSortCmp(this.head, compareStringCaseSensitiveDesc);
                            }
                            else
                            {
                                if (_local_2 == 14)
                                {
                                    this.head = dLinkedInsertionSortCmp(this.head, compareStringCaseInSensitive);
                                }
                                else
                                {
                                    if (_local_2 == 30)
                                    {
                                        this.head = dLinkedInsertionSortCmp(this.head, compareStringCaseInSensitiveDesc);
                                    }
                                    else
                                    {
                                        this.head = dLinkedInsertionSortCmp(this.head, compareStringCaseSensitive);
                                    };
                                };
                            };
                        }
                        else
                        {
                            this.head = dLinkedInsertionSort(this.head, (_local_2 == 18));
                        };
                    }
                    else
                    {
                        if ((_local_2 & 0x04))
                        {
                            if (_local_2 == 20)
                            {
                                this.head = dLinkedMergeSortCmp(this.head, compareStringCaseSensitiveDesc);
                            }
                            else
                            {
                                if (_local_2 == 12)
                                {
                                    this.head = dLinkedMergeSortCmp(this.head, compareStringCaseInSensitive);
                                }
                                else
                                {
                                    if (_local_2 == 28)
                                    {
                                        this.head = dLinkedMergeSortCmp(this.head, compareStringCaseInSensitiveDesc);
                                    }
                                    else
                                    {
                                        this.head = dLinkedMergeSortCmp(this.head, compareStringCaseSensitive);
                                    };
                                };
                            };
                        }
                        else
                        {
                            if ((_local_2 & 0x10))
                            {
                                this.head = dLinkedMergeSort(this.head, true);
                            };
                        };
                    };
                };
            }
            else
            {
                this.head = dLinkedMergeSort(this.head);
            };
        }

        public function nodeOf(_arg_1:*, _arg_2:DListIterator=null):DListIterator
        {
            if (_arg_2 != null)
            {
                if (_arg_2.list != this)
                {
                    return (null);
                };
            };
            var _local_3:DListNode = ((_arg_2 == null) ? this.head : _arg_2.node);
            while (_local_3)
            {
                if (_local_3.data === _arg_1)
                {
                    return (new DListIterator(this, _local_3));
                };
                _local_3 = _local_3.next;
            };
            return (null);
        }

        public function lastNodeOf(_arg_1:*, _arg_2:DListIterator=null):DListIterator
        {
            if (_arg_2 != null)
            {
                if (_arg_2.list != this)
                {
                    return (null);
                };
            };
            var _local_3:DListNode = ((_arg_2 == null) ? this.tail : _arg_2.node);
            while (_local_3)
            {
                if (_local_3.data === _arg_1)
                {
                    return (new DListIterator(this, _local_3));
                };
                _local_3 = _local_3.prev;
            };
            return (null);
        }

        public function splice(_arg_1:DListIterator, _arg_2:uint=0xFFFFFFFF, ... _args):DLinkedList
        {
            var _local_4:DListNode;
            var _local_5:DListNode;
            var _local_6:DLinkedList;
            var _local_7:int;
            var _local_8:int;
            var _local_9:DListNode;
            if (_arg_1)
            {
                if (_arg_1.list != this)
                {
                    return (null);
                };
            };
            if (_arg_1.node)
            {
                _local_4 = _arg_1.node;
                _local_5 = _arg_1.node.prev;
                _local_6 = new DLinkedList();
                if (_arg_2 == 0xFFFFFFFF)
                {
                    if (_arg_1.node == this.tail)
                    {
                        return (_local_6);
                    };
                    while (_arg_1.node)
                    {
                        _local_6.append(_arg_1.node.data);
                        _arg_1.remove();
                    };
                    _arg_1.list = _local_6;
                    _arg_1.node = _local_4;
                    return (_local_6);
                };
                _local_7 = 0;
                while (_local_7 < _arg_2)
                {
                    if (_arg_1.node)
                    {
                        _local_6.append(_arg_1.node.data);
                        _arg_1.remove();
                    }
                    else
                    {
                        break;
                    };
                    _local_7++;
                };
                _local_8 = _args.length;
                if (_local_8 > 0)
                {
                    if (this._count == 0)
                    {
                        _local_7 = 0;
                        while (_local_7 < _local_8)
                        {
                            this.append(_args[_local_7]);
                            _local_7++;
                        };
                    }
                    else
                    {
                        if (_local_5 == null)
                        {
                            _local_9 = this.prepend(_args[0]);
                            _local_7 = 1;
                            while (_local_7 < _local_8)
                            {
                                _local_9.insertAfter(new DListNode(_args[_local_7]));
                                if (_local_9 == this.tail)
                                {
                                    this.tail = _local_9.next;
                                };
                                _local_9 = _local_9.next;
                                this._count++;
                                _local_7++;
                            };
                        }
                        else
                        {
                            _local_9 = _local_5;
                            _local_7 = 0;
                            while (_local_7 < _local_8)
                            {
                                _local_9.insertAfter(new DListNode(_args[_local_7]));
                                if (_local_9 == this.tail)
                                {
                                    this.tail = _local_9.next;
                                };
                                _local_9 = _local_9.next;
                                this._count++;
                                _local_7++;
                            };
                        };
                    };
                    _arg_1.node = _local_9;
                }
                else
                {
                    _arg_1.node = _local_4;
                };
                _arg_1.list = _local_6;
                return (_local_6);
            };
            return (null);
        }

        public function shiftUp():void
        {
            var _local_1:DListNode = this.head;
            if (this.head.next == this.tail)
            {
                this.head = this.tail;
                this.head.prev = null;
                this.tail = _local_1;
                this.tail.next = null;
                this.head.next = this.tail;
                this.tail.prev = this.head;
            }
            else
            {
                this.head = this.head.next;
                this.head.prev = null;
                this.tail.next = _local_1;
                _local_1.next = null;
                _local_1.prev = this.tail;
                this.tail = _local_1;
            };
        }

        public function popDown():void
        {
            var _local_1:DListNode = this.tail;
            if (this.tail.prev == this.head)
            {
                this.tail = this.head;
                this.tail.next = null;
                this.head = _local_1;
                this.head.prev = null;
                this.head.next = this.tail;
                this.tail.prev = this.head;
            }
            else
            {
                this.tail = this.tail.prev;
                this.tail.next = null;
                this.head.prev = _local_1;
                _local_1.prev = null;
                _local_1.next = this.head;
                this.head = _local_1;
            };
        }

        public function reverse():void
        {
            var _local_1:DListNode;
            var _local_3:DListNode;
            if (this._count == 0)
            {
                return;
            };
            var _local_2:DListNode = this.tail;
            while (_local_2)
            {
                _local_1 = _local_2.prev;
                if (!_local_2.next)
                {
                    _local_2.next = _local_2.prev;
                    _local_2.prev = null;
                    this.head = _local_2;
                }
                else
                {
                    if (!_local_2.prev)
                    {
                        _local_2.prev = _local_2.next;
                        _local_2.next = null;
                        this.tail = _local_2;
                    }
                    else
                    {
                        _local_3 = _local_2.next;
                        _local_2.next = _local_2.prev;
                        _local_2.prev = _local_3;
                    };
                };
                _local_2 = _local_1;
            };
        }

        public function join(_arg_1:*):String
        {
            if (this._count == 0)
            {
                return ("");
            };
            var _local_2:* = "";
            var _local_3:DListNode = this.head;
            while (_local_3.next)
            {
                _local_2 = (_local_2 + (_local_3.data + _arg_1));
                _local_3 = _local_3.next;
            };
            return (_local_2 + _local_3.data);
        }

        public function contains(_arg_1:*):Boolean
        {
            var _local_2:DListNode = this.head;
            while (_local_2)
            {
                if (_local_2.data == _arg_1)
                {
                    return (true);
                };
                _local_2 = _local_2.next;
            };
            return (false);
        }

        public function clear():void
        {
            var _local_2:DListNode;
            var _local_1:DListNode = this.head;
            this.head = null;
            while (_local_1)
            {
                _local_2 = _local_1.next;
                _local_1.next = (_local_1.prev = null);
                _local_1 = _local_2;
            };
            this._count = 0;
        }

        public function getIterator():Iterator
        {
            return (new DListIterator(this, this.head));
        }

        public function getListIterator():DListIterator
        {
            return (new DListIterator(this, this.head));
        }

        public function get size():int
        {
            return (this._count);
        }

        public function isEmpty():Boolean
        {
            return (this._count == 0);
        }

        public function toArray():Array
        {
            var _local_1:Array = [];
            var _local_2:DListNode = this.head;
            while (_local_2)
            {
                _local_1.push(_local_2.data);
                _local_2 = _local_2.next;
            };
            return (_local_1);
        }

        public function toString():String
        {
            return (("[DLinkedList > has " + this.size) + " nodes]");
        }

        public function dump():String
        {
            if (this.head == null)
            {
                return ("DLinkedList, empty");
            };
            var _local_1:* = (((("DLinkedList, has " + this._count) + " node") + ((this._count == 1) ? "" : "s")) + "\n|< Head\n");
            var _local_2:DListIterator = this.getListIterator();
            while (_local_2.valid())
            {
                _local_1 = (_local_1 + (("\t" + _local_2.data) + "\n"));
                _local_2.forth();
            };
            return (_local_1 + "Tail >|");
        }


    }
}//package de.polygonal.ds

//------------------------------------------------------------
//de.polygonal.ds.DListIterator

package de.polygonal.ds
{
    public class DListIterator implements Iterator 
    {

        public var node:DListNode;
        public var list:DLinkedList;

        public function DListIterator(_arg_1:DLinkedList, _arg_2:DListNode=null)
        {
            this.list = _arg_1;
            this.node = _arg_2;
        }

        public function start():void
        {
            this.node = this.list.head;
        }

        public function next():*
        {
            var _local_1:*;
            if (this.hasNext())
            {
                _local_1 = this.node.data;
                this.node = this.node.next;
                return (_local_1);
            };
            return (null);
        }

        public function hasNext():Boolean
        {
            return (Boolean(this.node));
        }

        public function get data():*
        {
            if (this.node)
            {
                return (this.node.data);
            };
            return (null);
        }

        public function set data(_arg_1:*):void
        {
            this.node.data = _arg_1;
        }

        public function end():void
        {
            this.node = this.list.tail;
        }

        public function forth():void
        {
            if (this.node)
            {
                this.node = this.node.next;
            };
        }

        public function back():void
        {
            if (this.node)
            {
                this.node = this.node.prev;
            };
        }

        public function valid():Boolean
        {
            return (Boolean(this.node));
        }

        public function remove():Boolean
        {
            return (this.list.remove(this));
        }

        public function toString():String
        {
            return (("{DListIterator, data=" + ((this.node) ? this.node.data : "null")) + "}");
        }


    }
}//package de.polygonal.ds

//------------------------------------------------------------
//de.polygonal.ds.DListNode

package de.polygonal.ds
{
    public class DListNode implements LinkedListNode 
    {

        public var data:*;
        public var next:DListNode;
        public var prev:DListNode;

        public function DListNode(_arg_1:*)
        {
            this.next = (this.prev = null);
            this.data = _arg_1;
        }

        public function insertAfter(_arg_1:DListNode):void
        {
            _arg_1.next = this.next;
            _arg_1.prev = this;
            if (this.next)
            {
                this.next.prev = _arg_1;
            };
            this.next = _arg_1;
        }

        public function insertBefore(_arg_1:DListNode):void
        {
            _arg_1.next = this;
            _arg_1.prev = this.prev;
            if (this.prev)
            {
                this.prev.next = _arg_1;
            };
            this.prev = _arg_1;
        }

        public function unlink():void
        {
            if (this.prev)
            {
                this.prev.next = this.next;
            };
            if (this.next)
            {
                this.next.prev = this.prev;
            };
            this.next = (this.prev = null);
        }

        public function toString():String
        {
            return (("[DListNode, data=" + this.data) + "]");
        }


    }
}//package de.polygonal.ds

//------------------------------------------------------------
//de.polygonal.ds.Graph

package de.polygonal.ds
{
    public class Graph implements Collection 
    {

        public var nodes:Array;
        private var _nodeCount:int;
        private var _maxSize:int;

        public function Graph(_arg_1:int)
        {
            this.nodes = new Array((this._maxSize = _arg_1));
            this._nodeCount = 0;
        }

        public function get maxSize():int
        {
            return (this._maxSize);
        }

        public function depthFirst(_arg_1:GraphNode, _arg_2:Function):void
        {
            var _local_5:int;
            var _local_6:int;
            var _local_7:Array;
            var _local_8:GraphNode;
            if (!_arg_1)
            {
                return;
            };
            var _local_3:Array = [_arg_1];
            var _local_4:int = 1;
            while (_local_4 > 0)
            {
                _local_8 = _local_3[--_local_4];
                if (!_local_8.marked)
                {
                    _local_8.marked = true;
                    (_arg_2(_local_8));
                    _local_5 = _local_8.numArcs;
                    _local_7 = _local_8.arcs;
                    _local_6 = 0;
                    while (_local_6 < _local_5)
                    {
                        var _local_9:* = _local_4++;
                        _local_3[_local_9] = _local_7[_local_6].node;
                        _local_6++;
                    };
                };
            };
        }

        public function breadthFirst(_arg_1:GraphNode, _arg_2:Function):void
        {
            var _local_7:int;
            var _local_8:int;
            var _local_9:Array;
            var _local_10:GraphNode;
            var _local_11:GraphNode;
            if (!_arg_1)
            {
                return;
            };
            var _local_3:Array = new Array(0x10000);
            var _local_4:int = (0x10000 - 1);
            var _local_5:int;
            _local_3[0] = _arg_1;
            _arg_1.marked = true;
            var _local_6:int = 1;
            while (_local_6 > 0)
            {
                _local_10 = _local_3[_local_5];
                if (!_arg_2(_local_10))
                {
                    return;
                };
                _local_9 = _local_10.arcs;
                _local_7 = _local_10.numArcs;
                _local_8 = 0;
                while (_local_8 < _local_7)
                {
                    _local_11 = _local_9[_local_8].node;
                    if (!_local_11.marked)
                    {
                        _local_11.marked = true;
                        _local_3[int(((_local_6++ + _local_5) & _local_4))] = _local_11;
                    };
                    _local_8++;
                };
                if (++_local_5 == 0x10000)
                {
                    _local_5 = 0;
                };
                _local_6--;
            };
        }

        public function addNode(_arg_1:*, _arg_2:int):Boolean
        {
            if (this.nodes[_arg_2])
            {
                return (false);
            };
            this.nodes[_arg_2] = new GraphNode(_arg_1);
            this._nodeCount++;
            return (true);
        }

        public function removeNode(_arg_1:int):Boolean
        {
            var _local_4:GraphNode;
            var _local_2:GraphNode = this.nodes[_arg_1];
            if (!_local_2)
            {
                return (false);
            };
            var _local_3:int;
            while (_local_3 < this._maxSize)
            {
                _local_4 = this.nodes[_local_3];
                if (((_local_4) && (_local_4.getArc(_local_2))))
                {
                    this.removeArc(_local_3, _arg_1);
                };
                _local_3++;
            };
            this.nodes[_arg_1] = null;
            this._nodeCount--;
            return (true);
        }

        public function getArc(_arg_1:int, _arg_2:int):GraphArc
        {
            var _local_3:GraphNode = this.nodes[_arg_1];
            var _local_4:GraphNode = this.nodes[_arg_2];
            if (((_local_3) && (_local_4)))
            {
                return (_local_3.getArc(_local_4));
            };
            return (null);
        }

        public function addArc(_arg_1:int, _arg_2:int, _arg_3:int=1):Boolean
        {
            var _local_4:GraphNode = this.nodes[_arg_1];
            var _local_5:GraphNode = this.nodes[_arg_2];
            if (((_local_4) && (_local_5)))
            {
                if (_local_4.getArc(_local_5))
                {
                    return (false);
                };
                _local_4.addArc(_local_5, _arg_3);
                return (true);
            };
            return (false);
        }

        public function removeArc(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:GraphNode = this.nodes[_arg_1];
            var _local_4:GraphNode = this.nodes[_arg_2];
            if (((_local_3) && (_local_4)))
            {
                _local_3.removeArc(_local_4);
                return (true);
            };
            return (false);
        }

        public function clearMarks():void
        {
            var _local_2:GraphNode;
            var _local_1:int;
            while (_local_1 < this._maxSize)
            {
                _local_2 = this.nodes[_local_1];
                if (_local_2)
                {
                    _local_2.marked = false;
                };
                _local_1++;
            };
        }

        public function contains(_arg_1:*):Boolean
        {
            var _local_2:GraphNode;
            var _local_3:int = this._nodeCount;
            var _local_4:int;
            while (_local_4 < _local_3)
            {
                _local_2 = this.nodes[_local_4];
                if (((_local_2) && (_local_2.data == _arg_1)))
                {
                    return (true);
                };
                _local_4++;
            };
            return (false);
        }

        public function clear():void
        {
            this.nodes = new Array(this._maxSize);
            this._nodeCount = 0;
        }

        public function getIterator():Iterator
        {
            return (new GraphIterator(this));
        }

        public function get size():int
        {
            return (this._nodeCount);
        }

        public function isEmpty():Boolean
        {
            return (this.size == 0);
        }

        public function toArray():Array
        {
            var _local_2:GraphNode;
            var _local_1:Array = [];
            var _local_3:int = this._nodeCount;
            var _local_4:int;
            var _local_5:int;
            while (_local_4 < _local_3)
            {
                _local_2 = this.nodes[_local_4];
                if (_local_2)
                {
                    var _local_6:* = _local_5++;
                    _local_1[_local_6] = _local_2.data;
                };
                _local_4++;
            };
            return (_local_1);
        }


    }
}//package de.polygonal.ds

import de.polygonal.ds.Iterator;
import de.polygonal.ds.Graph;
import de.polygonal.ds.GraphNode;

class GraphIterator implements Iterator 
{

    /*private*/ var _nodes:Array;
    /*private*/ var _cursor:int;
    /*private*/ var _size:int;

    public function GraphIterator(_arg_1:Graph)
    {
        this._nodes = _arg_1.nodes;
        this._size = _arg_1.maxSize;
    }

    public function get data():*
    {
        var _local_1:GraphNode = this._nodes[this._cursor];
        if (_local_1)
        {
            return (_local_1.data);
        };
    }

    public function set data(_arg_1:*):void
    {
        var _local_2:GraphNode = this._nodes[this._cursor];
        if (_local_2)
        {
            _local_2.data = _arg_1;
        };
    }

    public function start():void
    {
        this._cursor = 0;
    }

    public function hasNext():Boolean
    {
        return (this._cursor < this._size);
    }

    public function next():*
    {
        var _local_1:*;
        if (this._cursor < this._size)
        {
            _local_1 = this._nodes[this._cursor];
            if (_local_1)
            {
                this._cursor++;
                return (_local_1);
            };
            while (this._cursor < this._size)
            {
                _local_1 = this._nodes[this._cursor++];
                if (_local_1)
                {
                    return (_local_1);
                };
            };
        };
        return (null);
    }


}


//------------------------------------------------------------
//de.polygonal.ds.GraphArc

package de.polygonal.ds
{
    public class GraphArc 
    {

        public var node:GraphNode;
        public var weight:Number;

        public function GraphArc(_arg_1:GraphNode, _arg_2:Number=1)
        {
            this.node = _arg_1;
            this.weight = _arg_2;
        }

    }
}//package de.polygonal.ds

//------------------------------------------------------------
//de.polygonal.ds.GraphNode

package de.polygonal.ds
{
    public class GraphNode 
    {

        public var data:*;
        public var arcs:Array;
        public var marked:Boolean;
        private var _arcCount:int = 0;

        public function GraphNode(_arg_1:*)
        {
            this.data = _arg_1;
            this.arcs = new Array((this._arcCount = 0));
            this.marked = false;
        }

        public function addArc(_arg_1:GraphNode, _arg_2:Number):void
        {
            this.arcs[int(this._arcCount++)] = new GraphArc(_arg_1, _arg_2);
        }

        public function removeArc(_arg_1:GraphNode):Boolean
        {
            var _local_2:int;
            while (_local_2 < this._arcCount)
            {
                if (this.arcs[_local_2].node == _arg_1)
                {
                    this.arcs.splice(_local_2, 1);
                    this._arcCount--;
                    return (true);
                };
                _local_2++;
            };
            return (false);
        }

        public function getArc(_arg_1:GraphNode):GraphArc
        {
            var _local_3:GraphArc;
            var _local_2:int;
            while (_local_2 < this._arcCount)
            {
                _local_3 = this.arcs[_local_2];
                if (_local_3.node == _arg_1)
                {
                    return (_local_3);
                };
                _local_2++;
            };
            return (null);
        }

        public function get numArcs():int
        {
            return (this._arcCount);
        }


    }
}//package de.polygonal.ds

//------------------------------------------------------------
//de.polygonal.ds.Heap

package de.polygonal.ds
{
    public class Heap implements Collection 
    {

        public var _heap:Array;
        private var _size:int;
        private var _count:int;
        private var _compare:Function;

        public function Heap(size:int, compare:Function=null)
        {
            super();
            this._heap = new Array((this._size = (size + 1)));
            this._count = 0;
            if (compare == null)
            {
                this._compare = function (_arg_1:int, _arg_2:int):int
                {
                    return (_arg_1 - _arg_2);
                };
            }
            else
            {
                this._compare = compare;
            };
        }

        public function get front():*
        {
            return (this._heap[1]);
        }

        public function get maxSize():int
        {
            return (this._size);
        }

        public function enqueue(_arg_1:*):Boolean
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:*;
            var _local_5:*;
            if ((this._count + 1) < this._size)
            {
                var _local_6:* = ++this._count;
                this._heap[_local_6] = _arg_1;
                _local_2 = this._count;
                _local_3 = (_local_2 >> 1);
                _local_4 = this._heap[_local_2];
                if (this._compare != null)
                {
                    while (_local_3 > 0)
                    {
                        _local_5 = this._heap[_local_3];
                        if (this._compare(_local_4, _local_5) > 0)
                        {
                            this._heap[_local_2] = _local_5;
                            _local_2 = _local_3;
                            _local_3 = (_local_3 >> 1);
                        }
                        else
                        {
                            break;
                        };
                    };
                }
                else
                {
                    while (_local_3 > 0)
                    {
                        _local_5 = this._heap[_local_3];
                        if ((_local_4 - _local_5) > 0)
                        {
                            this._heap[_local_2] = _local_5;
                            _local_2 = _local_3;
                            _local_3 = (_local_3 >> 1);
                        }
                        else
                        {
                            break;
                        };
                    };
                };
                this._heap[_local_2] = _local_4;
                return (true);
            };
            return (false);
        }

        public function dequeue():*
        {
            var _local_1:*;
            var _local_2:int;
            var _local_3:int;
            var _local_4:*;
            var _local_5:*;
            if (this._count >= 1)
            {
                _local_1 = this._heap[1];
                this._heap[1] = this._heap[this._count];
                delete this._heap[this._count];
                _local_2 = 1;
                _local_3 = (_local_2 << 1);
                _local_4 = this._heap[_local_2];
                if (this._compare != null)
                {
                    while (_local_3 < this._count)
                    {
                        if (_local_3 < (this._count - 1))
                        {
                            if (this._compare(this._heap[_local_3], this._heap[int((_local_3 + 1))]) < 0)
                            {
                                _local_3++;
                            };
                        };
                        _local_5 = this._heap[_local_3];
                        if (this._compare(_local_4, _local_5) < 0)
                        {
                            this._heap[_local_2] = _local_5;
                            _local_2 = _local_3;
                            _local_3 = (_local_3 << 1);
                        }
                        else
                        {
                            break;
                        };
                    };
                }
                else
                {
                    while (_local_3 < this._count)
                    {
                        if (_local_3 < (this._count - 1))
                        {
                            if ((this._heap[_local_3] - this._heap[int((_local_3 + 1))]) < 0)
                            {
                                _local_3++;
                            };
                        };
                        _local_5 = this._heap[_local_3];
                        if ((_local_4 - _local_5) < 0)
                        {
                            this._heap[_local_2] = _local_5;
                            _local_2 = _local_3;
                            _local_3 = (_local_3 << 1);
                        }
                        else
                        {
                            break;
                        };
                    };
                };
                this._heap[_local_2] = _local_4;
                this._count--;
                return (_local_1);
            };
            return (null);
        }

        public function contains(_arg_1:*):Boolean
        {
            var _local_2:int = 1;
            while (_local_2 <= this._count)
            {
                if (this._heap[_local_2] === _arg_1)
                {
                    return (true);
                };
                _local_2++;
            };
            return (false);
        }

        public function clear():void
        {
            this._heap = new Array(this._size);
            this._count = 0;
        }

        public function getIterator():Iterator
        {
            return (new HeapIterator(this));
        }

        public function get size():int
        {
            return (this._count);
        }

        public function isEmpty():Boolean
        {
            return (false);
        }

        public function toArray():Array
        {
            return (this._heap.slice(1, (this._count + 1)));
        }

        public function toString():String
        {
            return (("[Heap, size=" + this._size) + "]");
        }

        public function dump():String
        {
            var _local_1:* = "Heap\n{\n";
            var _local_2:int = (this._count + 1);
            var _local_3:int = 1;
            while (_local_3 < _local_2)
            {
                _local_1 = (_local_1 + (("\t" + this._heap[_local_3]) + "\n"));
                _local_3++;
            };
            return (_local_1 + "\n}");
        }


    }
}//package de.polygonal.ds

import de.polygonal.ds.Iterator;
import de.polygonal.ds.Heap;

class HeapIterator implements Iterator 
{

    /*private*/ var _values:Array;
    /*private*/ var _length:int;
    /*private*/ var _cursor:int;

    public function HeapIterator(_arg_1:Heap)
    {
        this._values = _arg_1.toArray();
        this._length = this._values.length;
        this._cursor = 0;
    }

    public function get data():*
    {
        return (this._values[this._cursor]);
    }

    public function set data(_arg_1:*):void
    {
        this._values[this._cursor] = _arg_1;
    }

    public function start():void
    {
        this._cursor = 0;
    }

    public function hasNext():Boolean
    {
        return (this._cursor < this._length);
    }

    public function next():*
    {
        return (this._values[this._cursor++]);
    }


}


//------------------------------------------------------------
//de.polygonal.ds.Iterator

package de.polygonal.ds
{
    public interface Iterator 
    {

        function next():*;
        function hasNext():Boolean;
        function start():void;
        function get data():*;
        function set data(_arg_1:*):void;

    }
}//package de.polygonal.ds

//------------------------------------------------------------
//de.polygonal.ds.LinkedListNode

package de.polygonal.ds
{
    public interface LinkedListNode 
    {

    }
}//package de.polygonal.ds

//------------------------------------------------------------
//de.polygonal.ds.LinkedStack

package de.polygonal.ds
{
    public class LinkedStack implements Collection 
    {

        private var _list:DLinkedList;

        public function LinkedStack(_arg_1:DLinkedList=null)
        {
            if (_arg_1 == null)
            {
                this._list = new DLinkedList();
            }
            else
            {
                this._list = _arg_1;
            };
        }

        public function peek():*
        {
            return ((this._list.size > 0) ? this._list.tail.data : null);
        }

        public function push(_arg_1:*):void
        {
            this._list.append(_arg_1);
        }

        public function pop():*
        {
            var _local_1:* = ((this._list.size > 0) ? this._list.tail.data : null);
            this._list.removeTail();
            return (_local_1);
        }

        public function contains(_arg_1:*):Boolean
        {
            return (this._list.contains(_arg_1));
        }

        public function clear():void
        {
            this._list.clear();
        }

        public function getIterator():Iterator
        {
            return (this._list.getIterator());
        }

        public function get size():int
        {
            return (this._list.size);
        }

        public function isEmpty():Boolean
        {
            return (this._list.size == 0);
        }

        public function toArray():Array
        {
            return (this._list.toArray());
        }

        public function toString():String
        {
            return (("[LinkedStack > " + this._list) + "]");
        }

        public function dump():String
        {
            return ("LinkedStack:\n" + this._list.dump());
        }


    }
}//package de.polygonal.ds

//------------------------------------------------------------
//fl.transitions.easing.None

package fl.transitions.easing
{
    public class None 
    {


        public static function easeNone(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number):Number
        {
            return (((_arg_3 * _arg_1) / _arg_4) + _arg_2);
        }

        public static function easeIn(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number):Number
        {
            return (((_arg_3 * _arg_1) / _arg_4) + _arg_2);
        }

        public static function easeOut(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number):Number
        {
            return (((_arg_3 * _arg_1) / _arg_4) + _arg_2);
        }

        public static function easeInOut(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number):Number
        {
            return (((_arg_3 * _arg_1) / _arg_4) + _arg_2);
        }


    }
}//package fl.transitions.easing

//------------------------------------------------------------
//fl.transitions.Tween

package fl.transitions
{
    import flash.events.EventDispatcher;
    import flash.display.MovieClip;
    import flash.utils.Timer;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.utils.getTimer;
    import flash.events.*;
    import flash.display.*;
    import flash.utils.*;

    public class Tween extends EventDispatcher 
    {

        protected static var _mc:MovieClip = new MovieClip();

        public var isPlaying:Boolean = false;
        public var obj:Object = null;
        public var prop:String = "";
        public var func:Function = function (_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number):Number
        {
            return (((_arg_3 * _arg_1) / _arg_4) + _arg_2);
        };
        public var begin:Number = NaN;
        public var change:Number = NaN;
        public var useSeconds:Boolean = false;
        public var prevTime:Number = NaN;
        public var prevPos:Number = NaN;
        public var looping:Boolean = false;
        private var _duration:Number = NaN;
        private var _time:Number = NaN;
        private var _fps:Number = NaN;
        private var _position:Number = NaN;
        private var _startTime:Number = NaN;
        private var _intervalID:uint = 0;
        private var _finish:Number = NaN;
        private var _timer:Timer = null;

        public function Tween(_arg_1:Object, _arg_2:String, _arg_3:Function, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Boolean=false)
        {
            if (!arguments.length)
            {
                return;
            };
            this.obj = _arg_1;
            this.prop = _arg_2;
            this.begin = _arg_4;
            this.position = _arg_4;
            this.duration = _arg_6;
            this.useSeconds = _arg_7;
            if ((_arg_3 is Function))
            {
                this.func = _arg_3;
            };
            this.finish = _arg_5;
            this._timer = new Timer(100);
            this.start();
        }

        public function get time():Number
        {
            return (this._time);
        }

        public function set time(_arg_1:Number):void
        {
            this.prevTime = this._time;
            if (_arg_1 > this.duration)
            {
                if (this.looping)
                {
                    this.rewind((_arg_1 - this._duration));
                    this.update();
                    this.dispatchEvent(new TweenEvent(TweenEvent.MOTION_LOOP, this._time, this._position));
                }
                else
                {
                    if (this.useSeconds)
                    {
                        this._time = this._duration;
                        this.update();
                    };
                    this.stop();
                    this.dispatchEvent(new TweenEvent(TweenEvent.MOTION_FINISH, this._time, this._position));
                };
            }
            else
            {
                if (_arg_1 < 0)
                {
                    this.rewind();
                    this.update();
                }
                else
                {
                    this._time = _arg_1;
                    this.update();
                };
            };
        }

        public function get duration():Number
        {
            return (this._duration);
        }

        public function set duration(_arg_1:Number):void
        {
            this._duration = ((_arg_1 <= 0) ? Infinity : _arg_1);
        }

        public function get FPS():Number
        {
            return (this._fps);
        }

        public function set FPS(_arg_1:Number):void
        {
            var _local_2:Boolean = this.isPlaying;
            this.stopEnterFrame();
            this._fps = _arg_1;
            if (_local_2)
            {
                this.startEnterFrame();
            };
        }

        public function get position():Number
        {
            return (this.getPosition(this._time));
        }

        public function set position(_arg_1:Number):void
        {
            this.setPosition(_arg_1);
        }

        public function getPosition(_arg_1:Number=NaN):Number
        {
            if (isNaN(_arg_1))
            {
                _arg_1 = this._time;
            };
            return (this.func(_arg_1, this.begin, this.change, this._duration));
        }

        public function setPosition(_arg_1:Number):void
        {
            this.prevPos = this._position;
            if (this.prop.length)
            {
                this.obj[this.prop] = (this._position = _arg_1);
            };
            this.dispatchEvent(new TweenEvent(TweenEvent.MOTION_CHANGE, this._time, this._position));
        }

        public function get finish():Number
        {
            return (this.begin + this.change);
        }

        public function set finish(_arg_1:Number):void
        {
            this.change = (_arg_1 - this.begin);
        }

        public function continueTo(_arg_1:Number, _arg_2:Number):void
        {
            this.begin = this.position;
            this.finish = _arg_1;
            if (!isNaN(_arg_2))
            {
                this.duration = _arg_2;
            };
            this.start();
        }

        public function yoyo():void
        {
            this.continueTo(this.begin, this.time);
        }

        protected function startEnterFrame():void
        {
            var _local_1:Number;
            if (isNaN(this._fps))
            {
                _mc.addEventListener(Event.ENTER_FRAME, this.onEnterFrame, false, 0, true);
            }
            else
            {
                _local_1 = (1000 / this._fps);
                this._timer.delay = _local_1;
                this._timer.addEventListener(TimerEvent.TIMER, this.timerHandler, false, 0, true);
                this._timer.start();
            };
            this.isPlaying = true;
        }

        protected function stopEnterFrame():void
        {
            if (isNaN(this._fps))
            {
                _mc.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
            }
            else
            {
                this._timer.stop();
            };
            this.isPlaying = false;
        }

        public function start():void
        {
            this.rewind();
            this.startEnterFrame();
            this.dispatchEvent(new TweenEvent(TweenEvent.MOTION_START, this._time, this._position));
        }

        public function stop():void
        {
            this.stopEnterFrame();
            this.dispatchEvent(new TweenEvent(TweenEvent.MOTION_STOP, this._time, this._position));
        }

        public function resume():void
        {
            this.fixTime();
            this.startEnterFrame();
            this.dispatchEvent(new TweenEvent(TweenEvent.MOTION_RESUME, this._time, this._position));
        }

        public function rewind(_arg_1:Number=0):void
        {
            this._time = _arg_1;
            this.fixTime();
            this.update();
        }

        public function fforward():void
        {
            this.time = this._duration;
            this.fixTime();
        }

        public function nextFrame():void
        {
            if (this.useSeconds)
            {
                this.time = ((getTimer() - this._startTime) / 1000);
            }
            else
            {
                this.time = (this._time + 1);
            };
        }

        protected function onEnterFrame(_arg_1:Event):void
        {
            this.nextFrame();
        }

        protected function timerHandler(_arg_1:TimerEvent):void
        {
            this.nextFrame();
            _arg_1.updateAfterEvent();
        }

        public function prevFrame():void
        {
            if (!this.useSeconds)
            {
                this.time = (this._time - 1);
            };
        }

        private function fixTime():void
        {
            if (this.useSeconds)
            {
                this._startTime = (getTimer() - (this._time * 1000));
            };
        }

        private function update():void
        {
            this.setPosition(this.getPosition(this._time));
        }


    }
}//package fl.transitions

//------------------------------------------------------------
//fl.transitions.TweenEvent

package fl.transitions
{
    import flash.events.Event;

    public class TweenEvent extends Event 
    {

        public static const MOTION_START:String = "motionStart";
        public static const MOTION_STOP:String = "motionStop";
        public static const MOTION_FINISH:String = "motionFinish";
        public static const MOTION_CHANGE:String = "motionChange";
        public static const MOTION_RESUME:String = "motionResume";
        public static const MOTION_LOOP:String = "motionLoop";

        public var time:Number = NaN;
        public var position:Number = NaN;

        public function TweenEvent(_arg_1:String, _arg_2:Number, _arg_3:Number, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(_arg_1, _arg_4, _arg_5);
            this.time = _arg_2;
            this.position = _arg_3;
        }

        override public function clone():Event
        {
            return (new TweenEvent(this.type, this.time, this.position, this.bubbles, this.cancelable));
        }


    }
}//package fl.transitions

//------------------------------------------------------------
//it.gotoandplay.smartfoxserver.data.Room

package it.gotoandplay.smartfoxserver.data
{
    public class Room 
    {

        private var id:int;
        private var name:String;
        private var maxUsers:int;
        private var maxSpectators:int;
        private var temp:Boolean;
        private var game:Boolean;
        private var priv:Boolean;
        private var limbo:Boolean;
        private var userCount:int;
        private var specCount:int;
        private var myPlayerIndex:int;
        private var userList:Array;
        private var variables:Array;

        public function Room(_arg_1:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean, _arg_8:Boolean, _arg_9:int=0, _arg_10:int=0)
        {
            this.id = _arg_1;
            this.name = _arg_2;
            this.maxSpectators = _arg_4;
            this.maxUsers = _arg_3;
            this.temp = _arg_5;
            this.game = _arg_6;
            this.priv = _arg_7;
            this.limbo = _arg_8;
            this.userCount = _arg_9;
            this.specCount = _arg_10;
            this.userList = [];
            this.variables = [];
        }

        public function addUser(_arg_1:User, _arg_2:int):void
        {
            this.userList[_arg_2] = _arg_1;
            if (((this.game) && (_arg_1.isSpectator())))
            {
                this.specCount++;
            }
            else
            {
                this.userCount++;
            };
        }

        public function removeUser(_arg_1:int):void
        {
            var _local_2:User = this.userList[_arg_1];
            if (((this.game) && (_local_2.isSpectator())))
            {
                this.specCount--;
            }
            else
            {
                this.userCount--;
            };
            delete this.userList[_arg_1];
        }

        public function getUserList():Array
        {
            return (this.userList);
        }

        public function getUser(_arg_1:*):User
        {
            var _local_3:String;
            var _local_4:User;
            var _local_2:User;
            if (typeof(_arg_1) == "number")
            {
                _local_2 = this.userList[_arg_1];
            }
            else
            {
                if (typeof(_arg_1) == "string")
                {
                    for (_local_3 in this.userList)
                    {
                        _local_4 = this.userList[_local_3];
                        if (_local_4.getName() == _arg_1)
                        {
                            _local_2 = _local_4;
                            break;
                        };
                    };
                };
            };
            return (_local_2);
        }

        public function clearUserList():void
        {
            this.userList = [];
            this.userCount = 0;
            this.specCount = 0;
        }

        public function getVariable(_arg_1:String):*
        {
            return (this.variables[_arg_1]);
        }

        public function getVariables():Array
        {
            return (this.variables);
        }

        public function setVariables(_arg_1:Array):void
        {
            this.variables = _arg_1;
        }

        public function clearVariables():void
        {
            this.variables = [];
        }

        public function getName():String
        {
            return (this.name);
        }

        public function getId():int
        {
            return (this.id);
        }

        public function isTemp():Boolean
        {
            return (this.temp);
        }

        public function isGame():Boolean
        {
            return (this.game);
        }

        public function isPrivate():Boolean
        {
            return (this.priv);
        }

        public function getUserCount():int
        {
            return (this.userCount);
        }

        public function getSpectatorCount():int
        {
            return (this.specCount);
        }

        public function getMaxUsers():int
        {
            return (this.maxUsers);
        }

        public function getMaxSpectators():int
        {
            return (this.maxSpectators);
        }

        public function setMyPlayerIndex(_arg_1:int):void
        {
            this.myPlayerIndex = _arg_1;
        }

        public function getMyPlayerIndex():int
        {
            return (this.myPlayerIndex);
        }

        public function setIsLimbo(_arg_1:Boolean):void
        {
            this.limbo = _arg_1;
        }

        public function isLimbo():Boolean
        {
            return (this.limbo);
        }

        public function setUserCount(_arg_1:int):void
        {
            this.userCount = _arg_1;
        }

        public function setSpectatorCount(_arg_1:int):void
        {
            this.specCount = _arg_1;
        }

        public function setUserList(_arg_1:Array):void
        {
            this.userList = _arg_1;
        }


    }
}//package it.gotoandplay.smartfoxserver.data

//------------------------------------------------------------
//it.gotoandplay.smartfoxserver.data.User

package it.gotoandplay.smartfoxserver.data
{
    public class User 
    {

        private var id:int;
        private var name:String;
        private var variables:Array;
        private var isSpec:Boolean;
        private var isMod:Boolean;
        private var pId:int;

        public function User(_arg_1:int, _arg_2:String)
        {
            this.id = _arg_1;
            this.name = _arg_2;
            this.variables = [];
            this.isSpec = false;
            this.isMod = false;
        }

        public function getId():int
        {
            return (this.id);
        }

        public function getName():String
        {
            return (this.name);
        }

        public function getVariable(_arg_1:String):*
        {
            return (this.variables[_arg_1]);
        }

        public function getVariables():Array
        {
            return (this.variables);
        }

        public function setVariables(_arg_1:Object):void
        {
            var _local_2:String;
            var _local_3:*;
            for (_local_2 in _arg_1)
            {
                _local_3 = _arg_1[_local_2];
                if (_local_3 != null)
                {
                    this.variables[_local_2] = _local_3;
                }
                else
                {
                    delete this.variables[_local_2];
                };
            };
        }

        public function clearVariables():void
        {
            this.variables = [];
        }

        public function setIsSpectator(_arg_1:Boolean):void
        {
            this.isSpec = _arg_1;
        }

        public function isSpectator():Boolean
        {
            return (this.isSpec);
        }

        public function setModerator(_arg_1:Boolean):void
        {
            this.isMod = _arg_1;
        }

        public function isModerator():Boolean
        {
            return (this.isMod);
        }

        public function getPlayerId():int
        {
            return (this.pId);
        }

        public function setPlayerId(_arg_1:int):void
        {
            this.pId = _arg_1;
        }


    }
}//package it.gotoandplay.smartfoxserver.data

//------------------------------------------------------------
//it.gotoandplay.smartfoxserver.handlers.ExtHandler

package it.gotoandplay.smartfoxserver.handlers
{
    import it.gotoandplay.smartfoxserver.SmartFoxClient;
    import it.gotoandplay.smartfoxserver.SFSEvent;
    import it.gotoandplay.smartfoxserver.util.ObjectSerializer;

    public class ExtHandler implements IMessageHandler 
    {

        private var sfs:SmartFoxClient;

        public function ExtHandler(_arg_1:SmartFoxClient)
        {
            this.sfs = _arg_1;
        }

        public function handleMessage(_arg_1:Object, _arg_2:String):void
        {
            var _local_3:Object;
            var _local_4:SFSEvent;
            var _local_5:XML;
            var _local_6:String;
            var _local_7:int;
            var _local_8:String;
            var _local_9:Object;
            if (_arg_2 == SmartFoxClient.XTMSG_TYPE_XML)
            {
                _local_5 = (_arg_1 as XML);
                _local_6 = _local_5.body.@action;
                _local_7 = int(_local_5.body.@id);
                if (_local_6 == "xtRes")
                {
                    _local_8 = _local_5.body.toString();
                    _local_9 = ObjectSerializer.getInstance().deserialize(_local_8);
                    _local_3 = {};
                    _local_3.dataObj = _local_9;
                    _local_3.type = _arg_2;
                    _local_4 = new SFSEvent(SFSEvent.onExtensionResponse, _local_3);
                    this.sfs.dispatchEvent(_local_4);
                };
            }
            else
            {
                if (_arg_2 == SmartFoxClient.XTMSG_TYPE_JSON)
                {
                    _local_3 = {};
                    _local_3.dataObj = _arg_1.o;
                    _local_3.type = _arg_2;
                    _local_4 = new SFSEvent(SFSEvent.onExtensionResponse, _local_3);
                    this.sfs.dispatchEvent(_local_4);
                }
                else
                {
                    if (_arg_2 == SmartFoxClient.XTMSG_TYPE_STR)
                    {
                        _local_3 = {};
                        _local_3.dataObj = _arg_1;
                        _local_3.type = _arg_2;
                        _local_4 = new SFSEvent(SFSEvent.onExtensionResponse, _local_3);
                        this.sfs.dispatchEvent(_local_4);
                    };
                };
            };
        }


    }
}//package it.gotoandplay.smartfoxserver.handlers

//------------------------------------------------------------
//it.gotoandplay.smartfoxserver.handlers.IMessageHandler

package it.gotoandplay.smartfoxserver.handlers
{
    public interface IMessageHandler 
    {

        function handleMessage(_arg_1:Object, _arg_2:String):void;

    }
}//package it.gotoandplay.smartfoxserver.handlers

//------------------------------------------------------------
//it.gotoandplay.smartfoxserver.handlers.SysHandler

package it.gotoandplay.smartfoxserver.handlers
{
    import it.gotoandplay.smartfoxserver.SmartFoxClient;
    import it.gotoandplay.smartfoxserver.SFSEvent;
    import it.gotoandplay.smartfoxserver.data.Room;
    import it.gotoandplay.smartfoxserver.data.User;
    import it.gotoandplay.smartfoxserver.util.Entities;
    import it.gotoandplay.smartfoxserver.util.ObjectSerializer;
    import flash.utils.getTimer;

    public class SysHandler implements IMessageHandler 
    {

        private var sfs:SmartFoxClient;
        private var handlersTable:Array;

        public function SysHandler(_arg_1:SmartFoxClient)
        {
            this.sfs = _arg_1;
            this.handlersTable = [];
            this.handlersTable["apiOK"] = this.handleApiOK;
            this.handlersTable["apiKO"] = this.handleApiKO;
            this.handlersTable["logOK"] = this.handleLoginOk;
            this.handlersTable["logKO"] = this.handleLoginKo;
            this.handlersTable["logout"] = this.handleLogout;
            this.handlersTable["rmList"] = this.handleRoomList;
            this.handlersTable["uCount"] = this.handleUserCountChange;
            this.handlersTable["joinOK"] = this.handleJoinOk;
            this.handlersTable["joinKO"] = this.handleJoinKo;
            this.handlersTable["uER"] = this.handleUserEnterRoom;
            this.handlersTable["userGone"] = this.handleUserLeaveRoom;
            this.handlersTable["pubMsg"] = this.handlePublicMessage;
            this.handlersTable["prvMsg"] = this.handlePrivateMessage;
            this.handlersTable["dmnMsg"] = this.handleAdminMessage;
            this.handlersTable["modMsg"] = this.handleModMessage;
            this.handlersTable["dataObj"] = this.handleASObject;
            this.handlersTable["rVarsUpdate"] = this.handleRoomVarsUpdate;
            this.handlersTable["roomAdd"] = this.handleRoomAdded;
            this.handlersTable["roomDel"] = this.handleRoomDeleted;
            this.handlersTable["rndK"] = this.handleRandomKey;
            this.handlersTable["roundTripRes"] = this.handleRoundTripBench;
            this.handlersTable["uVarsUpdate"] = this.handleUserVarsUpdate;
            this.handlersTable["createRmKO"] = this.handleCreateRoomError;
            this.handlersTable["bList"] = this.handleBuddyList;
            this.handlersTable["bUpd"] = this.handleBuddyListUpdate;
            this.handlersTable["bAdd"] = this.handleBuddyAdded;
            this.handlersTable["roomB"] = this.handleBuddyRoom;
            this.handlersTable["leaveRoom"] = this.handleLeaveRoom;
            this.handlersTable["swSpec"] = this.handleSpectatorSwitched;
            this.handlersTable["bPrm"] = this.handleAddBuddyPermission;
            this.handlersTable["remB"] = this.handleRemoveBuddy;
            this.handlersTable["swPl"] = this.handlePlayerSwitched;
        }

        public function handleMessage(_arg_1:Object, _arg_2:String):void
        {
            var _local_3:XML = (_arg_1 as XML);
            var _local_4:String = _local_3.body.@action;
            var _local_5:Function = this.handlersTable[_local_4];
            if (_local_5 != null)
            {
                _local_5.apply(this, [_arg_1]);
            }
            else
            {
                trace(("Unknown sys command: " + _local_4));
            };
        }

        public function handleApiOK(_arg_1:Object):void
        {
            this.sfs.isConnected = true;
            var _local_2:SFSEvent = new SFSEvent(SFSEvent.onConnection, {"success":true});
            this.sfs.dispatchEvent(_local_2);
        }

        public function handleApiKO(_arg_1:Object):void
        {
            var _local_2:Object = {};
            _local_2.success = false;
            _local_2.error = "API are obsolete, please upgrade";
            var _local_3:SFSEvent = new SFSEvent(SFSEvent.onConnection, _local_2);
            this.sfs.dispatchEvent(_local_3);
        }

        public function handleLoginOk(_arg_1:Object):void
        {
            var _local_2:int = int(_arg_1.body.login.@id);
            var _local_3:int = int(_arg_1.body.login.@mod);
            var _local_4:String = _arg_1.body.login.@n;
            this.sfs.amIModerator = (_local_3 == 1);
            this.sfs.myUserId = _local_2;
            this.sfs.myUserName = _local_4;
            this.sfs.playerId = -1;
            var _local_5:Object = {};
            _local_5.success = true;
            _local_5.name = _local_4;
            _local_5.error = "";
            var _local_6:SFSEvent = new SFSEvent(SFSEvent.onLogin, _local_5);
            this.sfs.dispatchEvent(_local_6);
            this.sfs.getRoomList();
        }

        public function handleLoginKo(_arg_1:Object):void
        {
            var _local_2:Object = {};
            _local_2.success = false;
            _local_2.error = _arg_1.body.login.@e;
            var _local_3:SFSEvent = new SFSEvent(SFSEvent.onLogin, _local_2);
            this.sfs.dispatchEvent(_local_3);
        }

        public function handleLogout(_arg_1:Object):void
        {
            this.sfs.__logout();
            var _local_2:SFSEvent = new SFSEvent(SFSEvent.onLogout, {});
            this.sfs.dispatchEvent(_local_2);
        }

        public function handleRoomList(_arg_1:Object):void
        {
            var _local_4:XML;
            var _local_5:Object;
            var _local_6:SFSEvent;
            var _local_7:int;
            var _local_8:Room;
            var _local_9:Room;
            var _local_2:Array = this.sfs.getAllRooms();
            var _local_3:Array = [];
            for each (_local_4 in _arg_1.body.rmList.rm)
            {
                _local_7 = int(_local_4.@id);
                _local_8 = new Room(_local_7, _local_4.n, int(_local_4.@maxu), int(_local_4.@maxs), (_local_4.@temp == "1"), (_local_4.@game == "1"), (_local_4.@priv == "1"), (_local_4.@lmb == "1"), int(_local_4.@ucnt), int(_local_4.@scnt));
                if (_local_4.vars.toString().length > 0)
                {
                    this.populateVariables(_local_8.getVariables(), _local_4);
                };
                _local_9 = _local_2[_local_7];
                if (_local_9 != null)
                {
                    _local_8.setVariables(_local_9.getVariables());
                    _local_8.setUserList(_local_9.getUserList());
                };
                _local_3[_local_7] = _local_8;
            };
            this.sfs.setRoomList(_local_3);
            _local_5 = {};
            _local_5.roomList = _local_3;
            _local_6 = new SFSEvent(SFSEvent.onRoomListUpdate, _local_5);
            this.sfs.dispatchEvent(_local_6);
        }

        public function handleUserCountChange(_arg_1:Object):void
        {
            var _local_6:Object;
            var _local_7:SFSEvent;
            var _local_2:int = int(_arg_1.body.@u);
            var _local_3:int = int(_arg_1.body.@s);
            var _local_4:int = int(_arg_1.body.@r);
            var _local_5:Room = this.sfs.getAllRooms()[_local_4];
            if (_local_5 != null)
            {
                _local_5.setUserCount(_local_2);
                _local_5.setSpectatorCount(_local_3);
                _local_6 = {};
                _local_6.room = _local_5;
                _local_7 = new SFSEvent(SFSEvent.onUserCountChange, _local_6);
                this.sfs.dispatchEvent(_local_7);
            };
        }

        public function handleJoinOk(_arg_1:Object):void
        {
            var _local_7:XML;
            var _local_8:Object;
            var _local_9:SFSEvent;
            var _local_10:String;
            var _local_11:int;
            var _local_12:Boolean;
            var _local_13:Boolean;
            var _local_14:int;
            var _local_15:User;
            var _local_2:int = int(_arg_1.body.@r);
            var _local_3:XMLList = _arg_1.body;
            var _local_4:XMLList = _arg_1.body.uLs.u;
            var _local_5:int = int(_arg_1.body.pid.@id);
            this.sfs.activeRoomId = _local_2;
            var _local_6:Room = this.sfs.getRoom(_local_2);
            _local_6.clearUserList();
            this.sfs.playerId = _local_5;
            _local_6.setMyPlayerIndex(_local_5);
            if (_local_3.vars.toString().length > 0)
            {
                _local_6.clearVariables();
                this.populateVariables(_local_6.getVariables(), _local_3);
            };
            for each (_local_7 in _local_4)
            {
                _local_10 = _local_7.n;
                _local_11 = int(_local_7.@i);
                _local_12 = ((_local_7.@m == "1") ? true : false);
                _local_13 = ((_local_7.@s == "1") ? true : false);
                _local_14 = ((_local_7.@p == null) ? -1 : int(_local_7.@p));
                _local_15 = new User(_local_11, _local_10);
                _local_15.setModerator(_local_12);
                _local_15.setIsSpectator(_local_13);
                _local_15.setPlayerId(_local_14);
                if (_local_7.vars.toString().length > 0)
                {
                    this.populateVariables(_local_15.getVariables(), _local_7);
                };
                _local_6.addUser(_local_15, _local_11);
            };
            this.sfs.changingRoom = false;
            _local_8 = {};
            _local_8.room = _local_6;
            _local_9 = new SFSEvent(SFSEvent.onJoinRoom, _local_8);
            this.sfs.dispatchEvent(_local_9);
        }

        public function handleJoinKo(_arg_1:Object):void
        {
            this.sfs.changingRoom = false;
            var _local_2:Object = {};
            _local_2.error = _arg_1.body.error.@msg;
            var _local_3:SFSEvent = new SFSEvent(SFSEvent.onJoinRoomError, _local_2);
            this.sfs.dispatchEvent(_local_3);
        }

        public function handleUserEnterRoom(_arg_1:Object):void
        {
            var _local_room:int = int(_arg_1.body.@r);
            var _local_3:int = int(_arg_1.body.u.@i);
            var _local_4:String = _arg_1.body.u.n;
            var _local_5:* = (_arg_1.body.u.@m == "1");
            var _local_6:* = (_arg_1.body.u.@s == "1");
            var _local_7:int = ((_arg_1.body.u.@p != null) ? int(_arg_1.body.u.@p) : -1);
            var _local_8:XMLList = _arg_1.body.u.vars["var"];
            var _local_9:Room = this.sfs.getRoom(_local_room);
            var _local_10:User = new User(_local_3, _local_4);
            _local_10.setModerator(_local_5);
            _local_10.setIsSpectator(_local_6);
            _local_10.setPlayerId(_local_7);
            _local_9.addUser(_local_10, _local_3);
            if (_arg_1.body.u.vars.toString().length > 0)
            {
                this.populateVariables(_local_10.getVariables(), _arg_1.body.u);
            };
            var _local_11:Object = {};
            _local_11.roomId = _local_2;
            _local_11.user = _local_10;
            var _local_12:SFSEvent = new SFSEvent(SFSEvent.onUserEnterRoom, _local_11);
            this.sfs.dispatchEvent(_local_12);
        }

        public function handleUserLeaveRoom(_arg_1:Object):void
        {
            var _local_2:int = int(_arg_1.body.user.@id);
            var _local_3:int = int(_arg_1.body.@r);
            var _local_4:Room = this.sfs.getRoom(_local_3);
            if (_local_4 == null)
            {
                trace(("WARN - Leave Room not found, id: " + _local_3));
                return;
            };
            var _local_5:String = _local_4.getUser(_local_2).getName();
            _local_4.removeUser(_local_2);
            var _local_6:Object = {};
            _local_6.roomId = _local_3;
            _local_6.userId = _local_2;
            _local_6.userName = _local_5;
            var _local_7:SFSEvent = new SFSEvent(SFSEvent.onUserLeaveRoom, _local_6);
            this.sfs.dispatchEvent(_local_7);
        }

        public function handlePublicMessage(_arg_1:Object):void
        {
            var _local_2:int = int(_arg_1.body.@r);
            var _local_3:int = int(_arg_1.body.user.@id);
            var _local_4:String = _arg_1.body.txt;
            var _local_5:User = this.sfs.getRoom(_local_2).getUser(_local_3);
            var _local_6:Object = {};
            _local_6.message = Entities.decodeEntities(_local_4);
            _local_6.sender = _local_5;
            _local_6.roomId = _local_2;
            var _local_7:SFSEvent = new SFSEvent(SFSEvent.onPublicMessage, _local_6);
            this.sfs.dispatchEvent(_local_7);
        }

        public function handlePrivateMessage(_arg_1:Object):void
        {
            var _local_2:int = int(_arg_1.body.@r);
            var _local_3:int = int(_arg_1.body.user.@id);
            var _local_4:String = _arg_1.body.txt;
            var _local_5:* = this.sfs.getRoom(_local_2);
            var _local_6:User;
            if (_local_5 != null)
            {
                _local_6 = _local_5.getUser(_local_3);
            };
            var _local_7:Object = {};
            _local_7.message = Entities.decodeEntities(_local_4);
            _local_7.sender = _local_6;
            _local_7.roomId = _local_2;
            _local_7.userId = _local_3;
            var _local_8:SFSEvent = new SFSEvent(SFSEvent.onPrivateMessage, _local_7);
            this.sfs.dispatchEvent(_local_8);
        }

        public function handleAdminMessage(_arg_1:Object):void
        {
            var _local_2:int = int(_arg_1.body.@r);
            var _local_3:int = int(_arg_1.body.user.@id);
            var _local_4:String = _arg_1.body.txt;
            var _local_5:Object = {};
            _local_5.message = Entities.decodeEntities(_local_4);
            var _local_6:SFSEvent = new SFSEvent(SFSEvent.onAdminMessage, _local_5);
            this.sfs.dispatchEvent(_local_6);
        }

        public function handleModMessage(_arg_1:Object):void
        {
            var _local_2:int = int(_arg_1.body.@r);
            var _local_3:int = int(_arg_1.body.user.@id);
            var _local_4:String = _arg_1.body.txt;
            var _local_5:User;
            var _local_6:Room = this.sfs.getRoom(_local_2);
            if (_local_6 != null)
            {
                _local_5 = _local_6.getUser(_local_3);
            };
            var _local_7:Object = {};
            _local_7.message = Entities.decodeEntities(_local_4);
            _local_7.sender = _local_5;
            var _local_8:SFSEvent = new SFSEvent(SFSEvent.onModeratorMessage, _local_7);
            this.sfs.dispatchEvent(_local_8);
        }

        public function handleASObject(_arg_1:Object):void
        {
            var _local_2:int = int(_arg_1.body.@r);
            var _local_3:int = int(_arg_1.body.user.@id);
            var _local_4:String = _arg_1.body.dataObj;
            var _local_5:User = this.sfs.getRoom(_local_2).getUser(_local_3);
            var _local_6:Object = ObjectSerializer.getInstance().deserialize(new XML(_local_4));
            var _local_7:Object = {};
            _local_7.obj = _local_6;
            _local_7.sender = _local_5;
            var _local_8:SFSEvent = new SFSEvent(SFSEvent.onObjectReceived, _local_7);
            this.sfs.dispatchEvent(_local_8);
        }

        public function handleRoomVarsUpdate(_arg_1:Object):void
        {
            var _local_6:Object;
            var _local_7:SFSEvent;
            var _local_2:int = int(_arg_1.body.@r);
            var _local_3:int = int(_arg_1.body.user.@id);
            var _local_4:Room = this.sfs.getRoom(_local_2);
            var _local_5:Array = [];
            if (_local_4 != null)
            {
                if (_arg_1.body.vars.toString().length > 0)
                {
                    this.populateVariables(_local_4.getVariables(), _arg_1.body, _local_5);
                };
                _local_6 = {};
                _local_6.room = _local_4;
                _local_6.changedVars = _local_5;
                _local_7 = new SFSEvent(SFSEvent.onRoomVariablesUpdate, _local_6);
                this.sfs.dispatchEvent(_local_7);
            };
        }

        public function handleUserVarsUpdate(_arg_1:Object):void
        {
            var _local_3:Array;
            var _local_6:Room;
            var _local_7:Object;
            var _local_8:SFSEvent;
            var _local_2:int = int(_arg_1.body.user.@id);
            var _local_4:User;
            var _local_5:User;
            if (_arg_1.body.vars.toString().length > 0)
            {
                for each (_local_6 in this.sfs.getAllRooms())
                {
                    _local_4 = _local_6.getUser(_local_2);
                    if (_local_4 != null)
                    {
                        if (_local_5 == null)
                        {
                            _local_5 = _local_4;
                        };
                        _local_3 = [];
                        this.populateVariables(_local_4.getVariables(), _arg_1.body, _local_3);
                    };
                };
                _local_7 = {};
                _local_7.user = _local_5;
                _local_7.changedVars = _local_3;
                _local_8 = new SFSEvent(SFSEvent.onUserVariablesUpdate, _local_7);
                this.sfs.dispatchEvent(_local_8);
            };
        }

        private function handleRoomAdded(_arg_1:Object):void
        {
            var _local_2:int = int(_arg_1.body.rm.@id);
            var _local_3:String = _arg_1.body.rm.name;
            var _local_4:int = int(_arg_1.body.rm.@max);
            var _local_5:int = int(_arg_1.body.rm.@spec);
            var _local_6:Boolean = ((_arg_1.body.rm.@temp == "1") ? true : false);
            var _local_7:Boolean = ((_arg_1.body.rm.@game == "1") ? true : false);
            var _local_8:Boolean = ((_arg_1.body.rm.@priv == "1") ? true : false);
            var _local_9:Boolean = ((_arg_1.body.rm.@limbo == "1") ? true : false);
            var _local_10:Room = new Room(_local_2, _local_3, _local_4, _local_5, _local_6, _local_7, _local_8, _local_9);
            var _local_11:Array = this.sfs.getAllRooms();
            _local_11[_local_2] = _local_10;
            if (_arg_1.body.rm.vars.toString().length > 0)
            {
                this.populateVariables(_local_10.getVariables(), _arg_1.body.rm);
            };
            var _local_12:Object = {};
            _local_12.room = _local_10;
            var _local_13:SFSEvent = new SFSEvent(SFSEvent.onRoomAdded, _local_12);
            this.sfs.dispatchEvent(_local_13);
        }

        private function handleRoomDeleted(_arg_1:Object):void
        {
            var _local_4:Object;
            var _local_5:SFSEvent;
            var _local_2:int = int(_arg_1.body.rm.@id);
            var _local_3:Array = this.sfs.getAllRooms();
            if (_local_3[_local_2] != null)
            {
                _local_4 = {};
                _local_4.room = _local_3[_local_2];
                delete _local_3[_local_2];
                _local_5 = new SFSEvent(SFSEvent.onRoomDeleted, _local_4);
                this.sfs.dispatchEvent(_local_5);
            };
        }

        private function handleRandomKey(_arg_1:Object):void
        {
            var _local_2:String = _arg_1.body.k.toString();
            var _local_3:Object = {};
            _local_3.key = _local_2;
            var _local_4:SFSEvent = new SFSEvent(SFSEvent.onRandomKey, _local_3);
            this.sfs.dispatchEvent(_local_4);
        }

        private function handleRoundTripBench(_arg_1:Object):void
        {
            var _local_2:int = getTimer();
            var _local_3:int = (_local_2 - this.sfs.getBenchStartTime());
            var _local_4:Object = {};
            _local_4.elapsed = _local_3;
            var _local_5:SFSEvent = new SFSEvent(SFSEvent.onRoundTripResponse, _local_4);
            this.sfs.dispatchEvent(_local_5);
        }

        private function handleCreateRoomError(_arg_1:Object):void
        {
            var _local_2:String = _arg_1.body.room.@e;
            var _local_3:Object = {};
            _local_3.error = _local_2;
            var _local_4:SFSEvent = new SFSEvent(SFSEvent.onCreateRoomError, _local_3);
            this.sfs.dispatchEvent(_local_4);
        }

        private function handleBuddyList(_arg_1:Object):void
        {
            var _local_4:Object;
            var _local_7:XML;
            var _local_8:XML;
            var _local_9:XMLList;
            var _local_10:XML;
            var _local_2:XMLList = _arg_1.body.bList;
            var _local_3:XMLList = _arg_1.body.mv;
            var _local_5:Object = {};
            var _local_6:SFSEvent;
            if (((!(_local_3 == null)) && (_local_3.toString().length > 0)))
            {
                for each (_local_7 in _local_3.v)
                {
                    this.sfs.myBuddyVars[_local_7.@n.toString()] = _local_7.toString();
                };
            };
            if (((!(_local_2 == null)) && (!(_local_2.b.length == null))))
            {
                if (_local_2.toString().length > 0)
                {
                    for each (_local_8 in _local_2.b)
                    {
                        _local_4 = {};
                        _local_4.isOnline = ((_local_8.@s == "1") ? true : false);
                        _local_4.name = _local_8.n.toString();
                        _local_4.id = _local_8.@i;
                        _local_4.isBlocked = ((_local_8.@x == "1") ? true : false);
                        _local_4.variables = {};
                        _local_9 = _local_8.vs;
                        if (_local_9.toString().length > 0)
                        {
                            for each (_local_10 in _local_9.v)
                            {
                                _local_4.variables[_local_10.@n.toString()] = _local_10.toString();
                            };
                        };
                        this.sfs.buddyList.push(_local_4);
                    };
                };
                _local_5.list = this.sfs.buddyList;
                _local_6 = new SFSEvent(SFSEvent.onBuddyList, _local_5);
                this.sfs.dispatchEvent(_local_6);
            }
            else
            {
                _local_5.error = _arg_1.body.err.toString();
                _local_6 = new SFSEvent(SFSEvent.onBuddyListError, _local_5);
                this.sfs.dispatchEvent(_local_6);
            };
        }

        private function handleBuddyListUpdate(_arg_1:Object):void
        {
            var _local_4:Object;
            var _local_5:XMLList;
            var _local_6:Object;
            var _local_7:Boolean;
            var _local_8:String;
            var _local_9:XML;
            var _local_2:Object = {};
            var _local_3:SFSEvent;
            if (_arg_1.body.err.toString().length > 0)
            {
                _local_2.error = _arg_1.body.err.toString();
                _local_3 = new SFSEvent(SFSEvent.onBuddyListError, _local_2);
                this.sfs.dispatchEvent(_local_3);
                return;
            };
            if (_arg_1.body.b != null)
            {
                _local_4 = {};
                _local_4.isOnline = ((_arg_1.body.b.@s == "1") ? true : false);
                _local_4.name = _arg_1.body.b.n.toString();
                _local_4.id = _arg_1.body.b.@i;
                _local_4.isBlocked = ((_arg_1.body.b.@x == "1") ? true : false);
                _local_5 = _arg_1.body.b.vs;
                _local_6 = null;
                _local_7 = false;
                for (_local_8 in this.sfs.buddyList)
                {
                    _local_6 = this.sfs.buddyList[_local_8];
                    if (_local_6.name == _local_4.name)
                    {
                        this.sfs.buddyList[_local_8] = _local_4;
                        _local_4.isBlocked = _local_6.isBlocked;
                        _local_4.variables = _local_6.variables;
                        if (_local_5.toString().length > 0)
                        {
                            for each (_local_9 in _local_5.v)
                            {
                                _local_4.variables[_local_9.@n.toString()] = _local_9.toString();
                            };
                        };
                        _local_7 = true;
                        break;
                    };
                };
                if (_local_7)
                {
                    _local_2.buddy = _local_4;
                    _local_3 = new SFSEvent(SFSEvent.onBuddyListUpdate, _local_2);
                    this.sfs.dispatchEvent(_local_3);
                };
            };
        }

        private function handleAddBuddyPermission(_arg_1:Object):void
        {
            var _local_2:Object = {};
            _local_2.sender = _arg_1.body.n.toString();
            _local_2.message = "";
            if (_arg_1.body.txt != undefined)
            {
                _local_2.message = Entities.decodeEntities(_arg_1.body.txt);
            };
            var _local_3:SFSEvent = new SFSEvent(SFSEvent.onBuddyPermissionRequest, _local_2);
            this.sfs.dispatchEvent(_local_3);
        }

        private function handleBuddyAdded(_arg_1:Object):void
        {
            var _local_6:XML;
            var _local_2:Object = {};
            _local_2.isOnline = ((_arg_1.body.b.@s == "1") ? true : false);
            _local_2.name = _arg_1.body.b.n.toString();
            _local_2.id = _arg_1.body.b.@i;
            _local_2.isBlocked = ((_arg_1.body.b.@x == "1") ? true : false);
            _local_2.variables = {};
            var _local_3:XMLList = _arg_1.body.b.vs;
            if (_local_3.toString().length > 0)
            {
                for each (_local_6 in _local_3.v)
                {
                    _local_2.variables[_local_6.@n.toString()] = _local_6.toString();
                };
            };
            this.sfs.buddyList.push(_local_2);
            var _local_4:Object = {};
            _local_4.list = this.sfs.buddyList;
            var _local_5:SFSEvent = new SFSEvent(SFSEvent.onBuddyList, _local_4);
            this.sfs.dispatchEvent(_local_5);
        }

        private function handleRemoveBuddy(_arg_1:Object):void
        {
            var _local_4:String;
            var _local_5:Object;
            var _local_6:SFSEvent;
            var _local_2:String = _arg_1.body.n.toString();
            var _local_3:Object;
            for (_local_4 in this.sfs.buddyList)
            {
                _local_3 = this.sfs.buddyList[_local_4];
                if (_local_3.name == _local_2)
                {
                    delete this.sfs.buddyList[_local_4];
                    _local_5 = {};
                    _local_5.list = this.sfs.buddyList;
                    _local_6 = new SFSEvent(SFSEvent.onBuddyList, _local_5);
                    this.sfs.dispatchEvent(_local_6);
                    break;
                };
            };
        }

        private function handleBuddyRoom(_arg_1:Object):void
        {
            var _local_2:String = _arg_1.body.br.@r;
            var _local_3:Array = _local_2.split(",");
            var _local_4:int;
            while (_local_4 < _local_3.length)
            {
                _local_3[_local_4] = int(_local_3[_local_4]);
                _local_4++;
            };
            var _local_5:Object = {};
            _local_5.idList = _local_3;
            var _local_6:SFSEvent = new SFSEvent(SFSEvent.onBuddyRoom, _local_5);
            this.sfs.dispatchEvent(_local_6);
        }

        private function handleLeaveRoom(_arg_1:Object):void
        {
            var _local_4:Object;
            var _local_5:SFSEvent;
            var _local_2:int = int(_arg_1.body.rm.@id);
            var _local_3:Array = this.sfs.getAllRooms();
            if (_local_3[_local_2])
            {
                _local_4 = {};
                _local_4.roomId = _local_2;
                _local_5 = new SFSEvent(SFSEvent.onRoomLeft, _local_4);
                this.sfs.dispatchEvent(_local_5);
            };
        }

        private function handleSpectatorSwitched(_arg_1:Object):void
        {
            var _local_5:int;
            var _local_6:User;
            var _local_7:Object;
            var _local_8:SFSEvent;
            var _local_2:int = int(_arg_1.body.@r);
            var _local_3:int = int(_arg_1.body.pid.@id);
            var _local_4:Room = this.sfs.getRoom(_local_2);
            if (_local_3 > 0)
            {
                _local_4.setUserCount((_local_4.getUserCount() + 1));
                _local_4.setSpectatorCount((_local_4.getSpectatorCount() - 1));
            };
            if (_arg_1.body.pid.@u != undefined)
            {
                _local_5 = int(_arg_1.body.pid.@u);
                _local_6 = _local_4.getUser(_local_5);
                if (_local_6 != null)
                {
                    _local_6.setIsSpectator(false);
                    _local_6.setPlayerId(_local_3);
                };
            }
            else
            {
                this.sfs.playerId = _local_3;
                _local_7 = {};
                _local_7.success = (this.sfs.playerId > 0);
                _local_7.newId = this.sfs.playerId;
                _local_7.room = _local_4;
                _local_8 = new SFSEvent(SFSEvent.onSpectatorSwitched, _local_7);
                this.sfs.dispatchEvent(_local_8);
            };
        }

        private function handlePlayerSwitched(_arg_1:Object):void
        {
            var _local_6:int;
            var _local_7:User;
            var _local_8:Object;
            var _local_9:SFSEvent;
            var _local_2:int = int(_arg_1.body.@r);
            var _local_3:int = int(_arg_1.body.pid.@id);
            var _local_4:* = (_arg_1.body.pid.@u == undefined);
            var _local_5:Room = this.sfs.getRoom(_local_2);
            if (_local_3 == -1)
            {
                _local_5.setUserCount((_local_5.getUserCount() - 1));
                _local_5.setSpectatorCount((_local_5.getSpectatorCount() + 1));
                if (!_local_4)
                {
                    _local_6 = int(_arg_1.body.pid.@u);
                    _local_7 = _local_5.getUser(_local_6);
                    if (_local_7 != null)
                    {
                        _local_7.setIsSpectator(true);
                        _local_7.setPlayerId(_local_3);
                    };
                };
            };
            if (_local_4)
            {
                this.sfs.playerId = _local_3;
                _local_8 = {};
                _local_8.success = (_local_3 == -1);
                _local_8.newId = _local_3;
                _local_8.room = _local_5;
                _local_9 = new SFSEvent(SFSEvent.onPlayerSwitched, _local_8);
                this.sfs.dispatchEvent(_local_9);
            };
        }

        private function populateVariables(_arg_1:Array, _arg_2:Object, _arg_3:Array=null):void
        {
            var _local_4:XML;
            var _local_5:String;
            var _local_6:String;
            var _local_7:String;
            for each (_local_4 in _arg_2.vars["var"])
            {
                _local_5 = _local_4.@n;
                _local_6 = _local_4.@t;
                _local_7 = _local_4;
                if (_arg_3 != null)
                {
                    _arg_3.push(_local_5);
                    _arg_3[_local_5] = true;
                };
                if (_local_6 == "b")
                {
                    _arg_1[_local_5] = ((_local_7 == "1") ? true : false);
                }
                else
                {
                    if (_local_6 == "n")
                    {
                        _arg_1[_local_5] = Number(_local_7);
                    }
                    else
                    {
                        if (_local_6 == "s")
                        {
                            _arg_1[_local_5] = _local_7;
                        }
                        else
                        {
                            if (_local_6 == "x")
                            {
                                delete _arg_1[_local_5];
                            };
                        };
                    };
                };
            };
        }

        public function dispatchDisconnection():void
        {
            var _local_1:SFSEvent = new SFSEvent(SFSEvent.onConnectionLost, null);
            this.sfs.dispatchEvent(_local_1);
        }


    }
}//package it.gotoandplay.smartfoxserver.handlers

//------------------------------------------------------------
//it.gotoandplay.smartfoxserver.http.HttpConnection

package it.gotoandplay.smartfoxserver.http
{
    import flash.events.EventDispatcher;
    import flash.net.URLRequest;
    import flash.net.URLRequestMethod;
    import flash.net.URLVariables;
    import flash.net.URLLoader;
    import flash.events.Event;
    import flash.events.IOErrorEvent;

    public class HttpConnection extends EventDispatcher 
    {

        private static const HANDSHAKE:String = "connect";
        private static const DISCONNECT:String = "disconnect";
        private static const CONN_LOST:String = "ERR#01";
        public static const HANDSHAKE_TOKEN:String = "#";
        private static const servletUrl:String = "BlueBox/HttpBox.do";
        private static const paramName:String = "sfsHttp";

        private var sessionId:String;
        private var connected:Boolean = false;
        private var ipAddr:String;
        private var port:int;
        private var webUrl:String;
        private var urlLoaderFactory:LoaderFactory;
        private var urlRequest:URLRequest;
        private var codec:IHttpProtocolCodec;

        public function HttpConnection()
        {
            this.codec = new RawProtocolCodec();
            this.urlLoaderFactory = new LoaderFactory(this.handleResponse, this.handleIOError);
        }

        public function getSessionId():String
        {
            return (this.sessionId);
        }

        public function isConnected():Boolean
        {
            return (this.connected);
        }

        public function connect(_arg_1:String, _arg_2:int=8080):void
        {
            this.ipAddr = _arg_1;
            this.port = _arg_2;
            this.webUrl = ((((("http://" + this.ipAddr) + ":") + this.port) + "/") + servletUrl);
            this.sessionId = null;
            this.urlRequest = new URLRequest(this.webUrl);
            this.urlRequest.method = URLRequestMethod.POST;
            this.send(HANDSHAKE);
        }

        public function close():void
        {
            this.send(DISCONNECT);
        }

        public function send(_arg_1:String):void
        {
            var _local_2:URLVariables;
            var _local_3:URLLoader;
            if ((((this.connected) || ((!(this.connected)) && (_arg_1 == HANDSHAKE))) || ((!(this.connected)) && (_arg_1 == "poll"))))
            {
                _local_2 = new URLVariables();
                _local_2[paramName] = this.codec.encode(this.sessionId, _arg_1);
                this.urlRequest.data = _local_2;
                if (_arg_1 != "poll")
                {
                    trace(("[ Send ]: " + this.urlRequest.data));
                };
                _local_3 = this.urlLoaderFactory.getLoader();
                _local_3.data = _local_2;
                _local_3.load(this.urlRequest);
            };
        }

        private function handleResponse(_arg_1:Event):void
        {
            var _local_4:HttpEvent;
            var _local_2:URLLoader = (_arg_1.target as URLLoader);
            var _local_3:String = (_local_2.data as String);
            var _local_5:Object = {};
            if (_local_3.charAt(0) == HANDSHAKE_TOKEN)
            {
                if (this.sessionId == null)
                {
                    this.sessionId = this.codec.decode(_local_3);
                    this.connected = true;
                    _local_5.sessionId = this.sessionId;
                    _local_5.success = true;
                    _local_4 = new HttpEvent(HttpEvent.onHttpConnect, _local_5);
                    dispatchEvent(_local_4);
                }
                else
                {
                    trace("**ERROR** SessionId is being rewritten");
                };
            }
            else
            {
                if (_local_3.indexOf(CONN_LOST) == 0)
                {
                    _local_5.data = {};
                    _local_4 = new HttpEvent(HttpEvent.onHttpClose, _local_5);
                }
                else
                {
                    _local_5.data = _local_3;
                    _local_4 = new HttpEvent(HttpEvent.onHttpData, _local_5);
                };
                dispatchEvent(_local_4);
            };
        }

        private function handleIOError(_arg_1:IOErrorEvent):void
        {
            var _local_2:Object = {};
            _local_2.message = _arg_1.text;
            var _local_3:HttpEvent = new HttpEvent(HttpEvent.onHttpError, _local_2);
            dispatchEvent(_local_3);
        }


    }
}//package it.gotoandplay.smartfoxserver.http

//------------------------------------------------------------
//it.gotoandplay.smartfoxserver.http.HttpEvent

package it.gotoandplay.smartfoxserver.http
{
    import flash.events.Event;

    public class HttpEvent extends Event 
    {

        public static const onHttpData:String = "onHttpData";
        public static const onHttpError:String = "onHttpError";
        public static const onHttpConnect:String = "onHttpConnect";
        public static const onHttpClose:String = "onHttpClose";

        public var params:Object;
        private var evtType:String;

        public function HttpEvent(_arg_1:String, _arg_2:Object)
        {
            super(_arg_1);
            this.params = _arg_2;
            this.evtType = _arg_1;
        }

        override public function clone():Event
        {
            return (new HttpEvent(this.evtType, this.params));
        }

        override public function toString():String
        {
            return (formatToString("HttpEvent", "type", "bubbles", "cancelable", "eventPhase", "params"));
        }


    }
}//package it.gotoandplay.smartfoxserver.http

//------------------------------------------------------------
//it.gotoandplay.smartfoxserver.http.IHttpProtocolCodec

package it.gotoandplay.smartfoxserver.http
{
    public interface IHttpProtocolCodec 
    {

        function encode(_arg_1:String, _arg_2:String):String;
        function decode(_arg_1:String):String;

    }
}//package it.gotoandplay.smartfoxserver.http

//------------------------------------------------------------
//it.gotoandplay.smartfoxserver.http.LoaderFactory

package it.gotoandplay.smartfoxserver.http
{
    import flash.net.URLLoader;
    import flash.net.URLLoaderDataFormat;
    import flash.events.Event;
    import flash.events.IOErrorEvent;

    public class LoaderFactory 
    {

        private static const DEFAULT_POOL_SIZE:int = 2;

        private var currentLoaderIndex:int;
        private var responseHandler:Function;
        private var errorHandler:Function;

        public function LoaderFactory(_arg_1:Function, _arg_2:Function, _arg_3:int=2)
        {
            this.responseHandler = _arg_1;
            this.errorHandler = _arg_2;
        }

        public function getLoader():URLLoader
        {
            var _local_1:URLLoader = new URLLoader();
            _local_1.dataFormat = URLLoaderDataFormat.TEXT;
            _local_1.addEventListener(Event.COMPLETE, this.responseHandler);
            _local_1.addEventListener(IOErrorEvent.IO_ERROR, this.errorHandler);
            _local_1.addEventListener(IOErrorEvent.NETWORK_ERROR, this.errorHandler);
            return (_local_1);
        }


    }
}//package it.gotoandplay.smartfoxserver.http

//------------------------------------------------------------
//it.gotoandplay.smartfoxserver.http.RawProtocolCodec

package it.gotoandplay.smartfoxserver.http
{
    public class RawProtocolCodec implements IHttpProtocolCodec 
    {

        private static const SESSION_ID_LEN:int = 32;


        public function encode(_arg_1:String, _arg_2:String):String
        {
            return (((_arg_1 == null) ? "" : _arg_1) + _arg_2);
        }

        public function decode(_arg_1:String):String
        {
            var _local_2:String;
            if (_arg_1.charAt(0) == HttpConnection.HANDSHAKE_TOKEN)
            {
                _local_2 = _arg_1.substr(1, SESSION_ID_LEN);
            };
            return (_local_2);
        }


    }
}//package it.gotoandplay.smartfoxserver.http

//------------------------------------------------------------
//it.gotoandplay.smartfoxserver.util.Entities

package it.gotoandplay.smartfoxserver.util
{
    public class Entities 
    {

        private static var ascTab:Array = [];
        private static var ascTabRev:Array = [];
        private static var hexTable:Array = new Array();

        {
            ascTab[">"] = "&gt;";
            ascTab["<"] = "&lt;";
            ascTab["&"] = "&amp;";
            ascTab["'"] = "&apos;";
            ascTab['"'] = "&quot;";
            ascTabRev["&gt;"] = ">";
            ascTabRev["&lt;"] = "<";
            ascTabRev["&amp;"] = "&";
            ascTabRev["&apos;"] = "'";
            ascTabRev["&quot;"] = '"';
            hexTable["0"] = 0;
            hexTable["1"] = 1;
            hexTable["2"] = 2;
            hexTable["3"] = 3;
            hexTable["4"] = 4;
            hexTable["5"] = 5;
            hexTable["6"] = 6;
            hexTable["7"] = 7;
            hexTable["8"] = 8;
            hexTable["9"] = 9;
            hexTable["A"] = 10;
            hexTable["B"] = 11;
            hexTable["C"] = 12;
            hexTable["D"] = 13;
            hexTable["E"] = 14;
            hexTable["F"] = 15;
        }


        public static function encodeEntities(_arg_1:String):String
        {
            var _local_4:String;
            var _local_5:int;
            var _local_2:* = "";
            var _local_3:int;
            while (_local_3 < _arg_1.length)
            {
                _local_4 = _arg_1.charAt(_local_3);
                _local_5 = _arg_1.charCodeAt(_local_3);
                if ((((_local_5 == 9) || (_local_5 == 10)) || (_local_5 == 13)))
                {
                    _local_2 = (_local_2 + _local_4);
                }
                else
                {
                    if (((_local_5 >= 32) && (_local_5 <= 126)))
                    {
                        if (ascTab[_local_4] != null)
                        {
                            _local_2 = (_local_2 + ascTab[_local_4]);
                        }
                        else
                        {
                            _local_2 = (_local_2 + _local_4);
                        };
                    }
                    else
                    {
                        _local_2 = (_local_2 + _local_4);
                    };
                };
                _local_3++;
            };
            return (_local_2);
        }

        public static function decodeEntities(_arg_1:String):String
        {
            var _local_2:String;
            var _local_3:String;
            var _local_4:String;
            var _local_5:String;
            var _local_6:String;
            var _local_7:int;
            _local_2 = "";
            while (_local_7 < _arg_1.length)
            {
                _local_3 = _arg_1.charAt(_local_7);
                if (_local_3 == "&")
                {
                    _local_4 = _local_3;
                    do 
                    {
                        _local_5 = _arg_1.charAt(++_local_7);
                        _local_4 = (_local_4 + _local_5);
                    } while (((!(_local_5 == ";")) && (_local_7 < _arg_1.length)));
                    _local_6 = ascTabRev[_local_4];
                    if (_local_6 != null)
                    {
                        _local_2 = (_local_2 + _local_6);
                    }
                    else
                    {
                        _local_2 = (_local_2 + String.fromCharCode(getCharCode(_local_4)));
                    };
                }
                else
                {
                    _local_2 = (_local_2 + _local_3);
                };
                _local_7++;
            };
            return (_local_2);
        }

        public static function getCharCode(_arg_1:String):Number
        {
            var _local_2:String = _arg_1.substr(3, _arg_1.length);
            _local_2 = _local_2.substr(0, (_local_2.length - 1));
            return (Number(("0x" + _local_2)));
        }


    }
}//package it.gotoandplay.smartfoxserver.util

//------------------------------------------------------------
//it.gotoandplay.smartfoxserver.util.ObjectSerializer

package it.gotoandplay.smartfoxserver.util
{
    public class ObjectSerializer 
    {

        private static var instance:ObjectSerializer;

        private var debug:Boolean;
        private var eof:String;
        private var tabs:String;

        public function ObjectSerializer(_arg_1:Boolean=false)
        {
            this.tabs = "\t\t\t\t\t\t\t\t\t\t\t\t\t";
            this.setDebug(_arg_1);
        }

        public static function getInstance(_arg_1:Boolean=false):ObjectSerializer
        {
            if (instance == null)
            {
                instance = new ObjectSerializer(_arg_1);
            };
            return (instance);
        }


        private function setDebug(_arg_1:Boolean):void
        {
            this.debug = _arg_1;
            if (this.debug)
            {
                this.eof = "\n";
            }
            else
            {
                this.eof = "";
            };
        }

        public function serialize(_arg_1:Object):String
        {
            var _local_2:Object = {};
            this.obj2xml(_arg_1, _local_2);
            return (_local_2.xmlStr);
        }

        public function deserialize(_arg_1:String):Object
        {
            var _local_2:XML = new XML(_arg_1);
            var _local_3:Object = {};
            this.xml2obj(_local_2, _local_3);
            return (_local_3);
        }

        private function obj2xml(_arg_1:Object, _arg_2:Object, _arg_3:int=0, _arg_4:String=""):void
        {
            var _local_5:String;
            var _local_6:String;
            var _local_7:String;
            var _local_8:*;
            if (_arg_3 == 0)
            {
                _arg_2.xmlStr = ("<dataObj>" + this.eof);
            }
            else
            {
                if (this.debug)
                {
                    _arg_2.xmlStr = (_arg_2.xmlStr + this.tabs.substr(0, _arg_3));
                };
                _local_6 = ((_arg_1 is Array) ? "a" : "o");
                _arg_2.xmlStr = (_arg_2.xmlStr + ((((("<obj t='" + _local_6) + "' o='") + _arg_4) + "'>") + this.eof));
            };
            for (_local_5 in _arg_1)
            {
                _local_7 = typeof(_arg_1[_local_5]);
                _local_8 = _arg_1[_local_5];
                if (((((_local_7 == "boolean") || (_local_7 == "number")) || (_local_7 == "string")) || (_local_7 == "null")))
                {
                    if (_local_7 == "boolean")
                    {
                        _local_8 = Number(_local_8);
                    }
                    else
                    {
                        if (_local_7 == "null")
                        {
                            _local_7 = "x";
                            _local_8 = "";
                        }
                        else
                        {
                            if (_local_7 == "string")
                            {
                                _local_8 = Entities.encodeEntities(_local_8);
                            };
                        };
                    };
                    if (this.debug)
                    {
                        _arg_2.xmlStr = (_arg_2.xmlStr + this.tabs.substr(0, (_arg_3 + 1)));
                    };
                    _arg_2.xmlStr = (_arg_2.xmlStr + ((((((("<var n='" + _local_5) + "' t='") + _local_7.substr(0, 1)) + "'>") + _local_8) + "</var>") + this.eof));
                }
                else
                {
                    if (_local_7 == "object")
                    {
                        this.obj2xml(_local_8, _arg_2, (_arg_3 + 1), _local_5);
                        if (this.debug)
                        {
                            _arg_2.xmlStr = (_arg_2.xmlStr + this.tabs.substr(0, (_arg_3 + 1)));
                        };
                        _arg_2.xmlStr = (_arg_2.xmlStr + ("</obj>" + this.eof));
                    };
                };
            };
            if (_arg_3 == 0)
            {
                _arg_2.xmlStr = (_arg_2.xmlStr + ("</dataObj>" + this.eof));
            };
        }

        private function xml2obj(_arg_1:XML, _arg_2:Object):void
        {
            var _local_5:String;
            var _local_6:XML;
            var _local_7:String;
            var _local_8:String;
            var _local_9:String;
            var _local_10:String;
            var _local_11:String;
            var _local_3:int;
            var _local_4:XMLList = _arg_1.children();
            for each (_local_6 in _local_4)
            {
                _local_5 = _local_6.name().toString();
                if (_local_5 == "obj")
                {
                    _local_7 = _local_6.@o;
                    _local_8 = _local_6.@t;
                    if (_local_8 == "a")
                    {
                        _arg_2[_local_7] = [];
                    }
                    else
                    {
                        if (_local_8 == "o")
                        {
                            _arg_2[_local_7] = {};
                        };
                    };
                    this.xml2obj(_local_6, _arg_2[_local_7]);
                }
                else
                {
                    if (_local_5 == "var")
                    {
                        _local_9 = _local_6.@n;
                        _local_10 = _local_6.@t;
                        _local_11 = _local_6.toString();
                        if (_local_10 == "b")
                        {
                            _arg_2[_local_9] = ((_local_11 == "0") ? false : true);
                        }
                        else
                        {
                            if (_local_10 == "n")
                            {
                                _arg_2[_local_9] = Number(_local_11);
                            }
                            else
                            {
                                if (_local_10 == "s")
                                {
                                    _arg_2[_local_9] = _local_11;
                                }
                                else
                                {
                                    if (_local_10 == "x")
                                    {
                                        _arg_2[_local_9] = null;
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        private function encodeEntities(_arg_1:String):String
        {
            return (_arg_1);
        }


    }
}//package it.gotoandplay.smartfoxserver.util

//------------------------------------------------------------
//it.gotoandplay.smartfoxserver.SFSEvent

package it.gotoandplay.smartfoxserver
{
    import flash.events.Event;

    public class SFSEvent extends Event 
    {

        public static const onAdminMessage:String = "onAdminMessage";
        public static const onBuddyList:String = "onBuddyList";
        public static const onBuddyListError:String = "onBuddyListError";
        public static const onBuddyListUpdate:String = "onBuddyListUpdate";
        public static const onBuddyPermissionRequest:String = "onBuddyPermissionRequest";
        public static const onBuddyRoom:String = "onBuddyRoom";
        public static const onConfigLoadFailure:String = "onConfigLoadFailure";
        public static const onConfigLoadSuccess:String = "onConfigLoadSuccess";
        public static const onConnection:String = "onConnection";
        public static const onConnectionLost:String = "onConnectionLost";
        public static const onCreateRoomError:String = "onCreateRoomError";
        public static const onDebugMessage:String = "onDebugMessage";
        public static const onExtensionResponse:String = "onExtensionResponse";
        public static const onJoinRoom:String = "onJoinRoom";
        public static const onJoinRoomError:String = "onJoinRoomError";
        public static const onLogin:String = "onLogin";
        public static const onLogout:String = "onLogout";
        public static const onModeratorMessage:String = "onModMessage";
        public static const onObjectReceived:String = "onObjectReceived";
        public static const onPrivateMessage:String = "onPrivateMessage";
        public static const onPublicMessage:String = "onPublicMessage";
        public static const onRandomKey:String = "onRandomKey";
        public static const onRoomAdded:String = "onRoomAdded";
        public static const onRoomDeleted:String = "onRoomDeleted";
        public static const onRoomLeft:String = "onRoomLeft";
        public static const onRoomListUpdate:String = "onRoomListUpdate";
        public static const onRoomVariablesUpdate:String = "onRoomVariablesUpdate";
        public static const onRoundTripResponse:String = "onRoundTripResponse";
        public static const onSpectatorSwitched:String = "onSpectatorSwitched";
        public static const onPlayerSwitched:String = "onPlayerSwitched";
        public static const onUserCountChange:String = "onUserCountChange";
        public static const onUserEnterRoom:String = "onUserEnterRoom";
        public static const onUserLeaveRoom:String = "onUserLeaveRoom";
        public static const onUserVariablesUpdate:String = "onUserVariablesUpdate";

        public var params:Object;

        public function SFSEvent(_arg_1:String, _arg_2:Object)
        {
            super(_arg_1);
            this.params = _arg_2;
        }

        override public function clone():Event
        {
            return (new SFSEvent(this.type, this.params));
        }

        override public function toString():String
        {
            return (formatToString("SFSEvent", "type", "bubbles", "cancelable", "eventPhase", "params"));
        }


    }
}//package it.gotoandplay.smartfoxserver

//------------------------------------------------------------
//it.gotoandplay.smartfoxserver.SmartFoxClient

package it.gotoandplay.smartfoxserver
{
    import flash.events.EventDispatcher;
    import flash.utils.ByteArray;
    import it.gotoandplay.smartfoxserver.handlers.SysHandler;
    import it.gotoandplay.smartfoxserver.handlers.ExtHandler;
    import flash.net.Socket;
    import it.gotoandplay.smartfoxserver.http.HttpConnection;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import it.gotoandplay.smartfoxserver.http.HttpEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import it.gotoandplay.smartfoxserver.data.Room;
    import flash.utils.getTimer;
    import it.gotoandplay.smartfoxserver.util.Entities;
    import it.gotoandplay.smartfoxserver.util.ObjectSerializer;
    import it.gotoandplay.smartfoxserver.data.User;
    import flash.net.FileReference;
    import it.gotoandplay.smartfoxserver.handlers.IMessageHandler;
    import flash.utils.setTimeout;
    import flash.events.ErrorEvent;

    public class SmartFoxClient extends EventDispatcher 
    {

        private static const EOM:int = 0;
        private static const MSG_XML:String = "<";
        private static const MSG_JSON:String = "{";
        private static var MSG_STR:String = "%";
        private static var MIN_POLL_SPEED:Number = 0;
        private static var DEFAULT_POLL_SPEED:Number = 750;
        private static var MAX_POLL_SPEED:Number = 10000;
        private static var HTTP_POLL_REQUEST:String = "poll";
        public static const MODMSG_TO_USER:String = "u";
        public static const MODMSG_TO_ROOM:String = "r";
        public static const MODMSG_TO_ZONE:String = "z";
        public static const XTMSG_TYPE_XML:String = "xml";
        public static const XTMSG_TYPE_STR:String = "str";
        public static const XTMSG_TYPE_JSON:String = "json";
        public static const CONNECTION_MODE_DISCONNECTED:String = "disconnected";
        public static const CONNECTION_MODE_SOCKET:String = "socket";
        public static const CONNECTION_MODE_HTTP:String = "http";

        private var byteBuffer:ByteArray = new ByteArray();
        private var roomList:Array;
        private var connected:Boolean;
        private var benchStartTime:int;
        private var sysHandler:SysHandler;
        private var extHandler:ExtHandler;
        private var majVersion:Number;
        private var minVersion:Number;
        private var subVersion:Number;
        private var messageHandlers:Array;
        private var socketConnection:Socket;
        private var autoConnectOnConfigSuccess:Boolean = false;
        public var ipAddress:String;
        public var port:int = 9339;
        public var defaultZone:String;
        private var isHttpMode:Boolean = false;
        private var _httpPollSpeed:int = DEFAULT_POLL_SPEED;
        private var httpConnection:HttpConnection;
        public var blueBoxIpAddress:String;
        public var blueBoxPort:Number = 0;
        public var smartConnect:Boolean = true;
        public var buddyList:Array;
        public var myBuddyVars:Array;
        public var debug:Boolean;
        public var myUserId:int;
        public var myUserName:String;
        public var playerId:int;
        public var amIModerator:Boolean;
        public var activeRoomId:int;
        public var changingRoom:Boolean;
        public var httpPort:int = 8080;
        public var properties:Object = null;

        public function SmartFoxClient(_arg_1:Boolean=false)
        {
            this.majVersion = 1;
            this.minVersion = 6;
            this.subVersion = 5;
            this.activeRoomId = -1;
            this.debug = _arg_1;
            this.messageHandlers = [];
            this.setupMessageHandlers();
            this.socketConnection = new Socket();
            this.socketConnection.addEventListener(Event.CONNECT, this.handleSocketConnection);
            this.socketConnection.addEventListener(Event.CLOSE, this.handleSocketDisconnection);
            this.socketConnection.addEventListener(ProgressEvent.SOCKET_DATA, this.handleSocketData);
            this.socketConnection.addEventListener(IOErrorEvent.IO_ERROR, this.handleIOError);
            this.socketConnection.addEventListener(IOErrorEvent.NETWORK_ERROR, this.handleIOError);
            this.socketConnection.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.handleSecurityError);
            this.httpConnection = new HttpConnection();
            this.httpConnection.addEventListener(HttpEvent.onHttpConnect, this.handleHttpConnect);
            this.httpConnection.addEventListener(HttpEvent.onHttpClose, this.handleHttpClose);
            this.httpConnection.addEventListener(HttpEvent.onHttpData, this.handleHttpData);
            this.httpConnection.addEventListener(HttpEvent.onHttpError, this.handleHttpError);
        }

        public function get rawProtocolSeparator():String
        {
            return (MSG_STR);
        }

        public function set rawProtocolSeparator(_arg_1:String):void
        {
            if (((!(_arg_1 == "<")) && (!(_arg_1 == "{"))))
            {
                MSG_STR = _arg_1;
            };
        }

        public function get isConnected():Boolean
        {
            return (this.connected);
        }

        public function set isConnected(_arg_1:Boolean):void
        {
            this.connected = _arg_1;
        }

        public function get httpPollSpeed():int
        {
            return (this._httpPollSpeed);
        }

        public function set httpPollSpeed(_arg_1:int):void
        {
            if (((_arg_1 >= 0) && (_arg_1 <= 10000)))
            {
                this._httpPollSpeed = _arg_1;
            };
        }

        public function loadConfig(_arg_1:String="config.xml", _arg_2:Boolean=true):void
        {
            this.autoConnectOnConfigSuccess = _arg_2;
            var _local_3:URLLoader = new URLLoader();
            _local_3.addEventListener(Event.COMPLETE, this.onConfigLoadSuccess);
            _local_3.addEventListener(IOErrorEvent.IO_ERROR, this.onConfigLoadFailure);
            _local_3.load(new URLRequest(_arg_1));
        }

        public function getConnectionMode():String
        {
            var _local_1:String = CONNECTION_MODE_DISCONNECTED;
            if (this.isConnected)
            {
                if (this.isHttpMode)
                {
                    _local_1 = CONNECTION_MODE_HTTP;
                }
                else
                {
                    _local_1 = CONNECTION_MODE_SOCKET;
                };
            };
            return (_local_1);
        }

        public function connect(_arg_1:String, _arg_2:int=9339):void
        {
            if (!this.connected)
            {
                this.initialize();
                this.ipAddress = _arg_1;
                this.port = _arg_2;
                this.socketConnection.connect(_arg_1, _arg_2);
            }
            else
            {
                this.debugMessage("*** ALREADY CONNECTED ***");
            };
        }

        public function disconnect():void
        {
            this.connected = false;
            if (!this.isHttpMode)
            {
                this.socketConnection.close();
            }
            else
            {
                this.httpConnection.close();
            };
            this.sysHandler.dispatchDisconnection();
        }

        public function addBuddy(_arg_1:String):void
        {
            var _local_2:String;
            if (((!(_arg_1 == this.myUserName)) && (!(this.checkBuddyDuplicates(_arg_1)))))
            {
                _local_2 = (("<n>" + _arg_1) + "</n>");
                this.send({"t":"sys"}, "addB", -1, _local_2);
            };
        }

        public function autoJoin():void
        {
            if (!this.checkRoomList())
            {
                return;
            };
            var _local_1:Object = {"t":"sys"};
            this.send(_local_1, "autoJoin", ((this.activeRoomId) ? this.activeRoomId : -1), "");
        }

        public function clearBuddyList():void
        {
            this.buddyList = [];
            this.send({"t":"sys"}, "clearB", -1, "");
            var _local_1:Object = {};
            _local_1.list = this.buddyList;
            var _local_2:SFSEvent = new SFSEvent(SFSEvent.onBuddyList, _local_1);
            dispatchEvent(_local_2);
        }

        public function createRoom(_arg_1:Object, _arg_2:int=-1):void
        {
            var _local_10:String;
            if (((!(this.checkRoomList())) || (!(this.checkJoin()))))
            {
                return;
            };
            if (_arg_2 == -1)
            {
                _arg_2 = this.activeRoomId;
            };
            var _local_3:Object = {"t":"sys"};
            var _local_4:String = ((_arg_1.isGame) ? "1" : "0");
            var _local_5:* = "1";
            var _local_6:String = ((_arg_1.maxUsers == null) ? "0" : String(_arg_1.maxUsers));
            var _local_7:String = ((_arg_1.maxSpectators == null) ? "0" : String(_arg_1.maxSpectators));
            var _local_8:String = ((_arg_1.joinAsSpectator) ? "1" : "0");
            if (((_arg_1.isGame) && (!(_arg_1.exitCurrentRoom == null))))
            {
                _local_5 = ((_arg_1.exitCurrentRoom) ? "1" : "0");
            };
            var _local_9:* = (((((((("<room tmp='1' gam='" + _local_4) + "' spec='") + _local_7) + "' exit='") + _local_5) + "' jas='") + _local_8) + "'>");
            _local_9 = (_local_9 + (("<name><![CDATA[" + ((_arg_1.name == null) ? "" : _arg_1.name)) + "]]></name>"));
            _local_9 = (_local_9 + (("<pwd><![CDATA[" + ((_arg_1.password == null) ? "" : _arg_1.password)) + "]]></pwd>"));
            _local_9 = (_local_9 + (("<max>" + _local_6) + "</max>"));
            if (_arg_1.uCount != null)
            {
                _local_9 = (_local_9 + (("<uCnt>" + ((_arg_1.uCount) ? "1" : "0")) + "</uCnt>"));
            };
            if (_arg_1.extension != null)
            {
                _local_9 = (_local_9 + ("<xt n='" + _arg_1.extension.name));
                _local_9 = (_local_9 + (("' s='" + _arg_1.extension.script) + "' />"));
            };
            if (_arg_1.vars == null)
            {
                _local_9 = (_local_9 + "<vars></vars>");
            }
            else
            {
                _local_9 = (_local_9 + "<vars>");
                for (_local_10 in _arg_1.vars)
                {
                    _local_9 = (_local_9 + this.getXmlRoomVariable(_arg_1.vars[_local_10]));
                };
                _local_9 = (_local_9 + "</vars>");
            };
            _local_9 = (_local_9 + "</room>");
            this.send(_local_3, "createRoom", _arg_2, _local_9);
        }

        public function getAllRooms():Array
        {
            return (this.roomList);
        }

        public function setRoomList(_arg_1:Array):void
        {
            this.roomList = _arg_1;
        }

        public function getBuddyByName(_arg_1:String):Object
        {
            var _local_2:Object;
            for each (_local_2 in this.buddyList)
            {
                if (_local_2.name == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function getBuddyById(_arg_1:int):Object
        {
            var _local_2:Object;
            for each (_local_2 in this.buddyList)
            {
                if (_local_2.id == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function getBuddyRoom(_arg_1:Object):void
        {
            if (_arg_1.id != -1)
            {
                this.send({"t":"sys"}, "roomB", -1, (("<b id='" + _arg_1.id) + "' />"));
            };
        }

        public function getRoom(_arg_1:int):Room
        {
            if (!this.checkRoomList())
            {
                return (null);
            };
            return (this.roomList[_arg_1]);
        }

        public function getRoomByName(_arg_1:String):Room
        {
            var _local_3:Room;
            if (!this.checkRoomList())
            {
                return (null);
            };
            var _local_2:Room;
            for each (_local_3 in this.roomList)
            {
                if (_local_3.getName() == _arg_1)
                {
                    _local_2 = _local_3;
                    break;
                };
            };
            return (_local_2);
        }

        public function getRoomList():void
        {
            var _local_1:Object = {"t":"sys"};
            this.send(_local_1, "getRmList", this.activeRoomId, "");
        }

        public function getActiveRoom():Room
        {
            if (((!(this.checkRoomList())) || (!(this.checkJoin()))))
            {
                return (null);
            };
            return (this.roomList[this.activeRoomId]);
        }

        public function getRandomKey():void
        {
            this.send({"t":"sys"}, "rndK", -1, "");
        }

        public function getUploadPath():String
        {
            return (((("http://" + this.ipAddress) + ":") + this.httpPort) + "/default/uploads/");
        }

        public function getVersion():String
        {
            return ((((this.majVersion + ".") + this.minVersion) + ".") + this.subVersion);
        }

        public function joinRoom(_arg_1:*, _arg_2:String="", _arg_3:Boolean=false, _arg_4:Boolean=false, _arg_5:int=-1):void
        {
            var _local_8:Room;
            var _local_9:Object;
            var _local_10:String;
            var _local_11:int;
            var _local_12:String;
            if (!this.checkRoomList())
            {
                return;
            };
            var _local_6:int = -1;
            var _local_7:int = ((_arg_3) ? 1 : 0);
            if (!this.changingRoom)
            {
                if (typeof(_arg_1) == "number")
                {
                    _local_6 = int(_arg_1);
                }
                else
                {
                    if (typeof(_arg_1) == "string")
                    {
                        for each (_local_8 in this.roomList)
                        {
                            if (_local_8.getName() == _arg_1)
                            {
                                _local_6 = _local_8.getId();
                                break;
                            };
                        };
                    };
                };
                if (_local_6 != -1)
                {
                    _local_9 = {"t":"sys"};
                    _local_10 = ((_arg_4) ? "0" : "1");
                    _local_11 = ((_arg_5 > -1) ? _arg_5 : this.activeRoomId);
                    if (this.activeRoomId == -1)
                    {
                        _local_10 = "0";
                        _local_11 = -1;
                    };
                    _local_12 = (((((((((("<room id='" + _local_6) + "' pwd='") + _arg_2) + "' spec='") + _local_7) + "' leave='") + _local_10) + "' old='") + _local_11) + "' />");
                    this.send(_local_9, "joinRoom", this.activeRoomId, _local_12);
                    this.changingRoom = true;
                }
                else
                {
                    this.debugMessage("SmartFoxError: requested room to join does not exist!");
                };
            };
        }

        public function leaveRoom(_arg_1:int):void
        {
            if (((!(this.checkRoomList())) || (!(this.checkJoin()))))
            {
                return;
            };
            var _local_2:Object = {"t":"sys"};
            var _local_3:* = (("<rm id='" + _arg_1) + "' />");
            this.send(_local_2, "leaveRoom", _arg_1, _local_3);
        }

        public function loadBuddyList():void
        {
            this.send({"t":"sys"}, "loadB", -1, "");
        }

        public function login(_arg_1:String, _arg_2:String, _arg_3:String):void
        {
            var _local_4:Object = {"t":"sys"};
            var _local_5:* = (((((("<login z='" + _arg_1) + "'><nick><![CDATA[") + _arg_2) + "]]></nick><pword><![CDATA[") + _arg_3) + "]]></pword></login>");
            this.send(_local_4, "login", 0, _local_5);
        }

        public function logout():void
        {
            var _local_1:Object = {"t":"sys"};
            this.send(_local_1, "logout", -1, "");
        }

        public function removeBuddy(_arg_1:String):void
        {
            var _local_3:Object;
            var _local_4:String;
            var _local_5:Object;
            var _local_6:String;
            var _local_7:Object;
            var _local_8:SFSEvent;
            var _local_2:Boolean;
            for (_local_4 in this.buddyList)
            {
                _local_3 = this.buddyList[_local_4];
                if (_local_3.name == _arg_1)
                {
                    delete this.buddyList[_local_4];
                    _local_2 = true;
                    break;
                };
            };
            if (_local_2)
            {
                _local_5 = {"t":"sys"};
                _local_6 = (("<n>" + _arg_1) + "</n>");
                this.send(_local_5, "remB", -1, _local_6);
                _local_7 = {};
                _local_7.list = this.buddyList;
                _local_8 = new SFSEvent(SFSEvent.onBuddyList, _local_7);
                dispatchEvent(_local_8);
            };
        }

        public function roundTripBench():void
        {
            this.benchStartTime = getTimer();
            this.send({"t":"sys"}, "roundTrip", this.activeRoomId, "");
        }

        public function sendBuddyPermissionResponse(_arg_1:Boolean, _arg_2:String):void
        {
            var _local_3:Object = {"t":"sys"};
            var _local_4:* = (((("<n res='" + ((_arg_1) ? "g" : "r")) + "'>") + _arg_2) + "</n>");
            this.send(_local_3, "bPrm", -1, _local_4);
        }

        public function sendPublicMessage(_arg_1:String, _arg_2:int=-1):void
        {
            if (((!(this.checkRoomList())) || (!(this.checkJoin()))))
            {
                return;
            };
            if (_arg_2 == -1)
            {
                _arg_2 = this.activeRoomId;
            };
            var _local_3:Object = {"t":"sys"};
            var _local_4:* = (("<txt><![CDATA[" + Entities.encodeEntities(_arg_1)) + "]]></txt>");
            this.send(_local_3, "pubMsg", _arg_2, _local_4);
        }

        public function sendPrivateMessage(_arg_1:String, _arg_2:int, _arg_3:int=-1):void
        {
            if (((!(this.checkRoomList())) || (!(this.checkJoin()))))
            {
                return;
            };
            if (_arg_3 == -1)
            {
                _arg_3 = this.activeRoomId;
            };
            var _local_4:Object = {"t":"sys"};
            var _local_5:* = (((("<txt rcp='" + _arg_2) + "'><![CDATA[") + Entities.encodeEntities(_arg_1)) + "]]></txt>");
            this.send(_local_4, "prvMsg", _arg_3, _local_5);
        }

        public function sendModeratorMessage(_arg_1:String, _arg_2:String, _arg_3:int=-1):void
        {
            if (((!(this.checkRoomList())) || (!(this.checkJoin()))))
            {
                return;
            };
            var _local_4:Object = {"t":"sys"};
            var _local_5:* = (((((("<txt t='" + _arg_2) + "' id='") + _arg_3) + "'><![CDATA[") + Entities.encodeEntities(_arg_1)) + "]]></txt>");
            this.send(_local_4, "modMsg", this.activeRoomId, _local_5);
        }

        public function sendObject(_arg_1:Object, _arg_2:int=-1):void
        {
            if (((!(this.checkRoomList())) || (!(this.checkJoin()))))
            {
                return;
            };
            if (_arg_2 == -1)
            {
                _arg_2 = this.activeRoomId;
            };
            var _local_3:* = (("<![CDATA[" + ObjectSerializer.getInstance().serialize(_arg_1)) + "]]>");
            var _local_4:Object = {"t":"sys"};
            this.send(_local_4, "asObj", _arg_2, _local_3);
        }

        public function sendObjectToGroup(_arg_1:Object, _arg_2:Array, _arg_3:int=-1):void
        {
            var _local_5:String;
            var _local_6:Object;
            var _local_7:String;
            if (((!(this.checkRoomList())) || (!(this.checkJoin()))))
            {
                return;
            };
            if (_arg_3 == -1)
            {
                _arg_3 = this.activeRoomId;
            };
            var _local_4:* = "";
            for (_local_5 in _arg_2)
            {
                if (!isNaN(_arg_2[_local_5]))
                {
                    _local_4 = (_local_4 + (_arg_2[_local_5] + ","));
                };
            };
            _local_4 = _local_4.substr(0, (_local_4.length - 1));
            _arg_1._$$_ = _local_4;
            _local_6 = {"t":"sys"};
            _local_7 = (("<![CDATA[" + ObjectSerializer.getInstance().serialize(_arg_1)) + "]]>");
            this.send(_local_6, "asObjG", _arg_3, _local_7);
        }

        public function sendXtMessage(_arg_1:String, _arg_2:String, _arg_3:*, _arg_4:String="xml", _arg_5:int=-1):void
        {
            var _local_6:Object;
            var _local_7:Object;
            var _local_8:String;
            var _local_9:String;
            var _local_10:Number;
            var _local_11:Object;
            var _local_12:Object;
            var _local_13:String;
            if (!this.checkRoomList())
            {
                return;
            };
            if (_arg_5 == -1)
            {
                _arg_5 = this.activeRoomId;
            };
            if (_arg_4 == XTMSG_TYPE_XML)
            {
                _local_6 = {"t":"xt"};
                _local_7 = {
                    "name":_arg_1,
                    "cmd":_arg_2,
                    "param":_arg_3
                };
                _local_8 = (("<![CDATA[" + ObjectSerializer.getInstance().serialize(_local_7)) + "]]>");
                this.send(_local_6, "xtReq", _arg_5, _local_8);
            }
            else
            {
                if (_arg_4 == XTMSG_TYPE_STR)
                {
                    _local_9 = ((((((((MSG_STR + "xt") + MSG_STR) + _arg_1) + MSG_STR) + _arg_2) + MSG_STR) + _arg_5) + MSG_STR);
                    _local_10 = 0;
                    while (_local_10 < _arg_3.length)
                    {
                        _local_9 = (_local_9 + (_arg_3[_local_10].toString() + MSG_STR));
                        _local_10++;
                    };
                    this.sendString(_local_9);
                }
                else
                {
                    if (_arg_4 == XTMSG_TYPE_JSON)
                    {
                        _local_11 = {};
                        _local_11.x = _arg_1;
                        _local_11.c = _arg_2;
                        _local_11.r = _arg_5;
                        _local_11.p = _arg_3;
                        _local_12 = {};
                        _local_12.t = "xt";
                        _local_12.b = _local_11;
                        _local_13 = JSON.stringify(_local_12);
                        this.sendJson(_local_13);
                    };
                };
            };
        }

        public function setBuddyBlockStatus(_arg_1:String, _arg_2:Boolean):void
        {
            var _local_4:String;
            var _local_5:Object;
            var _local_6:SFSEvent;
            var _local_3:Object = this.getBuddyByName(_arg_1);
            if (_local_3 != null)
            {
                if (_local_3.isBlocked != _arg_2)
                {
                    _local_3.isBlocked = _arg_2;
                    _local_4 = (((("<n x='" + ((_arg_2) ? "1" : "0")) + "'>") + _arg_1) + "</n>");
                    this.send({"t":"sys"}, "setB", -1, _local_4);
                    _local_5 = {};
                    _local_5.buddy = _local_3;
                    _local_6 = new SFSEvent(SFSEvent.onBuddyListUpdate, _local_5);
                    dispatchEvent(_local_6);
                };
            };
        }

        public function setBuddyVariables(_arg_1:Array):void
        {
            var _local_4:String;
            var _local_5:String;
            var _local_2:Object = {"t":"sys"};
            var _local_3:* = "<vars>";
            for (_local_4 in _arg_1)
            {
                _local_5 = _arg_1[_local_4];
                if (this.myBuddyVars[_local_4] != _local_5)
                {
                    this.myBuddyVars[_local_4] = _local_5;
                    _local_3 = (_local_3 + (((("<var n='" + _local_4) + "'><![CDATA[") + _local_5) + "]]></var>"));
                };
            };
            _local_3 = (_local_3 + "</vars>");
            this.send(_local_2, "setBvars", -1, _local_3);
        }

        public function setRoomVariables(_arg_1:Array, _arg_2:int=-1, _arg_3:Boolean=true):void
        {
            var _local_5:String;
            var _local_6:Object;
            if (((!(this.checkRoomList())) || (!(this.checkJoin()))))
            {
                return;
            };
            if (_arg_2 == -1)
            {
                _arg_2 = this.activeRoomId;
            };
            var _local_4:Object = {"t":"sys"};
            if (_arg_3)
            {
                _local_5 = "<vars>";
            }
            else
            {
                _local_5 = "<vars so='0'>";
            };
            for each (_local_6 in _arg_1)
            {
                _local_5 = (_local_5 + this.getXmlRoomVariable(_local_6));
            };
            _local_5 = (_local_5 + "</vars>");
            this.send(_local_4, "setRvars", _arg_2, _local_5);
        }

        public function setUserVariables(_arg_1:Object, _arg_2:int=-1):void
        {
            var _local_7:Room;
            var _local_8:String;
            var _local_9:User;
            if (((!(this.checkRoomList())) || (!(this.checkJoin()))))
            {
                return;
            };
            if (_arg_2 == -1)
            {
                _arg_2 = this.activeRoomId;
            };
            var _local_3:Object = {"t":"sys"};
            var _local_4:Room = this.getActiveRoom();
            var _local_5:User = _local_4.getUser(this.myUserId);
            _local_5.setVariables(_arg_1);
            var _local_6:int = _local_5.getId();
            for each (_local_7 in this.getAllRooms())
            {
                _local_9 = _local_7.getUser(_local_6);
                if (((!(_local_9 == null)) && (!(_local_9 == _local_5))))
                {
                    _local_9.setVariables(_arg_1);
                };
            };
            _local_8 = this.getXmlUserVariable(_arg_1);
            this.send(_local_3, "setUvars", _arg_2, _local_8);
        }

        public function switchSpectator(_arg_1:int=-1):void
        {
            if (((!(this.checkRoomList())) || (!(this.checkJoin()))))
            {
                return;
            };
            if (_arg_1 == -1)
            {
                _arg_1 = this.activeRoomId;
            };
            this.send({"t":"sys"}, "swSpec", _arg_1, "");
        }

        public function switchPlayer(_arg_1:int=-1):void
        {
            if (((!(this.checkRoomList())) || (!(this.checkJoin()))))
            {
                return;
            };
            if (_arg_1 == -1)
            {
                _arg_1 = this.activeRoomId;
            };
            this.send({"t":"sys"}, "swPl", _arg_1, "");
        }

        public function uploadFile(_arg_1:FileReference, _arg_2:int=-1, _arg_3:String="", _arg_4:int=-1):void
        {
            if (_arg_2 == -1)
            {
                _arg_2 = this.myUserId;
            };
            if (_arg_3 == "")
            {
                _arg_3 = this.myUserName;
            };
            if (_arg_4 == -1)
            {
                _arg_4 = this.httpPort;
            };
            _arg_1.upload(new URLRequest(((((((("http://" + this.ipAddress) + ":") + _arg_4) + "/default/Upload.py?id=") + _arg_2) + "&nick=") + _arg_3)));
            this.debugMessage(((((((("[UPLOAD]: http://" + this.ipAddress) + ":") + _arg_4) + "/default/Upload.py?id=") + _arg_2) + "&nick=") + _arg_3));
        }

        public function __logout():void
        {
            this.initialize(true);
        }

        public function sendString(_arg_1:String):void
        {
            this.debugMessage((("[Sending - STR]: " + _arg_1) + "\n"));
            if (this.isHttpMode)
            {
                this.httpConnection.send(_arg_1);
            }
            else
            {
                this.writeToSocket(_arg_1);
            };
        }

        public function sendJson(_arg_1:String):void
        {
            this.debugMessage((("[Sending - JSON]: " + _arg_1) + "\n"));
            if (this.isHttpMode)
            {
                this.httpConnection.send(_arg_1);
            }
            else
            {
                this.writeToSocket(_arg_1);
            };
        }

        public function getBenchStartTime():int
        {
            return (this.benchStartTime);
        }

        public function clearRoomList():void
        {
            this.roomList = [];
        }

        private function initialize(_arg_1:Boolean=false):void
        {
            this.changingRoom = false;
            this.amIModerator = false;
            this.playerId = -1;
            this.activeRoomId = -1;
            this.myUserId = -1;
            this.myUserName = "";
            this.roomList = [];
            this.buddyList = [];
            this.myBuddyVars = [];
            if (!_arg_1)
            {
                this.connected = false;
                this.isHttpMode = false;
            };
        }

        private function onConfigLoadSuccess(_arg_1:Event):void
        {
            var _local_4:SFSEvent;
            var _local_2:URLLoader = (_arg_1.target as URLLoader);
            var _local_3:XML = new XML(_local_2.data);
            this.ipAddress = (this.blueBoxIpAddress = _local_3.ip);
            this.port = int(_local_3.port);
            this.defaultZone = _local_3.zone;
            if (_local_3.blueBoxIpAddress != undefined)
            {
                this.blueBoxIpAddress = _local_3.blueBoxIpAddress;
            };
            if (_local_3.blueBoxPort != undefined)
            {
                this.blueBoxPort = _local_3.blueBoxPort;
            };
            if (_local_3.debug != undefined)
            {
                this.debug = ((_local_3.debug.toLowerCase() == "true") ? true : false);
            };
            if (_local_3.smartConnect != undefined)
            {
                this.smartConnect = ((_local_3.smartConnect.toLowerCase() == "true") ? true : false);
            };
            if (_local_3.httpPort != undefined)
            {
                this.httpPort = int(_local_3.httpPort);
            };
            if (_local_3.httpPollSpeed != undefined)
            {
                this.httpPollSpeed = int(_local_3.httpPollSpeed);
            };
            if (_local_3.rawProtocolSeparator != undefined)
            {
                this.rawProtocolSeparator = _local_3.rawProtocolSeparator;
            };
            if (this.autoConnectOnConfigSuccess)
            {
                this.connect(this.ipAddress, this.port);
            }
            else
            {
                _local_4 = new SFSEvent(SFSEvent.onConfigLoadSuccess, {});
                dispatchEvent(_local_4);
            };
        }

        private function onConfigLoadFailure(_arg_1:IOErrorEvent):void
        {
            var _local_2:Object = {"message":_arg_1.text};
            var _local_3:SFSEvent = new SFSEvent(SFSEvent.onConfigLoadFailure, _local_2);
            dispatchEvent(_local_3);
        }

        private function setupMessageHandlers():void
        {
            this.sysHandler = new SysHandler(this);
            this.extHandler = new ExtHandler(this);
            this.addMessageHandler("sys", this.sysHandler);
            this.addMessageHandler("xt", this.extHandler);
        }

        private function addMessageHandler(_arg_1:String, _arg_2:IMessageHandler):void
        {
            if (this.messageHandlers[_arg_1] == null)
            {
                this.messageHandlers[_arg_1] = _arg_2;
            }
            else
            {
                this.debugMessage((("Warning, message handler called: " + _arg_1) + " already exist!"));
            };
        }

        private function debugMessage(_arg_1:String):void
        {
            var _local_2:SFSEvent;
            if (this.debug)
            {
                trace(_arg_1);
                _local_2 = new SFSEvent(SFSEvent.onDebugMessage, {"message":_arg_1});
                dispatchEvent(_local_2);
            };
        }

        private function send(_arg_1:Object, _arg_2:String, _arg_3:Number, _arg_4:String):void
        {
            var _local_5:String = this.makeXmlHeader(_arg_1);
            _local_5 = (_local_5 + ((((((("<body action='" + _arg_2) + "' r='") + _arg_3) + "'>") + _arg_4) + "</body>") + this.closeHeader()));
            this.debugMessage((("[Sending]: " + _local_5) + "\n"));
            if (this.isHttpMode)
            {
                this.httpConnection.send(_local_5);
            }
            else
            {
                this.writeToSocket(_local_5);
            };
        }

        private function writeToSocket(_arg_1:String):void
        {
            var _local_2:ByteArray = new ByteArray();
            _local_2.writeUTFBytes(_arg_1);
            _local_2.writeByte(0);
            this.socketConnection.writeBytes(_local_2);
            this.socketConnection.flush();
        }

        private function makeXmlHeader(_arg_1:Object):String
        {
            var _local_3:String;
            var _local_2:* = "<msg";
            for (_local_3 in _arg_1)
            {
                _local_2 = (_local_2 + ((((" " + _local_3) + "='") + _arg_1[_local_3]) + "'"));
            };
            return (_local_2 + ">");
        }

        private function closeHeader():String
        {
            return ("</msg>");
        }

        private function checkBuddyDuplicates(_arg_1:String):Boolean
        {
            var _local_3:Object;
            var _local_2:Boolean;
            for each (_local_3 in this.buddyList)
            {
                if (_local_3.name == _arg_1)
                {
                    _local_2 = true;
                    break;
                };
            };
            return (_local_2);
        }

        private function xmlReceived(_arg_1:String):void
        {
            var _local_2:XML = new XML(_arg_1);
            var _local_3:String = _local_2.@t;
            var _local_4:String = _local_2.body.@action;
            var _local_5:int = int(_local_2.body.@r);
            var _local_6:IMessageHandler = this.messageHandlers[_local_3];
            if (_local_6 != null)
            {
                _local_6.handleMessage(_local_2, XTMSG_TYPE_XML);
            };
        }

        private function jsonReceived(_arg_1:String):void
        {
            var _local_2:Object = JSON.parse(_arg_1);
            var _local_3:String = _local_2["t"];
            var _local_4:IMessageHandler = this.messageHandlers[_local_3];
            if (_local_4 != null)
            {
                _local_4.handleMessage(_local_2["b"], XTMSG_TYPE_JSON);
            };
        }

        private function strReceived(_arg_1:String):void
        {
            var _local_2:Array = _arg_1.substr(1, (_arg_1.length - 2)).split(MSG_STR);
            var _local_3:String = _local_2[0];
            var _local_4:IMessageHandler = this.messageHandlers[_local_3];
            if (_local_4 != null)
            {
                _local_4.handleMessage(_local_2.splice(1, (_local_2.length - 1)), XTMSG_TYPE_STR);
            };
        }

        private function getXmlRoomVariable(_arg_1:Object):String
        {
            var _local_2:String = _arg_1.name.toString();
            var _local_3:* = _arg_1.val;
            var _local_4:String = ((_arg_1.priv) ? "1" : "0");
            var _local_5:String = ((_arg_1.persistent) ? "1" : "0");
            var _local_6:String;
            var _local_7:* = typeof(_local_3);
            if (_local_7 == "boolean")
            {
                _local_6 = "b";
                _local_3 = ((_local_3) ? "1" : "0");
            }
            else
            {
                if (_local_7 == "number")
                {
                    _local_6 = "n";
                }
                else
                {
                    if (_local_7 == "string")
                    {
                        _local_6 = "s";
                    }
                    else
                    {
                        if ((((_local_3 == null) && (_local_7 == "object")) || (_local_7 == "undefined")))
                        {
                            _local_6 = "x";
                            _local_3 = "";
                        };
                    };
                };
            };
            if (_local_6 != null)
            {
                return (((((((((("<var n='" + _local_2) + "' t='") + _local_6) + "' pr='") + _local_4) + "' pe='") + _local_5) + "'><![CDATA[") + _local_3) + "]]></var>");
            };
            return ("");
        }

        private function getXmlUserVariable(_arg_1:Object):String
        {
            var _local_3:*;
            var _local_4:String;
            var _local_5:String;
            var _local_6:String;
            var _local_2:* = "<vars>";
            for (_local_6 in _arg_1)
            {
                _local_3 = _arg_1[_local_6];
                _local_5 = typeof(_local_3);
                _local_4 = null;
                if (_local_5 == "boolean")
                {
                    _local_4 = "b";
                    _local_3 = ((_local_3) ? "1" : "0");
                }
                else
                {
                    if (_local_5 == "number")
                    {
                        _local_4 = "n";
                    }
                    else
                    {
                        if (_local_5 == "string")
                        {
                            _local_4 = "s";
                        }
                        else
                        {
                            if ((((_local_3 == null) && (_local_5 == "object")) || (_local_5 == "undefined")))
                            {
                                _local_4 = "x";
                                _local_3 = "";
                            };
                        };
                    };
                };
                if (_local_4 != null)
                {
                    _local_2 = (_local_2 + (((((("<var n='" + _local_6) + "' t='") + _local_4) + "'><![CDATA[") + _local_3) + "]]></var>"));
                };
            };
            return (_local_2 + "</vars>");
        }

        private function checkRoomList():Boolean
        {
            var _local_1:Boolean = true;
            if (((this.roomList == null) || (this.roomList.length == 0)))
            {
                _local_1 = false;
                this.errorTrace("The room list is empty!\nThe client API cannot function properly until the room list is populated.\nPlease consult the documentation for more infos.");
            };
            return (_local_1);
        }

        private function checkJoin():Boolean
        {
            var _local_1:Boolean = true;
            if (this.activeRoomId < 0)
            {
                _local_1 = false;
                this.errorTrace("You haven't joined any rooms!\nIn order to interact with the server you should join at least one room.\nPlease consult the documentation for more infos.");
            };
            return (_local_1);
        }

        private function errorTrace(_arg_1:String):void
        {
            trace("\n****************************************************************");
            trace("Warning:");
            trace(_arg_1);
            trace("****************************************************************");
        }

        private function handleHttpConnect(_arg_1:HttpEvent):void
        {
            this.handleSocketConnection(null);
            this.connected = true;
            this.httpConnection.send(HTTP_POLL_REQUEST);
        }

        private function handleHttpClose(_arg_1:HttpEvent):void
        {
            this.initialize();
            var _local_2:SFSEvent = new SFSEvent(SFSEvent.onConnectionLost, {});
            dispatchEvent(_local_2);
        }

        private function handleHttpData(_arg_1:HttpEvent):void
        {
            var _local_4:String;
            var _local_5:int;
            var _local_2:String = (_arg_1.params.data as String);
            var _local_3:Array = _local_2.split("\n");
            if (_local_3[0] != "")
            {
                _local_5 = 0;
                while (_local_5 < (_local_3.length - 1))
                {
                    _local_4 = _local_3[_local_5];
                    if (_local_4.length > 0)
                    {
                        this.handleMessage(_local_4);
                    };
                    _local_5++;
                };
                if (this._httpPollSpeed > 0)
                {
                    setTimeout(this.handleDelayedPoll, this._httpPollSpeed);
                }
                else
                {
                    this.handleDelayedPoll();
                };
            };
        }

        private function handleDelayedPoll():void
        {
            this.httpConnection.send(HTTP_POLL_REQUEST);
        }

        private function handleHttpError(_arg_1:HttpEvent):void
        {
            trace("HttpError");
            if (!this.connected)
            {
                this.dispatchConnectionError();
            };
        }

        private function handleSocketConnection(_arg_1:Event):void
        {
            var _local_2:Object = {"t":"sys"};
            var _local_3:* = (((("<ver v='" + this.majVersion.toString()) + this.minVersion.toString()) + this.subVersion.toString()) + "' />");
            this.send(_local_2, "verChk", 0, _local_3);
        }

        private function handleSocketDisconnection(_arg_1:Event):void
        {
            this.initialize();
            var _local_2:SFSEvent = new SFSEvent(SFSEvent.onConnectionLost, {});
            dispatchEvent(_local_2);
        }

        private function handleIOError(_arg_1:IOErrorEvent):void
        {
            this.tryBlueBoxConnection(_arg_1);
        }

        private function tryBlueBoxConnection(_arg_1:ErrorEvent):void
        {
            var _local_2:String;
            var _local_3:int;
            if (!this.connected)
            {
                if (this.smartConnect)
                {
                    this.debugMessage("Socket connection failed. Trying BlueBox");
                    this.isHttpMode = true;
                    _local_2 = ((this.blueBoxIpAddress != null) ? this.blueBoxIpAddress : this.ipAddress);
                    _local_3 = ((this.blueBoxPort != 0) ? this.blueBoxPort : this.httpPort);
                    this.httpConnection.connect(_local_2, _local_3);
                }
                else
                {
                    this.dispatchConnectionError();
                };
            }
            else
            {
                this.debugMessage(("[WARN] Connection error: " + _arg_1.text));
            };
        }

        private function handleSocketError(_arg_1:SecurityErrorEvent):void
        {
            this.debugMessage(("Socket Error: " + _arg_1.text));
        }

        private function handleSecurityError(_arg_1:SecurityErrorEvent):void
        {
            this.tryBlueBoxConnection(_arg_1);
        }

        private function handleSocketData(evt:Event):void
        {
            var b:int;
            var bytes:int = this.socketConnection.bytesAvailable;
            while (--bytes >= 0)
            {
                b = this.socketConnection.readByte();
                if (b != 0)
                {
                    this.byteBuffer.writeByte(b);
                }
                else
                {
                    try
                    {
                        this.handleMessage(this.byteBuffer.toString());
                    }
                    catch(err:Error)
                    {
                        debugMessage(("[WARN] Unexpected exception during handleMessage: " + err));
                        if (err.getStackTrace() != null)
                        {
                            debugMessage(err.getStackTrace());
                        };
                    };
                    this.byteBuffer = new ByteArray();
                };
            };
        }

        private function handleMessage(_arg_1:String):void
        {
            if (_arg_1 != "ok")
            {
                this.debugMessage((((("[ RECEIVED ]: " + _arg_1) + ", (len: ") + _arg_1.length) + ")"));
            };
            var _local_2:String = _arg_1.charAt(0);
            if (_local_2 == MSG_XML)
            {
                this.xmlReceived(_arg_1);
            }
            else
            {
                if (_local_2 == MSG_STR)
                {
                    this.strReceived(_arg_1);
                }
                else
                {
                    if (_local_2 == MSG_JSON)
                    {
                        this.jsonReceived(_arg_1);
                    };
                };
            };
        }

        private function dispatchConnectionError():void
        {
            var _local_1:Object = {};
            _local_1.success = false;
            _local_1.error = "I/O Error";
            var _local_2:SFSEvent = new SFSEvent(SFSEvent.onConnection, _local_1);
            dispatchEvent(_local_2);
        }


    }
}//package it.gotoandplay.smartfoxserver

//------------------------------------------------------------
//bt_loginstandard

package 
{
    import com.cocolani.common.simplebutton;
    import flash.events.*;
    import flash.text.*;
    import flash.geom.*;
    import flash.net.*;
    import flash.display.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.system.*;
    import flash.external.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.filters.*;
    import flash.globalization.*;
    import flash.media.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.xml.*;

    public dynamic class bt_loginstandard extends simplebutton 
    {

        public function bt_loginstandard()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4);
        }

        internal function frame1():*
        {
            me.updtext();
        }

        internal function frame2():*
        {
            me.updtext();
        }

        internal function frame3():*
        {
            me.updtext();
        }

        internal function frame4():*
        {
            me.updtext();
        }


    }
}//package 

//------------------------------------------------------------
//mc_msg

package 
{
    import com.cocolani.infomsg;

    public dynamic class mc_msg extends infomsg 
    {


    }
}//package 

//------------------------------------------------------------
//mc_preloader

package 
{
    import com.cocolani.preloader;

    public dynamic class mc_preloader extends preloader 
    {


    }
}//package 

//------------------------------------------------------------
//mc_progress

package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;

    public dynamic class mc_progress extends MovieClip 
    {

        public var percentagetxt:TextField;


    }
}//package 

//------------------------------------------------------------
//msgpopup_Ok

package 
{
    import com.cocolani.common.simplebutton;
    import flash.events.*;
    import flash.text.*;
    import flash.geom.*;
    import flash.net.*;
    import flash.display.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.system.*;
    import flash.external.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.filters.*;
    import flash.globalization.*;
    import flash.media.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.xml.*;

    public dynamic class msgpopup_Ok extends simplebutton 
    {

        public var thisref:*;

        public function msgpopup_Ok()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3);
        }

        internal function frame1():*
        {
            this.thisref = this;
            this.thisref.updtext();
        }

        internal function frame2():*
        {
            this.thisref.updtext();
        }

        internal function frame3():*
        {
            this.thisref.updtext();
        }


    }
}//package 

