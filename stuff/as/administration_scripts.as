// Decompiled by AS3 Sorcerer 5.72
// www.as3sorcerer.com

//------------------------------------------------------------
//com.cocolani.common.simplebutton

package com.cocolani.common
{
    import flash.display.MovieClip;
    import flash.text.TextFormat;
    import flash.events.MouseEvent;

    public class simplebutton extends MovieClip 
    {

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
//com.cocolani.common.togglebutton

package com.cocolani.common
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;

    public class togglebutton extends MovieClip 
    {

        public var me:*;
        public var toggleState:* = false;

        public function togglebutton()
        {
            this.me = this;
            super();
            stop();
            buttonMode = true;
            mouseChildren = false;
            addEventListener(MouseEvent.MOUSE_OVER, this.rollover);
            addEventListener(MouseEvent.MOUSE_OUT, this.rollover);
            addEventListener(MouseEvent.MOUSE_DOWN, this.rollover);
            addEventListener(MouseEvent.CLICK, this.rollover);
        }

        public function get status():*
        {
            if (currentFrame == 5)
            {
                return (-1);
            };
            return (this.toggleState);
        }

        public function toggle():*
        {
            if (currentFrame != 5)
            {
                this.toggleState = (!(this.toggleState));
                if (this.toggleState)
                {
                    gotoAndStop(3);
                }
                else
                {
                    gotoAndStop(1);
                };
            };
        }

        public function enable():*
        {
            if (this.toggleState)
            {
                gotoAndStop(3);
            }
            else
            {
                gotoAndStop(1);
            };
            this.sendToggleEnable(this.status);
        }

        public function setText(_arg_1:String):*
        {
            this.me.thetext.text = _arg_1;
        }

        public function sendToggleEnable(_arg_1:*):*
        {
            var _local_2:* = this.me.stage.getChildAt(0);
            if (((_local_2.mc_scene.sceneRef) && (_local_2.mc_scene.sceneRef.getChildByName("pathFinding"))))
            {
                _local_2.mc_scene.sceneRef.pathFinding = _arg_1;
            };
        }

        public function disable():*
        {
            gotoAndStop(5);
            this.sendToggleEnable(this.status);
        }

        public function rollover(e:MouseEvent):*
        {
            if (currentFrame != 5)
            {
                if (e.type == "mouseOver")
                {
                    try
                    {
                        if (!e.currentTarget.stage.getChildAt(0).getChildByName("cursorRef"))
                        {
                            if (this.toggleState)
                            {
                                e.currentTarget.gotoAndStop(4);
                            }
                            else
                            {
                                e.currentTarget.gotoAndStop(2);
                            };
                        };
                    }
                    catch(e)
                    {
                        if (toggleState)
                        {
                            e.currentTarget.gotoAndStop(4);
                        }
                        else
                        {
                            e.currentTarget.gotoAndStop(2);
                        };
                    };
                }
                else
                {
                    if (e.type == "mouseOut")
                    {
                        if (this.toggleState)
                        {
                            e.currentTarget.gotoAndStop(3);
                        }
                        else
                        {
                            e.currentTarget.gotoAndStop(1);
                        };
                    }
                    else
                    {
                        if (e.type == "mouseDown")
                        {
                            if (e.currentTarget.stage.getChildAt(0).getChildByName("mc_interface"))
                            {
                                e.currentTarget.stage.getChildAt(0).mc_interface.audio.playSound("sfx_click");
                            };
                        }
                        else
                        {
                            if (e.type == "click")
                            {
                                this.toggle();
                            };
                        };
                    };
                };
            };
        }


    }
}//package com.cocolani.common

//------------------------------------------------------------
//com.cocolani.panels.admin_activityHandler

package com.cocolani.panels
{
    import flash.events.MouseEvent;

    public class admin_activityHandler 
    {

        internal var stageref:*;
        internal var thisref:*;
        internal var reportingList:*;
        internal var hackList:*;
        internal var swearList:*;
        internal var reportingIcon:*;
        internal var hackIcon:*;
        internal var swearIcon:*;

        public function admin_activityHandler(_arg_1:*)
        {
            this.thisref = this;
            this.reportingList = [];
            this.hackList = [];
            this.swearList = [];
            super();
            this.stageref = _arg_1;
        }

        public function addReport(_arg_1:*):*
        {
            this.reportingList.push(_arg_1);
            this.refreshDisplays();
        }

        public function addHack(_arg_1:*):*
        {
            this.hackList.push(_arg_1);
            this.refreshDisplays();
        }

        public function addSwear(_arg_1:*):*
        {
            this.swearList.push(_arg_1);
            this.refreshDisplays();
        }

        public function refreshDisplays():*
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            if (this.reportingList.length > 0)
            {
                if (!this.reportingIcon)
                {
                    this.reportingIcon = this.stageref.newpopup("mc_userreport", "class", "admin_userReport", false, false, {"nocentre":true});
                    this.reportingIcon.x = 15;
                    this.reportingIcon.y = 100;
                    this.reportingIcon.mouseChildren = false;
                    this.reportingIcon.buttonMode = true;
                    this.reportingIcon.addEventListener(MouseEvent.CLICK, this.iconClicked);
                    _local_4 = this.stageref.mc_interface;
                    _local_4.setHelpItem(this.reportingIcon);
                };
                this.reportingIcon.count.text = this.reportingList.length;
                _local_1 = [];
                _local_2 = "";
                for (_local_3 in this.reportingList)
                {
                    _local_5 = false;
                    for (_local_6 in _local_1)
                    {
                        if (_local_1[_local_6].tgt == this.reportingList[_local_3].tgt)
                        {
                            _local_5 = true;
                        };
                    };
                    if (!_local_5)
                    {
                        _local_1.push({"tgt":this.reportingList[_local_3].tgt});
                    };
                };
                for (_local_3 in _local_1)
                {
                    _local_7 = 0;
                    for (_local_6 in this.reportingList)
                    {
                        if (this.reportingList[_local_6].tgt == _local_1[_local_3].tgt)
                        {
                            _local_7++;
                        };
                    };
                    _local_1[_local_3].ct = _local_7;
                };
                _local_1.sortOn("ct", (Array.NUMERIC | Array.DESCENDING));
                for (_local_3 in _local_1)
                {
                    _local_2 = (_local_2 + (((_local_1[_local_3].tgt + " has been reported ") + _local_1[_local_3].ct) + " times \n"));
                };
                this.reportingIcon.toolText = _local_2;
            }
            else
            {
                if (this.reportingIcon)
                {
                    this.stageref.removepopup("admin_userReport");
                    this.reportingIcon = null;
                };
            };
            if (this.hackList.length > 0)
            {
                if (!this.hackIcon)
                {
                    this.hackIcon = this.stageref.newpopup("mc_hackreport", "class", "admin_hackReport", false, false, {"nocentre":true});
                    this.hackIcon.x = 15;
                    this.hackIcon.y = 180;
                    this.hackIcon.mouseChildren = false;
                    this.hackIcon.buttonMode = true;
                    this.hackIcon.addEventListener(MouseEvent.CLICK, this.iconClicked);
                    _local_4 = this.stageref.mc_interface;
                    _local_4.setHelpItem(this.hackIcon);
                };
                this.hackIcon.count.text = this.hackList.length;
                _local_8 = [];
                _local_2 = "";
                for (_local_3 in this.hackList)
                {
                    _local_5 = false;
                    for (_local_6 in _local_8)
                    {
                        if (_local_8[_local_6].usr == this.hackList[_local_3].usr)
                        {
                            _local_5 = true;
                        };
                    };
                    if (!_local_5)
                    {
                        _local_8.push({"usr":this.hackList[_local_3].usr});
                    };
                };
                for (_local_3 in _local_8)
                {
                    _local_7 = 0;
                    for (_local_6 in this.hackList)
                    {
                        if (this.hackList[_local_6].usr == _local_8[_local_3].usr)
                        {
                            _local_7++;
                        };
                    };
                    _local_8[_local_3].ct = _local_7;
                    _local_2 = (_local_2 + (((_local_8[_local_3].usr + " triggered hack attempt ") + _local_7) + " times \n"));
                };
                this.hackIcon.toolText = _local_2;
            }
            else
            {
                if (this.hackIcon)
                {
                    this.stageref.removepopup("admin_hackReport");
                    this.hackIcon = null;
                };
            };
            if (this.swearList.length > 0)
            {
                if (!this.swearIcon)
                {
                    this.swearIcon = this.stageref.newpopup("mc_swearreport", "class", "admin_swearReport", false, false, {"nocentre":true});
                    this.swearIcon.x = 15;
                    this.swearIcon.y = 260;
                    this.swearIcon.mouseChildren = false;
                    this.swearIcon.buttonMode = true;
                    this.swearIcon.addEventListener(MouseEvent.CLICK, this.iconClicked);
                    _local_4 = this.stageref.mc_interface;
                    _local_4.setHelpItem(this.swearIcon);
                };
                this.swearIcon.count.text = this.swearList.length;
                _local_9 = [];
                _local_2 = "";
                for (_local_3 in this.swearList)
                {
                    _local_5 = false;
                    for (_local_6 in _local_9)
                    {
                        if (_local_9[_local_6].usr == this.swearList[_local_3].usr)
                        {
                            _local_5 = true;
                        };
                    };
                    if (!_local_5)
                    {
                        _local_9.push({"usr":this.swearList[_local_3].usr});
                    };
                };
                for (_local_3 in _local_9)
                {
                    _local_7 = 0;
                    for (_local_6 in this.swearList)
                    {
                        if (this.swearList[_local_6].usr == _local_9[_local_3].usr)
                        {
                            _local_7++;
                        };
                    };
                    _local_9[_local_3].ct = _local_7;
                };
                _local_9.sortOn("ct", (Array.NUMERIC | Array.DESCENDING));
                for (_local_3 in _local_9)
                {
                    _local_2 = (_local_2 + (((_local_9[_local_3].usr + " kicked for swearing ") + _local_9[_local_3].ct) + " times \n"));
                };
                this.swearIcon.toolText = _local_2;
            }
            else
            {
                if (this.swearIcon)
                {
                    this.stageref.removepopup("admin_swearReport");
                    this.swearIcon = null;
                };
            };
        }

        public function iconClicked(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            var _local_3:*;
            if (_arg_1.currentTarget == this.reportingIcon)
            {
                for (_local_2 in this.reportingList)
                {
                    _local_3 = this.reportingList[_local_2];
                    this.stageref.showmsg(((((_local_3.ref + " reported user ") + _local_3.tgt) + " with reason : ") + _local_3.desc));
                };
                this.reportingList = [];
            }
            else
            {
                if (_arg_1.currentTarget == this.hackIcon)
                {
                    for (_local_2 in this.hackList)
                    {
                        _local_3 = this.hackList[_local_2];
                        this.stageref.showmsg(((((((("User " + _local_3.usr) + " on IP: ") + _local_3.ip) + " possibly hacking. Hack count = ") + _local_3.count) + "\nReason:") + _local_3.reason));
                    };
                    this.hackList = [];
                }
                else
                {
                    if (_arg_1.currentTarget == this.swearIcon)
                    {
                        for (_local_2 in this.swearList)
                        {
                            _local_3 = this.swearList[_local_2].reason;
                            this.stageref.showmsg(_local_3);
                        };
                        this.swearList = [];
                    };
                };
            };
            this.refreshDisplays();
        }

        public function reset():*
        {
            this.reportingList = [];
            this.hackList = [];
        }


    }
}//package com.cocolani.panels

//------------------------------------------------------------
//com.cocolani.panels.admin_activitymon

package com.cocolani.panels
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import fl.containers.ScrollPane;
    import flash.utils.Timer;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.TimerEvent;

    public class admin_activitymon extends simplepopup 
    {

        internal static var maxLength:* = 1440;

        internal var stageref:*;
        public var bgd:MovieClip;
        public var bt_close:MovieClip;
        public var mytype:* = "activity";
        public var maxusers:TextField;
        public var max24:TextField;
        public var graphmax:TextField;
        public var restarttime:TextField;
        public var crtTotal:TextField;
        public var activitygraph:ScrollPane;
        internal var grapharr:* = new Array(0);
        internal var graphtimer:* = new Timer(60000);
        internal var graphsprite:* = new Sprite();
        internal var maxamt:* = 0;

        public function admin_activitymon()
        {
            setAttribs({"dragbgd":true});
            addEventListener(Event.ADDED_TO_STAGE, this.init);
            this.graphtimer.addEventListener(TimerEvent.TIMER, this.timerchk);
            this.graphtimer.start();
            cacheAsBitmap = true;
            this.activitygraph.source = this.graphsprite;
            this.setgraph(this.grapharr);
        }

        private function clearme():*
        {
            this.graphtimer.stop();
            this.graphtimer.removeEventListener(TimerEvent.TIMER, this.timerchk);
            this.graphtimer = undefined;
        }

        public function timerchk(_arg_1:TimerEvent):*
        {
            var _local_4:*;
            var _local_2:* = this.stageref.sfs.getAllRooms();
            var _local_3:* = 0;
            for (_local_4 in _local_2)
            {
                if (((_local_2[_local_4].isGame() == false) || (_local_2[_local_4].getName() == "GamesRoom")))
                {
                    _local_3 = (_local_3 + _local_2[_local_4].getUserCount());
                };
            };
            if (this.grapharr.length >= maxLength)
            {
                this.grapharr.shift();
            };
            this.grapharr.push(_local_3);
            if (_local_3 > this.maxamt)
            {
                this.maxamt = _local_3;
            };
            this.graphmax.text = this.maxamt;
            this.max24.text = this.maxamt;
            if (Number(this.maxusers.text) < this.maxamt)
            {
                this.maxusers.text = this.maxamt;
            };
            this.setgraph(this.grapharr);
        }

        public function setgraph(_arg_1:Array):*
        {
            this.maxamt = 0;
            var _local_2:* = 0;
            while (_local_2 < _arg_1.length)
            {
                if (_arg_1[_local_2])
                {
                    this.grapharr[_local_2] = Number(_arg_1[_local_2]);
                    if (Number(_arg_1[_local_2]) > this.maxamt)
                    {
                        this.maxamt = Number(_arg_1[_local_2]);
                        this.graphmax.text = this.maxamt;
                        this.max24.text = this.maxamt;
                    };
                };
                _local_2++;
            };
            if (_arg_1.length > 0)
            {
                this.crtTotal.text = _arg_1[(_arg_1.length - 1)];
            };
            this.updategraph();
        }

        private function updategraph():*
        {
            this.graphsprite.graphics.clear();
            this.graphsprite.graphics.lineStyle(1, 12263970, 0.5, false, "normal", null, null, 1);
            this.graphsprite.graphics.moveTo(0, 0);
            this.graphsprite.graphics.lineTo((24 * 60), 0);
            this.graphsprite.graphics.moveTo(0, 60);
            this.graphsprite.graphics.lineTo((24 * 60), 60);
            this.graphsprite.graphics.moveTo(0, 30);
            this.graphsprite.graphics.lineTo((24 * 60), 30);
            var _local_1:* = 0;
            while (_local_1 < 24)
            {
                this.graphsprite.graphics.moveTo((_local_1 * 60), 0);
                this.graphsprite.graphics.lineTo((_local_1 * 60), 60);
                _local_1++;
            };
            this.graphsprite.graphics.lineStyle(1, 0xBBFF00, 1, false, "normal", null, null, 1);
            var _local_2:* = 0;
            var _local_3:* = 0;
            while (_local_3 < this.grapharr.length)
            {
                if (this.grapharr[_local_3] > _local_2)
                {
                    _local_2 = this.grapharr[_local_3];
                };
                this.graphsprite.graphics.moveTo(_local_3, 60);
                if (this.grapharr[_local_3] > 0)
                {
                    this.graphsprite.graphics.lineTo(_local_3, (60 - ((this.grapharr[_local_3] * 60) / this.maxamt)));
                };
                _local_3++;
            };
            this.activitygraph.update();
        }

        public function XTreply(_arg_1:*):*
        {
            this.setgraph(_arg_1.usergraph.split(","));
            this.restarttime.text = String(new Date(_arg_1.restarted));
            this.maxusers.text = _arg_1.max;
        }

        public function init(_arg_1:Event):*
        {
            this.stageref = thisref.stage.getChildAt(0);
            var _local_2:* = {
                "cmd":"activity",
                "ext":"admin"
            };
            this.stageref.sendXTmessage(_local_2);
        }

        override public function closepopup():*
        {
            this.clearme();
            thisref.parent.closepanel((this.mytype + "mon"));
        }


    }
}//package com.cocolani.panels

//------------------------------------------------------------
//com.cocolani.panels.admin_banlist

package com.cocolani.panels
{
    import fl.data.DataProvider;
    import flash.display.MovieClip;
    import fl.controls.List;
    import flash.text.TextField;
    import flash.events.Event;
    import flash.events.MouseEvent;

    public class admin_banlist extends simplepopup 
    {

        internal var stageref:*;
        internal var bannedList:DataProvider;
        internal var bannedData:*;
        public var bgd:MovieClip;
        public var bt_close:MovieClip;
        public var mytype:* = "banlist";
        public var banned_players:List;
        public var sendBanned:MovieClip;
        public var bt_info:MovieClip;
        public var unban_playername:TextField;
        public var reasontxt:TextField;
        public var search_unban:TextField;
        public var historytxt:TextField;
        public var unban:MovieClip;
        internal var selectedType:* = "usr";
        internal var seperator:* = String.fromCharCode(1);
        internal var seperator2:* = String.fromCharCode(2);

        public function admin_banlist()
        {
            setAttribs({"dragbgd":true});
            addEventListener(Event.ADDED_TO_STAGE, this.init);
            this.unban.addEventListener(MouseEvent.CLICK, this.bt_response);
            this.sendBanned.addEventListener(MouseEvent.CLICK, this.bt_response);
            this.search_unban.addEventListener(Event.CHANGE, this.updateSearch);
            this.bt_info.addEventListener(MouseEvent.CLICK, this.bt_response);
        }

        private function updateSearch(_arg_1:Event):*
        {
            this.refreshDisplay();
        }

        private function bt_response(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            if (_arg_1.currentTarget.name == "unban")
            {
                if (this.reasontxt.text.length < 2)
                {
                    this.stageref.showmsg("Please supply a valid reason for chosing to unban this player.");
                }
                else
                {
                    if (this.unban_playername.text.length < 2)
                    {
                        this.stageref.showmsg("Please enter a valid username to unban.");
                    }
                    else
                    {
                        _local_2 = {
                            "ext":"admin",
                            "cmd":"unban",
                            "tgt":this.unban_playername.text,
                            "reason":this.reasontxt.text,
                            "type":this.selectedType
                        };
                        this.stageref.sendXTmessage(_local_2);
                    };
                };
            }
            else
            {
                if (_arg_1.currentTarget.name == "sendBanned")
                {
                    if (this.banned_players.selectedItem)
                    {
                        this.unban_playername.text = this.banned_players.selectedItem.data;
                        this.selectedType = this.banned_players.selectedItem.type;
                    };
                }
                else
                {
                    if (_arg_1.currentTarget.name == "bt_info")
                    {
                        if (this.unban_playername.text.length > 1)
                        {
                            _local_2 = {
                                "ext":"admin",
                                "cmd":"getModHistory",
                                "tgt":this.unban_playername.text,
                                "type":this.selectedType
                            };
                            this.stageref.sendXTmessage(_local_2);
                            this.historytxt.text = "PLEASE WAIT...";
                        };
                    };
                };
            };
        }

        private function clearme():*
        {
        }

        public function XTreply(_arg_1:*):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            if (_arg_1.sub == "modHistory")
            {
                _local_2 = _arg_1.data.split(this.seperator2);
                _local_3 = "";
                for (_local_4 in _local_2)
                {
                    _local_5 = _local_2[_local_4].split(this.seperator);
                    _local_3 = (_local_3 + (((((((((((("Mod ID:" + _local_5[0]) + " ") + _local_5[3]) + " user '") + _local_5[1]) + "' on ") + new Date((Number(_local_5[5]) * 1000))) + ",reason:") + _local_5[4]) + " target IP=") + _local_5[2]) + "\n"));
                };
                this.historytxt.text = _local_3;
            }
            else
            {
                this.bannedData = _arg_1;
                this.refreshDisplay();
            };
        }

        public function refreshDisplay():*
        {
            var _local_3:*;
            this.bannedList = new DataProvider();
            var _local_1:* = [];
            var _local_2:* = [];
            if (this.bannedData.data)
            {
                _local_1 = this.bannedData.data.split(this.seperator);
            };
            if (this.bannedData.ipban)
            {
                _local_2 = this.bannedData.ipban.split(this.seperator);
            };
            for (_local_3 in _local_1)
            {
                if (((this.search_unban.text == "") || (_local_1[_local_3].indexOf(this.search_unban.text) > -1)))
                {
                    this.bannedList.addItem({
                        "label":_local_1[_local_3],
                        "data":_local_1[_local_3],
                        "type":"usr"
                    });
                };
            };
            for (_local_3 in _local_2)
            {
                if (((this.search_unban.text == "") || (_local_2[_local_3].indexOf(this.search_unban.text) > -1)))
                {
                    this.bannedList.addItem({
                        "label":_local_2[_local_3],
                        "data":_local_2[_local_3],
                        "type":"ip"
                    });
                };
            };
            this.bannedList.sortOn("label");
            this.banned_players.dataProvider = this.bannedList;
        }

        public function init(_arg_1:Event):*
        {
            this.stageref = thisref.stage.getChildAt(0);
            var _local_2:* = {
                "cmd":"getbanlist",
                "ext":"admin"
            };
            this.stageref.sendXTmessage(_local_2);
            this.sendBanned.setText("->");
            this.unban.setText("UNBAN");
            this.stageref.langObj.setFormat(this.reasontxt);
            this.stageref.langObj.setFormat(this.unban_playername);
        }

        override public function closepopup():*
        {
            this.clearme();
            thisref.parent.closepanel(this.mytype);
        }


    }
}//package com.cocolani.panels

//------------------------------------------------------------
//com.cocolani.panels.admin_broadcaster

package com.cocolani.panels
{
    import flash.text.TextField;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;

    public class admin_broadcaster extends simplepopup 
    {

        internal static var maxLength:* = 200;

        internal var stageref:*;
        public var mytype:* = "broadcaster";
        public var broadcastmsg:TextField;
        public var bgd:MovieClip;
        public var bt_close:MovieClip;
        public var bt_send:MovieClip;

        public function admin_broadcaster()
        {
            setAttribs({"dragbgd":true});
            addEventListener(Event.ADDED_TO_STAGE, this.init);
            this.bt_send.addEventListener(MouseEvent.CLICK, this.bt_pressed);
        }

        public function init(_arg_1:Event):*
        {
            this.stageref = thisref.stage.getChildAt(0);
            this.stageref.langObj.setFormat(this.broadcastmsg);
            this.bt_send.addEventListener(MouseEvent.CLICK, this.bt_pressed);
        }

        private function checkSureResponse(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            if (_arg_1.currentTarget.name == "bt_yes")
            {
                _local_2 = {};
                _local_2.cmd = "brdcast";
                _local_2.ext = "admin";
                _local_2.msg = this.broadcastmsg.text;
                this.stageref.sendXTmessage(_local_2);
            };
            this.stageref.removeChild(_arg_1.currentTarget.parent);
        }

        public function bt_pressed(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            var _local_3:*;
            if (_arg_1.type == "click")
            {
                if (this.stageref.getChildByName("mc_interface"))
                {
                    this.stageref.mc_interface.audio.playSound("sfx_click");
                };
                if (_arg_1.currentTarget.name == "bt_send")
                {
                    if (this.broadcastmsg.text.length < 2)
                    {
                        _arg_1.currentTarget.stage.getChildAt(0).showmsg("That message is not long enough");
                    }
                    else
                    {
                        _local_2 = getDefinitionByName("mc_request");
                        _local_3 = this.stageref.addChild(new (_local_2)());
                        _local_3.requesttxt.text = (("Are you sure you want to say:\n'" + this.broadcastmsg.text) + "'\n to the current zone?");
                        _local_3.bt_yes.addEventListener(MouseEvent.CLICK, this.checkSureResponse);
                        _local_3.bt_no.addEventListener(MouseEvent.CLICK, this.checkSureResponse);
                    };
                };
            };
        }

        override public function closepopup():*
        {
            thisref.parent.closepanel(this.mytype);
        }


    }
}//package com.cocolani.panels

//------------------------------------------------------------
//com.cocolani.panels.admin_chatmonitor

package com.cocolani.panels
{
    import flash.text.TextField;
    import com.cocolani.common.togglebutton;
    import flash.display.MovieClip;
    import fl.controls.List;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.events.FocusEvent;
    import fl.data.DataProvider;
    import it.gotoandplay.smartfoxserver.SFSEvent;
    import fl.data.SimpleCollectionItem;
    import flash.events.*;

    public class admin_chatmonitor extends simplepopup 
    {

        internal static var maxLength:* = 200;

        internal var stageref:*;
        public var chatHistory:TextField;
        public var toggle_size:togglebutton;
        public var toggle_location:togglebutton;
        public var toggle_time:togglebutton;
        public var bt_up:MovieClip;
        public var bt_down:MovieClip;
        public var bt_pause:MovieClip;
        public var monitor_list:List;
        public var bgd:MovieClip;
        public var bt_close:MovieClip;
        public var keyword:TextField;
        private var selectedItems:* = [];
        private var paused:* = false;
        private var showprivate:* = true;
        private var showall:* = true;
        private var scrollvel:* = 0;
        private var chatHistoryArray:* = [];
        private var chatTextHistoryArray:* = [];
        private var roomlist:*;
        private var monthlist:* = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
        public var mytype:* = "chat";
        internal var seperator:* = String.fromCharCode(1);

        public function admin_chatmonitor()
        {
            setAttribs({"dragbgd":true});
            addEventListener(Event.ADDED_TO_STAGE, this.init);
            this.bt_up.addEventListener(MouseEvent.MOUSE_DOWN, this.bt_pressed);
            this.bt_up.addEventListener(MouseEvent.MOUSE_UP, this.bt_pressed);
            this.bt_down.addEventListener(MouseEvent.MOUSE_DOWN, this.bt_pressed);
            this.bt_down.addEventListener(MouseEvent.MOUSE_UP, this.bt_pressed);
            this.bt_pause.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.monitor_list.addEventListener(Event.CHANGE, this.monitorUpdate);
            this.keyword.addEventListener(FocusEvent.FOCUS_OUT, this.updateKeyword);
            this.bt_pause.stop();
            this.bt_pause.buttonMode = true;
            this.toggle_size.setText("SIZE");
            this.toggle_location.setText("LOCATION");
            this.toggle_time.setText("TIME");
            this.toggle_size.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.toggle_location.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.toggle_time.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.__setProp_monitor_list_admin_chatmonitor_list_0();
        }

        public function updateKeyword(_arg_1:FocusEvent):*
        {
            this.generateChat();
        }

        public function XTreply(_arg_1:*):*
        {
            switch (_arg_1.sub)
            {
                case (this.mytype + "History"):
                    this.chatHistoryArray = _arg_1.data;
                    this.generateChat();
                    return;
                case this.mytype:
                    this.chatHistoryArray.push(_arg_1.txt);
                    while (this.chatHistoryArray.length > maxLength)
                    {
                        this.chatHistoryArray.shift();
                    };
                    if (!this.paused)
                    {
                        this.generateChat();
                    };
                    return;
            };
        }

        public function addline(_arg_1:*):*
        {
            this.chatTextHistoryArray.push(this.getFormattedText(_arg_1));
            if (this.chatTextHistoryArray.length > maxLength)
            {
                this.chatTextHistoryArray.shift();
            };
            this.refreshChat();
        }

        public function getFormattedText(_arg_1:String):*
        {
            var _local_5:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_2:* = _arg_1.split(this.seperator);
            var _local_3:* = "";
            var _local_4:* = true;
            var _local_6:* = this.stageref.langObj.getLangDir();
            if (((!(this.keyword.text == "")) && (_arg_1.indexOf(this.keyword.text) == -1)))
            {
                _local_4 = false;
            };
            if (_local_4)
            {
                if (_local_2.length == 4)
                {
                    _local_5 = Number(_local_2[1]);
                    _local_7 = new Date(Number(_local_2[2]));
                    if (this.toggle_location.toggleState)
                    {
                        _local_3 = (((_local_3 + "<font color='#990099'>[") + this.getRoomName(_local_5)) + "]</font> ");
                    };
                    if (this.toggle_time.toggleState)
                    {
                        _local_3 = (((((((((_local_3 + "<font color='#000099'>") + _local_7.day) + "/") + this.monthlist[_local_7.getMonth()]) + " ") + _local_7.getHours()) + ":") + _local_7.getMinutes()) + "</font> ");
                    };
                    _local_3 = (((((_local_3 + "<font color='#000099'>") + _local_2[0]) + "</font>: ") + _local_2[3]) + " <br>");
                    _local_8 = false;
                    if (!this.showall)
                    {
                        _local_9 = 0;
                        while (_local_9 < this.selectedItems.length)
                        {
                            if (((this.selectedItems[_local_9] > 1) && (this.monitor_list.getItemAt(this.selectedItems[_local_9]).data.getId() == _local_5)))
                            {
                                _local_8 = true;
                            };
                            _local_9++;
                        };
                    };
                    if (((!(_local_8)) && (!(this.showall))))
                    {
                        _local_4 = false;
                    };
                }
                else
                {
                    if (this.showprivate)
                    {
                        _local_5 = Number(_local_2[2]);
                        _local_7 = new Date(Number(_local_2[3]));
                        if (this.toggle_location.toggleState)
                        {
                            _local_3 = (((_local_3 + "<font color='#990099'>[") + this.getRoomName(_local_5)) + "]</font>");
                        };
                        if (this.toggle_time.toggleState)
                        {
                            _local_3 = (((((((((_local_3 + "<font color='#000099'>") + _local_7.day) + "/") + this.monthlist[_local_7.getMonth()]) + " ") + _local_7.getHours()) + ":") + _local_7.getMinutes()) + "</font> ");
                        };
                        _local_3 = (((((((_local_3 + "<font color ='#000099'>") + _local_2[0]) + "->") + _local_2[1]) + " </font>: ") + _local_2[4]) + "<br>");
                    }
                    else
                    {
                        _local_4 = false;
                    };
                };
            };
            if (_local_4)
            {
                return (_local_3);
            };
            return (false);
        }

        public function generateChat():*
        {
            var _local_1:*;
            var _local_2:*;
            this.chatTextHistoryArray = [];
            for (_local_1 in this.chatHistoryArray)
            {
                _local_2 = this.getFormattedText(this.chatHistoryArray[_local_1]);
                if (_local_2)
                {
                    this.chatTextHistoryArray.push(_local_2);
                };
            };
            this.refreshChat();
        }

        public function refreshChat():*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_1:* = "";
            for (_local_2 in this.chatTextHistoryArray)
            {
                _local_1 = (_local_1 + this.chatTextHistoryArray[_local_2]);
            };
            this.chatHistory.htmlText = _local_1;
            _local_3 = this.chatHistory.getTextFormat();
            if (this.toggle_size.toggleState)
            {
                _local_3.size = 16;
            }
            else
            {
                _local_3.size = 11;
            };
            this.chatHistory.setTextFormat(_local_3);
            this.chatHistory.scrollV = this.chatHistory.maxScrollV;
            this.stageref.langObj.setFormat(this.chatHistory);
        }

        public function getRoomName(_arg_1:*):*
        {
            var _local_2:*;
            for (_local_2 in this.roomlist)
            {
                if (this.roomlist[_local_2].getId() == _arg_1)
                {
                    return (this.roomlist[_local_2].getName());
                };
            };
            return ("Unknown");
        }

        public function setMonitorList():*
        {
            var _local_2:*;
            this.monitor_list.removeEventListener(Event.CHANGE, this.monitorUpdate);
            var _local_1:* = new DataProvider();
            _local_1.addItem({
                "label":"All Scenes",
                "data":"all"
            });
            _local_1.addItem({
                "label":"Private chat",
                "data":"pvt"
            });
            this.roomlist = this.stageref.sfs.getAllRooms();
            for (_local_2 in this.roomlist)
            {
                if (this.roomlist[_local_2].isGame() == false)
                {
                    _local_1.addItem({
                        "label":(((((this.roomlist[_local_2].getName() + " [") + this.roomlist[_local_2].getUserCount()) + "/") + this.roomlist[_local_2].getMaxUsers()) + "]"),
                        "data":this.roomlist[_local_2]
                    });
                };
            };
            _local_1.sortOn("label");
            this.monitor_list.dataProvider = _local_1;
            if (this.selectedItems.length == 0)
            {
                this.selectedItems = [0, 1];
            };
            this.monitor_list.selectedIndices = this.selectedItems;
            this.monitor_list.addEventListener(Event.CHANGE, this.monitorUpdate);
        }

        public function monitorUpdate(_arg_1:Event):*
        {
            var _local_2:*;
            this.selectedItems = this.monitor_list.selectedIndices;
            this.showall = false;
            this.showprivate = false;
            for (_local_2 in this.selectedItems)
            {
                if (this.selectedItems[_local_2] == 0)
                {
                    this.showall = true;
                };
                if (this.selectedItems[_local_2] == 1)
                {
                    this.showprivate = true;
                };
            };
            this.generateChat();
        }

        public function roomsUpdate(_arg_1:Event):*
        {
            this.setMonitorList();
        }

        public function init(_arg_1:Event):*
        {
            var _local_3:*;
            this.stageref = thisref.stage.getChildAt(0);
            this.setMonitorList();
            this.stageref.sfs.addEventListener(SFSEvent.onUserCountChange, this.roomsUpdate);
            var _local_2:* = new Object();
            _local_2.ext = "admin";
            _local_2.cmd = "getChatHistory";
            this.stageref.sendXTmessage(_local_2);
            this.bt_pause.toolText = this.stageref.langObj.getText("hlp27");
            if (this.stageref.getChildByName("mc_interface"))
            {
                _local_3 = this.stageref.mc_interface;
                _local_3.setHelpItem(this.bt_pause);
            };
        }

        public function bt_pressed(_arg_1:MouseEvent):*
        {
            if (_arg_1.type == "mouseDown")
            {
                if (_arg_1.currentTarget.name == "bt_up")
                {
                    this.scrollvel = -1;
                    if (!hasEventListener(Event.ENTER_FRAME))
                    {
                        addEventListener(Event.ENTER_FRAME, this.scrollev);
                    };
                }
                else
                {
                    if (_arg_1.currentTarget.name == "bt_down")
                    {
                        this.scrollvel = 1;
                        if (!hasEventListener(Event.ENTER_FRAME))
                        {
                            addEventListener(Event.ENTER_FRAME, this.scrollev);
                        };
                    };
                };
            }
            else
            {
                if (_arg_1.type == "mouseUp")
                {
                    this.scrollvel = 0;
                    removeEventListener(Event.ENTER_FRAME, this.scrollev);
                }
                else
                {
                    if (_arg_1.type == "click")
                    {
                        if (_arg_1.currentTarget.name == "bt_pause")
                        {
                            if (this.stageref.getChildByName("mc_interface"))
                            {
                                _arg_1.currentTarget.stage.getChildAt(0).mc_interface.audio.playSound("sfx_click");
                            };
                            this.paused = (!(this.paused));
                            if (this.paused)
                            {
                                this.bt_pause.gotoAndStop(2);
                            }
                            else
                            {
                                this.bt_pause.gotoAndStop(1);
                                this.generateChat();
                            };
                        }
                        else
                        {
                            if (_arg_1.currentTarget.name.indexOf("toggle") > -1)
                            {
                                this.generateChat();
                            };
                        };
                    };
                };
            };
        }

        public function scrollev(_arg_1:Event):*
        {
            this.chatHistory.scrollV = (this.chatHistory.scrollV + this.scrollvel);
        }

        override public function closepopup():*
        {
            removeEventListener(Event.ENTER_FRAME, this.scrollev);
            this.stageref.sfs.removeEventListener(SFSEvent.onUserCountChange, this.roomsUpdate);
            var _local_1:* = new Object();
            _local_1.ext = "admin";
            _local_1.cmd = (this.mytype + "Listen");
            this.stageref.sendXTmessage(_local_1);
            thisref.parent.closepanel((this.mytype + "monitor"));
        }

        internal function __setProp_monitor_list_admin_chatmonitor_list_0():*
        {
            var _local_2:SimpleCollectionItem;
            var _local_3:Array;
            var _local_4:Object;
            var _local_5:int;
            var _local_6:*;
            try
            {
                this.monitor_list["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            this.monitor_list.allowMultipleSelection = true;
            var _local_1:DataProvider = new DataProvider();
            _local_3 = [];
            _local_5 = 0;
            while (_local_5 < _local_3.length)
            {
                _local_2 = new SimpleCollectionItem();
                _local_4 = _local_3[_local_5];
                for (_local_6 in _local_4)
                {
                    _local_2[_local_6] = _local_4[_local_6];
                };
                _local_1.addItem(_local_2);
                _local_5++;
            };
            this.monitor_list.dataProvider = _local_1;
            this.monitor_list.enabled = true;
            this.monitor_list.horizontalLineScrollSize = 4;
            this.monitor_list.horizontalPageScrollSize = 0;
            this.monitor_list.horizontalScrollPolicy = "auto";
            this.monitor_list.verticalLineScrollSize = 4;
            this.monitor_list.verticalPageScrollSize = 0;
            this.monitor_list.verticalScrollPolicy = "auto";
            this.monitor_list.visible = true;
            try
            {
                this.monitor_list["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }


    }
}//package com.cocolani.panels

//------------------------------------------------------------
//com.cocolani.panels.admin_configs

package com.cocolani.panels
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import it.gotoandplay.smartfoxserver.*;

    public class admin_configs extends simplepopup 
    {

        internal var hasRefreshed:* = false;
        internal var hasInit:* = false;
        internal var stageref:*;
        public var bgd:MovieClip;
        public var bt_close:MovieClip;
        public var bt_save:MovieClip;
        public var bt_auto:MovieClip;
        public var bt_restart:MovieClip;
        public var time:TextField;
        public var msgtime:TextField;
        public var btl_0:TextField;
        public var btl_1:TextField;
        public var battleConfigs:*;
        public var bt_refresh:MovieClip;
        public var tgl_logins:MovieClip;

        public function admin_configs()
        {
            setAttribs({"dragbgd":true});
            addEventListener(Event.ADDED_TO_STAGE, this.init);
            this.bt_save.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.bt_auto.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.bt_close.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.bt_restart.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.bt_refresh.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.tgl_logins.addEventListener(MouseEvent.CLICK, this.bt_pressed);
        }

        public function XTreply(_arg_1:*):*
        {
            if (_arg_1.data)
            {
                this.battleConfigs = _arg_1.data;
                this.setLoginsDisplay(((_arg_1.st == "false") ? false : true));
                this.updateDisplay();
                this.hasInit = true;
            }
            else
            {
                if (_arg_1.req != "updatePlayersSucc")
                {
                    if (_arg_1.req == "updateLogins")
                    {
                        this.setLoginsDisplay(((_arg_1.st == "false") ? false : true));
                    };
                };
            };
        }

        private function setLoginsDisplay(_arg_1:Boolean):*
        {
            if ((((_arg_1 == true) && (this.tgl_logins.toggleState == true)) || ((_arg_1 == false) && (this.tgl_logins.toggleState == false))))
            {
                this.tgl_logins.toggle();
            };
        }

        private function updateDisplay():*
        {
            this.btl_0.text = this.battleConfigs[0].startGameThreshold;
            this.btl_1.text = this.battleConfigs[1].startGameThreshold;
        }

        private function init(_arg_1:Event):*
        {
            var _local_3:*;
            this.stageref = thisref.stage.getChildAt(0);
            var _local_2:* = {};
            _local_2.cmd = "getOptions";
            _local_2.ext = "admin";
            this.stageref.sendXTmessage(_local_2);
            this.bt_auto.toolText = this.stageref.langObj.getText("hlp28");
            this.bt_save.toolText = this.stageref.langObj.getText("hlp29");
            this.bt_restart.toolText = this.stageref.langObj.getText("hlp30");
            this.bt_refresh.toolText = this.stageref.langObj.getText("hlp40");
            this.tgl_logins.toolText = this.stageref.langObj.getText("hlp39");
            if (this.stageref.getChildByName("mc_interface"))
            {
                _local_3 = this.stageref.mc_interface;
                _local_3.setHelpItem(this.bt_auto);
                _local_3.setHelpItem(this.bt_save);
                _local_3.setHelpItem(this.bt_restart);
                _local_3.setHelpItem(this.bt_refresh);
                _local_3.setHelpItem(this.tgl_logins);
            };
        }

        private function onRestartReqResponse(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            if (_arg_1.currentTarget.name == "bt_yes")
            {
                _local_2 = {};
                _local_2.cmd = "restart";
                _local_2.ext = "admin";
                _local_2.time = this.time.text;
                _local_2.warningInterval = this.msgtime.text;
                this.stageref.sendXTmessage(_local_2);
            };
            this.stageref.removeChild(_arg_1.currentTarget.parent);
        }

        private function onAccessReqResponse(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            if (_arg_1.currentTarget.name == "bt_yes")
            {
                _local_2 = {};
                _local_2.cmd = "setAccessStatus";
                _local_2.ext = "admin";
                _local_2.st = Boolean((!(this.tgl_logins.toggleState)));
                this.stageref.sendXTmessage(_local_2);
            };
            this.stageref.removeChild(_arg_1.currentTarget.parent);
        }

        private function bt_pressed(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            if (this.hasInit)
            {
                if (_arg_1.currentTarget.name == "bt_save")
                {
                    _local_2 = true;
                    if (this.checkIsEven(Number(this.btl_0.text)) == false)
                    {
                        return;
                    };
                    if (this.checkIsEven(Number(this.btl_1.text)) == false)
                    {
                        return;
                    };
                    if (((Number(this.btl_0.text) < 2) || (Number(this.btl_0.text) > 6)))
                    {
                        this.stageref.showmsg("The practice game has a minimum of 2 and max of 6");
                        return;
                    };
                    if (((Number(this.btl_1.text) < 2) || (Number(this.btl_1.text) > 8)))
                    {
                        this.stageref.showmsg("The battle game has a minimum of 2 and max of 8");
                        return;
                    };
                    this.battleConfigs[0].startGameThreshold = Number(this.btl_0.text);
                    this.battleConfigs[1].startGameThreshold = Number(this.btl_1.text);
                    _local_3 = {};
                    _local_3.cmd = "updateOptions";
                    _local_3.ext = "admin";
                    _local_3.battledata = this.battleConfigs;
                    this.stageref.sendXTmessage(_local_3);
                }
                else
                {
                    if (_arg_1.currentTarget.name == "bt_auto")
                    {
                        this.stageref.showmsg("Automatic configs to be implemented.");
                    }
                    else
                    {
                        if (_arg_1.currentTarget.name == "bt_restart")
                        {
                            if ((((!(isNaN(Number(this.time.text)))) && (!(isNaN(Number(this.time.text))))) && (Number(this.time.text) >= 0)))
                            {
                                _local_4 = getDefinitionByName("mc_request");
                                _local_5 = this.stageref.addChild(new (_local_4)());
                                _local_5.requesttxt.text = "Are you absolutely sure you want to log all players out and request a server restart ? No players will be able to login until the server is actually restarted!";
                                _local_5.bt_yes.addEventListener(MouseEvent.CLICK, this.onRestartReqResponse);
                                _local_5.bt_no.addEventListener(MouseEvent.CLICK, this.onRestartReqResponse);
                            }
                            else
                            {
                                this.stageref.showmsg("Invalid information");
                            };
                        }
                        else
                        {
                            if (_arg_1.currentTarget.name == "bt_refresh")
                            {
                                if (this.hasRefreshed)
                                {
                                    this.stageref.showmsg("Only one update permitted. This is an intensive procedure so function is limited");
                                }
                                else
                                {
                                    this.hasRefreshed = true;
                                    _local_3 = {};
                                    _local_3.cmd = "refrehSettings";
                                    _local_3.ext = "admin";
                                    this.stageref.sendXTmessage(_local_3);
                                    this.stageref.showmsg("Server settings where updated");
                                };
                            }
                            else
                            {
                                if (_arg_1.currentTarget.name == "tgl_logins")
                                {
                                    _local_4 = getDefinitionByName("mc_request");
                                    _local_5 = this.stageref.addChild(new (_local_4)());
                                    _local_5.requesttxt.text = "Are you sure you want to toggle the status of allowing entry to players?";
                                    _local_5.bt_yes.addEventListener(MouseEvent.CLICK, this.onAccessReqResponse);
                                    _local_5.bt_no.addEventListener(MouseEvent.CLICK, this.onAccessReqResponse);
                                };
                            };
                        };
                    };
                };
            }
            else
            {
                this.stageref.showmsg("Please wait.");
            };
        }

        private function checkIsEven(_arg_1:Number):*
        {
            if ((_arg_1 % 2) == 1)
            {
                this.stageref.showmsg("Only even values are allowed");
                return (false);
            };
            return (true);
        }

        override public function closepopup():*
        {
            thisref.parent.closepanel("configs");
        }


    }
}//package com.cocolani.panels

//------------------------------------------------------------
//com.cocolani.panels.admin_roomlist

package com.cocolani.panels
{
    import flash.text.TextField;
    import flash.display.MovieClip;
    import fl.controls.List;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import fl.events.ListEvent;
    import it.gotoandplay.smartfoxserver.SFSEvent;
    import fl.data.DataProvider;
    import it.gotoandplay.smartfoxserver.*;

    public class admin_roomlist extends simplepopup 
    {

        internal var stageref:*;
        public var gamecount:TextField;
        public var bt_teleprt:MovieClip;
        public var roomselector:List;
        public var bgd:MovieClip;
        public var bt_close:MovieClip;
        public var selectedItem:*;
        public var bt_sortToggle:MovieClip;

        public function admin_roomlist()
        {
            setAttribs({"dragbgd":true});
            addEventListener(Event.ADDED_TO_STAGE, this.init);
            this.bt_teleprt.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.roomselector.addEventListener(ListEvent.ITEM_CLICK, this.selectItem);
            this.bt_sortToggle.addEventListener(MouseEvent.CLICK, this.bt_pressed);
        }

        private function selectItem(_arg_1:ListEvent):*
        {
            this.selectedItem = _arg_1.item.data.getName();
        }

        private function init(_arg_1:Event):*
        {
            var _local_2:*;
            this.stageref = thisref.stage.getChildAt(0);
            this.stageref.sfs.getRoomList();
            this.stageref.sfs.addEventListener(SFSEvent.onUserCountChange, this.roomUpdate);
            this.stageref.sfs.addEventListener(SFSEvent.onRoomListUpdate, this.onRoomListupd);
            this.bt_teleprt.toolText = this.stageref.langObj.getText("hlp31");
            if (this.stageref.mc_interface)
            {
                _local_2 = this.stageref.mc_interface;
                _local_2.setHelpItem(this.bt_teleprt);
            }
            else
            {
                this.bt_teleprt.visible = false;
            };
        }

        private function onRoomListupd(_arg_1:SFSEvent):*
        {
            this.updatelist();
            this.stageref.sfs.removeEventListener(SFSEvent.onRoomListUpdate, this.onRoomListupd);
        }

        private function roomUpdate(_arg_1:SFSEvent):*
        {
            this.updatelist();
        }

        private function updatelist():*
        {
            var _local_5:*;
            var _local_1:* = this.stageref.sfs.getAllRooms();
            var _local_2:* = new DataProvider();
            var _local_3:* = 0;
            var _local_4:* = null;
            for (_local_5 in _local_1)
            {
                if (_local_1[_local_5].isGame() == false)
                {
                    _local_2.addItem({
                        "label":(((((_local_1[_local_5].getName() + " [") + _local_1[_local_5].getUserCount()) + "/") + _local_1[_local_5].getMaxUsers()) + "]"),
                        "data":_local_1[_local_5],
                        "count":_local_1[_local_5].getUserCount()
                    });
                }
                else
                {
                    _local_3++;
                };
            };
            if (this.bt_sortToggle.toggleState)
            {
                _local_2.sortOn("count", (Array.NUMERIC | Array.DESCENDING));
            }
            else
            {
                _local_2.sortOn("label");
            };
            if (this.selectedItem)
            {
                _local_5 = 0;
                while (_local_5 < _local_2.length)
                {
                    if (_local_2.getItemAt(_local_5).data.getName() == this.selectedItem)
                    {
                        _local_4 = _local_5;
                        break;
                    };
                    _local_5++;
                };
            };
            this.roomselector.dataProvider = _local_2;
            this.roomselector.selectedIndex = _local_4;
            this.gamecount.text = _local_3;
        }

        public function XTreply(_arg_1:*):*
        {
            var _local_2:*;
            var _local_3:*;
            if (_arg_1.sub == "gotoHome")
            {
                _local_2 = _arg_1.hid;
                _local_3 = _arg_1.tid;
                if (_arg_1.hint == 0)
                {
                    _local_2 = ((Number(_arg_1.hid) + 1) * 3);
                };
                this.stageref.mc_scene.loadHome(_local_3, _local_2, _arg_1.hint);
            };
        }

        private function bt_pressed(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            if (_arg_1.currentTarget.name == "bt_teleprt")
            {
                if (this.roomselector.selectedItem.data.getName())
                {
                    if (this.roomselector.selectedItem.data.getName() == "GamesRoom")
                    {
                        this.stageref.showmsg("Can't teleport into a game.");
                    }
                    else
                    {
                        if (this.roomselector.selectedItem.data.getName().indexOf("home") > -1)
                        {
                            _local_2 = {
                                "cmd":"adminHome",
                                "ext":"home",
                                "id":this.roomselector.selectedItem.data.getName()
                            };
                            this.stageref.sendXTmessage(_local_2);
                        }
                        else
                        {
                            this.stageref.mc_scene.loadNewRoom(this.roomselector.selectedItem.data.getName());
                        };
                    };
                };
            }
            else
            {
                if (_arg_1.currentTarget.name == "bt_sortToggle")
                {
                    this.updatelist();
                };
            };
        }

        override public function closepopup():*
        {
            this.stageref.sfs.removeEventListener(SFSEvent.onRoomListUpdate, this.onRoomListupd);
            this.stageref.sfs.removeEventListener(SFSEvent.onUserCountChange, this.roomUpdate);
            thisref.parent.closepanel("roomlist");
        }


    }
}//package com.cocolani.panels

//------------------------------------------------------------
//com.cocolani.panels.admin_swearmonitor

package com.cocolani.panels
{
    import flash.text.TextField;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.events.FocusEvent;
    import it.gotoandplay.smartfoxserver.SFSEvent;
    import fl.data.SimpleCollectionItem;
    import fl.data.DataProvider;

    public class admin_swearmonitor extends admin_chatmonitor 
    {

        public var mytypelabel:TextField;

        public function admin_swearmonitor()
        {
            mytype = "swear";
            this.mytypelabel.text = "SWEARWORD MONITOR";
            setAttribs({"dragbgd":true});
            addEventListener(Event.ADDED_TO_STAGE, this.init);
            bt_up.addEventListener(MouseEvent.MOUSE_DOWN, bt_pressed);
            bt_up.addEventListener(MouseEvent.MOUSE_UP, bt_pressed);
            bt_down.addEventListener(MouseEvent.MOUSE_DOWN, bt_pressed);
            bt_down.addEventListener(MouseEvent.MOUSE_UP, bt_pressed);
            bt_pause.addEventListener(MouseEvent.CLICK, bt_pressed);
            monitor_list.addEventListener(Event.CHANGE, monitorUpdate);
            keyword.addEventListener(FocusEvent.FOCUS_OUT, updateKeyword);
            bt_pause.stop();
            bt_pause.buttonMode = true;
            this.__setProp_monitor_list_admin_swearmonitor_list_0();
        }

        override public function init(_arg_1:Event):*
        {
            var _local_3:*;
            stageref = thisref.stage.getChildAt(0);
            setMonitorList();
            stageref.sfs.addEventListener(SFSEvent.onUserCountChange, roomsUpdate);
            var _local_2:* = new Object();
            _local_2.ext = "admin";
            _local_2.cmd = "getSwearHistory";
            stageref.sendXTmessage(_local_2);
            bt_pause.toolText = stageref.langObj.getText("hlp27");
            if (stageref.getChildByName("mc_interface"))
            {
                _local_3 = stageref.mc_interface;
                _local_3.setHelpItem(bt_pause);
            };
        }

        internal function __setProp_monitor_list_admin_swearmonitor_list_0():*
        {
            var _local_2:SimpleCollectionItem;
            var _local_3:Array;
            var _local_4:Object;
            var _local_5:int;
            var _local_6:*;
            try
            {
                monitor_list["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            monitor_list.allowMultipleSelection = true;
            var _local_1:DataProvider = new DataProvider();
            _local_3 = [];
            _local_5 = 0;
            while (_local_5 < _local_3.length)
            {
                _local_2 = new SimpleCollectionItem();
                _local_4 = _local_3[_local_5];
                for (_local_6 in _local_4)
                {
                    _local_2[_local_6] = _local_4[_local_6];
                };
                _local_1.addItem(_local_2);
                _local_5++;
            };
            monitor_list.dataProvider = _local_1;
            monitor_list.enabled = true;
            monitor_list.horizontalLineScrollSize = 4;
            monitor_list.horizontalPageScrollSize = 0;
            monitor_list.horizontalScrollPolicy = "auto";
            monitor_list.verticalLineScrollSize = 4;
            monitor_list.verticalPageScrollSize = 0;
            monitor_list.verticalScrollPolicy = "auto";
            monitor_list.visible = true;
            try
            {
                monitor_list["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }


    }
}//package com.cocolani.panels

//------------------------------------------------------------
//com.cocolani.panels.admin_usersearch

package com.cocolani.panels
{
    import fl.controls.UIScrollBar;
    import flash.display.MovieClip;
    import com.cocolani.common.simplebutton;
    import flash.text.TextField;
    import fl.controls.List;
    import com.cocolani.common.togglebutton;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.events.TextEvent;
    import fl.data.DataProvider;
    import flash.net.URLRequest;
    import flash.net.URLLoader;
    import flash.utils.getDefinitionByName;
    import flash.events.*;
    import it.gotoandplay.smartfoxserver.*;

    public class admin_usersearch extends simplepopup 
    {

        public var __id0_:UIScrollBar;
        internal var stageref:*;
        public var bgd:MovieClip;
        public var clearTxt:simplebutton;
        public var bt_close:MovieClip;
        public var bt_search:MovieClip;
        public var bt_teleportouser:MovieClip;
        public var username:TextField;
        public var f_username:TextField;
        public var f_location:TextField;
        public var f_ip:TextField;
        public var f_type:TextField;
        public var f_hack:TextField;
        public var f_msg:TextField;
        public var txt_reason:TextField;
        public var f_joined:TextField;
        public var f_swears:TextField;
        public var f_sessionSwears:TextField;
        public var opt_ban:MovieClip;
        public var opt_ipban:MovieClip;
        public var opt_msg:MovieClip;
        public var opt_modchat:MovieClip;
        public var opt_kick:MovieClip;
        public var userlist:List;
        public var filter_mod:togglebutton;
        public var txt_quickbanip:TextField;
        public var bt_quickbanip:MovieClip;
        public var ipsearchfield:TextField;
        public var bt_searchIP:MovieClip;
        public var ipresult:TextField;
        public var selectedItem:* = 0;
        public var selectedUID:* = -1;
        private var dataArray:* = [];
        internal var seperator:* = String.fromCharCode(1);

        public function admin_usersearch()
        {
            setAttribs({"dragbgd":true});
            addEventListener(Event.ADDED_TO_STAGE, this.init);
            this.bt_search.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.opt_ban.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.opt_ipban.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.opt_msg.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.opt_kick.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.opt_modchat.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.userlist.addEventListener(Event.CHANGE, this.selectUsername);
            this.bt_teleportouser.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.clearTxt.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.filter_mod.setText("MODS ONLY");
            this.filter_mod.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.bt_quickbanip.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.bt_searchIP.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.txt_quickbanip.restrict = "0-9 .";
            this.__setProp___id0__admin_usersearch_reason_0();
        }

        public function selectUsername(_arg_1:Event):*
        {
            this.selectedItem = this.userlist.selectedIndex;
            this.selectedUID = -1;
            this.displayInfo();
        }

        private function clearDisplay():*
        {
            this.f_username.text = "";
            this.f_location.text = "";
            this.f_ip.text = "";
            this.f_type.text = "";
            this.f_hack.text = "";
            this.f_swears.text = "";
            this.f_sessionSwears.text = "";
            this.f_msg.text = "";
            this.f_joined.text = "";
        }

        public function displayInfo():*
        {
            var _local_4:*;
            var _local_1:* = this.userlist.getItemAt(this.selectedItem).data;
            this.f_username.text = _local_1[0];
            this.f_location.text = this.stageref.sfs.getRoom(_local_1[1]).getName();
            this.f_ip.text = _local_1[2];
            var _local_2:* = this.stageref.usertypes.split("|");
            var _local_3:* = 0;
            while (_local_3 < _local_2.length)
            {
                _local_4 = _local_2[_local_3].split(",");
                if (Number(_local_4[0]) == _local_1[3])
                {
                    this.f_type.text = _local_4[1];
                    break;
                };
                _local_3++;
            };
            this.f_hack.text = _local_1[4];
            this.f_msg.text = _local_1[5];
            this.f_joined.text = _local_1[6];
            this.selectedUID = _local_1[7];
            this.f_swears.text = _local_1[9];
            this.f_sessionSwears.text = _local_1[8];
        }

        public function XTreply(_arg_1:*):*
        {
            var _local_2:*;
            var _local_3:*;
            if (_arg_1.sub == "userList")
            {
                if (_arg_1.users)
                {
                    this.dataArray = [];
                    this.clearDisplay();
                    for (_local_2 in _arg_1.users)
                    {
                        _local_3 = _arg_1.users[_local_2].split(this.seperator);
                        this.dataArray[_local_2] = _local_3;
                    };
                    this.updateUserDisplay();
                };
            }
            else
            {
                if (_arg_1.sub == "userListIP")
                {
                    this.showSessionResults(_arg_1);
                }
                else
                {
                    if (_arg_1.sub == "userListHomeAddr")
                    {
                        trace(("Got response!!" + _arg_1.addrInt));
                        if (_arg_1.addrInt != undefined)
                        {
                            this.stageref.mc_scene.loadHome(_arg_1.trb, _arg_1.addrInt, true);
                        }
                        else
                        {
                            if (_arg_1.addrExt != undefined)
                            {
                                trace("LOAD EXTERNAL HOME...");
                                this.stageref.mc_scene.loadHome(_arg_1.trb, (Math.floor((_arg_1.addrExt * 3)) + 1), false);
                            };
                        };
                    };
                };
            };
        }

        private function showSessionResults(_arg_1:*):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_2:* = "";
            for (_local_3 in _arg_1.data)
            {
                _local_4 = new Date((Number(_arg_1.data[_local_3].ss) * 1000));
                _local_4 = ((((((((((_local_4.date + "/") + _local_4.month) + "/") + _local_4.fullYear) + " ") + _local_4.hours) + ":") + ((_local_4.minutes > 9) ? _local_4.minutes = (_local_4.minutes + "0") : _local_4.minutes)) + ":") + _local_4.seconds);
                _local_5 = new Date((Number(_arg_1.data[_local_3].se) * 1000));
                _local_5 = ((((((((((_local_5.date + "/") + _local_5.month) + "/") + _local_5.fullYear) + " ") + _local_5.hours) + ":") + ((_local_5.minutes < 10) ? ("0" + _local_5.minutes) : _local_5.minutes)) + ":") + _local_5.seconds);
                _local_2 = (_local_2 + (((((((((((("<a href='event:" + _arg_1.data[_local_3].nm) + "'>") + _arg_1.data[_local_3].nm) + "</a>, START: ") + _local_4) + ", END: ") + _local_5) + ",ZONE: ") + _arg_1.data[_local_3].zn) + ",IP: ") + _arg_1.data[_local_3].ip) + "<br/>"));
            };
            this.ipresult.htmlText = _local_2;
            if (!this.ipresult.hasEventListener(TextEvent.LINK))
            {
                this.ipresult.addEventListener(TextEvent.LINK, this.textFieldLinkEvent);
            };
        }

        private function textFieldLinkEvent(_arg_1:TextEvent):*
        {
            this.stageref.showmsg(("Coming next: shortcut link to view moderator history for " + _arg_1.text));
        }

        private function updateUserDisplay():*
        {
            var _local_2:*;
            var _local_1:* = new DataProvider();
            for (_local_2 in this.dataArray)
            {
                if ((((this.filter_mod.toggleState) && (Number(this.dataArray[_local_2][3]) > 6)) || (this.filter_mod.toggleState == false)))
                {
                    _local_1.addItem({
                        "label":this.dataArray[_local_2][0],
                        "data":this.dataArray[_local_2]
                    });
                };
            };
            _local_1.sortOn("label");
            this.userlist.dataProvider = _local_1;
            this.userlist.selectedItem = this.selectedItem;
            this.displayInfo();
        }

        private function init(_arg_1:Event):*
        {
            var _local_4:*;
            this.stageref = thisref.stage.getChildAt(0);
            this.bt_search.toolText = this.stageref.langObj.getText("hlp23");
            this.opt_msg.toolText = this.stageref.langObj.getText("hlp32");
            this.opt_kick.toolText = this.stageref.langObj.getText("hlp33");
            this.bt_teleportouser.toolText = this.stageref.langObj.getText("hlp31");
            this.opt_ban.toolText = this.stageref.langObj.getText("hlp34");
            this.opt_ipban.toolText = this.stageref.langObj.getText("hlp35");
            if (this.stageref.mc_interface)
            {
                _local_4 = this.stageref.mc_interface;
                _local_4.setHelpItem(this.bt_search);
                _local_4.setHelpItem(this.opt_msg);
                _local_4.setHelpItem(this.opt_kick);
                _local_4.setHelpItem(this.bt_teleportouser);
                _local_4.setHelpItem(this.opt_ban);
                _local_4.setHelpItem(this.opt_ipban);
            }
            else
            {
                this.bt_teleportouser.visible = false;
            };
            var _local_2:* = new URLRequest((((this.stageref.DBURL + "admin_c") + this.stageref.custID) + "_templateData.php"));
            var _local_3:* = new URLLoader();
            _local_3.load(_local_2);
            _local_3.addEventListener(Event.COMPLETE, this.loadedXML);
            this.stageref.langObj.setFormat(this.txt_reason);
        }

        private function loadedXML(e:Event):*
        {
            var contentXML:* = undefined;
            var i:* = undefined;
            var gui:* = undefined;
            var def:* = undefined;
            var btref:* = undefined;
            try
            {
                if (this.stageref.getChildByName("mc_interface"))
                {
                    gui = this.stageref.mc_interface;
                };
                contentXML = XML(e.currentTarget.data);
                i = 0;
                while (i < contentXML.lang[0].resp.length())
                {
                    def = getDefinitionByName("admin_template_bt");
                    btref = addChild(new (def)());
                    btref.x = (this.clearTxt.x + (((i + 1) % 5) * (this.clearTxt.width + 3)));
                    btref.y = ((int(((i + 1) / 5)) * (this.clearTxt.height + 3)) + this.clearTxt.y);
                    btref.toolText = contentXML.lang[0].resp[i];
                    if (gui)
                    {
                        gui.setHelpItem(btref);
                    };
                    btref.setText(("Q" + (i + 1)));
                    btref.data = contentXML.lang[0].resp[i];
                    btref.type = "QUICKTEXT";
                    btref.addEventListener(MouseEvent.CLICK, this.bt_pressed);
                    i++;
                };
            }
            catch(e:Error)
            {
                stageref.showmsg(("Error in quick template XML" + e));
            };
        }

        private function bt_pressed(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            if ((((_arg_1.currentTarget.name == "opt_ban") || (_arg_1.currentTarget.name == "opt_msg")) || (_arg_1.currentTarget.name == "opt_kick")))
            {
                if (this.txt_reason.text.length < 2)
                {
                    this.stageref.showmsg("You must leave a message for banning / kicking / messaging this player.");
                    return;
                };
            };
            if (_arg_1.currentTarget.name == "opt_modchat")
            {
                if (this.selectedUID)
                {
                    _local_2 = {};
                    _local_2.id = this.selectedUID;
                    _local_2.nm = this.f_username.text;
                    this.stageref.buddylistControl.Moderator_PvtMessage(_local_2);
                }
                else
                {
                    this.stageref.showmsg("Please select a user to moderator chat with.");
                };
            };
            if (_arg_1.currentTarget.name == "bt_search")
            {
                _local_3 = {};
                _local_3.cmd = "searchUsers";
                _local_3.ext = "admin";
                _local_3.nm = this.username.text;
                this.stageref.sendXTmessage(_local_3);
                this.userlist.selectedIndex = -1;
                this.clearDisplay();
            }
            else
            {
                if (_arg_1.currentTarget.name == "opt_ban")
                {
                    if (this.selectedUID)
                    {
                        _local_3 = {};
                        _local_3.cmd = "ban";
                        _local_3.ext = "admin";
                        _local_3.id = this.selectedUID;
                        _local_3.nm = this.f_username.text;
                        _local_3.exp = this.txt_reason.text;
                        this.stageref.sendXTmessage(_local_3);
                        this.txt_reason.text = "";
                    };
                }
                else
                {
                    if (_arg_1.currentTarget.name == "opt_ipban")
                    {
                        if (this.selectedUID)
                        {
                            _local_3 = {};
                            _local_3.cmd = "banIP";
                            _local_3.ext = "admin";
                            _local_3.id = this.selectedUID;
                            _local_3.exp = this.txt_reason.text;
                            this.stageref.sendXTmessage(_local_3);
                            this.txt_reason.text = "";
                        };
                    }
                    else
                    {
                        if (_arg_1.currentTarget.name == "opt_msg")
                        {
                            if (this.selectedUID)
                            {
                                _local_3 = {};
                                _local_3.cmd = "msg";
                                _local_3.ext = "admin";
                                _local_3.id = this.selectedUID;
                                _local_3.exp = this.txt_reason.text;
                                this.stageref.sendXTmessage(_local_3);
                                this.txt_reason.text = "";
                            };
                        }
                        else
                        {
                            if (_arg_1.currentTarget.name == "opt_kick")
                            {
                                if (this.selectedUID)
                                {
                                    _local_3 = {};
                                    _local_3.cmd = "kick";
                                    _local_3.ext = "admin";
                                    _local_3.id = this.selectedUID;
                                    _local_3.exp = this.txt_reason.text;
                                    this.stageref.sendXTmessage(_local_3);
                                    this.txt_reason.text = "";
                                };
                            }
                            else
                            {
                                if (_arg_1.currentTarget.name == "bt_teleportouser")
                                {
                                    if (this.f_location.text == "")
                                    {
                                        this.stageref.showmsg("Please select the user to teleport to the location of");
                                        return;
                                    };
                                    _local_4 = this.stageref.sfs.getRoomByName(this.f_location.text);
                                    if (_local_4.getName().indexOf("Games") > -1)
                                    {
                                        this.stageref.showmsg("Can't teleport into battle games.");
                                        return;
                                    };
                                    if (_local_4.getName().indexOf("home") > -1)
                                    {
                                        this.stageref.showmsg("Please wait... requesting home data from server.");
                                        _local_3 = {
                                            "ext":"admin",
                                            "cmd":"getHomeAddr",
                                            "id":_local_4.getId()
                                        };
                                        this.stageref.sendXTmessage(_local_3);
                                    }
                                    else
                                    {
                                        this.stageref.mc_scene.loadNewRoom(_local_4.getName(), false);
                                    };
                                }
                                else
                                {
                                    if (_arg_1.currentTarget.name == "filter_mod")
                                    {
                                        this.updateUserDisplay();
                                    }
                                    else
                                    {
                                        if (_arg_1.currentTarget.name == "clearTxt")
                                        {
                                            this.txt_reason.text = "";
                                        }
                                        else
                                        {
                                            if (((_arg_1.currentTarget.type) && (_arg_1.currentTarget.type == "QUICKTEXT")))
                                            {
                                                this.txt_reason.text = _arg_1.currentTarget.data;
                                            }
                                            else
                                            {
                                                if (_arg_1.currentTarget.name == "bt_quickbanip")
                                                {
                                                    if (this.txt_reason.text.length < 3)
                                                    {
                                                        this.stageref.showmsg("A reason must be given for the IP ban.");
                                                        return;
                                                    };
                                                    if (((this.txt_quickbanip.length < 4) && (this.txt_quickbanip.length < 15)))
                                                    {
                                                        this.stageref.showmsg("You need to enter a valid IP address.");
                                                    }
                                                    else
                                                    {
                                                        _local_3 = {
                                                            "cmd":"quickIPBan",
                                                            "tgt":this.txt_quickbanip.text,
                                                            "exp":this.txt_reason.text,
                                                            "ext":"admin"
                                                        };
                                                        this.stageref.sendXTmessage(_local_3);
                                                    };
                                                }
                                                else
                                                {
                                                    if (_arg_1.currentTarget.name == "bt_searchIP")
                                                    {
                                                        if (((this.ipsearchfield.length < 4) && (this.ipsearchfield.length < 15)))
                                                        {
                                                            this.stageref.showmsg("You need to enter a valid IP address.");
                                                        }
                                                        else
                                                        {
                                                            this.ipresult.htmlText = "PLEASE WAIT...";
                                                            _local_3 = {
                                                                "cmd":"ipsearchfield",
                                                                "tgt":this.ipsearchfield.text,
                                                                "ext":"admin"
                                                            };
                                                            this.stageref.sendXTmessage(_local_3);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        override public function closepopup():*
        {
            this.userlist.removeEventListener(Event.CHANGE, this.displayInfo);
            thisref.parent.closepanel("usersearch");
        }

        internal function __setProp___id0__admin_usersearch_reason_0():*
        {
            try
            {
                this.__id0_["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            this.__id0_.direction = "vertical";
            this.__id0_.scrollTargetName = "ipresult";
            this.__id0_.visible = true;
            try
            {
                this.__id0_["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }


    }
}//package com.cocolani.panels

//------------------------------------------------------------
//com.cocolani.panels.administration

package com.cocolani.panels
{
    import flash.text.TextField;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import it.gotoandplay.smartfoxserver.SFSEvent;
    import it.gotoandplay.smartfoxserver.*;

    public class administration extends simplepopup 
    {

        internal var stageref:*;
        internal var activitymonRef:*;
        internal var broadcastRef:*;
        internal var banlistRef:*;
        internal var chatmonitorRef:*;
        internal var swearmonitorRef:*;
        internal var roomlistRef:*;
        internal var userSearchRef:*;
        internal var configsRef:*;
        internal var activityHandlerRef:*;
        public var usertxt:TextField;
        public var zonetxt:TextField;
        public var bt_chatmonitor:MovieClip;
        public var bt_roomlist:MovieClip;
        public var bt_usersearch:MovieClip;
        public var bt_configs:MovieClip;
        public var bt_swearmonitor:MovieClip;
        public var bt_banlist:MovieClip;
        public var bt_activity:MovieClip;
        public var bgd:MovieClip;
        public var bt_close:MovieClip;
        public var bt_brdcast:MovieClip;

        public function administration()
        {
            setAttribs({"dragbgd":true});
            this.usertxt.mouseEnabled = false;
            this.zonetxt.mouseEnabled = false;
            addEventListener(Event.ADDED_TO_STAGE, this.init);
            this.bt_chatmonitor.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.bt_roomlist.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.bt_usersearch.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.bt_configs.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.bt_swearmonitor.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.bt_activity.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.bt_brdcast.addEventListener(MouseEvent.CLICK, this.bt_pressed);
            this.bt_banlist.addEventListener(MouseEvent.CLICK, this.bt_pressed);
        }

        public function XTreply(_arg_1:*):*
        {
            switch (_arg_1.sub)
            {
                case "userList":
                    if (this.userSearchRef)
                    {
                        this.userSearchRef.XTreply(_arg_1);
                    };
                    return;
                case "userListHomeAddr":
                    if (this.userSearchRef)
                    {
                        this.userSearchRef.XTreply(_arg_1);
                    };
                    return;
                case "userListIP":
                    if (this.userSearchRef)
                    {
                        this.userSearchRef.XTreply(_arg_1);
                    };
                    return;
                case "chatHistory":
                    if (this.chatmonitorRef)
                    {
                        this.chatmonitorRef.XTreply(_arg_1);
                    };
                    return;
                case "swearHistory":
                    if (this.swearmonitorRef)
                    {
                        this.swearmonitorRef.XTreply(_arg_1);
                    };
                    return;
                case "chat":
                    trace("got reply...");
                    if (this.chatmonitorRef)
                    {
                        this.chatmonitorRef.XTreply(_arg_1);
                    };
                    return;
                case "swear":
                    trace("got reply...");
                    if (this.swearmonitorRef)
                    {
                        this.swearmonitorRef.XTreply(_arg_1);
                    };
                    return;
                case "options":
                    if (this.configsRef)
                    {
                        this.configsRef.XTreply(_arg_1);
                    };
                    return;
                case "activityMon":
                    if (this.activitymonRef)
                    {
                        this.activitymonRef.XTreply(_arg_1);
                    };
                    return;
                case "banList":
                    if (this.banlistRef)
                    {
                        this.banlistRef.XTreply(_arg_1);
                    };
                    return;
                case "adminMsg":
                    this.handleAdminMessage(_arg_1);
                    return;
                case "modHistory":
                    if (this.banlistRef)
                    {
                        this.banlistRef.XTreply(_arg_1);
                    };
                    return;
                case "gotoHome":
                    if (this.roomlistRef)
                    {
                        this.roomlistRef.XTreply(_arg_1);
                    };
                    return;
            };
        }

        public function handleAdminMessage(_arg_1:*):*
        {
            switch (_arg_1.type)
            {
                case "broadcast":
                    this.stageref.showmsg(_arg_1.data);
                    return;
                case "hackBanned":
                    this.stageref.showmsg(((((("User: " + _arg_1.data.usr) + " on IP: ") + _arg_1.data.ip) + " now banned for more than 5 possible hacks. Hack count = ") + _arg_1.data.count));
                    return;
                case "hackAlert":
                    this.activityHandlerRef.addHack(_arg_1.data);
                    return;
                case "banned":
                    this.stageref.showmsg(((((("User " + _arg_1.data.tgt) + " was banned by moderator ") + _arg_1.data.ref) + ". Reason:") + _arg_1.data.reason));
                    return;
                case "offlinebanned":
                    this.stageref.showmsg(((((("User " + _arg_1.data.tgt) + " was offline banned by moderator ") + _arg_1.data.ref) + ". Reason:") + _arg_1.data.reason));
                    return;
                case "banIP":
                    this.stageref.showmsg(((((((("User " + _arg_1.data.tgt) + " was IP banned by moderator ") + _arg_1.data.ref) + ". IP:") + _arg_1.data.ip) + " Reason:") + _arg_1.data.reason));
                    return;
                case "kick":
                    this.stageref.showmsg(((((("User " + _arg_1.data.tgt) + " was kicked by moderator ") + _arg_1.data.ref) + ". Reason:") + _arg_1.data.reason));
                    return;
                case "autoSwear":
                    this.activityHandlerRef.addSwear({
                        "usr":_arg_1.data,
                        "reason":(("Username " + _arg_1.data) + " was kicked off for swearing!")
                    });
                    return;
                case "reportPlayer":
                    this.activityHandlerRef.addReport(_arg_1.data);
                    return;
                case "unban":
                    this.stageref.showmsg(((((("User " + _arg_1.data.tgt) + " was unbanned by moderator ") + _arg_1.data.ref) + ". Reason:") + _arg_1.data.reason));
                    return;
            };
        }

        public function closepanel(_arg_1:*):*
        {
            trace(("Closing " + _arg_1));
            switch (_arg_1)
            {
                case "roomlist":
                    removeChild(this.roomlistRef);
                    this.roomlistRef = undefined;
                    return;
                case "usersearch":
                    removeChild(this.userSearchRef);
                    this.userSearchRef = undefined;
                    return;
                case "chatmonitor":
                    removeChild(this.chatmonitorRef);
                    this.chatmonitorRef = undefined;
                    return;
                case "swearmonitor":
                    removeChild(this.swearmonitorRef);
                    this.swearmonitorRef = undefined;
                    return;
                case "configs":
                    removeChild(this.configsRef);
                    this.configsRef = undefined;
                    return;
                case "activitymon":
                    removeChild(this.activitymonRef);
                    this.activitymonRef = undefined;
                    return;
                case "broadcaster":
                    removeChild(this.broadcastRef);
                    this.broadcastRef = undefined;
                    return;
                case "banlist":
                    removeChild(this.banlistRef);
                    this.banlistRef = undefined;
            };
        }

        public function setupListener():*
        {
            this.updateUserCounter();
            this.stageref.sfs.addEventListener(SFSEvent.onUserCountChange, this.userctUpdate);
            thisref.visible = true;
        }

        private function init(_arg_1:Event):*
        {
            var _local_2:*;
            this.stageref = thisref.stage.getChildAt(0);
            this.setupListener();
            thisref.visible = false;
            this.activityHandlerRef = new admin_activityHandler(this.stageref);
            this.zonetxt.text = ("Current Zone: " + this.stageref.zoneName);
            this.bt_configs.toolText = this.stageref.langObj.getText("hlp22");
            this.bt_usersearch.toolText = this.stageref.langObj.getText("hlp23");
            this.bt_roomlist.toolText = this.stageref.langObj.getText("hlp24");
            this.bt_swearmonitor.toolText = this.stageref.langObj.getText("hlp25");
            this.bt_chatmonitor.toolText = this.stageref.langObj.getText("hlp26");
            this.bt_brdcast.toolText = this.stageref.langObj.getText("hlp41");
            if (this.stageref.getChildByName("mc_interface"))
            {
                _local_2 = this.stageref.mc_interface;
                _local_2.setHelpItem(this.bt_configs);
                _local_2.setHelpItem(this.bt_usersearch);
                _local_2.setHelpItem(this.bt_roomlist);
                _local_2.setHelpItem(this.bt_swearmonitor);
                _local_2.setHelpItem(this.bt_chatmonitor);
                _local_2.setHelpItem(this.bt_brdcast);
            };
            trace("Made invisible..");
        }

        private function bt_pressed(_arg_1:MouseEvent):*
        {
            if (_arg_1.currentTarget.name == "bt_roomlist")
            {
                this.roomlistRef = addChild(new admin_roomlist());
            }
            else
            {
                if (_arg_1.currentTarget.name == "bt_usersearch")
                {
                    this.userSearchRef = addChild(new admin_usersearch());
                }
                else
                {
                    if (_arg_1.currentTarget.name == "bt_chatmonitor")
                    {
                        this.chatmonitorRef = addChild(new admin_chatmonitor());
                    }
                    else
                    {
                        if (_arg_1.currentTarget.name == "bt_swearmonitor")
                        {
                            this.swearmonitorRef = addChild(new admin_swearmonitor());
                        }
                        else
                        {
                            if (_arg_1.currentTarget.name == "bt_configs")
                            {
                                this.configsRef = addChild(new public::admin_configs());
                            }
                            else
                            {
                                if (_arg_1.currentTarget.name == "bt_activity")
                                {
                                    this.activitymonRef = addChild(new admin_activitymon());
                                }
                                else
                                {
                                    if (_arg_1.currentTarget.name == "bt_brdcast")
                                    {
                                        this.broadcastRef = addChild(new admin_broadcaster());
                                    }
                                    else
                                    {
                                        if (_arg_1.currentTarget.name == "bt_banlist")
                                        {
                                            this.banlistRef = addChild(new admin_banlist());
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        private function userctUpdate(_arg_1:SFSEvent):*
        {
            this.updateUserCounter();
        }

        private function updateUserCounter():*
        {
            var _local_3:*;
            var _local_1:* = this.stageref.sfs.getAllRooms();
            var _local_2:* = 0;
            for (_local_3 in _local_1)
            {
                if (((_local_1[_local_3].isGame() == false) || (_local_1[_local_3].getName() == "GamesRoom")))
                {
                    _local_2 = (_local_2 + _local_1[_local_3].getUserCount());
                };
            };
            this.usertxt.text = (("Approx. " + _local_2) + " users online");
        }

        override public function clickbt(_arg_1:MouseEvent):*
        {
            if (_arg_1.currentTarget.name == "bt_close")
            {
                this.closepopup();
            };
        }

        override public function closepopup():*
        {
            if (this.chatmonitorRef)
            {
                this.chatmonitorRef.bt_close.dispatchEvent(new MouseEvent(MouseEvent.CLICK, true, false, 0, 0));
            };
            if (this.swearmonitorRef)
            {
                this.swearmonitorRef.bt_close.dispatchEvent(new MouseEvent(MouseEvent.CLICK, true, false, 0, 0));
            };
            if (this.activitymonRef)
            {
                this.activitymonRef.bt_close.dispatchEvent(new MouseEvent(MouseEvent.CLICK, true, false, 0, 0));
            };
            if (this.broadcastRef)
            {
                this.broadcastRef.bt_close.dispatchEvent(new MouseEvent(MouseEvent.CLICK, true, false, 0, 0));
            };
            this.stageref.sfs.removeEventListener(SFSEvent.onUserCountChange, this.userctUpdate);
            if (this.banlistRef)
            {
                this.banlistRef.bt_close.dispatchEvent(new MouseEvent(MouseEvent.CLICK, true, false, 0, 0));
            };
            thisref.visible = false;
        }


    }
}//package com.cocolani.panels

//------------------------------------------------------------
//com.cocolani.panels.simplepopup

package com.cocolani.panels
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.display.Loader;
    import com.cocolani.popupLoader;

    public class simplepopup extends MovieClip 
    {

        internal var thisref:*;
        public var myname:* = "";

        public function simplepopup()
        {
            this.thisref = this;
            super();
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
            };
        }

        public function clickbt(e:MouseEvent):*
        {
            if (e.currentTarget.name == "bt_close")
            {
                this.closepopup();
                try
                {
                    this.thisref.stage.getChildAt(0).removepopup(this.thisref);
                }
                catch(e)
                {
                    trace("Could not locate stage to remove popup");
                };
            };
        }

        public function closepopup():*
        {
        }

        public function dragfn(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            var _local_3:*;
            if (_arg_1.type == "mouseUp")
            {
                this.thisref.stopDrag();
            }
            else
            {
                if (_arg_1.type == "mouseDown")
                {
                    this.thisref.startDrag();
                    _local_2 = this.thisref.parent;
                    _local_3 = 0;
                    while ((((((!(_local_2)) as popupLoader) || (_local_3 > 4)) || (_local_2 is Loader)) || (_local_2.parent is Loader)))
                    {
                        _local_2 = _local_2.parent;
                        _local_3++;
                    };
                    _local_2.parent.setChildIndex(_local_2, (_local_2.parent.numChildren - 1));
                };
            };
        }


    }
}//package com.cocolani.panels

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
    import flash.display.*;
    import flash.events.*;
    import com.greensock.core.*;
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
//fl.containers.BaseScrollPane

package fl.containers
{
    import fl.core.UIComponent;
    import flash.display.Shape;
    import fl.controls.ScrollBar;
    import flash.display.DisplayObject;
    import flash.geom.Rectangle;
    import fl.events.ScrollEvent;
    import fl.controls.ScrollBarDirection;
    import flash.events.MouseEvent;
    import fl.core.InvalidationType;
    import fl.controls.ScrollPolicy;
    import flash.display.Graphics;

    public class BaseScrollPane extends UIComponent 
    {

        private static var defaultStyles:Object = {
            "repeatDelay":500,
            "repeatInterval":35,
            "skin":"ScrollPane_upSkin",
            "contentPadding":0,
            "disabledAlpha":0.5
        };
        protected static const SCROLL_BAR_STYLES:Object = {
            "upArrowDisabledSkin":"upArrowDisabledSkin",
            "upArrowDownSkin":"upArrowDownSkin",
            "upArrowOverSkin":"upArrowOverSkin",
            "upArrowUpSkin":"upArrowUpSkin",
            "downArrowDisabledSkin":"downArrowDisabledSkin",
            "downArrowDownSkin":"downArrowDownSkin",
            "downArrowOverSkin":"downArrowOverSkin",
            "downArrowUpSkin":"downArrowUpSkin",
            "thumbDisabledSkin":"thumbDisabledSkin",
            "thumbDownSkin":"thumbDownSkin",
            "thumbOverSkin":"thumbOverSkin",
            "thumbUpSkin":"thumbUpSkin",
            "thumbIcon":"thumbIcon",
            "trackDisabledSkin":"trackDisabledSkin",
            "trackDownSkin":"trackDownSkin",
            "trackOverSkin":"trackOverSkin",
            "trackUpSkin":"trackUpSkin",
            "repeatDelay":"repeatDelay",
            "repeatInterval":"repeatInterval"
        };

        protected var vScrollBar:Boolean;
        protected var disabledOverlay:Shape;
        protected var hScrollBar:Boolean;
        protected var availableWidth:Number;
        protected var _verticalScrollBar:ScrollBar;
        protected var background:DisplayObject;
        protected var availableHeight:Number;
        protected var _horizontalScrollBar:ScrollBar;
        protected var contentScrollRect:Rectangle;
        protected var _horizontalScrollPolicy:String;
        protected var _verticalScrollPolicy:String;

        protected var contentWidth:Number = 0;
        protected var contentHeight:Number = 0;
        protected var contentPadding:Number = 0;
        protected var vOffset:Number = 0;
        protected var _maxHorizontalScrollPosition:Number = 0;
        protected var _horizontalPageScrollSize:Number = 0;
        protected var _verticalPageScrollSize:Number = 0;
        protected var defaultLineScrollSize:Number = 4;
        protected var useFixedHorizontalScrolling:Boolean = false;
        protected var _useBitmpScrolling:Boolean = false;


        public static function getStyleDefinition():Object
        {
            return (mergeStyles(defaultStyles, ScrollBar.getStyleDefinition()));
        }


        protected function handleWheel(_arg_1:MouseEvent):void
        {
            if ((((!(enabled)) || (!(_verticalScrollBar.visible))) || (contentHeight <= availableHeight)))
            {
                return;
            };
            _verticalScrollBar.scrollPosition = (_verticalScrollBar.scrollPosition - (_arg_1.delta * verticalLineScrollSize));
            setVerticalScrollPosition(_verticalScrollBar.scrollPosition);
            dispatchEvent(new ScrollEvent(ScrollBarDirection.VERTICAL, _arg_1.delta, horizontalScrollPosition));
        }

        public function get verticalScrollPosition():Number
        {
            return (_verticalScrollBar.scrollPosition);
        }

        protected function drawDisabledOverlay():void
        {
            if (enabled)
            {
                if (contains(disabledOverlay))
                {
                    removeChild(disabledOverlay);
                };
            }
            else
            {
                disabledOverlay.x = (disabledOverlay.y = contentPadding);
                disabledOverlay.width = availableWidth;
                disabledOverlay.height = availableHeight;
                disabledOverlay.alpha = (getStyleValue("disabledAlpha") as Number);
                addChild(disabledOverlay);
            };
        }

        public function set verticalScrollPosition(_arg_1:Number):void
        {
            drawNow();
            _verticalScrollBar.scrollPosition = _arg_1;
            setVerticalScrollPosition(_verticalScrollBar.scrollPosition, false);
        }

        protected function setContentSize(_arg_1:Number, _arg_2:Number):void
        {
            if ((((contentWidth == _arg_1) || (useFixedHorizontalScrolling)) && (contentHeight == _arg_2)))
            {
                return;
            };
            contentWidth = _arg_1;
            contentHeight = _arg_2;
            invalidate(InvalidationType.SIZE);
        }

        public function get horizontalScrollPosition():Number
        {
            return (_horizontalScrollBar.scrollPosition);
        }

        public function get horizontalScrollBar():ScrollBar
        {
            return (_horizontalScrollBar);
        }

        override public function set enabled(_arg_1:Boolean):void
        {
            if (enabled == _arg_1)
            {
                return;
            };
            _verticalScrollBar.enabled = _arg_1;
            _horizontalScrollBar.enabled = _arg_1;
            super.enabled = _arg_1;
        }

        public function get verticalLineScrollSize():Number
        {
            return (_verticalScrollBar.lineScrollSize);
        }

        public function get horizontalScrollPolicy():String
        {
            return (_horizontalScrollPolicy);
        }

        protected function calculateAvailableSize():void
        {
            var _local_1:Number;
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:Number;
            _local_1 = ScrollBar.WIDTH;
            _local_2 = (contentPadding = Number(getStyleValue("contentPadding")));
            _local_3 = ((height - (2 * _local_2)) - vOffset);
            vScrollBar = ((_verticalScrollPolicy == ScrollPolicy.ON) || ((_verticalScrollPolicy == ScrollPolicy.AUTO) && (contentHeight > _local_3)));
            _local_4 = ((width - ((vScrollBar) ? _local_1 : 0)) - (2 * _local_2));
            _local_5 = ((useFixedHorizontalScrolling) ? _maxHorizontalScrollPosition : (contentWidth - _local_4));
            hScrollBar = ((_horizontalScrollPolicy == ScrollPolicy.ON) || ((_horizontalScrollPolicy == ScrollPolicy.AUTO) && (_local_5 > 0)));
            if (hScrollBar)
            {
                _local_3 = (_local_3 - _local_1);
            };
            if (((((hScrollBar) && (!(vScrollBar))) && (_verticalScrollPolicy == ScrollPolicy.AUTO)) && (contentHeight > _local_3)))
            {
                vScrollBar = true;
                _local_4 = (_local_4 - _local_1);
            };
            availableHeight = (_local_3 + vOffset);
            availableWidth = _local_4;
        }

        public function get maxVerticalScrollPosition():Number
        {
            drawNow();
            return (Math.max(0, (contentHeight - availableHeight)));
        }

        public function set horizontalScrollPosition(_arg_1:Number):void
        {
            drawNow();
            _horizontalScrollBar.scrollPosition = _arg_1;
            setHorizontalScrollPosition(_horizontalScrollBar.scrollPosition, false);
        }

        public function get horizontalLineScrollSize():Number
        {
            return (_horizontalScrollBar.lineScrollSize);
        }

        public function set verticalPageScrollSize(_arg_1:Number):void
        {
            _verticalPageScrollSize = _arg_1;
            invalidate(InvalidationType.SIZE);
        }

        public function get verticalScrollPolicy():String
        {
            return (_verticalScrollPolicy);
        }

        protected function setHorizontalScrollPosition(_arg_1:Number, _arg_2:Boolean=false):void
        {
        }

        public function get useBitmapScrolling():Boolean
        {
            return (_useBitmpScrolling);
        }

        protected function handleScroll(_arg_1:ScrollEvent):void
        {
            if (_arg_1.target == _verticalScrollBar)
            {
                setVerticalScrollPosition(_arg_1.position);
            }
            else
            {
                setHorizontalScrollPosition(_arg_1.position);
            };
        }

        public function set verticalLineScrollSize(_arg_1:Number):void
        {
            _verticalScrollBar.lineScrollSize = _arg_1;
        }

        public function get verticalScrollBar():ScrollBar
        {
            return (_verticalScrollBar);
        }

        protected function setVerticalScrollPosition(_arg_1:Number, _arg_2:Boolean=false):void
        {
        }

        public function set horizontalPageScrollSize(_arg_1:Number):void
        {
            _horizontalPageScrollSize = _arg_1;
            invalidate(InvalidationType.SIZE);
        }

        override protected function draw():void
        {
            if (isInvalid(InvalidationType.STYLES))
            {
                setStyles();
                drawBackground();
                if (contentPadding != getStyleValue("contentPadding"))
                {
                    invalidate(InvalidationType.SIZE, false);
                };
            };
            if (isInvalid(InvalidationType.SIZE, InvalidationType.STATE))
            {
                drawLayout();
            };
            updateChildren();
            super.draw();
        }

        public function set horizontalScrollPolicy(_arg_1:String):void
        {
            _horizontalScrollPolicy = _arg_1;
            invalidate(InvalidationType.SIZE);
        }

        override protected function configUI():void
        {
            var _local_1:Graphics;
            super.configUI();
            contentScrollRect = new Rectangle(0, 0, 85, 85);
            _verticalScrollBar = new ScrollBar();
            _verticalScrollBar.addEventListener(ScrollEvent.SCROLL, handleScroll, false, 0, true);
            _verticalScrollBar.visible = false;
            _verticalScrollBar.lineScrollSize = defaultLineScrollSize;
            addChild(_verticalScrollBar);
            copyStylesToChild(_verticalScrollBar, SCROLL_BAR_STYLES);
            _horizontalScrollBar = new ScrollBar();
            _horizontalScrollBar.direction = ScrollBarDirection.HORIZONTAL;
            _horizontalScrollBar.addEventListener(ScrollEvent.SCROLL, handleScroll, false, 0, true);
            _horizontalScrollBar.visible = false;
            _horizontalScrollBar.lineScrollSize = defaultLineScrollSize;
            addChild(_horizontalScrollBar);
            copyStylesToChild(_horizontalScrollBar, SCROLL_BAR_STYLES);
            disabledOverlay = new Shape();
            _local_1 = disabledOverlay.graphics;
            _local_1.beginFill(0xFFFFFF);
            _local_1.drawRect(0, 0, width, height);
            _local_1.endFill();
            addEventListener(MouseEvent.MOUSE_WHEEL, handleWheel, false, 0, true);
        }

        protected function calculateContentWidth():void
        {
        }

        public function get verticalPageScrollSize():Number
        {
            if (isNaN(availableHeight))
            {
                drawNow();
            };
            return (((_verticalPageScrollSize == 0) && (!(isNaN(availableHeight)))) ? availableHeight : _verticalPageScrollSize);
        }

        protected function drawLayout():void
        {
            calculateAvailableSize();
            calculateContentWidth();
            background.width = width;
            background.height = height;
            if (vScrollBar)
            {
                _verticalScrollBar.visible = true;
                _verticalScrollBar.x = ((width - ScrollBar.WIDTH) - contentPadding);
                _verticalScrollBar.y = contentPadding;
                _verticalScrollBar.height = availableHeight;
            }
            else
            {
                _verticalScrollBar.visible = false;
            };
            _verticalScrollBar.setScrollProperties(availableHeight, 0, (contentHeight - availableHeight), verticalPageScrollSize);
            setVerticalScrollPosition(_verticalScrollBar.scrollPosition, false);
            if (hScrollBar)
            {
                _horizontalScrollBar.visible = true;
                _horizontalScrollBar.x = contentPadding;
                _horizontalScrollBar.y = ((height - ScrollBar.WIDTH) - contentPadding);
                _horizontalScrollBar.width = availableWidth;
            }
            else
            {
                _horizontalScrollBar.visible = false;
            };
            _horizontalScrollBar.setScrollProperties(availableWidth, 0, ((useFixedHorizontalScrolling) ? _maxHorizontalScrollPosition : (contentWidth - availableWidth)), horizontalPageScrollSize);
            setHorizontalScrollPosition(_horizontalScrollBar.scrollPosition, false);
            drawDisabledOverlay();
        }

        protected function drawBackground():void
        {
            var _local_1:DisplayObject;
            _local_1 = background;
            background = getDisplayObjectInstance(getStyleValue("skin"));
            background.width = width;
            background.height = height;
            addChildAt(background, 0);
            if (((!(_local_1 == null)) && (!(_local_1 == background))))
            {
                removeChild(_local_1);
            };
        }

        public function set horizontalLineScrollSize(_arg_1:Number):void
        {
            _horizontalScrollBar.lineScrollSize = _arg_1;
        }

        public function get horizontalPageScrollSize():Number
        {
            if (isNaN(availableWidth))
            {
                drawNow();
            };
            return (((_horizontalPageScrollSize == 0) && (!(isNaN(availableWidth)))) ? availableWidth : _horizontalPageScrollSize);
        }

        public function get maxHorizontalScrollPosition():Number
        {
            drawNow();
            return (Math.max(0, (contentWidth - availableWidth)));
        }

        protected function setStyles():void
        {
            copyStylesToChild(_verticalScrollBar, SCROLL_BAR_STYLES);
            copyStylesToChild(_horizontalScrollBar, SCROLL_BAR_STYLES);
        }

        protected function updateChildren():void
        {
            _verticalScrollBar.enabled = (_horizontalScrollBar.enabled = enabled);
            _verticalScrollBar.drawNow();
            _horizontalScrollBar.drawNow();
        }

        public function set verticalScrollPolicy(_arg_1:String):void
        {
            _verticalScrollPolicy = _arg_1;
            invalidate(InvalidationType.SIZE);
        }

        public function set useBitmapScrolling(_arg_1:Boolean):void
        {
            _useBitmpScrolling = _arg_1;
            invalidate(InvalidationType.STATE);
        }


    }
}//package fl.containers

//------------------------------------------------------------
//fl.containers.ScrollPane

package fl.containers
{
    import fl.managers.IFocusManagerComponent;
    import flash.display.Loader;
    import flash.display.Sprite;
    import flash.display.DisplayObject;
    import flash.events.Event;
    import flash.net.URLRequest;
    import flash.events.MouseEvent;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;
    import fl.controls.ScrollPolicy;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import fl.events.ScrollEvent;
    import flash.events.ProgressEvent;
    import fl.core.InvalidationType;

    public class ScrollPane extends BaseScrollPane implements IFocusManagerComponent 
    {

        private static var defaultStyles:Object = {
            "upSkin":"ScrollPane_upSkin",
            "disabledSkin":"ScrollPane_disabledSkin",
            "focusRectSkin":null,
            "focusRectPadding":null,
            "contentPadding":0
        };

        protected var scrollDragHPos:Number;
        protected var loader:Loader;
        protected var yOffset:Number;
        protected var currentContent:Object;
        protected var xOffset:Number;
        protected var _source:Object = "";
        protected var scrollDragVPos:Number;
        protected var _scrollDrag:Boolean = false;
        protected var contentClip:Sprite;


        public static function getStyleDefinition():Object
        {
            return (mergeStyles(defaultStyles, BaseScrollPane.getStyleDefinition()));
        }


        public function get source():Object
        {
            return (_source);
        }

        public function set source(_arg_1:Object):void
        {
            var _local_2:*;
            clearContent();
            if (isLivePreview)
            {
                return;
            };
            _source = _arg_1;
            if (((_source == "") || (_source == null)))
            {
                return;
            };
            currentContent = getDisplayObjectInstance(_arg_1);
            if (currentContent != null)
            {
                _local_2 = contentClip.addChild((currentContent as DisplayObject));
                dispatchEvent(new Event(Event.INIT));
                update();
            }
            else
            {
                load(new URLRequest(_source.toString()));
            };
        }

        public function get bytesLoaded():Number
        {
            return (((loader == null) || (loader.contentLoaderInfo == null)) ? 0 : loader.contentLoaderInfo.bytesLoaded);
        }

        protected function doDrag(_arg_1:MouseEvent):void
        {
            var _local_2:*;
            var _local_3:*;
            _local_2 = (scrollDragVPos - (mouseY - yOffset));
            _verticalScrollBar.setScrollPosition(_local_2);
            setVerticalScrollPosition(_verticalScrollBar.scrollPosition, true);
            _local_3 = (scrollDragHPos - (mouseX - xOffset));
            _horizontalScrollBar.setScrollPosition(_local_3);
            setHorizontalScrollPosition(_horizontalScrollBar.scrollPosition, true);
        }

        override protected function keyDownHandler(_arg_1:KeyboardEvent):void
        {
            var _local_2:int;
            _local_2 = calculateAvailableHeight();
            switch (_arg_1.keyCode)
            {
                case Keyboard.DOWN:
                    verticalScrollPosition++;
                    return;
                case Keyboard.UP:
                    verticalScrollPosition--;
                    return;
                case Keyboard.RIGHT:
                    horizontalScrollPosition++;
                    return;
                case Keyboard.LEFT:
                    horizontalScrollPosition--;
                    return;
                case Keyboard.END:
                    verticalScrollPosition = maxVerticalScrollPosition;
                    return;
                case Keyboard.HOME:
                    verticalScrollPosition = 0;
                    return;
                case Keyboard.PAGE_UP:
                    verticalScrollPosition = (verticalScrollPosition - _local_2);
                    return;
                case Keyboard.PAGE_DOWN:
                    verticalScrollPosition = (verticalScrollPosition + _local_2);
                    return;
            };
        }

        protected function doStartDrag(_arg_1:MouseEvent):void
        {
            if (!enabled)
            {
                return;
            };
            xOffset = mouseX;
            yOffset = mouseY;
            scrollDragHPos = horizontalScrollPosition;
            scrollDragVPos = verticalScrollPosition;
            stage.addEventListener(MouseEvent.MOUSE_MOVE, doDrag, false, 0, true);
        }

        public function get content():DisplayObject
        {
            var _local_1:Object;
            _local_1 = currentContent;
            if ((_local_1 is URLRequest))
            {
                _local_1 = loader.content;
            };
            return (_local_1 as DisplayObject);
        }

        public function get percentLoaded():Number
        {
            if (loader != null)
            {
                return (Math.round(((bytesLoaded / bytesTotal) * 100)));
            };
            return (0);
        }

        protected function endDrag(_arg_1:MouseEvent):void
        {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, doDrag);
        }

        public function update():void
        {
            var _local_1:DisplayObject;
            _local_1 = contentClip.getChildAt(0);
            setContentSize(_local_1.width, _local_1.height);
        }

        override protected function setHorizontalScrollPosition(_arg_1:Number, _arg_2:Boolean=false):void
        {
            var _local_3:*;
            _local_3 = contentClip.scrollRect;
            _local_3.x = _arg_1;
            contentClip.scrollRect = _local_3;
        }

        public function refreshPane():void
        {
            if ((_source is URLRequest))
            {
                _source = _source.url;
            };
            source = _source;
        }

        protected function passEvent(_arg_1:Event):void
        {
            dispatchEvent(_arg_1);
        }

        protected function calculateAvailableHeight():Number
        {
            var _local_1:Number;
            _local_1 = Number(getStyleValue("contentPadding"));
            return ((height - (_local_1 * 2)) - (((_horizontalScrollPolicy == ScrollPolicy.ON) || ((_horizontalScrollPolicy == ScrollPolicy.AUTO) && (_maxHorizontalScrollPosition > 0))) ? 15 : 0));
        }

        public function load(_arg_1:URLRequest, _arg_2:LoaderContext=null):void
        {
            if (_arg_2 == null)
            {
                _arg_2 = new LoaderContext(false, ApplicationDomain.currentDomain);
            };
            clearContent();
            initLoader();
            currentContent = (_source = _arg_1);
            loader.load(_arg_1, _arg_2);
        }

        override protected function handleScroll(_arg_1:ScrollEvent):void
        {
            passEvent(_arg_1);
            super.handleScroll(_arg_1);
        }

        override protected function setVerticalScrollPosition(_arg_1:Number, _arg_2:Boolean=false):void
        {
            var _local_3:*;
            _local_3 = contentClip.scrollRect;
            _local_3.y = _arg_1;
            contentClip.scrollRect = _local_3;
        }

        protected function initLoader():void
        {
            loader = new Loader();
            loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, passEvent, false, 0, true);
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onContentLoad, false, 0, true);
            loader.contentLoaderInfo.addEventListener(Event.INIT, passEvent, false, 0, true);
            contentClip.addChild(loader);
        }

        override protected function draw():void
        {
            if (isInvalid(InvalidationType.STYLES))
            {
                drawBackground();
            };
            if (isInvalid(InvalidationType.STATE))
            {
                setScrollDrag();
            };
            super.draw();
        }

        override protected function configUI():void
        {
            super.configUI();
            contentClip = new Sprite();
            addChild(contentClip);
            contentClip.scrollRect = contentScrollRect;
            _horizontalScrollPolicy = ScrollPolicy.AUTO;
            _verticalScrollPolicy = ScrollPolicy.AUTO;
        }

        public function set scrollDrag(_arg_1:Boolean):void
        {
            _scrollDrag = _arg_1;
            invalidate(InvalidationType.STATE);
        }

        protected function clearContent():void
        {
            if (contentClip.numChildren == 0)
            {
                return;
            };
            contentClip.removeChildAt(0);
            currentContent = null;
            if (loader != null)
            {
                try
                {
                    loader.close();
                }
                catch(e)
                {
                };
                try
                {
                    loader.unload();
                }
                catch(e)
                {
                };
                loader = null;
            };
        }

        override protected function drawLayout():void
        {
            super.drawLayout();
            contentScrollRect = contentClip.scrollRect;
            contentScrollRect.width = availableWidth;
            contentScrollRect.height = availableHeight;
            contentClip.cacheAsBitmap = useBitmapScrolling;
            contentClip.scrollRect = contentScrollRect;
            contentClip.x = (contentClip.y = contentPadding);
        }

        override protected function drawBackground():void
        {
            var _local_1:DisplayObject;
            _local_1 = background;
            background = getDisplayObjectInstance(getStyleValue(((enabled) ? "upSkin" : "disabledSkin")));
            background.width = width;
            background.height = height;
            addChildAt(background, 0);
            if (((!(_local_1 == null)) && (!(_local_1 == background))))
            {
                removeChild(_local_1);
            };
        }

        public function get bytesTotal():Number
        {
            return (((loader == null) || (loader.contentLoaderInfo == null)) ? 0 : loader.contentLoaderInfo.bytesTotal);
        }

        protected function onContentLoad(_arg_1:Event):void
        {
            var _local_2:*;
            update();
            _local_2 = calculateAvailableHeight();
            calculateAvailableSize();
            horizontalScrollBar.setScrollProperties(availableWidth, 0, ((useFixedHorizontalScrolling) ? _maxHorizontalScrollPosition : (contentWidth - availableWidth)), availableWidth);
            verticalScrollBar.setScrollProperties(_local_2, 0, (contentHeight - _local_2), _local_2);
            passEvent(_arg_1);
        }

        public function get scrollDrag():Boolean
        {
            return (_scrollDrag);
        }

        protected function setScrollDrag():void
        {
            if (_scrollDrag)
            {
                contentClip.addEventListener(MouseEvent.MOUSE_DOWN, doStartDrag, false, 0, true);
                stage.addEventListener(MouseEvent.MOUSE_UP, endDrag, false, 0, true);
            }
            else
            {
                contentClip.removeEventListener(MouseEvent.MOUSE_DOWN, doStartDrag);
                stage.removeEventListener(MouseEvent.MOUSE_UP, endDrag);
                removeEventListener(MouseEvent.MOUSE_MOVE, doDrag);
            };
            contentClip.buttonMode = _scrollDrag;
        }


    }
}//package fl.containers

//------------------------------------------------------------
//fl.controls.listClasses.CellRenderer

package fl.controls.listClasses
{
    import fl.controls.LabelButton;
    import flash.events.MouseEvent;

    public class CellRenderer extends LabelButton implements ICellRenderer 
    {

        private static var defaultStyles:Object = {
            "upSkin":"CellRenderer_upSkin",
            "downSkin":"CellRenderer_downSkin",
            "overSkin":"CellRenderer_overSkin",
            "disabledSkin":"CellRenderer_disabledSkin",
            "selectedDisabledSkin":"CellRenderer_selectedDisabledSkin",
            "selectedUpSkin":"CellRenderer_selectedUpSkin",
            "selectedDownSkin":"CellRenderer_selectedDownSkin",
            "selectedOverSkin":"CellRenderer_selectedOverSkin",
            "textFormat":null,
            "disabledTextFormat":null,
            "embedFonts":null,
            "textPadding":5
        };

        protected var _data:Object;
        protected var _listData:ListData;

        public function CellRenderer():void
        {
            toggle = true;
            focusEnabled = false;
        }

        public static function getStyleDefinition():Object
        {
            return (defaultStyles);
        }


        override protected function toggleSelected(_arg_1:MouseEvent):void
        {
        }

        override public function get selected():Boolean
        {
            return (super.selected);
        }

        public function set listData(_arg_1:ListData):void
        {
            _listData = _arg_1;
            label = _listData.label;
            setStyle("icon", _listData.icon);
        }

        override public function set selected(_arg_1:Boolean):void
        {
            super.selected = _arg_1;
        }

        public function set data(_arg_1:Object):void
        {
            _data = _arg_1;
        }

        public function get listData():ListData
        {
            return (_listData);
        }

        override public function setSize(_arg_1:Number, _arg_2:Number):void
        {
            super.setSize(_arg_1, _arg_2);
        }

        override protected function drawLayout():void
        {
            var _local_1:Number;
            var _local_2:Number;
            var _local_3:Number;
            _local_1 = Number(getStyleValue("textPadding"));
            _local_2 = 0;
            if (icon != null)
            {
                icon.x = _local_1;
                icon.y = Math.round(((height - icon.height) >> 1));
                _local_2 = (icon.width + _local_1);
            };
            if (label.length > 0)
            {
                textField.visible = true;
                _local_3 = Math.max(0, ((width - _local_2) - (_local_1 * 2)));
                textField.width = _local_3;
                textField.height = (textField.textHeight + 4);
                textField.x = (_local_2 + _local_1);
                textField.y = Math.round(((height - textField.height) >> 1));
            }
            else
            {
                textField.visible = false;
            };
            background.width = width;
            background.height = height;
        }

        public function get data():Object
        {
            return (_data);
        }


    }
}//package fl.controls.listClasses

//------------------------------------------------------------
//fl.controls.listClasses.ICellRenderer

package fl.controls.listClasses
{
    public interface ICellRenderer 
    {

        function setSize(_arg_1:Number, _arg_2:Number):void;
        function get listData():ListData;
        function get data():Object;
        function setMouseState(_arg_1:String):void;
        function set x(_arg_1:Number):void;
        function set y(_arg_1:Number):void;
        function set data(_arg_1:Object):void;
        function set selected(_arg_1:Boolean):void;
        function set listData(_arg_1:ListData):void;
        function get selected():Boolean;

    }
}//package fl.controls.listClasses

//------------------------------------------------------------
//fl.controls.listClasses.ListData

package fl.controls.listClasses
{
    import fl.core.UIComponent;

    public class ListData 
    {

        protected var _index:uint;
        protected var _owner:UIComponent;
        protected var _label:String;
        protected var _icon:Object = null;
        protected var _row:uint;
        protected var _column:uint;

        public function ListData(_arg_1:String, _arg_2:Object, _arg_3:UIComponent, _arg_4:uint, _arg_5:uint, _arg_6:uint=0)
        {
            _label = _arg_1;
            _icon = _arg_2;
            _owner = _arg_3;
            _index = _arg_4;
            _row = _arg_5;
            _column = _arg_6;
        }

        public function get owner():UIComponent
        {
            return (_owner);
        }

        public function get label():String
        {
            return (_label);
        }

        public function get row():uint
        {
            return (_row);
        }

        public function get index():uint
        {
            return (_index);
        }

        public function get icon():Object
        {
            return (_icon);
        }

        public function get column():uint
        {
            return (_column);
        }


    }
}//package fl.controls.listClasses

//------------------------------------------------------------
//fl.controls.BaseButton

package fl.controls
{
    import fl.core.UIComponent;
    import flash.utils.Timer;
    import flash.display.DisplayObject;
    import flash.events.TimerEvent;
    import flash.events.MouseEvent;
    import fl.core.InvalidationType;
    import fl.events.ComponentEvent;

    public class BaseButton extends UIComponent 
    {

        private static var defaultStyles:Object = {
            "upSkin":"Button_upSkin",
            "downSkin":"Button_downSkin",
            "overSkin":"Button_overSkin",
            "disabledSkin":"Button_disabledSkin",
            "selectedDisabledSkin":"Button_selectedDisabledSkin",
            "selectedUpSkin":"Button_selectedUpSkin",
            "selectedDownSkin":"Button_selectedDownSkin",
            "selectedOverSkin":"Button_selectedOverSkin",
            "focusRectSkin":null,
            "focusRectPadding":null,
            "repeatDelay":500,
            "repeatInterval":35
        };

        private var unlockedMouseState:String;
        protected var pressTimer:Timer;
        protected var mouseState:String;
        protected var background:DisplayObject;

        protected var _selected:Boolean = false;
        protected var _autoRepeat:Boolean = false;
        private var _mouseStateLocked:Boolean = false;

        public function BaseButton()
        {
            buttonMode = true;
            mouseChildren = false;
            useHandCursor = false;
            setupMouseEvents();
            setMouseState("up");
            pressTimer = new Timer(1, 0);
            pressTimer.addEventListener(TimerEvent.TIMER, buttonDown, false, 0, true);
        }

        public static function getStyleDefinition():Object
        {
            return (defaultStyles);
        }


        protected function endPress():void
        {
            pressTimer.reset();
        }

        public function set mouseStateLocked(_arg_1:Boolean):void
        {
            _mouseStateLocked = _arg_1;
            if (_arg_1 == false)
            {
                setMouseState(unlockedMouseState);
            }
            else
            {
                unlockedMouseState = mouseState;
            };
        }

        public function get autoRepeat():Boolean
        {
            return (_autoRepeat);
        }

        public function set autoRepeat(_arg_1:Boolean):void
        {
            _autoRepeat = _arg_1;
        }

        override public function set enabled(_arg_1:Boolean):void
        {
            super.enabled = _arg_1;
            mouseEnabled = _arg_1;
        }

        public function get selected():Boolean
        {
            return (_selected);
        }

        protected function mouseEventHandler(_arg_1:MouseEvent):void
        {
            if (_arg_1.type == MouseEvent.MOUSE_DOWN)
            {
                setMouseState("down");
                startPress();
            }
            else
            {
                if (((_arg_1.type == MouseEvent.ROLL_OVER) || (_arg_1.type == MouseEvent.MOUSE_UP)))
                {
                    setMouseState("over");
                    endPress();
                }
                else
                {
                    if (_arg_1.type == MouseEvent.ROLL_OUT)
                    {
                        setMouseState("up");
                        endPress();
                    };
                };
            };
        }

        public function setMouseState(_arg_1:String):void
        {
            if (_mouseStateLocked)
            {
                unlockedMouseState = _arg_1;
                return;
            };
            if (mouseState == _arg_1)
            {
                return;
            };
            mouseState = _arg_1;
            invalidate(InvalidationType.STATE);
        }

        protected function startPress():void
        {
            if (_autoRepeat)
            {
                pressTimer.delay = Number(getStyleValue("repeatDelay"));
                pressTimer.start();
            };
            dispatchEvent(new ComponentEvent(ComponentEvent.BUTTON_DOWN, true));
        }

        protected function buttonDown(_arg_1:TimerEvent):void
        {
            if (!_autoRepeat)
            {
                endPress();
                return;
            };
            if (pressTimer.currentCount == 1)
            {
                pressTimer.delay = Number(getStyleValue("repeatInterval"));
            };
            dispatchEvent(new ComponentEvent(ComponentEvent.BUTTON_DOWN, true));
        }

        public function set selected(_arg_1:Boolean):void
        {
            if (_selected == _arg_1)
            {
                return;
            };
            _selected = _arg_1;
            invalidate(InvalidationType.STATE);
        }

        override public function get enabled():Boolean
        {
            return (super.enabled);
        }

        override protected function draw():void
        {
            if (isInvalid(InvalidationType.STYLES, InvalidationType.STATE))
            {
                drawBackground();
                invalidate(InvalidationType.SIZE, false);
            };
            if (isInvalid(InvalidationType.SIZE))
            {
                drawLayout();
            };
            super.draw();
        }

        protected function setupMouseEvents():void
        {
            addEventListener(MouseEvent.ROLL_OVER, mouseEventHandler, false, 0, true);
            addEventListener(MouseEvent.MOUSE_DOWN, mouseEventHandler, false, 0, true);
            addEventListener(MouseEvent.MOUSE_UP, mouseEventHandler, false, 0, true);
            addEventListener(MouseEvent.ROLL_OUT, mouseEventHandler, false, 0, true);
        }

        protected function drawLayout():void
        {
            background.width = width;
            background.height = height;
        }

        protected function drawBackground():void
        {
            var _local_1:String;
            var _local_2:DisplayObject;
            _local_1 = ((enabled) ? mouseState : "disabled");
            if (selected)
            {
                _local_1 = (("selected" + _local_1.substr(0, 1).toUpperCase()) + _local_1.substr(1));
            };
            _local_1 = (_local_1 + "Skin");
            _local_2 = background;
            background = getDisplayObjectInstance(getStyleValue(_local_1));
            addChildAt(background, 0);
            if (((!(_local_2 == null)) && (!(_local_2 == background))))
            {
                removeChild(_local_2);
            };
        }


    }
}//package fl.controls

//------------------------------------------------------------
//fl.controls.Button

package fl.controls
{
    import fl.managers.IFocusManagerComponent;
    import flash.display.DisplayObject;
    import fl.core.UIComponent;
    import fl.core.InvalidationType;

    public class Button extends LabelButton implements IFocusManagerComponent 
    {

        private static var defaultStyles:Object = {
            "emphasizedSkin":"Button_emphasizedSkin",
            "emphasizedPadding":2
        };
        public static var createAccessibilityImplementation:Function;

        protected var emphasizedBorder:DisplayObject;
        protected var _emphasized:Boolean = false;


        public static function getStyleDefinition():Object
        {
            return (UIComponent.mergeStyles(LabelButton.getStyleDefinition(), defaultStyles));
        }


        override public function drawFocus(_arg_1:Boolean):void
        {
            var _local_2:Number;
            var _local_3:*;
            super.drawFocus(_arg_1);
            if (_arg_1)
            {
                _local_2 = Number(getStyleValue("emphasizedPadding"));
                if (((_local_2 < 0) || (!(_emphasized))))
                {
                    _local_2 = 0;
                };
                _local_3 = getStyleValue("focusRectPadding");
                _local_3 = ((_local_3 == null) ? 2 : _local_3);
                _local_3 = (_local_3 + _local_2);
                uiFocusRect.x = -(_local_3);
                uiFocusRect.y = -(_local_3);
                uiFocusRect.width = (width + (_local_3 * 2));
                uiFocusRect.height = (height + (_local_3 * 2));
            };
        }

        public function set emphasized(_arg_1:Boolean):void
        {
            _emphasized = _arg_1;
            invalidate(InvalidationType.STYLES);
        }

        override protected function draw():void
        {
            if (((isInvalid(InvalidationType.STYLES)) || (isInvalid(InvalidationType.SIZE))))
            {
                drawEmphasized();
            };
            super.draw();
            if (emphasizedBorder != null)
            {
                setChildIndex(emphasizedBorder, (numChildren - 1));
            };
        }

        public function get emphasized():Boolean
        {
            return (_emphasized);
        }

        override protected function initializeAccessibility():void
        {
            if (Button.createAccessibilityImplementation != null)
            {
                Button.createAccessibilityImplementation(this);
            };
        }

        protected function drawEmphasized():void
        {
            var _local_1:Object;
            var _local_2:Number;
            if (emphasizedBorder != null)
            {
                removeChild(emphasizedBorder);
            };
            emphasizedBorder = null;
            if (!_emphasized)
            {
                return;
            };
            _local_1 = getStyleValue("emphasizedSkin");
            if (_local_1 != null)
            {
                emphasizedBorder = getDisplayObjectInstance(_local_1);
            };
            if (emphasizedBorder != null)
            {
                addChildAt(emphasizedBorder, 0);
                _local_2 = Number(getStyleValue("emphasizedPadding"));
                emphasizedBorder.x = (emphasizedBorder.y = -(_local_2));
                emphasizedBorder.width = (width + (_local_2 * 2));
                emphasizedBorder.height = (height + (_local_2 * 2));
            };
        }


    }
}//package fl.controls

//------------------------------------------------------------
//fl.controls.ButtonLabelPlacement

package fl.controls
{
    public class ButtonLabelPlacement 
    {

        public static const BOTTOM:String = "bottom";
        public static const TOP:String = "top";
        public static const LEFT:String = "left";
        public static const RIGHT:String = "right";


    }
}//package fl.controls

//------------------------------------------------------------
//fl.controls.LabelButton

package fl.controls
{
    import fl.managers.IFocusManagerComponent;
    import flash.display.DisplayObject;
    import flash.text.TextField;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;
    import fl.core.InvalidationType;
    import flash.text.TextFieldType;
    import fl.events.ComponentEvent;
    import flash.text.TextFormat;
    import fl.core.UIComponent;

    public class LabelButton extends BaseButton implements IFocusManagerComponent 
    {

        private static var defaultStyles:Object = {
            "icon":null,
            "upIcon":null,
            "downIcon":null,
            "overIcon":null,
            "disabledIcon":null,
            "selectedDisabledIcon":null,
            "selectedUpIcon":null,
            "selectedDownIcon":null,
            "selectedOverIcon":null,
            "textFormat":null,
            "disabledTextFormat":null,
            "textPadding":5,
            "embedFonts":false
        };
        public static var createAccessibilityImplementation:Function;

        protected var icon:DisplayObject;
        protected var oldMouseState:String;
        public var textField:TextField;

        protected var _labelPlacement:String = ButtonLabelPlacement.RIGHT;//"right"
        protected var _toggle:Boolean = false;
        protected var _label:String = "Label";
        protected var mode:String = "center";


        public static function getStyleDefinition():Object
        {
            return (mergeStyles(defaultStyles, BaseButton.getStyleDefinition()));
        }


        protected function toggleSelected(_arg_1:MouseEvent):void
        {
            selected = (!(selected));
            dispatchEvent(new Event(Event.CHANGE, true));
        }

        public function get labelPlacement():String
        {
            return (_labelPlacement);
        }

        override protected function keyDownHandler(_arg_1:KeyboardEvent):void
        {
            if (!enabled)
            {
                return;
            };
            if (_arg_1.keyCode == Keyboard.SPACE)
            {
                if (oldMouseState == null)
                {
                    oldMouseState = mouseState;
                };
                setMouseState("down");
                startPress();
            };
        }

        protected function setEmbedFont():*
        {
            var _local_1:Object;
            _local_1 = getStyleValue("embedFonts");
            if (_local_1 != null)
            {
                textField.embedFonts = _local_1;
            };
        }

        override protected function keyUpHandler(_arg_1:KeyboardEvent):void
        {
            if (!enabled)
            {
                return;
            };
            if (_arg_1.keyCode == Keyboard.SPACE)
            {
                setMouseState(oldMouseState);
                oldMouseState = null;
                endPress();
                dispatchEvent(new MouseEvent(MouseEvent.CLICK));
            };
        }

        override public function get selected():Boolean
        {
            return ((_toggle) ? _selected : false);
        }

        public function set labelPlacement(_arg_1:String):void
        {
            _labelPlacement = _arg_1;
            invalidate(InvalidationType.SIZE);
        }

        public function set toggle(_arg_1:Boolean):void
        {
            if (((!(_arg_1)) && (super.selected)))
            {
                selected = false;
            };
            _toggle = _arg_1;
            if (_toggle)
            {
                addEventListener(MouseEvent.CLICK, toggleSelected, false, 0, true);
            }
            else
            {
                removeEventListener(MouseEvent.CLICK, toggleSelected);
            };
            invalidate(InvalidationType.STATE);
        }

        public function get label():String
        {
            return (_label);
        }

        override public function set selected(_arg_1:Boolean):void
        {
            _selected = _arg_1;
            if (_toggle)
            {
                invalidate(InvalidationType.STATE);
            };
        }

        override protected function draw():void
        {
            if (textField.text != _label)
            {
                label = _label;
            };
            if (isInvalid(InvalidationType.STYLES, InvalidationType.STATE))
            {
                drawBackground();
                drawIcon();
                drawTextFormat();
                invalidate(InvalidationType.SIZE, false);
            };
            if (isInvalid(InvalidationType.SIZE))
            {
                drawLayout();
            };
            if (isInvalid(InvalidationType.SIZE, InvalidationType.STYLES))
            {
                if (((isFocused) && (focusManager.showFocusIndicator)))
                {
                    drawFocus(true);
                };
            };
            validate();
        }

        public function get toggle():Boolean
        {
            return (_toggle);
        }

        override protected function configUI():void
        {
            super.configUI();
            textField = new TextField();
            textField.type = TextFieldType.DYNAMIC;
            textField.selectable = false;
            addChild(textField);
        }

        override protected function drawLayout():void
        {
            var _local_1:Number;
            var _local_2:String;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:Number;
            _local_1 = Number(getStyleValue("textPadding"));
            _local_2 = (((icon == null) && (mode == "center")) ? ButtonLabelPlacement.TOP : _labelPlacement);
            textField.height = (textField.textHeight + 4);
            _local_3 = (textField.textWidth + 4);
            _local_4 = (textField.textHeight + 4);
            _local_5 = ((icon == null) ? 0 : (icon.width + _local_1));
            _local_6 = ((icon == null) ? 0 : (icon.height + _local_1));
            textField.visible = (label.length > 0);
            if (icon != null)
            {
                icon.x = Math.round(((width - icon.width) / 2));
                icon.y = Math.round(((height - icon.height) / 2));
            };
            if (textField.visible == false)
            {
                textField.width = 0;
                textField.height = 0;
            }
            else
            {
                if (((_local_2 == ButtonLabelPlacement.BOTTOM) || (_local_2 == ButtonLabelPlacement.TOP)))
                {
                    _local_7 = Math.max(0, Math.min(_local_3, (width - (2 * _local_1))));
                    if ((height - 2) > _local_4)
                    {
                        _local_8 = _local_4;
                    }
                    else
                    {
                        _local_8 = (height - 2);
                    };
                    textField.width = (_local_3 = _local_7);
                    textField.height = (_local_4 = _local_8);
                    textField.x = Math.round(((width - _local_3) / 2));
                    textField.y = Math.round(((((height - textField.height) - _local_6) / 2) + ((_local_2 == ButtonLabelPlacement.BOTTOM) ? _local_6 : 0)));
                    if (icon != null)
                    {
                        icon.y = Math.round(((_local_2 == ButtonLabelPlacement.BOTTOM) ? (textField.y - _local_6) : ((textField.y + textField.height) + _local_1)));
                    };
                }
                else
                {
                    _local_7 = Math.max(0, Math.min(_local_3, ((width - _local_5) - (2 * _local_1))));
                    textField.width = (_local_3 = _local_7);
                    textField.x = Math.round(((((width - _local_3) - _local_5) / 2) + ((_local_2 != ButtonLabelPlacement.LEFT) ? _local_5 : 0)));
                    textField.y = Math.round(((height - textField.height) / 2));
                    if (icon != null)
                    {
                        icon.x = Math.round(((_local_2 != ButtonLabelPlacement.LEFT) ? (textField.x - _local_5) : ((textField.x + _local_3) + _local_1)));
                    };
                };
            };
            super.drawLayout();
        }

        override protected function initializeAccessibility():void
        {
            if (LabelButton.createAccessibilityImplementation != null)
            {
                LabelButton.createAccessibilityImplementation(this);
            };
        }

        protected function drawIcon():void
        {
            var _local_1:DisplayObject;
            var _local_2:String;
            var _local_3:Object;
            _local_1 = icon;
            _local_2 = ((enabled) ? mouseState : "disabled");
            if (selected)
            {
                _local_2 = (("selected" + _local_2.substr(0, 1).toUpperCase()) + _local_2.substr(1));
            };
            _local_2 = (_local_2 + "Icon");
            _local_3 = getStyleValue(_local_2);
            if (_local_3 == null)
            {
                _local_3 = getStyleValue("icon");
            };
            if (_local_3 != null)
            {
                icon = getDisplayObjectInstance(_local_3);
            };
            if (icon != null)
            {
                addChildAt(icon, 1);
            };
            if (((!(_local_1 == null)) && (!(_local_1 == icon))))
            {
                removeChild(_local_1);
            };
        }

        public function set label(_arg_1:String):void
        {
            _label = _arg_1;
            if (textField.text != _label)
            {
                textField.text = _label;
                dispatchEvent(new ComponentEvent(ComponentEvent.LABEL_CHANGE));
            };
            invalidate(InvalidationType.SIZE);
            invalidate(InvalidationType.STYLES);
        }

        protected function drawTextFormat():void
        {
            var _local_1:Object;
            var _local_2:TextFormat;
            var _local_3:TextFormat;
            _local_1 = UIComponent.getStyleDefinition();
            _local_2 = ((enabled) ? (_local_1.defaultTextFormat as TextFormat) : (_local_1.defaultDisabledTextFormat as TextFormat));
            textField.setTextFormat(_local_2);
            _local_3 = (getStyleValue(((enabled) ? "textFormat" : "disabledTextFormat")) as TextFormat);
            if (_local_3 != null)
            {
                textField.setTextFormat(_local_3);
            }
            else
            {
                _local_3 = _local_2;
            };
            textField.defaultTextFormat = _local_3;
            setEmbedFont();
        }


    }
}//package fl.controls

//------------------------------------------------------------
//fl.controls.List

package fl.controls
{
    import fl.managers.IFocusManagerComponent;
    import flash.events.Event;
    import fl.core.InvalidationType;
    import flash.geom.Rectangle;
    import fl.controls.listClasses.ICellRenderer;
    import flash.utils.Dictionary;
    import flash.display.Sprite;
    import flash.display.DisplayObject;
    import flash.events.MouseEvent;
    import fl.controls.listClasses.ListData;
    import fl.core.UIComponent;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;

    public class List extends SelectableList implements IFocusManagerComponent 
    {

        private static var defaultStyles:Object = {
            "focusRectSkin":null,
            "focusRectPadding":null
        };
        public static var createAccessibilityImplementation:Function;

        protected var _cellRenderer:Object;
        protected var _labelFunction:Function;
        protected var _iconFunction:Function;

        protected var _rowHeight:Number = 20;
        protected var _labelField:String = "label";
        protected var _iconField:String = "icon";


        public static function getStyleDefinition():Object
        {
            return (mergeStyles(defaultStyles, SelectableList.getStyleDefinition()));
        }


        public function get iconField():String
        {
            return (_iconField);
        }

        protected function doKeySelection(_arg_1:int, _arg_2:Boolean, _arg_3:Boolean):void
        {
            var _local_4:Boolean;
            var _local_5:int;
            var _local_6:Array;
            var _local_7:int;
            var _local_8:int;
            _local_4 = false;
            if (_arg_2)
            {
                _local_6 = [];
                _local_7 = lastCaretIndex;
                _local_8 = _arg_1;
                if (_local_7 == -1)
                {
                    _local_7 = ((caretIndex != -1) ? caretIndex : _arg_1);
                };
                if (_local_7 > _local_8)
                {
                    _local_8 = _local_7;
                    _local_7 = _arg_1;
                };
                _local_5 = _local_7;
                while (_local_5 <= _local_8)
                {
                    _local_6.push(_local_5);
                    _local_5++;
                };
                selectedIndices = _local_6;
                caretIndex = _arg_1;
                _local_4 = true;
            }
            else
            {
                selectedIndex = _arg_1;
                caretIndex = (lastCaretIndex = _arg_1);
                _local_4 = true;
            };
            if (_local_4)
            {
                dispatchEvent(new Event(Event.CHANGE));
            };
            invalidate(InvalidationType.DATA);
        }

        override protected function drawList():void
        {
            var _local_1:Rectangle;
            var _local_2:uint;
            var _local_3:uint;
            var _local_4:uint;
            var _local_5:Object;
            var _local_6:ICellRenderer;
            var _local_7:Dictionary;
            var _local_8:Dictionary;
            var _local_9:Boolean;
            var _local_10:String;
            var _local_11:Object;
            var _local_12:Sprite;
            var _local_13:String;
            listHolder.x = (listHolder.y = contentPadding);
            _local_1 = listHolder.scrollRect;
            _local_1.x = _horizontalScrollPosition;
            _local_1.y = (Math.floor(_verticalScrollPosition) % rowHeight);
            listHolder.scrollRect = _local_1;
            listHolder.cacheAsBitmap = useBitmapScrolling;
            _local_2 = uint(Math.floor((_verticalScrollPosition / rowHeight)));
            _local_3 = Math.min(length, ((_local_2 + rowCount) + 1));
            _local_7 = (renderedItems = new Dictionary(true));
            _local_4 = _local_2;
            while (_local_4 < _local_3)
            {
                _local_7[_dataProvider.getItemAt(_local_4)] = true;
                _local_4++;
            };
            _local_8 = new Dictionary(true);
            while (activeCellRenderers.length > 0)
            {
                _local_6 = (activeCellRenderers.pop() as ICellRenderer);
                _local_5 = _local_6.data;
                if (((_local_7[_local_5] == null) || (invalidItems[_local_5] == true)))
                {
                    availableCellRenderers.push(_local_6);
                }
                else
                {
                    _local_8[_local_5] = _local_6;
                    invalidItems[_local_5] = true;
                };
                list.removeChild((_local_6 as DisplayObject));
            };
            invalidItems = new Dictionary(true);
            _local_4 = _local_2;
            while (_local_4 < _local_3)
            {
                _local_9 = false;
                _local_5 = _dataProvider.getItemAt(_local_4);
                if (_local_8[_local_5] != null)
                {
                    _local_9 = true;
                    _local_6 = _local_8[_local_5];
                    delete _local_8[_local_5];
                }
                else
                {
                    if (availableCellRenderers.length > 0)
                    {
                        _local_6 = (availableCellRenderers.pop() as ICellRenderer);
                    }
                    else
                    {
                        _local_6 = (getDisplayObjectInstance(getStyleValue("cellRenderer")) as ICellRenderer);
                        _local_12 = (_local_6 as Sprite);
                        if (_local_12 != null)
                        {
                            _local_12.addEventListener(MouseEvent.CLICK, handleCellRendererClick, false, 0, true);
                            _local_12.addEventListener(MouseEvent.ROLL_OVER, handleCellRendererMouseEvent, false, 0, true);
                            _local_12.addEventListener(MouseEvent.ROLL_OUT, handleCellRendererMouseEvent, false, 0, true);
                            _local_12.addEventListener(Event.CHANGE, handleCellRendererChange, false, 0, true);
                            _local_12.doubleClickEnabled = true;
                            _local_12.addEventListener(MouseEvent.DOUBLE_CLICK, handleCellRendererDoubleClick, false, 0, true);
                            if (_local_12["setStyle"] != null)
                            {
                                for (_local_13 in rendererStyles)
                                {
                                    var _local_16:* = _local_12;
                                    (_local_16["setStyle"](_local_13, rendererStyles[_local_13]));
                                };
                            };
                        };
                    };
                };
                list.addChild((_local_6 as Sprite));
                activeCellRenderers.push(_local_6);
                _local_6.y = (rowHeight * (_local_4 - _local_2));
                _local_6.setSize((availableWidth + _maxHorizontalScrollPosition), rowHeight);
                _local_10 = itemToLabel(_local_5);
                _local_11 = null;
                if (_iconFunction != null)
                {
                    _local_11 = _iconFunction(_local_5);
                }
                else
                {
                    if (_iconField != null)
                    {
                        _local_11 = _local_5[_iconField];
                    };
                };
                if (!_local_9)
                {
                    _local_6.data = _local_5;
                };
                _local_6.listData = new ListData(_local_10, _local_11, this, _local_4, _local_4, 0);
                _local_6.selected = (!(_selectedIndices.indexOf(_local_4) == -1));
                if ((_local_6 is UIComponent))
                {
                    (_local_6 as UIComponent).drawNow();
                };
                _local_4++;
            };
        }

        public function get iconFunction():Function
        {
            return (_iconFunction);
        }

        public function set iconField(_arg_1:String):void
        {
            if (_arg_1 == _iconField)
            {
                return;
            };
            _iconField = _arg_1;
            invalidate(InvalidationType.DATA);
        }

        override protected function keyDownHandler(_arg_1:KeyboardEvent):void
        {
            var _local_2:int;
            if (!selectable)
            {
                return;
            };
            switch (_arg_1.keyCode)
            {
                case Keyboard.UP:
                case Keyboard.DOWN:
                case Keyboard.END:
                case Keyboard.HOME:
                case Keyboard.PAGE_UP:
                case Keyboard.PAGE_DOWN:
                    moveSelectionVertically(_arg_1.keyCode, ((_arg_1.shiftKey) && (_allowMultipleSelection)), ((_arg_1.ctrlKey) && (_allowMultipleSelection)));
                    break;
                case Keyboard.LEFT:
                case Keyboard.RIGHT:
                    moveSelectionHorizontally(_arg_1.keyCode, ((_arg_1.shiftKey) && (_allowMultipleSelection)), ((_arg_1.ctrlKey) && (_allowMultipleSelection)));
                    break;
                case Keyboard.SPACE:
                    if (caretIndex == -1)
                    {
                        caretIndex = 0;
                    };
                    doKeySelection(caretIndex, _arg_1.shiftKey, _arg_1.ctrlKey);
                    scrollToSelected();
                    break;
                default:
                    _local_2 = getNextIndexAtLetter(String.fromCharCode(_arg_1.keyCode), selectedIndex);
                    if (_local_2 > -1)
                    {
                        selectedIndex = _local_2;
                        scrollToSelected();
                    };
            };
            _arg_1.stopPropagation();
        }

        override public function itemToLabel(_arg_1:Object):String
        {
            if (_labelFunction != null)
            {
                return (String(_labelFunction(_arg_1)));
            };
            return ((_arg_1[_labelField] != null) ? String(_arg_1[_labelField]) : "");
        }

        public function get labelField():String
        {
            return (_labelField);
        }

        override protected function moveSelectionVertically(_arg_1:uint, _arg_2:Boolean, _arg_3:Boolean):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            _local_4 = int(Math.max(Math.floor((calculateAvailableHeight() / rowHeight)), 1));
            _local_5 = -1;
            _local_6 = 0;
            switch (_arg_1)
            {
                case Keyboard.UP:
                    if (caretIndex > 0)
                    {
                        _local_5 = (caretIndex - 1);
                    };
                    break;
                case Keyboard.DOWN:
                    if (caretIndex < (length - 1))
                    {
                        _local_5 = (caretIndex + 1);
                    };
                    break;
                case Keyboard.PAGE_UP:
                    if (caretIndex > 0)
                    {
                        _local_5 = Math.max((caretIndex - _local_4), 0);
                    };
                    break;
                case Keyboard.PAGE_DOWN:
                    if (caretIndex < (length - 1))
                    {
                        _local_5 = Math.min((caretIndex + _local_4), (length - 1));
                    };
                    break;
                case Keyboard.HOME:
                    if (caretIndex > 0)
                    {
                        _local_5 = 0;
                    };
                    break;
                case Keyboard.END:
                    if (caretIndex < (length - 1))
                    {
                        _local_5 = (length - 1);
                    };
                    break;
            };
            if (_local_5 >= 0)
            {
                doKeySelection(_local_5, _arg_2, _arg_3);
                scrollToSelected();
            };
        }

        public function set labelField(_arg_1:String):void
        {
            if (_arg_1 == _labelField)
            {
                return;
            };
            _labelField = _arg_1;
            invalidate(InvalidationType.DATA);
        }

        public function set rowCount(_arg_1:uint):void
        {
            var _local_2:Number;
            var _local_3:Number;
            _local_2 = Number(getStyleValue("contentPadding"));
            _local_3 = (((_horizontalScrollPolicy == ScrollPolicy.ON) || ((_horizontalScrollPolicy == ScrollPolicy.AUTO) && (_maxHorizontalScrollPosition > 0))) ? 15 : 0);
            height = (((rowHeight * _arg_1) + (2 * _local_2)) + _local_3);
        }

        override protected function setHorizontalScrollPosition(_arg_1:Number, _arg_2:Boolean=false):void
        {
            list.x = -(_arg_1);
            super.setHorizontalScrollPosition(_arg_1, true);
        }

        public function set iconFunction(_arg_1:Function):void
        {
            if (_iconFunction == _arg_1)
            {
                return;
            };
            _iconFunction = _arg_1;
            invalidate(InvalidationType.DATA);
        }

        public function get labelFunction():Function
        {
            return (_labelFunction);
        }

        override protected function moveSelectionHorizontally(_arg_1:uint, _arg_2:Boolean, _arg_3:Boolean):void
        {
        }

        override protected function setVerticalScrollPosition(_arg_1:Number, _arg_2:Boolean=false):void
        {
            invalidate(InvalidationType.SCROLL);
            super.setVerticalScrollPosition(_arg_1, true);
        }

        protected function calculateAvailableHeight():Number
        {
            var _local_1:Number;
            _local_1 = Number(getStyleValue("contentPadding"));
            return ((height - (_local_1 * 2)) - (((_horizontalScrollPolicy == ScrollPolicy.ON) || ((_horizontalScrollPolicy == ScrollPolicy.AUTO) && (_maxHorizontalScrollPosition > 0))) ? 15 : 0));
        }

        override protected function draw():void
        {
            var _local_1:Boolean;
            _local_1 = (!(contentHeight == (rowHeight * length)));
            contentHeight = (rowHeight * length);
            if (isInvalid(InvalidationType.STYLES))
            {
                setStyles();
                drawBackground();
                if (contentPadding != getStyleValue("contentPadding"))
                {
                    invalidate(InvalidationType.SIZE, false);
                };
                if (_cellRenderer != getStyleValue("cellRenderer"))
                {
                    _invalidateList();
                    _cellRenderer = getStyleValue("cellRenderer");
                };
            };
            if (((isInvalid(InvalidationType.SIZE, InvalidationType.STATE)) || (_local_1)))
            {
                drawLayout();
            };
            if (isInvalid(InvalidationType.RENDERER_STYLES))
            {
                updateRendererStyles();
            };
            if (isInvalid(InvalidationType.STYLES, InvalidationType.SIZE, InvalidationType.DATA, InvalidationType.SCROLL, InvalidationType.SELECTED))
            {
                drawList();
            };
            updateChildren();
            validate();
        }

        override protected function configUI():void
        {
            useFixedHorizontalScrolling = true;
            _horizontalScrollPolicy = ScrollPolicy.AUTO;
            _verticalScrollPolicy = ScrollPolicy.AUTO;
            super.configUI();
        }

        override public function get rowCount():uint
        {
            return (Math.ceil((calculateAvailableHeight() / rowHeight)));
        }

        override protected function initializeAccessibility():void
        {
            if (List.createAccessibilityImplementation != null)
            {
                List.createAccessibilityImplementation(this);
            };
        }

        override public function scrollToIndex(_arg_1:int):void
        {
            var _local_2:uint;
            var _local_3:uint;
            drawNow();
            _local_2 = uint((Math.floor(((_verticalScrollPosition + availableHeight) / rowHeight)) - 1));
            _local_3 = uint(Math.ceil((_verticalScrollPosition / rowHeight)));
            if (_arg_1 < _local_3)
            {
                verticalScrollPosition = (_arg_1 * rowHeight);
            }
            else
            {
                if (_arg_1 > _local_2)
                {
                    verticalScrollPosition = (((_arg_1 + 1) * rowHeight) - availableHeight);
                };
            };
        }

        public function get rowHeight():Number
        {
            return (_rowHeight);
        }

        public function set labelFunction(_arg_1:Function):void
        {
            if (_labelFunction == _arg_1)
            {
                return;
            };
            _labelFunction = _arg_1;
            invalidate(InvalidationType.DATA);
        }

        public function set rowHeight(_arg_1:Number):void
        {
            _rowHeight = _arg_1;
            invalidate(InvalidationType.SIZE);
        }


    }
}//package fl.controls

//------------------------------------------------------------
//fl.controls.ScrollBar

package fl.controls
{
    import fl.core.UIComponent;
    import fl.events.ScrollEvent;
    import flash.events.MouseEvent;
    import fl.core.InvalidationType;
    import fl.events.ComponentEvent;

    public class ScrollBar extends UIComponent 
    {

        public static const WIDTH:Number = 15;
        private static var defaultStyles:Object = {
            "downArrowDisabledSkin":"ScrollArrowDown_disabledSkin",
            "downArrowDownSkin":"ScrollArrowDown_downSkin",
            "downArrowOverSkin":"ScrollArrowDown_overSkin",
            "downArrowUpSkin":"ScrollArrowDown_upSkin",
            "thumbDisabledSkin":"ScrollThumb_upSkin",
            "thumbDownSkin":"ScrollThumb_downSkin",
            "thumbOverSkin":"ScrollThumb_overSkin",
            "thumbUpSkin":"ScrollThumb_upSkin",
            "trackDisabledSkin":"ScrollTrack_skin",
            "trackDownSkin":"ScrollTrack_skin",
            "trackOverSkin":"ScrollTrack_skin",
            "trackUpSkin":"ScrollTrack_skin",
            "upArrowDisabledSkin":"ScrollArrowUp_disabledSkin",
            "upArrowDownSkin":"ScrollArrowUp_downSkin",
            "upArrowOverSkin":"ScrollArrowUp_overSkin",
            "upArrowUpSkin":"ScrollArrowUp_upSkin",
            "thumbIcon":"ScrollBar_thumbIcon",
            "repeatDelay":500,
            "repeatInterval":35
        };
        protected static const DOWN_ARROW_STYLES:Object = {
            "disabledSkin":"downArrowDisabledSkin",
            "downSkin":"downArrowDownSkin",
            "overSkin":"downArrowOverSkin",
            "upSkin":"downArrowUpSkin",
            "repeatDelay":"repeatDelay",
            "repeatInterval":"repeatInterval"
        };
        protected static const THUMB_STYLES:Object = {
            "disabledSkin":"thumbDisabledSkin",
            "downSkin":"thumbDownSkin",
            "overSkin":"thumbOverSkin",
            "upSkin":"thumbUpSkin",
            "icon":"thumbIcon",
            "textPadding":0
        };
        protected static const TRACK_STYLES:Object = {
            "disabledSkin":"trackDisabledSkin",
            "downSkin":"trackDownSkin",
            "overSkin":"trackOverSkin",
            "upSkin":"trackUpSkin",
            "repeatDelay":"repeatDelay",
            "repeatInterval":"repeatInterval"
        };
        protected static const UP_ARROW_STYLES:Object = {
            "disabledSkin":"upArrowDisabledSkin",
            "downSkin":"upArrowDownSkin",
            "overSkin":"upArrowOverSkin",
            "upSkin":"upArrowUpSkin",
            "repeatDelay":"repeatDelay",
            "repeatInterval":"repeatInterval"
        };

        protected var upArrow:BaseButton;
        protected var downArrow:BaseButton;
        private var thumbScrollOffset:Number;
        protected var track:BaseButton;
        protected var thumb:LabelButton;

        private var _pageSize:Number = 10;
        private var _pageScrollSize:Number = 0;
        private var _lineScrollSize:Number = 1;
        private var _minScrollPosition:Number = 0;
        private var _maxScrollPosition:Number = 0;
        private var _scrollPosition:Number = 0;
        private var _direction:String = ScrollBarDirection.VERTICAL;//"vertical"
        protected var inDrag:Boolean = false;

        public function ScrollBar()
        {
            setStyles();
            focusEnabled = false;
        }

        public static function getStyleDefinition():Object
        {
            return (defaultStyles);
        }


        public function get minScrollPosition():Number
        {
            return (_minScrollPosition);
        }

        public function set minScrollPosition(_arg_1:Number):void
        {
            setScrollProperties(_pageSize, _arg_1, _maxScrollPosition);
        }

        public function setScrollPosition(_arg_1:Number, _arg_2:Boolean=true):void
        {
            var _local_3:Number;
            _local_3 = scrollPosition;
            _scrollPosition = Math.max(_minScrollPosition, Math.min(_maxScrollPosition, _arg_1));
            if (_local_3 == _scrollPosition)
            {
                return;
            };
            if (_arg_2)
            {
                dispatchEvent(new ScrollEvent(_direction, (scrollPosition - _local_3), scrollPosition));
            };
            updateThumb();
        }

        public function set scrollPosition(_arg_1:Number):void
        {
            setScrollPosition(_arg_1, true);
        }

        public function get pageScrollSize():Number
        {
            return ((_pageScrollSize == 0) ? _pageSize : _pageScrollSize);
        }

        public function set pageSize(_arg_1:Number):void
        {
            if (_arg_1 > 0)
            {
                _pageSize = _arg_1;
            };
        }

        public function setScrollProperties(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number=0):void
        {
            this.pageSize = _arg_1;
            _minScrollPosition = _arg_2;
            _maxScrollPosition = _arg_3;
            if (_arg_4 >= 0)
            {
                _pageScrollSize = _arg_4;
            };
            enabled = (_maxScrollPosition > _minScrollPosition);
            setScrollPosition(_scrollPosition, false);
            updateThumb();
        }

        override public function set enabled(_arg_1:Boolean):void
        {
            super.enabled = _arg_1;
            downArrow.enabled = (track.enabled = (thumb.enabled = (upArrow.enabled = ((enabled) && (_maxScrollPosition > _minScrollPosition)))));
            updateThumb();
        }

        protected function updateThumb():void
        {
            var _local_1:Number;
            _local_1 = ((_maxScrollPosition - _minScrollPosition) + _pageSize);
            if ((((track.height <= 12) || (_maxScrollPosition <= _minScrollPosition)) || ((_local_1 == 0) || (isNaN(_local_1)))))
            {
                thumb.height = 12;
                thumb.visible = false;
            }
            else
            {
                thumb.height = Math.max(13, ((_pageSize / _local_1) * track.height));
                thumb.y = (track.y + ((track.height - thumb.height) * ((_scrollPosition - _minScrollPosition) / (_maxScrollPosition - _minScrollPosition))));
                thumb.visible = enabled;
            };
        }

        protected function thumbPressHandler(_arg_1:MouseEvent):void
        {
            inDrag = true;
            thumbScrollOffset = (mouseY - thumb.y);
            thumb.mouseStateLocked = true;
            mouseChildren = false;
            stage.addEventListener(MouseEvent.MOUSE_MOVE, handleThumbDrag, false, 0, true);
            stage.addEventListener(MouseEvent.MOUSE_UP, thumbReleaseHandler, false, 0, true);
        }

        protected function thumbReleaseHandler(_arg_1:MouseEvent):void
        {
            inDrag = false;
            mouseChildren = true;
            thumb.mouseStateLocked = false;
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, handleThumbDrag);
            stage.removeEventListener(MouseEvent.MOUSE_UP, thumbReleaseHandler);
        }

        public function set pageScrollSize(_arg_1:Number):void
        {
            if (_arg_1 >= 0)
            {
                _pageScrollSize = _arg_1;
            };
        }

        protected function handleThumbDrag(_arg_1:MouseEvent):void
        {
            var _local_2:Number;
            _local_2 = Math.max(0, Math.min((track.height - thumb.height), ((mouseY - track.y) - thumbScrollOffset)));
            setScrollPosition((((_local_2 / (track.height - thumb.height)) * (_maxScrollPosition - _minScrollPosition)) + _minScrollPosition));
        }

        public function set direction(_arg_1:String):void
        {
            var _local_2:Boolean;
            if (_direction == _arg_1)
            {
                return;
            };
            _direction = _arg_1;
            if (isLivePreview)
            {
                return;
            };
            setScaleY(1);
            _local_2 = (_direction == ScrollBarDirection.HORIZONTAL);
            if (((_local_2) && (componentInspectorSetting)))
            {
                if (rotation == 90)
                {
                    return;
                };
                setScaleX(-1);
                rotation = -90;
            };
            if (!componentInspectorSetting)
            {
                if (((_local_2) && (rotation == 0)))
                {
                    rotation = -90;
                    setScaleX(-1);
                }
                else
                {
                    if (((!(_local_2)) && (rotation == -90)))
                    {
                        rotation = 0;
                        setScaleX(1);
                    };
                };
            };
            invalidate(InvalidationType.SIZE);
        }

        public function set lineScrollSize(_arg_1:Number):void
        {
            if (_arg_1 > 0)
            {
                _lineScrollSize = _arg_1;
            };
        }

        override public function get height():Number
        {
            return ((_direction == ScrollBarDirection.HORIZONTAL) ? super.width : super.height);
        }

        protected function scrollPressHandler(_arg_1:ComponentEvent):void
        {
            var _local_2:Number;
            var _local_3:Number;
            _arg_1.stopImmediatePropagation();
            if (_arg_1.currentTarget == upArrow)
            {
                setScrollPosition((_scrollPosition - _lineScrollSize));
            }
            else
            {
                if (_arg_1.currentTarget == downArrow)
                {
                    setScrollPosition((_scrollPosition + _lineScrollSize));
                }
                else
                {
                    _local_2 = (((track.mouseY / track.height) * (_maxScrollPosition - _minScrollPosition)) + _minScrollPosition);
                    _local_3 = ((pageScrollSize == 0) ? pageSize : pageScrollSize);
                    if (_scrollPosition < _local_2)
                    {
                        setScrollPosition(Math.min(_local_2, (_scrollPosition + _local_3)));
                    }
                    else
                    {
                        if (_scrollPosition > _local_2)
                        {
                            setScrollPosition(Math.max(_local_2, (_scrollPosition - _local_3)));
                        };
                    };
                };
            };
        }

        public function get pageSize():Number
        {
            return (_pageSize);
        }

        public function set maxScrollPosition(_arg_1:Number):void
        {
            setScrollProperties(_pageSize, _minScrollPosition, _arg_1);
        }

        public function get scrollPosition():Number
        {
            return (_scrollPosition);
        }

        override public function get enabled():Boolean
        {
            return (super.enabled);
        }

        override protected function draw():void
        {
            var _local_1:Number;
            if (isInvalid(InvalidationType.SIZE))
            {
                _local_1 = super.height;
                downArrow.move(0, Math.max(upArrow.height, (_local_1 - downArrow.height)));
                track.setSize(WIDTH, Math.max(0, (_local_1 - (downArrow.height + upArrow.height))));
                updateThumb();
            };
            if (isInvalid(InvalidationType.STYLES, InvalidationType.STATE))
            {
                setStyles();
            };
            downArrow.drawNow();
            upArrow.drawNow();
            track.drawNow();
            thumb.drawNow();
            validate();
        }

        override protected function configUI():void
        {
            super.configUI();
            track = new BaseButton();
            track.move(0, 14);
            track.useHandCursor = false;
            track.autoRepeat = true;
            track.focusEnabled = false;
            addChild(track);
            thumb = new LabelButton();
            thumb.label = "";
            thumb.setSize(WIDTH, 15);
            thumb.move(0, 15);
            thumb.focusEnabled = false;
            addChild(thumb);
            downArrow = new BaseButton();
            downArrow.setSize(WIDTH, 14);
            downArrow.autoRepeat = true;
            downArrow.focusEnabled = false;
            addChild(downArrow);
            upArrow = new BaseButton();
            upArrow.setSize(WIDTH, 14);
            upArrow.move(0, 0);
            upArrow.autoRepeat = true;
            upArrow.focusEnabled = false;
            addChild(upArrow);
            upArrow.addEventListener(ComponentEvent.BUTTON_DOWN, scrollPressHandler, false, 0, true);
            downArrow.addEventListener(ComponentEvent.BUTTON_DOWN, scrollPressHandler, false, 0, true);
            track.addEventListener(ComponentEvent.BUTTON_DOWN, scrollPressHandler, false, 0, true);
            thumb.addEventListener(MouseEvent.MOUSE_DOWN, thumbPressHandler, false, 0, true);
            enabled = false;
        }

        public function get direction():String
        {
            return (_direction);
        }

        public function get lineScrollSize():Number
        {
            return (_lineScrollSize);
        }

        override public function setSize(_arg_1:Number, _arg_2:Number):void
        {
            if (_direction == ScrollBarDirection.HORIZONTAL)
            {
                super.setSize(_arg_2, _arg_1);
            }
            else
            {
                super.setSize(_arg_1, _arg_2);
            };
        }

        public function get maxScrollPosition():Number
        {
            return (_maxScrollPosition);
        }

        override public function get width():Number
        {
            return ((_direction == ScrollBarDirection.HORIZONTAL) ? super.height : super.width);
        }

        protected function setStyles():void
        {
            copyStylesToChild(downArrow, DOWN_ARROW_STYLES);
            copyStylesToChild(thumb, THUMB_STYLES);
            copyStylesToChild(track, TRACK_STYLES);
            copyStylesToChild(upArrow, UP_ARROW_STYLES);
        }


    }
}//package fl.controls

//------------------------------------------------------------
//fl.controls.ScrollBarDirection

package fl.controls
{
    public class ScrollBarDirection 
    {

        public static const VERTICAL:String = "vertical";
        public static const HORIZONTAL:String = "horizontal";


    }
}//package fl.controls

//------------------------------------------------------------
//fl.controls.ScrollPolicy

package fl.controls
{
    public class ScrollPolicy 
    {

        public static const ON:String = "on";
        public static const AUTO:String = "auto";
        public static const OFF:String = "off";


    }
}//package fl.controls

//------------------------------------------------------------
//fl.controls.SelectableList

package fl.controls
{
    import fl.containers.BaseScrollPane;
    import fl.managers.IFocusManagerComponent;
    import fl.controls.listClasses.CellRenderer;
    import flash.utils.Dictionary;
    import flash.display.Sprite;
    import fl.data.DataProvider;
    import fl.data.SimpleCollectionItem;
    import fl.core.InvalidationType;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;
    import fl.controls.listClasses.ICellRenderer;
    import fl.events.DataChangeType;
    import fl.events.DataChangeEvent;
    import flash.display.DisplayObject;
    import flash.events.Event;
    import fl.events.ScrollEvent;
    import fl.events.ListEvent;
    import flash.events.MouseEvent;

    public class SelectableList extends BaseScrollPane implements IFocusManagerComponent 
    {

        private static var defaultStyles:Object = {
            "skin":"List_skin",
            "cellRenderer":CellRenderer,
            "contentPadding":null,
            "disabledAlpha":null
        };
        public static var createAccessibilityImplementation:Function;

        protected var invalidItems:Dictionary;
        protected var renderedItems:Dictionary;
        protected var listHolder:Sprite;
        protected var _selectedIndices:Array;
        protected var availableCellRenderers:Array;
        protected var list:Sprite;
        protected var updatedRendererStyles:Object;
        protected var preChangeItems:Array;
        protected var activeCellRenderers:Array;
        protected var rendererStyles:Object;
        protected var _verticalScrollPosition:Number;
        protected var _dataProvider:DataProvider;
        protected var _horizontalScrollPosition:Number;
        private var collectionItemImport:SimpleCollectionItem;

        protected var _allowMultipleSelection:Boolean = false;
        protected var _selectable:Boolean = true;
        protected var caretIndex:int = -1;
        protected var lastCaretIndex:int = -1;

        public function SelectableList()
        {
            activeCellRenderers = [];
            availableCellRenderers = [];
            invalidItems = new Dictionary(true);
            renderedItems = new Dictionary(true);
            _selectedIndices = [];
            if (dataProvider == null)
            {
                dataProvider = new DataProvider();
            };
            verticalScrollPolicy = ScrollPolicy.AUTO;
            rendererStyles = {};
            updatedRendererStyles = {};
        }

        public static function getStyleDefinition():Object
        {
            return (mergeStyles(defaultStyles, BaseScrollPane.getStyleDefinition()));
        }


        protected function drawList():void
        {
        }

        public function set allowMultipleSelection(_arg_1:Boolean):void
        {
            if (_arg_1 == _allowMultipleSelection)
            {
                return;
            };
            _allowMultipleSelection = _arg_1;
            if (((!(_arg_1)) && (_selectedIndices.length > 1)))
            {
                _selectedIndices = [_selectedIndices.pop()];
                invalidate(InvalidationType.DATA);
            };
        }

        public function sortItemsOn(_arg_1:String, _arg_2:Object=null):*
        {
            return (_dataProvider.sortOn(_arg_1, _arg_2));
        }

        public function removeItemAt(_arg_1:uint):Object
        {
            return (_dataProvider.removeItemAt(_arg_1));
        }

        public function get selectedItem():Object
        {
            return ((_selectedIndices.length == 0) ? null : _dataProvider.getItemAt(selectedIndex));
        }

        override protected function keyDownHandler(_arg_1:KeyboardEvent):void
        {
            if (!selectable)
            {
                return;
            };
            switch (_arg_1.keyCode)
            {
                case Keyboard.UP:
                case Keyboard.DOWN:
                case Keyboard.END:
                case Keyboard.HOME:
                case Keyboard.PAGE_UP:
                case Keyboard.PAGE_DOWN:
                    moveSelectionVertically(_arg_1.keyCode, ((_arg_1.shiftKey) && (_allowMultipleSelection)), ((_arg_1.ctrlKey) && (_allowMultipleSelection)));
                    _arg_1.stopPropagation();
                    return;
                case Keyboard.LEFT:
                case Keyboard.RIGHT:
                    moveSelectionHorizontally(_arg_1.keyCode, ((_arg_1.shiftKey) && (_allowMultipleSelection)), ((_arg_1.ctrlKey) && (_allowMultipleSelection)));
                    _arg_1.stopPropagation();
                    return;
            };
        }

        public function get selectable():Boolean
        {
            return (_selectable);
        }

        public function itemToCellRenderer(_arg_1:Object):ICellRenderer
        {
            var _local_2:*;
            var _local_3:ICellRenderer;
            if (_arg_1 != null)
            {
                for (_local_2 in activeCellRenderers)
                {
                    _local_3 = (activeCellRenderers[_local_2] as ICellRenderer);
                    if (_local_3.data == _arg_1)
                    {
                        return (_local_3);
                    };
                };
            };
            return (null);
        }

        public function getNextIndexAtLetter(_arg_1:String, _arg_2:int=-1):int
        {
            var _local_3:int;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:Object;
            var _local_7:String;
            if (length == 0)
            {
                return (-1);
            };
            _arg_1 = _arg_1.toUpperCase();
            _local_3 = (length - 1);
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_5 = ((_arg_2 + 1) + _local_4);
                if (_local_5 > (length - 1))
                {
                    _local_5 = (_local_5 - length);
                };
                _local_6 = getItemAt(_local_5);
                if (_local_6 == null) break;
                _local_7 = itemToLabel(_local_6);
                if (_local_7 != null)
                {
                    if (_local_7.charAt(0).toUpperCase() == _arg_1)
                    {
                        return (_local_5);
                    };
                };
                _local_4++;
            };
            return (-1);
        }

        public function invalidateList():void
        {
            _invalidateList();
            invalidate(InvalidationType.DATA);
        }

        override public function set enabled(_arg_1:Boolean):void
        {
            super.enabled = _arg_1;
            list.mouseChildren = _enabled;
        }

        public function get selectedIndices():Array
        {
            return (_selectedIndices.concat());
        }

        public function set selectable(_arg_1:Boolean):void
        {
            if (_arg_1 == _selectable)
            {
                return;
            };
            if (!_arg_1)
            {
                selectedIndices = [];
            };
            _selectable = _arg_1;
        }

        public function itemToLabel(_arg_1:Object):String
        {
            return (_arg_1["label"]);
        }

        public function addItemAt(_arg_1:Object, _arg_2:uint):void
        {
            _dataProvider.addItemAt(_arg_1, _arg_2);
            invalidateList();
        }

        public function replaceItemAt(_arg_1:Object, _arg_2:uint):Object
        {
            return (_dataProvider.replaceItemAt(_arg_1, _arg_2));
        }

        protected function handleDataChange(_arg_1:DataChangeEvent):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:String;
            var _local_5:uint;
            _local_2 = _arg_1.startIndex;
            _local_3 = _arg_1.endIndex;
            _local_4 = _arg_1.changeType;
            if (_local_4 == DataChangeType.INVALIDATE_ALL)
            {
                clearSelection();
                invalidateList();
            }
            else
            {
                if (_local_4 == DataChangeType.INVALIDATE)
                {
                    _local_5 = 0;
                    while (_local_5 < _arg_1.items.length)
                    {
                        invalidateItem(_arg_1.items[_local_5]);
                        _local_5++;
                    };
                }
                else
                {
                    if (_local_4 == DataChangeType.ADD)
                    {
                        _local_5 = 0;
                        while (_local_5 < _selectedIndices.length)
                        {
                            if (_selectedIndices[_local_5] >= _local_2)
                            {
                                _selectedIndices[_local_5] = (_selectedIndices[_local_5] + (_local_2 - _local_3));
                            };
                            _local_5++;
                        };
                    }
                    else
                    {
                        if (_local_4 == DataChangeType.REMOVE)
                        {
                            _local_5 = 0;
                            while (_local_5 < _selectedIndices.length)
                            {
                                if (_selectedIndices[_local_5] >= _local_2)
                                {
                                    if (_selectedIndices[_local_5] <= _local_3)
                                    {
                                        delete _selectedIndices[_local_5];
                                    }
                                    else
                                    {
                                        _selectedIndices[_local_5] = (_selectedIndices[_local_5] - ((_local_2 - _local_3) + 1));
                                    };
                                };
                                _local_5++;
                            };
                        }
                        else
                        {
                            if (_local_4 == DataChangeType.REMOVE_ALL)
                            {
                                clearSelection();
                            }
                            else
                            {
                                if (_local_4 != DataChangeType.REPLACE)
                                {
                                    selectedItems = preChangeItems;
                                    preChangeItems = null;
                                };
                            };
                        };
                    };
                };
            };
            invalidate(InvalidationType.DATA);
        }

        protected function _invalidateList():void
        {
            availableCellRenderers = [];
            while (activeCellRenderers.length > 0)
            {
                list.removeChild((activeCellRenderers.pop() as DisplayObject));
            };
        }

        protected function updateRendererStyles():void
        {
            var _local_1:Array;
            var _local_2:uint;
            var _local_3:uint;
            var _local_4:String;
            _local_1 = availableCellRenderers.concat(activeCellRenderers);
            _local_2 = _local_1.length;
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                if (_local_1[_local_3].setStyle != null)
                {
                    for (_local_4 in updatedRendererStyles)
                    {
                        _local_1[_local_3].setStyle(_local_4, updatedRendererStyles[_local_4]);
                    };
                    _local_1[_local_3].drawNow();
                };
                _local_3++;
            };
            updatedRendererStyles = {};
        }

        public function set selectedItem(_arg_1:Object):void
        {
            var _local_2:int;
            _local_2 = _dataProvider.getItemIndex(_arg_1);
            selectedIndex = _local_2;
        }

        public function sortItems(... _args):*
        {
            return (_dataProvider.sort.apply(_dataProvider, _args));
        }

        public function removeAll():void
        {
            _dataProvider.removeAll();
        }

        protected function handleCellRendererChange(_arg_1:Event):void
        {
            var _local_2:ICellRenderer;
            var _local_3:uint;
            _local_2 = (_arg_1.currentTarget as ICellRenderer);
            _local_3 = _local_2.listData.index;
            _dataProvider.invalidateItemAt(_local_3);
        }

        protected function moveSelectionVertically(_arg_1:uint, _arg_2:Boolean, _arg_3:Boolean):void
        {
        }

        override protected function setHorizontalScrollPosition(_arg_1:Number, _arg_2:Boolean=false):void
        {
            var _local_3:Number;
            if (_arg_1 == _horizontalScrollPosition)
            {
                return;
            };
            _local_3 = (_arg_1 - _horizontalScrollPosition);
            _horizontalScrollPosition = _arg_1;
            if (_arg_2)
            {
                dispatchEvent(new ScrollEvent(ScrollBarDirection.HORIZONTAL, _local_3, _arg_1));
            };
        }

        public function scrollToSelected():void
        {
            scrollToIndex(selectedIndex);
        }

        public function invalidateItem(_arg_1:Object):void
        {
            if (renderedItems[_arg_1] == null)
            {
                return;
            };
            invalidItems[_arg_1] = true;
            invalidate(InvalidationType.DATA);
        }

        protected function handleCellRendererClick(_arg_1:MouseEvent):void
        {
            var _local_2:ICellRenderer;
            var _local_3:uint;
            var _local_4:int;
            var _local_5:int;
            var _local_6:uint;
            if (!_enabled)
            {
                return;
            };
            _local_2 = (_arg_1.currentTarget as ICellRenderer);
            _local_3 = _local_2.listData.index;
            if (((!(dispatchEvent(new ListEvent(ListEvent.ITEM_CLICK, false, true, _local_2.listData.column, _local_2.listData.row, _local_3, _local_2.data)))) || (!(_selectable))))
            {
                return;
            };
            _local_4 = selectedIndices.indexOf(_local_3);
            if (!_allowMultipleSelection)
            {
                if (_local_4 != -1)
                {
                    return;
                };
                _local_2.selected = true;
                _selectedIndices = [_local_3];
                lastCaretIndex = (caretIndex = _local_3);
            }
            else
            {
                if (_arg_1.shiftKey)
                {
                    _local_6 = ((_selectedIndices.length > 0) ? _selectedIndices[0] : _local_3);
                    _selectedIndices = [];
                    if (_local_6 > _local_3)
                    {
                        _local_5 = _local_6;
                        while (_local_5 >= _local_3)
                        {
                            _selectedIndices.push(_local_5);
                            _local_5--;
                        };
                    }
                    else
                    {
                        _local_5 = _local_6;
                        while (_local_5 <= _local_3)
                        {
                            _selectedIndices.push(_local_5);
                            _local_5++;
                        };
                    };
                    caretIndex = _local_3;
                }
                else
                {
                    if (_arg_1.ctrlKey)
                    {
                        if (_local_4 != -1)
                        {
                            _local_2.selected = false;
                            _selectedIndices.splice(_local_4, 1);
                        }
                        else
                        {
                            _local_2.selected = true;
                            _selectedIndices.push(_local_3);
                        };
                        caretIndex = _local_3;
                    }
                    else
                    {
                        _selectedIndices = [_local_3];
                        lastCaretIndex = (caretIndex = _local_3);
                    };
                };
            };
            dispatchEvent(new Event(Event.CHANGE));
            invalidate(InvalidationType.DATA);
        }

        public function get length():uint
        {
            return (_dataProvider.length);
        }

        public function get allowMultipleSelection():Boolean
        {
            return (_allowMultipleSelection);
        }

        protected function onPreChange(_arg_1:DataChangeEvent):void
        {
            switch (_arg_1.changeType)
            {
                case DataChangeType.REMOVE:
                case DataChangeType.ADD:
                case DataChangeType.INVALIDATE:
                case DataChangeType.REMOVE_ALL:
                case DataChangeType.REPLACE:
                case DataChangeType.INVALIDATE_ALL:
                    return;
                default:
                    preChangeItems = selectedItems;
            };
        }

        public function getRendererStyle(_arg_1:String, _arg_2:int=-1):Object
        {
            return (rendererStyles[_arg_1]);
        }

        override protected function setVerticalScrollPosition(_arg_1:Number, _arg_2:Boolean=false):void
        {
            var _local_3:Number;
            if (_arg_1 == _verticalScrollPosition)
            {
                return;
            };
            _local_3 = (_arg_1 - _verticalScrollPosition);
            _verticalScrollPosition = _arg_1;
            if (_arg_2)
            {
                dispatchEvent(new ScrollEvent(ScrollBarDirection.VERTICAL, _local_3, _arg_1));
            };
        }

        protected function moveSelectionHorizontally(_arg_1:uint, _arg_2:Boolean, _arg_3:Boolean):void
        {
        }

        public function set selectedIndices(_arg_1:Array):void
        {
            if (!_selectable)
            {
                return;
            };
            _selectedIndices = ((_arg_1 == null) ? [] : _arg_1.concat());
            invalidate(InvalidationType.SELECTED);
        }

        public function get selectedIndex():int
        {
            return ((_selectedIndices.length == 0) ? -1 : _selectedIndices[(_selectedIndices.length - 1)]);
        }

        override protected function draw():void
        {
            super.draw();
        }

        override protected function configUI():void
        {
            super.configUI();
            listHolder = new Sprite();
            addChild(listHolder);
            listHolder.scrollRect = contentScrollRect;
            list = new Sprite();
            listHolder.addChild(list);
        }

        public function addItem(_arg_1:Object):void
        {
            _dataProvider.addItem(_arg_1);
            invalidateList();
        }

        protected function handleCellRendererMouseEvent(_arg_1:MouseEvent):void
        {
            var _local_2:ICellRenderer;
            var _local_3:String;
            _local_2 = (_arg_1.target as ICellRenderer);
            _local_3 = ((_arg_1.type == MouseEvent.ROLL_OVER) ? ListEvent.ITEM_ROLL_OVER : ListEvent.ITEM_ROLL_OUT);
            dispatchEvent(new ListEvent(_local_3, false, false, _local_2.listData.column, _local_2.listData.row, _local_2.listData.index, _local_2.data));
        }

        public function clearRendererStyle(_arg_1:String, _arg_2:int=-1):void
        {
            delete rendererStyles[_arg_1];
            updatedRendererStyles[_arg_1] = null;
            invalidate(InvalidationType.RENDERER_STYLES);
        }

        protected function handleCellRendererDoubleClick(_arg_1:MouseEvent):void
        {
            var _local_2:ICellRenderer;
            var _local_3:uint;
            if (!_enabled)
            {
                return;
            };
            _local_2 = (_arg_1.currentTarget as ICellRenderer);
            _local_3 = _local_2.listData.index;
            dispatchEvent(new ListEvent(ListEvent.ITEM_DOUBLE_CLICK, false, true, _local_2.listData.column, _local_2.listData.row, _local_3, _local_2.data));
        }

        public function get rowCount():uint
        {
            return (0);
        }

        public function isItemSelected(_arg_1:Object):Boolean
        {
            return (selectedItems.indexOf(_arg_1) > -1);
        }

        public function set dataProvider(_arg_1:DataProvider):void
        {
            if (_dataProvider != null)
            {
                _dataProvider.removeEventListener(DataChangeEvent.DATA_CHANGE, handleDataChange);
                _dataProvider.removeEventListener(DataChangeEvent.PRE_DATA_CHANGE, onPreChange);
            };
            _dataProvider = _arg_1;
            _dataProvider.addEventListener(DataChangeEvent.DATA_CHANGE, handleDataChange, false, 0, true);
            _dataProvider.addEventListener(DataChangeEvent.PRE_DATA_CHANGE, onPreChange, false, 0, true);
            clearSelection();
            invalidateList();
        }

        override protected function drawLayout():void
        {
            super.drawLayout();
            contentScrollRect = listHolder.scrollRect;
            contentScrollRect.width = availableWidth;
            contentScrollRect.height = availableHeight;
            listHolder.scrollRect = contentScrollRect;
        }

        public function getItemAt(_arg_1:uint):Object
        {
            return (_dataProvider.getItemAt(_arg_1));
        }

        override protected function initializeAccessibility():void
        {
            if (SelectableList.createAccessibilityImplementation != null)
            {
                SelectableList.createAccessibilityImplementation(this);
            };
        }

        public function scrollToIndex(_arg_1:int):void
        {
        }

        public function removeItem(_arg_1:Object):Object
        {
            return (_dataProvider.removeItem(_arg_1));
        }

        public function get dataProvider():DataProvider
        {
            return (_dataProvider);
        }

        public function set maxHorizontalScrollPosition(_arg_1:Number):void
        {
            _maxHorizontalScrollPosition = _arg_1;
            invalidate(InvalidationType.SIZE);
        }

        public function setRendererStyle(_arg_1:String, _arg_2:Object, _arg_3:uint=0):void
        {
            if (rendererStyles[_arg_1] == _arg_2)
            {
                return;
            };
            updatedRendererStyles[_arg_1] = _arg_2;
            rendererStyles[_arg_1] = _arg_2;
            invalidate(InvalidationType.RENDERER_STYLES);
        }

        public function invalidateItemAt(_arg_1:uint):void
        {
            var _local_2:Object;
            _local_2 = _dataProvider.getItemAt(_arg_1);
            if (_local_2 != null)
            {
                invalidateItem(_local_2);
            };
        }

        public function set selectedItems(_arg_1:Array):void
        {
            var _local_2:Array;
            var _local_3:uint;
            var _local_4:int;
            if (_arg_1 == null)
            {
                selectedIndices = null;
                return;
            };
            _local_2 = [];
            _local_3 = 0;
            while (_local_3 < _arg_1.length)
            {
                _local_4 = _dataProvider.getItemIndex(_arg_1[_local_3]);
                if (_local_4 != -1)
                {
                    _local_2.push(_local_4);
                };
                _local_3++;
            };
            selectedIndices = _local_2;
        }

        public function clearSelection():void
        {
            selectedIndex = -1;
        }

        override public function get maxHorizontalScrollPosition():Number
        {
            return (_maxHorizontalScrollPosition);
        }

        public function get selectedItems():Array
        {
            var _local_1:Array;
            var _local_2:uint;
            _local_1 = [];
            _local_2 = 0;
            while (_local_2 < _selectedIndices.length)
            {
                _local_1.push(_dataProvider.getItemAt(_selectedIndices[_local_2]));
                _local_2++;
            };
            return (_local_1);
        }

        public function set selectedIndex(_arg_1:int):void
        {
            selectedIndices = ((_arg_1 == -1) ? null : [_arg_1]);
        }


    }
}//package fl.controls

//------------------------------------------------------------
//fl.controls.UIScrollBar

package fl.controls
{
    import flash.text.TextField;
    import fl.core.UIComponent;
    import flash.events.Event;
    import fl.events.ScrollEvent;
    import fl.core.InvalidationType;
    import flash.events.TextEvent;

    public class UIScrollBar extends ScrollBar 
    {

        private static var defaultStyles:Object = {};

        protected var _scrollTarget:TextField;

        protected var inEdit:Boolean = false;
        protected var inScroll:Boolean = false;


        public static function getStyleDefinition():Object
        {
            return (UIComponent.mergeStyles(defaultStyles, ScrollBar.getStyleDefinition()));
        }


        protected function handleTargetScroll(_arg_1:Event):void
        {
            if (inDrag)
            {
                return;
            };
            if (!enabled)
            {
                return;
            };
            inEdit = true;
            updateScrollTargetProperties();
            scrollPosition = ((direction == ScrollBarDirection.HORIZONTAL) ? _scrollTarget.scrollH : _scrollTarget.scrollV);
            inEdit = false;
        }

        override public function set minScrollPosition(_arg_1:Number):void
        {
            super.minScrollPosition = ((_arg_1 < 0) ? 0 : _arg_1);
        }

        override public function setScrollPosition(_arg_1:Number, _arg_2:Boolean=true):void
        {
            super.setScrollPosition(_arg_1, _arg_2);
            if (!_scrollTarget)
            {
                inScroll = false;
                return;
            };
            updateTargetScroll();
        }

        override public function setScrollProperties(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number=0):void
        {
            var _local_5:Number;
            var _local_6:Number;
            _local_5 = _arg_3;
            _local_6 = ((_arg_2 < 0) ? 0 : _arg_2);
            if (_scrollTarget != null)
            {
                if (direction == ScrollBarDirection.HORIZONTAL)
                {
                    _local_5 = ((_arg_3 > _scrollTarget.maxScrollH) ? _scrollTarget.maxScrollH : _local_5);
                }
                else
                {
                    _local_5 = ((_arg_3 > _scrollTarget.maxScrollV) ? _scrollTarget.maxScrollV : _local_5);
                };
            };
            super.setScrollProperties(_arg_1, _local_6, _local_5, _arg_4);
        }

        public function get scrollTargetName():String
        {
            return (_scrollTarget.name);
        }

        public function get scrollTarget():TextField
        {
            return (_scrollTarget);
        }

        protected function updateScrollTargetProperties():void
        {
            var _local_1:Boolean;
            var _local_2:Number;
            if (_scrollTarget == null)
            {
                setScrollProperties(pageSize, minScrollPosition, maxScrollPosition, pageScrollSize);
                scrollPosition = 0;
            }
            else
            {
                _local_1 = (direction == ScrollBarDirection.HORIZONTAL);
                _local_2 = ((_local_1) ? _scrollTarget.width : 10);
                setScrollProperties(_local_2, ((_local_1) ? 0 : 1), ((_local_1) ? _scrollTarget.maxScrollH : _scrollTarget.maxScrollV), pageScrollSize);
                scrollPosition = ((_local_1) ? _scrollTarget.scrollH : _scrollTarget.scrollV);
            };
        }

        public function update():void
        {
            inEdit = true;
            updateScrollTargetProperties();
            inEdit = false;
        }

        public function set scrollTargetName(target:String):void
        {
            try
            {
                scrollTarget = (parent.getChildByName(target) as TextField);
            }
            catch(error:Error)
            {
                throw (new Error("ScrollTarget not found, or is not a TextField"));
            };
        }

        override public function set direction(_arg_1:String):void
        {
            if (isLivePreview)
            {
                return;
            };
            super.direction = _arg_1;
            updateScrollTargetProperties();
        }

        protected function handleTargetChange(_arg_1:Event):void
        {
            inEdit = true;
            setScrollPosition(((direction == ScrollBarDirection.HORIZONTAL) ? _scrollTarget.scrollH : _scrollTarget.scrollV), true);
            updateScrollTargetProperties();
            inEdit = false;
        }

        override public function set maxScrollPosition(_arg_1:Number):void
        {
            var _local_2:Number;
            _local_2 = _arg_1;
            if (_scrollTarget != null)
            {
                if (direction == ScrollBarDirection.HORIZONTAL)
                {
                    _local_2 = ((_local_2 > _scrollTarget.maxScrollH) ? _scrollTarget.maxScrollH : _local_2);
                }
                else
                {
                    _local_2 = ((_local_2 > _scrollTarget.maxScrollV) ? _scrollTarget.maxScrollV : _local_2);
                };
            };
            super.maxScrollPosition = _local_2;
        }

        protected function updateTargetScroll(_arg_1:ScrollEvent=null):void
        {
            if (inEdit)
            {
                return;
            };
            if (direction == ScrollBarDirection.HORIZONTAL)
            {
                _scrollTarget.scrollH = scrollPosition;
            }
            else
            {
                _scrollTarget.scrollV = scrollPosition;
            };
        }

        override protected function draw():void
        {
            if (isInvalid(InvalidationType.DATA))
            {
                updateScrollTargetProperties();
            };
            super.draw();
        }

        public function set scrollTarget(_arg_1:TextField):void
        {
            if (_scrollTarget != null)
            {
                _scrollTarget.removeEventListener(Event.CHANGE, handleTargetChange, false);
                _scrollTarget.removeEventListener(TextEvent.TEXT_INPUT, handleTargetChange, false);
                _scrollTarget.removeEventListener(Event.SCROLL, handleTargetScroll, false);
                removeEventListener(ScrollEvent.SCROLL, updateTargetScroll, false);
            };
            _scrollTarget = _arg_1;
            if (_scrollTarget != null)
            {
                _scrollTarget.addEventListener(Event.CHANGE, handleTargetChange, false, 0, true);
                _scrollTarget.addEventListener(TextEvent.TEXT_INPUT, handleTargetChange, false, 0, true);
                _scrollTarget.addEventListener(Event.SCROLL, handleTargetScroll, false, 0, true);
                addEventListener(ScrollEvent.SCROLL, updateTargetScroll, false, 0, true);
            };
            invalidate(InvalidationType.DATA);
        }

        override public function get direction():String
        {
            return (super.direction);
        }


    }
}//package fl.controls

//------------------------------------------------------------
//fl.core.ComponentShim

package fl.core
{
    import flash.display.MovieClip;

    public dynamic class ComponentShim extends MovieClip 
    {


    }
}//package fl.core

//------------------------------------------------------------
//fl.core.InvalidationType

package fl.core
{
    public class InvalidationType 
    {

        public static const ALL:String = "all";
        public static const SIZE:String = "size";
        public static const STYLES:String = "styles";
        public static const RENDERER_STYLES:String = "rendererStyles";
        public static const STATE:String = "state";
        public static const DATA:String = "data";
        public static const SCROLL:String = "scroll";
        public static const SELECTED:String = "selected";


    }
}//package fl.core

//------------------------------------------------------------
//fl.core.UIComponent

package fl.core
{
    import flash.display.Sprite;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;
    import flash.utils.Dictionary;
    import fl.managers.IFocusManagerComponent;
    import flash.display.DisplayObject;
    import flash.text.TextField;
    import fl.managers.StyleManager;
    import flash.events.FocusEvent;
    import flash.events.KeyboardEvent;
    import flash.events.Event;
    import fl.managers.IFocusManager;
    import flash.system.IME;
    import flash.system.IMEConversionMode;
    import flash.utils.getDefinitionByName;
    import fl.managers.FocusManager;
    import fl.events.ComponentEvent;
    import flash.utils.getQualifiedClassName;
    import flash.display.InteractiveObject;

    public class UIComponent extends Sprite 
    {

        public static var inCallLaterPhase:Boolean = false;
        private static var defaultStyles:Object = {
            "focusRectSkin":"focusRectSkin",
            "focusRectPadding":2,
            "textFormat":new TextFormat("_sans", 11, 0, false, false, false, "", "", TextFormatAlign.LEFT, 0, 0, 0, 0),
            "disabledTextFormat":new TextFormat("_sans", 11, 0x999999, false, false, false, "", "", TextFormatAlign.LEFT, 0, 0, 0, 0),
            "defaultTextFormat":new TextFormat("_sans", 11, 0, false, false, false, "", "", TextFormatAlign.LEFT, 0, 0, 0, 0),
            "defaultDisabledTextFormat":new TextFormat("_sans", 11, 0x999999, false, false, false, "", "", TextFormatAlign.LEFT, 0, 0, 0, 0)
        };
        private static var focusManagers:Dictionary = new Dictionary(false);
        public static var createAccessibilityImplementation:Function;

        protected var startHeight:Number;
        protected var _height:Number;
        protected var startWidth:Number;
        public var focusTarget:IFocusManagerComponent;
        protected var uiFocusRect:DisplayObject;
        protected var _width:Number;
        protected var callLaterMethods:Dictionary;
        private var tempText:TextField;
        protected var sharedStyles:Object;
        protected var invalidHash:Object;
        protected var instanceStyles:Object;
        protected var _x:Number;
        protected var _y:Number;

        public var version:String = "3.0.0.15";
        protected var isLivePreview:Boolean = false;
        protected var invalidateFlag:Boolean = false;
        protected var _enabled:Boolean = true;
        protected var isFocused:Boolean = false;
        private var _focusEnabled:Boolean = true;
        private var _mouseFocusEnabled:Boolean = true;
        protected var _imeMode:String = null;
        protected var _oldIMEMode:String = null;
        protected var errorCaught:Boolean = false;
        protected var _inspector:Boolean = false;

        public function UIComponent()
        {
            instanceStyles = {};
            sharedStyles = {};
            invalidHash = {};
            callLaterMethods = new Dictionary();
            StyleManager.registerInstance(this);
            configUI();
            invalidate(InvalidationType.ALL);
            tabEnabled = (this is IFocusManagerComponent);
            focusRect = false;
            if (tabEnabled)
            {
                addEventListener(FocusEvent.FOCUS_IN, focusInHandler);
                addEventListener(FocusEvent.FOCUS_OUT, focusOutHandler);
                addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
                addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
            };
            initializeFocusManager();
            addEventListener(Event.ENTER_FRAME, hookAccessibility, false, 0, true);
        }

        public static function getStyleDefinition():Object
        {
            return (defaultStyles);
        }

        public static function mergeStyles(... _args):Object
        {
            var _local_2:Object;
            var _local_3:uint;
            var _local_4:uint;
            var _local_5:Object;
            var _local_6:String;
            _local_2 = {};
            _local_3 = _args.length;
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_5 = _args[_local_4];
                for (_local_6 in _local_5)
                {
                    if (_local_2[_local_6] == null)
                    {
                        _local_2[_local_6] = _args[_local_4][_local_6];
                    };
                };
                _local_4++;
            };
            return (_local_2);
        }


        public function drawFocus(_arg_1:Boolean):void
        {
            var _local_2:Number;
            isFocused = _arg_1;
            if (((!(uiFocusRect == null)) && (contains(uiFocusRect))))
            {
                removeChild(uiFocusRect);
                uiFocusRect = null;
            };
            if (_arg_1)
            {
                uiFocusRect = (getDisplayObjectInstance(getStyleValue("focusRectSkin")) as Sprite);
                if (uiFocusRect == null)
                {
                    return;
                };
                _local_2 = Number(getStyleValue("focusRectPadding"));
                uiFocusRect.x = -(_local_2);
                uiFocusRect.y = -(_local_2);
                uiFocusRect.width = (width + (_local_2 * 2));
                uiFocusRect.height = (height + (_local_2 * 2));
                addChildAt(uiFocusRect, 0);
            };
        }

        private function callLaterDispatcher(_arg_1:Event):void
        {
            var _local_2:Dictionary;
            var _local_3:Object;
            if (_arg_1.type == Event.ADDED_TO_STAGE)
            {
                removeEventListener(Event.ADDED_TO_STAGE, callLaterDispatcher);
                stage.addEventListener(Event.RENDER, callLaterDispatcher, false, 0, true);
                stage.invalidate();
                return;
            };
            _arg_1.target.removeEventListener(Event.RENDER, callLaterDispatcher);
            if (stage == null)
            {
                addEventListener(Event.ADDED_TO_STAGE, callLaterDispatcher, false, 0, true);
                return;
            };
            inCallLaterPhase = true;
            _local_2 = callLaterMethods;
            for (_local_3 in _local_2)
            {
                (_local_3());
                delete _local_2[_local_3];
            };
            inCallLaterPhase = false;
        }

        private function addedHandler(_arg_1:Event):void
        {
            removeEventListener("addedToStage", addedHandler);
            initializeFocusManager();
        }

        protected function getStyleValue(_arg_1:String):Object
        {
            return ((instanceStyles[_arg_1] == null) ? sharedStyles[_arg_1] : instanceStyles[_arg_1]);
        }

        protected function isOurFocus(_arg_1:DisplayObject):Boolean
        {
            return (_arg_1 == this);
        }

        override public function get scaleX():Number
        {
            return (width / startWidth);
        }

        override public function get scaleY():Number
        {
            return (height / startHeight);
        }

        override public function set height(_arg_1:Number):void
        {
            if (_height == _arg_1)
            {
                return;
            };
            setSize(width, _arg_1);
        }

        protected function keyDownHandler(_arg_1:KeyboardEvent):void
        {
        }

        protected function focusInHandler(_arg_1:FocusEvent):void
        {
            var _local_2:IFocusManager;
            if (isOurFocus((_arg_1.target as DisplayObject)))
            {
                _local_2 = focusManager;
                if (((_local_2) && (_local_2.showFocusIndicator)))
                {
                    drawFocus(true);
                    isFocused = true;
                };
            };
        }

        public function setStyle(_arg_1:String, _arg_2:Object):void
        {
            if (((instanceStyles[_arg_1] === _arg_2) && (!(_arg_2 is TextFormat))))
            {
                return;
            };
            instanceStyles[_arg_1] = _arg_2;
            invalidate(InvalidationType.STYLES);
        }

        override public function get visible():Boolean
        {
            return (super.visible);
        }

        public function get componentInspectorSetting():Boolean
        {
            return (_inspector);
        }

        override public function get x():Number
        {
            return ((isNaN(_x)) ? super.x : _x);
        }

        override public function get y():Number
        {
            return ((isNaN(_y)) ? super.y : _y);
        }

        protected function setIMEMode(enabled:Boolean):*
        {
            if (_imeMode != null)
            {
                if (enabled)
                {
                    IME.enabled = true;
                    _oldIMEMode = IME.conversionMode;
                    try
                    {
                        if (((!(errorCaught)) && (!(IME.conversionMode == IMEConversionMode.UNKNOWN))))
                        {
                            IME.conversionMode = _imeMode;
                        };
                        errorCaught = false;
                    }
                    catch(e:Error)
                    {
                        errorCaught = true;
                        throw (new Error(("IME mode not supported: " + _imeMode)));
                    };
                }
                else
                {
                    if (((!(IME.conversionMode == IMEConversionMode.UNKNOWN)) && (!(_oldIMEMode == IMEConversionMode.UNKNOWN))))
                    {
                        IME.conversionMode = _oldIMEMode;
                    };
                    IME.enabled = false;
                };
            };
        }

        public function set enabled(_arg_1:Boolean):void
        {
            if (_arg_1 == _enabled)
            {
                return;
            };
            _enabled = _arg_1;
            invalidate(InvalidationType.STATE);
        }

        public function setSharedStyle(_arg_1:String, _arg_2:Object):void
        {
            if (((sharedStyles[_arg_1] === _arg_2) && (!(_arg_2 is TextFormat))))
            {
                return;
            };
            sharedStyles[_arg_1] = _arg_2;
            if (instanceStyles[_arg_1] == null)
            {
                invalidate(InvalidationType.STYLES);
            };
        }

        protected function keyUpHandler(_arg_1:KeyboardEvent):void
        {
        }

        public function set focusEnabled(_arg_1:Boolean):void
        {
            _focusEnabled = _arg_1;
        }

        override public function set scaleX(_arg_1:Number):void
        {
            setSize((startWidth * _arg_1), height);
        }

        public function get mouseFocusEnabled():Boolean
        {
            return (_mouseFocusEnabled);
        }

        override public function set scaleY(_arg_1:Number):void
        {
            setSize(width, (startHeight * _arg_1));
        }

        protected function getDisplayObjectInstance(skin:Object):DisplayObject
        {
            var classDef:Object;
            classDef = null;
            if ((skin is Class))
            {
                return (new (skin)() as DisplayObject);
            };
            if ((skin is DisplayObject))
            {
                (skin as DisplayObject).x = 0;
                (skin as DisplayObject).y = 0;
                return (skin as DisplayObject);
            };
            try
            {
                classDef = getDefinitionByName(skin.toString());
            }
            catch(e:Error)
            {
                try
                {
                    classDef = (loaderInfo.applicationDomain.getDefinition(skin.toString()) as Object);
                }
                catch(e:Error)
                {
                };
            };
            if (classDef == null)
            {
                return (null);
            };
            return (new (classDef)() as DisplayObject);
        }

        protected function copyStylesToChild(_arg_1:UIComponent, _arg_2:Object):void
        {
            var _local_3:String;
            for (_local_3 in _arg_2)
            {
                _arg_1.setStyle(_local_3, getStyleValue(_arg_2[_local_3]));
            };
        }

        protected function beforeComponentParameters():void
        {
        }

        protected function callLater(_arg_1:Function):void
        {
            if (inCallLaterPhase)
            {
                return;
            };
            callLaterMethods[_arg_1] = true;
            if (stage != null)
            {
                stage.addEventListener(Event.RENDER, callLaterDispatcher, false, 0, true);
                stage.invalidate();
            }
            else
            {
                addEventListener(Event.ADDED_TO_STAGE, callLaterDispatcher, false, 0, true);
            };
        }

        protected function createFocusManager():void
        {
            if (focusManagers[stage] == null)
            {
                focusManagers[stage] = new FocusManager(stage);
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            var _local_2:String;
            if (super.visible == _arg_1)
            {
                return;
            };
            super.visible = _arg_1;
            _local_2 = ((_arg_1) ? ComponentEvent.SHOW : ComponentEvent.HIDE);
            dispatchEvent(new ComponentEvent(_local_2, true));
        }

        protected function hookAccessibility(_arg_1:Event):void
        {
            removeEventListener(Event.ENTER_FRAME, hookAccessibility);
            initializeAccessibility();
        }

        public function set componentInspectorSetting(_arg_1:Boolean):void
        {
            _inspector = _arg_1;
            if (_inspector)
            {
                beforeComponentParameters();
            }
            else
            {
                afterComponentParameters();
            };
        }

        override public function set x(_arg_1:Number):void
        {
            move(_arg_1, _y);
        }

        public function drawNow():void
        {
            draw();
        }

        override public function set y(_arg_1:Number):void
        {
            move(_x, _arg_1);
        }

        protected function checkLivePreview():Boolean
        {
            var className:String;
            if (parent == null)
            {
                return (false);
            };
            try
            {
                className = getQualifiedClassName(parent);
            }
            catch(e:Error)
            {
            };
            return (className == "fl.livepreview::LivePreviewParent");
        }

        protected function focusOutHandler(_arg_1:FocusEvent):void
        {
            if (isOurFocus((_arg_1.target as DisplayObject)))
            {
                drawFocus(false);
                isFocused = false;
            };
        }

        public function set mouseFocusEnabled(_arg_1:Boolean):void
        {
            _mouseFocusEnabled = _arg_1;
        }

        public function getFocus():InteractiveObject
        {
            if (stage)
            {
                return (stage.focus);
            };
            return (null);
        }

        protected function validate():void
        {
            invalidHash = {};
        }

        override public function get height():Number
        {
            return (_height);
        }

        public function invalidate(_arg_1:String="all", _arg_2:Boolean=true):void
        {
            invalidHash[_arg_1] = true;
            if (_arg_2)
            {
                this.callLater(draw);
            };
        }

        public function get enabled():Boolean
        {
            return (_enabled);
        }

        protected function getScaleX():Number
        {
            return (super.scaleX);
        }

        protected function getScaleY():Number
        {
            return (super.scaleY);
        }

        public function get focusEnabled():Boolean
        {
            return (_focusEnabled);
        }

        protected function afterComponentParameters():void
        {
        }

        protected function draw():void
        {
            if (isInvalid(InvalidationType.SIZE, InvalidationType.STYLES))
            {
                if (((isFocused) && (focusManager.showFocusIndicator)))
                {
                    drawFocus(true);
                };
            };
            validate();
        }

        protected function configUI():void
        {
            var _local_1:Number;
            var _local_2:Number;
            var _local_3:Number;
            isLivePreview = checkLivePreview();
            _local_1 = rotation;
            rotation = 0;
            _local_2 = super.width;
            _local_3 = super.height;
            var _local_4:int = 1;
            super.scaleY = _local_4;
            super.scaleX = _local_4;
            setSize(_local_2, _local_3);
            move(super.x, super.y);
            rotation = _local_1;
            startWidth = _local_2;
            startHeight = _local_3;
            if (numChildren > 0)
            {
                removeChildAt(0);
            };
        }

        protected function setScaleX(_arg_1:Number):void
        {
            super.scaleX = _arg_1;
        }

        protected function setScaleY(_arg_1:Number):void
        {
            super.scaleY = _arg_1;
        }

        private function initializeFocusManager():void
        {
            if (stage == null)
            {
                addEventListener(Event.ADDED_TO_STAGE, addedHandler, false, 0, true);
            }
            else
            {
                createFocusManager();
            };
        }

        public function set focusManager(_arg_1:IFocusManager):void
        {
            UIComponent.focusManagers[this] = _arg_1;
        }

        public function clearStyle(_arg_1:String):void
        {
            setStyle(_arg_1, null);
        }

        protected function isInvalid(_arg_1:String, ... _args):Boolean
        {
            if (((invalidHash[_arg_1]) || (invalidHash[InvalidationType.ALL])))
            {
                return (true);
            };
            while (_args.length > 0)
            {
                if (invalidHash[_args.pop()])
                {
                    return (true);
                };
            };
            return (false);
        }

        public function setSize(_arg_1:Number, _arg_2:Number):void
        {
            _width = _arg_1;
            _height = _arg_2;
            invalidate(InvalidationType.SIZE);
            dispatchEvent(new ComponentEvent(ComponentEvent.RESIZE, false));
        }

        override public function set width(_arg_1:Number):void
        {
            if (_width == _arg_1)
            {
                return;
            };
            setSize(_arg_1, height);
        }

        public function setFocus():void
        {
            if (stage)
            {
                stage.focus = this;
            };
        }

        protected function initializeAccessibility():void
        {
            if (UIComponent.createAccessibilityImplementation != null)
            {
                UIComponent.createAccessibilityImplementation(this);
            };
        }

        public function get focusManager():IFocusManager
        {
            var _local_1:DisplayObject;
            _local_1 = this;
            while (_local_1)
            {
                if (UIComponent.focusManagers[_local_1] != null)
                {
                    return (IFocusManager(UIComponent.focusManagers[_local_1]));
                };
                _local_1 = _local_1.parent;
            };
            return (null);
        }

        override public function get width():Number
        {
            return (_width);
        }

        public function move(_arg_1:Number, _arg_2:Number):void
        {
            _x = _arg_1;
            _y = _arg_2;
            super.x = Math.round(_arg_1);
            super.y = Math.round(_arg_2);
            dispatchEvent(new ComponentEvent(ComponentEvent.MOVE));
        }

        public function validateNow():void
        {
            invalidate(InvalidationType.ALL, false);
            draw();
        }

        public function getStyle(_arg_1:String):Object
        {
            return (instanceStyles[_arg_1]);
        }


    }
}//package fl.core

//------------------------------------------------------------
//fl.data.DataProvider

package fl.data
{
    import flash.events.EventDispatcher;
    import fl.events.DataChangeEvent;
    import fl.events.DataChangeType;

    public class DataProvider extends EventDispatcher 
    {

        protected var data:Array;

        public function DataProvider(_arg_1:Object=null)
        {
            if (_arg_1 == null)
            {
                data = [];
            }
            else
            {
                data = getDataFromObject(_arg_1);
            };
        }

        protected function dispatchPreChangeEvent(_arg_1:String, _arg_2:Array, _arg_3:int, _arg_4:int):void
        {
            dispatchEvent(new DataChangeEvent(DataChangeEvent.PRE_DATA_CHANGE, _arg_1, _arg_2, _arg_3, _arg_4));
        }

        public function invalidateItemAt(_arg_1:int):void
        {
            checkIndex(_arg_1, (data.length - 1));
            dispatchChangeEvent(DataChangeType.INVALIDATE, [data[_arg_1]], _arg_1, _arg_1);
        }

        public function getItemIndex(_arg_1:Object):int
        {
            return (data.indexOf(_arg_1));
        }

        protected function getDataFromObject(_arg_1:Object):Array
        {
            var _local_2:Array;
            var _local_3:Array;
            var _local_4:uint;
            var _local_5:Object;
            var _local_6:XML;
            var _local_7:XMLList;
            var _local_8:XML;
            var _local_9:XMLList;
            var _local_10:XML;
            var _local_11:XMLList;
            var _local_12:XML;
            if ((_arg_1 is Array))
            {
                _local_3 = (_arg_1 as Array);
                if (_local_3.length > 0)
                {
                    if (((_local_3[0] is String) || (_local_3[0] is Number)))
                    {
                        _local_2 = [];
                        _local_4 = 0;
                        while (_local_4 < _local_3.length)
                        {
                            _local_5 = {
                                "label":String(_local_3[_local_4]),
                                "data":_local_3[_local_4]
                            };
                            _local_2.push(_local_5);
                            _local_4++;
                        };
                        return (_local_2);
                    };
                };
                return (_arg_1.concat());
            };
            if ((_arg_1 is DataProvider))
            {
                return (_arg_1.toArray());
            };
            if ((_arg_1 is XML))
            {
                _local_6 = (_arg_1 as XML);
                _local_2 = [];
                _local_7 = _local_6.*;
                for each (_local_8 in _local_7)
                {
                    _arg_1 = {};
                    _local_9 = _local_8.attributes();
                    for each (_local_10 in _local_9)
                    {
                        _arg_1[_local_10.localName()] = _local_10.toString();
                    };
                    _local_11 = _local_8.*;
                    for each (_local_12 in _local_11)
                    {
                        if (_local_12.hasSimpleContent())
                        {
                            _arg_1[_local_12.localName()] = _local_12.toString();
                        };
                    };
                    _local_2.push(_arg_1);
                };
                return (_local_2);
            };
            throw (new TypeError((("Error: Type Coercion failed: cannot convert " + _arg_1) + " to Array or DataProvider.")));
        }

        public function removeItemAt(_arg_1:uint):Object
        {
            var _local_2:Array;
            checkIndex(_arg_1, (data.length - 1));
            dispatchPreChangeEvent(DataChangeType.REMOVE, data.slice(_arg_1, (_arg_1 + 1)), _arg_1, _arg_1);
            _local_2 = data.splice(_arg_1, 1);
            dispatchChangeEvent(DataChangeType.REMOVE, _local_2, _arg_1, _arg_1);
            return (_local_2[0]);
        }

        public function addItem(_arg_1:Object):void
        {
            dispatchPreChangeEvent(DataChangeType.ADD, [_arg_1], (data.length - 1), (data.length - 1));
            data.push(_arg_1);
            dispatchChangeEvent(DataChangeType.ADD, [_arg_1], (data.length - 1), (data.length - 1));
        }

        public function sortOn(_arg_1:Object, _arg_2:Object=null):*
        {
            var _local_3:Array;
            dispatchPreChangeEvent(DataChangeType.SORT, data.concat(), 0, (data.length - 1));
            _local_3 = data.sortOn(_arg_1, _arg_2);
            dispatchChangeEvent(DataChangeType.SORT, data.concat(), 0, (data.length - 1));
            return (_local_3);
        }

        public function sort(... _args):*
        {
            var _local_2:Array;
            dispatchPreChangeEvent(DataChangeType.SORT, data.concat(), 0, (data.length - 1));
            _local_2 = data.sort.apply(data, _args);
            dispatchChangeEvent(DataChangeType.SORT, data.concat(), 0, (data.length - 1));
            return (_local_2);
        }

        public function addItems(_arg_1:Object):void
        {
            addItemsAt(_arg_1, data.length);
        }

        public function concat(_arg_1:Object):void
        {
            addItems(_arg_1);
        }

        public function clone():DataProvider
        {
            return (new DataProvider(data));
        }

        public function toArray():Array
        {
            return (data.concat());
        }

        public function get length():uint
        {
            return (data.length);
        }

        public function addItemAt(_arg_1:Object, _arg_2:uint):void
        {
            checkIndex(_arg_2, data.length);
            dispatchPreChangeEvent(DataChangeType.ADD, [_arg_1], _arg_2, _arg_2);
            data.splice(_arg_2, 0, _arg_1);
            dispatchChangeEvent(DataChangeType.ADD, [_arg_1], _arg_2, _arg_2);
        }

        public function getItemAt(_arg_1:uint):Object
        {
            checkIndex(_arg_1, (data.length - 1));
            return (data[_arg_1]);
        }

        override public function toString():String
        {
            return (("DataProvider [" + data.join(" , ")) + "]");
        }

        public function invalidateItem(_arg_1:Object):void
        {
            var _local_2:uint;
            _local_2 = getItemIndex(_arg_1);
            if (_local_2 == -1)
            {
                return;
            };
            invalidateItemAt(_local_2);
        }

        protected function dispatchChangeEvent(_arg_1:String, _arg_2:Array, _arg_3:int, _arg_4:int):void
        {
            dispatchEvent(new DataChangeEvent(DataChangeEvent.DATA_CHANGE, _arg_1, _arg_2, _arg_3, _arg_4));
        }

        protected function checkIndex(_arg_1:int, _arg_2:int):void
        {
            if (((_arg_1 > _arg_2) || (_arg_1 < 0)))
            {
                throw (new RangeError((((("DataProvider index (" + _arg_1) + ") is not in acceptable range (0 - ") + _arg_2) + ")")));
            };
        }

        public function addItemsAt(_arg_1:Object, _arg_2:uint):void
        {
            var _local_3:Array;
            checkIndex(_arg_2, data.length);
            _local_3 = getDataFromObject(_arg_1);
            dispatchPreChangeEvent(DataChangeType.ADD, _local_3, _arg_2, ((_arg_2 + _local_3.length) - 1));
            data.splice.apply(data, [_arg_2, 0].concat(_local_3));
            dispatchChangeEvent(DataChangeType.ADD, _local_3, _arg_2, ((_arg_2 + _local_3.length) - 1));
        }

        public function replaceItem(_arg_1:Object, _arg_2:Object):Object
        {
            var _local_3:int;
            _local_3 = getItemIndex(_arg_2);
            if (_local_3 != -1)
            {
                return (replaceItemAt(_arg_1, _local_3));
            };
            return (null);
        }

        public function removeItem(_arg_1:Object):Object
        {
            var _local_2:int;
            _local_2 = getItemIndex(_arg_1);
            if (_local_2 != -1)
            {
                return (removeItemAt(_local_2));
            };
            return (null);
        }

        public function merge(_arg_1:Object):void
        {
            var _local_2:Array;
            var _local_3:uint;
            var _local_4:uint;
            var _local_5:uint;
            var _local_6:Object;
            _local_2 = getDataFromObject(_arg_1);
            _local_3 = _local_2.length;
            _local_4 = data.length;
            dispatchPreChangeEvent(DataChangeType.ADD, data.slice(_local_4, data.length), _local_4, (this.data.length - 1));
            _local_5 = 0;
            while (_local_5 < _local_3)
            {
                _local_6 = _local_2[_local_5];
                if (getItemIndex(_local_6) == -1)
                {
                    data.push(_local_6);
                };
                _local_5++;
            };
            if (data.length > _local_4)
            {
                dispatchChangeEvent(DataChangeType.ADD, data.slice(_local_4, data.length), _local_4, (this.data.length - 1));
            }
            else
            {
                dispatchChangeEvent(DataChangeType.ADD, [], -1, -1);
            };
        }

        public function replaceItemAt(_arg_1:Object, _arg_2:uint):Object
        {
            var _local_3:Array;
            checkIndex(_arg_2, (data.length - 1));
            _local_3 = [data[_arg_2]];
            dispatchPreChangeEvent(DataChangeType.REPLACE, _local_3, _arg_2, _arg_2);
            data[_arg_2] = _arg_1;
            dispatchChangeEvent(DataChangeType.REPLACE, _local_3, _arg_2, _arg_2);
            return (_local_3[0]);
        }

        public function invalidate():void
        {
            dispatchEvent(new DataChangeEvent(DataChangeEvent.DATA_CHANGE, DataChangeType.INVALIDATE_ALL, data.concat(), 0, data.length));
        }

        public function removeAll():void
        {
            var _local_1:Array;
            _local_1 = data.concat();
            dispatchPreChangeEvent(DataChangeType.REMOVE_ALL, _local_1, 0, _local_1.length);
            data = [];
            dispatchChangeEvent(DataChangeType.REMOVE_ALL, _local_1, 0, _local_1.length);
        }


    }
}//package fl.data

//------------------------------------------------------------
//fl.data.SimpleCollectionItem

package fl.data
{
    public dynamic class SimpleCollectionItem 
    {

        public var label:String;
        public var data:String;


        public function toString():String
        {
            return (((("[SimpleCollectionItem: " + label) + ",") + data) + "]");
        }


    }
}//package fl.data

//------------------------------------------------------------
//fl.events.ComponentEvent

package fl.events
{
    import flash.events.Event;

    public class ComponentEvent extends Event 
    {

        public static const BUTTON_DOWN:String = "buttonDown";
        public static const LABEL_CHANGE:String = "labelChange";
        public static const HIDE:String = "hide";
        public static const SHOW:String = "show";
        public static const RESIZE:String = "resize";
        public static const MOVE:String = "move";
        public static const ENTER:String = "enter";

        public function ComponentEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override public function toString():String
        {
            return (formatToString("ComponentEvent", "type", "bubbles", "cancelable"));
        }

        override public function clone():Event
        {
            return (new ComponentEvent(type, bubbles, cancelable));
        }


    }
}//package fl.events

//------------------------------------------------------------
//fl.events.DataChangeEvent

package fl.events
{
    import flash.events.Event;

    public class DataChangeEvent extends Event 
    {

        public static const DATA_CHANGE:String = "dataChange";
        public static const PRE_DATA_CHANGE:String = "preDataChange";

        protected var _items:Array;
        protected var _endIndex:uint;
        protected var _changeType:String;
        protected var _startIndex:uint;

        public function DataChangeEvent(_arg_1:String, _arg_2:String, _arg_3:Array, _arg_4:int=-1, _arg_5:int=-1):void
        {
            super(_arg_1);
            _changeType = _arg_2;
            _startIndex = _arg_4;
            _items = _arg_3;
            _endIndex = ((_arg_5 == -1) ? _startIndex : _arg_5);
        }

        public function get changeType():String
        {
            return (_changeType);
        }

        public function get startIndex():uint
        {
            return (_startIndex);
        }

        public function get items():Array
        {
            return (_items);
        }

        override public function clone():Event
        {
            return (new DataChangeEvent(type, _changeType, _items, _startIndex, _endIndex));
        }

        override public function toString():String
        {
            return (formatToString("DataChangeEvent", "type", "changeType", "startIndex", "endIndex", "bubbles", "cancelable"));
        }

        public function get endIndex():uint
        {
            return (_endIndex);
        }


    }
}//package fl.events

//------------------------------------------------------------
//fl.events.DataChangeType

package fl.events
{
    public class DataChangeType 
    {

        public static const CHANGE:String = "change";
        public static const INVALIDATE:String = "invalidate";
        public static const INVALIDATE_ALL:String = "invalidateAll";
        public static const ADD:String = "add";
        public static const REMOVE:String = "remove";
        public static const REMOVE_ALL:String = "removeAll";
        public static const REPLACE:String = "replace";
        public static const SORT:String = "sort";


    }
}//package fl.events

//------------------------------------------------------------
//fl.events.ListEvent

package fl.events
{
    import flash.events.Event;

    public class ListEvent extends Event 
    {

        public static const ITEM_ROLL_OUT:String = "itemRollOut";
        public static const ITEM_ROLL_OVER:String = "itemRollOver";
        public static const ITEM_CLICK:String = "itemClick";
        public static const ITEM_DOUBLE_CLICK:String = "itemDoubleClick";

        protected var _index:int;
        protected var _item:Object;
        protected var _columnIndex:int;
        protected var _rowIndex:int;

        public function ListEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false, _arg_4:int=-1, _arg_5:int=-1, _arg_6:int=-1, _arg_7:Object=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            _rowIndex = _arg_5;
            _columnIndex = _arg_4;
            _index = _arg_6;
            _item = _arg_7;
        }

        public function get rowIndex():Object
        {
            return (_rowIndex);
        }

        public function get index():int
        {
            return (_index);
        }

        public function get item():Object
        {
            return (_item);
        }

        public function get columnIndex():int
        {
            return (_columnIndex);
        }

        override public function clone():Event
        {
            return (new ListEvent(type, bubbles, cancelable, _columnIndex, _rowIndex));
        }

        override public function toString():String
        {
            return (formatToString("ListEvent", "type", "bubbles", "cancelable", "columnIndex", "rowIndex", "index", "item"));
        }


    }
}//package fl.events

//------------------------------------------------------------
//fl.events.ScrollEvent

package fl.events
{
    import flash.events.Event;

    public class ScrollEvent extends Event 
    {

        public static const SCROLL:String = "scroll";

        private var _position:Number;
        private var _direction:String;
        private var _delta:Number;

        public function ScrollEvent(_arg_1:String, _arg_2:Number, _arg_3:Number)
        {
            super(ScrollEvent.SCROLL, false, false);
            _direction = _arg_1;
            _delta = _arg_2;
            _position = _arg_3;
        }

        override public function clone():Event
        {
            return (new ScrollEvent(_direction, _delta, _position));
        }

        public function get position():Number
        {
            return (_position);
        }

        override public function toString():String
        {
            return (formatToString("ScrollEvent", "type", "bubbles", "cancelable", "direction", "delta", "position"));
        }

        public function get delta():Number
        {
            return (_delta);
        }

        public function get direction():String
        {
            return (_direction);
        }


    }
}//package fl.events

//------------------------------------------------------------
//fl.managers.FocusManager

package fl.managers
{
    import flash.utils.Dictionary;
    import fl.controls.Button;
    import flash.display.DisplayObjectContainer;
    import flash.display.InteractiveObject;
    import flash.display.DisplayObject;
    import flash.events.Event;
    import flash.display.Stage;
    import flash.text.TextField;
    import flash.events.FocusEvent;
    import fl.core.UIComponent;
    import flash.events.MouseEvent;
    import flash.display.SimpleButton;
    import flash.text.TextFieldType;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;

    public class FocusManager implements IFocusManager 
    {

        private var focusableObjects:Dictionary;
        private var defButton:Button;
        private var focusableCandidates:Array;
        private var _form:DisplayObjectContainer;
        private var _defaultButton:Button;
        private var lastFocus:InteractiveObject;
        private var lastAction:String;

        private var activated:Boolean = false;
        private var calculateCandidates:Boolean = true;
        private var _showFocusIndicator:Boolean = true;
        private var _defaultButtonEnabled:Boolean = true;

        public function FocusManager(_arg_1:DisplayObjectContainer)
        {
            focusableObjects = new Dictionary(true);
            if (_arg_1 != null)
            {
                _form = _arg_1;
                addFocusables(DisplayObject(_arg_1));
                _arg_1.addEventListener(Event.ADDED, addedHandler);
                _arg_1.addEventListener(Event.REMOVED, removedHandler);
                activate();
            };
        }

        public function get showFocusIndicator():Boolean
        {
            return (_showFocusIndicator);
        }

        private function getIndexOfNextObject(_arg_1:int, _arg_2:Boolean, _arg_3:Boolean, _arg_4:String):int
        {
            var _local_5:int;
            var _local_6:int;
            var _local_7:DisplayObject;
            var _local_8:IFocusManagerGroup;
            var _local_9:int;
            var _local_10:DisplayObject;
            var _local_11:IFocusManagerGroup;
            _local_5 = focusableCandidates.length;
            _local_6 = _arg_1;
            while (true)
            {
                if (_arg_2)
                {
                    _arg_1--;
                }
                else
                {
                    _arg_1++;
                };
                if (_arg_3)
                {
                    if (((_arg_2) && (_arg_1 < 0))) break;
                    if (((!(_arg_2)) && (_arg_1 == _local_5))) break;
                }
                else
                {
                    _arg_1 = ((_arg_1 + _local_5) % _local_5);
                    if (_local_6 == _arg_1) break;
                };
                if (isValidFocusCandidate(focusableCandidates[_arg_1], _arg_4))
                {
                    _local_7 = DisplayObject(findFocusManagerComponent(focusableCandidates[_arg_1]));
                    if ((_local_7 is IFocusManagerGroup))
                    {
                        _local_8 = IFocusManagerGroup(_local_7);
                        _local_9 = 0;
                        while (_local_9 < focusableCandidates.length)
                        {
                            _local_10 = focusableCandidates[_local_9];
                            if ((_local_10 is IFocusManagerGroup))
                            {
                                _local_11 = IFocusManagerGroup(_local_10);
                                if (((_local_11.groupName == _local_8.groupName) && (_local_11.selected)))
                                {
                                    _arg_1 = _local_9;
                                    break;
                                };
                            };
                            _local_9++;
                        };
                    };
                    return (_arg_1);
                };
            };
            return (_arg_1);
        }

        public function set form(_arg_1:DisplayObjectContainer):void
        {
            _form = _arg_1;
        }

        private function addFocusables(o:DisplayObject, skipTopLevel:Boolean=false):void
        {
            var focusable:IFocusManagerComponent;
            var io:InteractiveObject;
            var doc:DisplayObjectContainer;
            var i:int;
            var child:DisplayObject;
            if (!skipTopLevel)
            {
                if ((o is IFocusManagerComponent))
                {
                    focusable = IFocusManagerComponent(o);
                    if (focusable.focusEnabled)
                    {
                        if (((focusable.tabEnabled) && (isTabVisible(o))))
                        {
                            focusableObjects[o] = true;
                            calculateCandidates = true;
                        };
                        o.addEventListener(Event.TAB_ENABLED_CHANGE, tabEnabledChangeHandler);
                        o.addEventListener(Event.TAB_INDEX_CHANGE, tabIndexChangeHandler);
                    };
                }
                else
                {
                    if ((o is InteractiveObject))
                    {
                        io = (o as InteractiveObject);
                        if ((((io) && (io.tabEnabled)) && (findFocusManagerComponent(io) == io)))
                        {
                            focusableObjects[io] = true;
                            calculateCandidates = true;
                        };
                        io.addEventListener(Event.TAB_ENABLED_CHANGE, tabEnabledChangeHandler);
                        io.addEventListener(Event.TAB_INDEX_CHANGE, tabIndexChangeHandler);
                    };
                };
            };
            if ((o is DisplayObjectContainer))
            {
                doc = DisplayObjectContainer(o);
                o.addEventListener(Event.TAB_CHILDREN_CHANGE, tabChildrenChangeHandler);
                if ((((doc is Stage) || (doc.parent is Stage)) || (doc.tabChildren)))
                {
                    i = 0;
                    while (i < doc.numChildren)
                    {
                        try
                        {
                            child = doc.getChildAt(i);
                            if (child != null)
                            {
                                addFocusables(doc.getChildAt(i));
                            };
                        }
                        catch(error:SecurityError)
                        {
                        };
                        i = (i + 1);
                    };
                };
            };
        }

        private function getChildIndex(_arg_1:DisplayObjectContainer, _arg_2:DisplayObject):int
        {
            return (_arg_1.getChildIndex(_arg_2));
        }

        private function mouseFocusChangeHandler(_arg_1:FocusEvent):void
        {
            if ((_arg_1.relatedObject is TextField))
            {
                return;
            };
            _arg_1.preventDefault();
        }

        private function focusOutHandler(_arg_1:FocusEvent):void
        {
            var _local_2:InteractiveObject;
            _local_2 = (_arg_1.target as InteractiveObject);
        }

        private function isValidFocusCandidate(_arg_1:DisplayObject, _arg_2:String):Boolean
        {
            var _local_3:IFocusManagerGroup;
            if (!isEnabledAndVisible(_arg_1))
            {
                return (false);
            };
            if ((_arg_1 is IFocusManagerGroup))
            {
                _local_3 = IFocusManagerGroup(_arg_1);
                if (_arg_2 == _local_3.groupName)
                {
                    return (false);
                };
            };
            return (true);
        }

        public function findFocusManagerComponent(_arg_1:InteractiveObject):InteractiveObject
        {
            var _local_2:InteractiveObject;
            _local_2 = _arg_1;
            while (_arg_1)
            {
                if (((_arg_1 is IFocusManagerComponent) && (IFocusManagerComponent(_arg_1).focusEnabled)))
                {
                    return (_arg_1);
                };
                _arg_1 = _arg_1.parent;
            };
            return (_local_2);
        }

        private function sortFocusableObjectsTabIndex():void
        {
            var _local_1:Object;
            var _local_2:InteractiveObject;
            focusableCandidates = [];
            for (_local_1 in focusableObjects)
            {
                _local_2 = InteractiveObject(_local_1);
                if (((_local_2.tabIndex) && (!(isNaN(Number(_local_2.tabIndex))))))
                {
                    focusableCandidates.push(_local_2);
                };
            };
            focusableCandidates.sort(sortByTabIndex);
        }

        private function removeFocusables(_arg_1:DisplayObject):void
        {
            var _local_2:Object;
            var _local_3:DisplayObject;
            if ((_arg_1 is DisplayObjectContainer))
            {
                _arg_1.removeEventListener(Event.TAB_CHILDREN_CHANGE, tabChildrenChangeHandler);
                _arg_1.removeEventListener(Event.TAB_INDEX_CHANGE, tabIndexChangeHandler);
                for (_local_2 in focusableObjects)
                {
                    _local_3 = DisplayObject(_local_2);
                    if (DisplayObjectContainer(_arg_1).contains(_local_3))
                    {
                        if (_local_3 == lastFocus)
                        {
                            lastFocus = null;
                        };
                        _local_3.removeEventListener(Event.TAB_ENABLED_CHANGE, tabEnabledChangeHandler);
                        delete focusableObjects[_local_2];
                        calculateCandidates = true;
                    };
                };
            };
        }

        private function addedHandler(_arg_1:Event):void
        {
            var _local_2:DisplayObject;
            _local_2 = DisplayObject(_arg_1.target);
            if (_local_2.stage)
            {
                addFocusables(DisplayObject(_arg_1.target));
            };
        }

        private function getTopLevelFocusTarget(_arg_1:InteractiveObject):InteractiveObject
        {
            while (_arg_1 != InteractiveObject(form))
            {
                if (((((_arg_1 is IFocusManagerComponent) && (IFocusManagerComponent(_arg_1).focusEnabled)) && (IFocusManagerComponent(_arg_1).mouseFocusEnabled)) && (UIComponent(_arg_1).enabled)))
                {
                    return (_arg_1);
                };
                _arg_1 = _arg_1.parent;
                if (_arg_1 == null) break;
            };
            return (null);
        }

        private function tabChildrenChangeHandler(_arg_1:Event):void
        {
            var _local_2:DisplayObjectContainer;
            if (_arg_1.target != _arg_1.currentTarget)
            {
                return;
            };
            calculateCandidates = true;
            _local_2 = DisplayObjectContainer(_arg_1.target);
            if (_local_2.tabChildren)
            {
                addFocusables(_local_2, true);
            }
            else
            {
                removeFocusables(_local_2);
            };
        }

        public function sendDefaultButtonEvent():void
        {
            defButton.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        }

        public function getFocus():InteractiveObject
        {
            var _local_1:InteractiveObject;
            _local_1 = form.stage.focus;
            return (findFocusManagerComponent(_local_1));
        }

        private function isEnabledAndVisible(_arg_1:DisplayObject):Boolean
        {
            var _local_2:DisplayObjectContainer;
            var _local_3:TextField;
            var _local_4:SimpleButton;
            _local_2 = DisplayObject(form).parent;
            while (_arg_1 != _local_2)
            {
                if ((_arg_1 is UIComponent))
                {
                    if (!UIComponent(_arg_1).enabled)
                    {
                        return (false);
                    };
                }
                else
                {
                    if ((_arg_1 is TextField))
                    {
                        _local_3 = TextField(_arg_1);
                        if (((_local_3.type == TextFieldType.DYNAMIC) || (!(_local_3.selectable))))
                        {
                            return (false);
                        };
                    }
                    else
                    {
                        if ((_arg_1 is SimpleButton))
                        {
                            _local_4 = SimpleButton(_arg_1);
                            if (!_local_4.enabled)
                            {
                                return (false);
                            };
                        };
                    };
                };
                if (!_arg_1.visible)
                {
                    return (false);
                };
                _arg_1 = _arg_1.parent;
            };
            return (true);
        }

        public function set defaultButton(_arg_1:Button):void
        {
            var _local_2:Button;
            _local_2 = ((_arg_1) ? Button(_arg_1) : null);
            if (_local_2 != _defaultButton)
            {
                if (_defaultButton)
                {
                    _defaultButton.emphasized = false;
                };
                if (defButton)
                {
                    defButton.emphasized = false;
                };
                _defaultButton = _local_2;
                defButton = _local_2;
                if (_local_2)
                {
                    _local_2.emphasized = true;
                };
            };
        }

        private function deactivateHandler(_arg_1:Event):void
        {
            var _local_2:InteractiveObject;
            _local_2 = InteractiveObject(_arg_1.target);
        }

        public function setFocus(_arg_1:InteractiveObject):void
        {
            if ((_arg_1 is IFocusManagerComponent))
            {
                IFocusManagerComponent(_arg_1).setFocus();
            }
            else
            {
                form.stage.focus = _arg_1;
            };
        }

        private function setFocusToNextObject(_arg_1:FocusEvent):void
        {
            var _local_2:InteractiveObject;
            if (!hasFocusableObjects())
            {
                return;
            };
            _local_2 = getNextFocusManagerComponent(_arg_1.shiftKey);
            if (_local_2)
            {
                setFocus(_local_2);
            };
        }

        private function hasFocusableObjects():Boolean
        {
            var _local_1:Object;
            for (_local_1 in focusableObjects)
            {
                return (true);
            };
            return (false);
        }

        private function tabIndexChangeHandler(_arg_1:Event):void
        {
            calculateCandidates = true;
        }

        private function sortFocusableObjects():void
        {
            var _local_1:Object;
            var _local_2:InteractiveObject;
            focusableCandidates = [];
            for (_local_1 in focusableObjects)
            {
                _local_2 = InteractiveObject(_local_1);
                if ((((_local_2.tabIndex) && (!(isNaN(Number(_local_2.tabIndex))))) && (_local_2.tabIndex > 0)))
                {
                    sortFocusableObjectsTabIndex();
                    return;
                };
                focusableCandidates.push(_local_2);
            };
            focusableCandidates.sort(sortByDepth);
        }

        private function keyFocusChangeHandler(_arg_1:FocusEvent):void
        {
            showFocusIndicator = true;
            if ((((_arg_1.keyCode == Keyboard.TAB) || (_arg_1.keyCode == 0)) && (!(_arg_1.isDefaultPrevented()))))
            {
                setFocusToNextObject(_arg_1);
                _arg_1.preventDefault();
            };
        }

        private function getIndexOfFocusedObject(_arg_1:DisplayObject):int
        {
            var _local_2:int;
            var _local_3:int;
            _local_2 = focusableCandidates.length;
            _local_3 = 0;
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                if (focusableCandidates[_local_3] == _arg_1)
                {
                    return (_local_3);
                };
                _local_3++;
            };
            return (-1);
        }

        public function hideFocus():void
        {
        }

        private function removedHandler(_arg_1:Event):void
        {
            var _local_2:int;
            var _local_3:DisplayObject;
            var _local_4:InteractiveObject;
            _local_3 = DisplayObject(_arg_1.target);
            if (((_local_3 is IFocusManagerComponent) && (focusableObjects[_local_3] == true)))
            {
                if (_local_3 == lastFocus)
                {
                    IFocusManagerComponent(lastFocus).drawFocus(false);
                    lastFocus = null;
                };
                _local_3.removeEventListener(Event.TAB_ENABLED_CHANGE, tabEnabledChangeHandler);
                delete focusableObjects[_local_3];
                calculateCandidates = true;
            }
            else
            {
                if (((_local_3 is InteractiveObject) && (focusableObjects[_local_3] == true)))
                {
                    _local_4 = (_local_3 as InteractiveObject);
                    if (_local_4)
                    {
                        if (_local_4 == lastFocus)
                        {
                            lastFocus = null;
                        };
                        delete focusableObjects[_local_4];
                        calculateCandidates = true;
                    };
                    _local_3.addEventListener(Event.TAB_ENABLED_CHANGE, tabEnabledChangeHandler);
                };
            };
            removeFocusables(_local_3);
        }

        private function sortByDepth(_arg_1:InteractiveObject, _arg_2:InteractiveObject):Number
        {
            var _local_3:String;
            var _local_4:String;
            var _local_5:int;
            var _local_6:String;
            var _local_7:String;
            var _local_8:String;
            var _local_9:DisplayObject;
            var _local_10:DisplayObject;
            _local_3 = "";
            _local_4 = "";
            _local_8 = "0000";
            _local_9 = DisplayObject(_arg_1);
            _local_10 = DisplayObject(_arg_2);
            while (((!(_local_9 == DisplayObject(form))) && (_local_9.parent)))
            {
                _local_5 = getChildIndex(_local_9.parent, _local_9);
                _local_6 = _local_5.toString(16);
                if (_local_6.length < 4)
                {
                    _local_7 = (_local_8.substring(0, (4 - _local_6.length)) + _local_6);
                };
                _local_3 = (_local_7 + _local_3);
                _local_9 = _local_9.parent;
            };
            while (((!(_local_10 == DisplayObject(form))) && (_local_10.parent)))
            {
                _local_5 = getChildIndex(_local_10.parent, _local_10);
                _local_6 = _local_5.toString(16);
                if (_local_6.length < 4)
                {
                    _local_7 = (_local_8.substring(0, (4 - _local_6.length)) + _local_6);
                };
                _local_4 = (_local_7 + _local_4);
                _local_10 = _local_10.parent;
            };
            return ((_local_3 > _local_4) ? 1 : ((_local_3 < _local_4) ? -1 : 0));
        }

        public function get defaultButton():Button
        {
            return (_defaultButton);
        }

        private function activateHandler(_arg_1:Event):void
        {
            var _local_2:InteractiveObject;
            _local_2 = InteractiveObject(_arg_1.target);
            if (lastFocus)
            {
                if ((lastFocus is IFocusManagerComponent))
                {
                    IFocusManagerComponent(lastFocus).setFocus();
                }
                else
                {
                    form.stage.focus = lastFocus;
                };
            };
            lastAction = "ACTIVATE";
        }

        public function showFocus():void
        {
        }

        public function set defaultButtonEnabled(_arg_1:Boolean):void
        {
            _defaultButtonEnabled = _arg_1;
        }

        public function getNextFocusManagerComponent(_arg_1:Boolean=false):InteractiveObject
        {
            var _local_2:DisplayObject;
            var _local_3:String;
            var _local_4:int;
            var _local_5:Boolean;
            var _local_6:int;
            var _local_7:int;
            var _local_8:IFocusManagerGroup;
            if (!hasFocusableObjects())
            {
                return (null);
            };
            if (calculateCandidates)
            {
                sortFocusableObjects();
                calculateCandidates = false;
            };
            _local_2 = form.stage.focus;
            _local_2 = DisplayObject(findFocusManagerComponent(InteractiveObject(_local_2)));
            _local_3 = "";
            if ((_local_2 is IFocusManagerGroup))
            {
                _local_8 = IFocusManagerGroup(_local_2);
                _local_3 = _local_8.groupName;
            };
            _local_4 = getIndexOfFocusedObject(_local_2);
            _local_5 = false;
            _local_6 = _local_4;
            if (_local_4 == -1)
            {
                if (_arg_1)
                {
                    _local_4 = focusableCandidates.length;
                };
                _local_5 = true;
            };
            _local_7 = getIndexOfNextObject(_local_4, _arg_1, _local_5, _local_3);
            return (findFocusManagerComponent(focusableCandidates[_local_7]));
        }

        private function mouseDownHandler(_arg_1:MouseEvent):void
        {
            var _local_2:InteractiveObject;
            if (_arg_1.isDefaultPrevented())
            {
                return;
            };
            _local_2 = getTopLevelFocusTarget(InteractiveObject(_arg_1.target));
            if (!_local_2)
            {
                return;
            };
            showFocusIndicator = false;
            if ((((!(_local_2 == lastFocus)) || (lastAction == "ACTIVATE")) && (!(_local_2 is TextField))))
            {
                setFocus(_local_2);
            };
            lastAction = "MOUSEDOWN";
        }

        private function isTabVisible(_arg_1:DisplayObject):Boolean
        {
            var _local_2:DisplayObjectContainer;
            _local_2 = _arg_1.parent;
            while ((((_local_2) && (!(_local_2 is Stage))) && (!((_local_2.parent) && (_local_2.parent is Stage)))))
            {
                if (!_local_2.tabChildren)
                {
                    return (false);
                };
                _local_2 = _local_2.parent;
            };
            return (true);
        }

        public function get nextTabIndex():int
        {
            return (0);
        }

        private function keyDownHandler(_arg_1:KeyboardEvent):void
        {
            if (_arg_1.keyCode == Keyboard.TAB)
            {
                lastAction = "KEY";
                if (calculateCandidates)
                {
                    sortFocusableObjects();
                    calculateCandidates = false;
                };
            };
            if (((((defaultButtonEnabled) && (_arg_1.keyCode == Keyboard.ENTER)) && (defaultButton)) && (defButton.enabled)))
            {
                sendDefaultButtonEvent();
            };
        }

        private function focusInHandler(_arg_1:FocusEvent):void
        {
            var _local_2:InteractiveObject;
            var _local_3:Button;
            _local_2 = InteractiveObject(_arg_1.target);
            if (form.contains(_local_2))
            {
                lastFocus = findFocusManagerComponent(InteractiveObject(_local_2));
                if ((lastFocus is Button))
                {
                    _local_3 = Button(lastFocus);
                    if (defButton)
                    {
                        defButton.emphasized = false;
                        defButton = _local_3;
                        _local_3.emphasized = true;
                    };
                }
                else
                {
                    if (((defButton) && (!(defButton == _defaultButton))))
                    {
                        defButton.emphasized = false;
                        defButton = _defaultButton;
                        _defaultButton.emphasized = true;
                    };
                };
            };
        }

        private function tabEnabledChangeHandler(_arg_1:Event):void
        {
            var _local_2:InteractiveObject;
            var _local_3:Boolean;
            calculateCandidates = true;
            _local_2 = InteractiveObject(_arg_1.target);
            _local_3 = (focusableObjects[_local_2] == true);
            if (_local_2.tabEnabled)
            {
                if (((!(_local_3)) && (isTabVisible(_local_2))))
                {
                    if (!(_local_2 is IFocusManagerComponent))
                    {
                        _local_2.focusRect = false;
                    };
                    focusableObjects[_local_2] = true;
                };
            }
            else
            {
                if (_local_3)
                {
                    delete focusableObjects[_local_2];
                };
            };
        }

        public function set showFocusIndicator(_arg_1:Boolean):void
        {
            _showFocusIndicator = _arg_1;
        }

        public function get form():DisplayObjectContainer
        {
            return (_form);
        }

        private function sortByTabIndex(_arg_1:InteractiveObject, _arg_2:InteractiveObject):int
        {
            return ((_arg_1.tabIndex > _arg_2.tabIndex) ? 1 : ((_arg_1.tabIndex < _arg_2.tabIndex) ? -1 : sortByDepth(_arg_1, _arg_2)));
        }

        public function activate():void
        {
            if (activated)
            {
                return;
            };
            form.stage.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE, mouseFocusChangeHandler, false, 0, true);
            form.stage.addEventListener(FocusEvent.KEY_FOCUS_CHANGE, keyFocusChangeHandler, false, 0, true);
            form.addEventListener(FocusEvent.FOCUS_IN, focusInHandler, true);
            form.addEventListener(FocusEvent.FOCUS_OUT, focusOutHandler, true);
            form.stage.addEventListener(Event.ACTIVATE, activateHandler, false, 0, true);
            form.stage.addEventListener(Event.DEACTIVATE, deactivateHandler, false, 0, true);
            form.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
            form.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler, true);
            activated = true;
            if (lastFocus)
            {
                setFocus(lastFocus);
            };
        }

        public function deactivate():void
        {
            form.stage.removeEventListener(FocusEvent.MOUSE_FOCUS_CHANGE, mouseFocusChangeHandler);
            form.stage.removeEventListener(FocusEvent.KEY_FOCUS_CHANGE, keyFocusChangeHandler);
            form.removeEventListener(FocusEvent.FOCUS_IN, focusInHandler, true);
            form.removeEventListener(FocusEvent.FOCUS_OUT, focusOutHandler, true);
            form.stage.removeEventListener(Event.ACTIVATE, activateHandler);
            form.stage.removeEventListener(Event.DEACTIVATE, deactivateHandler);
            form.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
            form.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler, true);
            activated = false;
        }

        public function get defaultButtonEnabled():Boolean
        {
            return (_defaultButtonEnabled);
        }


    }
}//package fl.managers

//------------------------------------------------------------
//fl.managers.IFocusManager

package fl.managers
{
    import flash.display.InteractiveObject;
    import fl.controls.Button;

    public interface IFocusManager 
    {

        function getFocus():InteractiveObject;
        function deactivate():void;
        function set defaultButton(_arg_1:Button):void;
        function set showFocusIndicator(_arg_1:Boolean):void;
        function get defaultButtonEnabled():Boolean;
        function get nextTabIndex():int;
        function get defaultButton():Button;
        function get showFocusIndicator():Boolean;
        function setFocus(_arg_1:InteractiveObject):void;
        function activate():void;
        function showFocus():void;
        function set defaultButtonEnabled(_arg_1:Boolean):void;
        function hideFocus():void;
        function findFocusManagerComponent(_arg_1:InteractiveObject):InteractiveObject;
        function getNextFocusManagerComponent(_arg_1:Boolean=false):InteractiveObject;

    }
}//package fl.managers

//------------------------------------------------------------
//fl.managers.IFocusManagerComponent

package fl.managers
{
    public interface IFocusManagerComponent 
    {

        function set focusEnabled(_arg_1:Boolean):void;
        function drawFocus(_arg_1:Boolean):void;
        function setFocus():void;
        function get focusEnabled():Boolean;
        function get tabEnabled():Boolean;
        function get tabIndex():int;
        function get mouseFocusEnabled():Boolean;

    }
}//package fl.managers

//------------------------------------------------------------
//fl.managers.IFocusManagerGroup

package fl.managers
{
    public interface IFocusManagerGroup 
    {

        function set groupName(_arg_1:String):void;
        function set selected(_arg_1:Boolean):void;
        function get groupName():String;
        function get selected():Boolean;

    }
}//package fl.managers

//------------------------------------------------------------
//fl.managers.StyleManager

package fl.managers
{
    import flash.utils.Dictionary;
    import fl.core.UIComponent;
    import flash.utils.getDefinitionByName;
    import flash.utils.getQualifiedClassName;
    import flash.utils.getQualifiedSuperclassName;
    import flash.text.TextFormat;

    public class StyleManager 
    {

        private static var _instance:StyleManager;

        private var globalStyles:Object;
        private var classToDefaultStylesDict:Dictionary;
        private var styleToClassesHash:Object;
        private var classToStylesDict:Dictionary;
        private var classToInstancesDict:Dictionary;

        public function StyleManager()
        {
            styleToClassesHash = {};
            classToInstancesDict = new Dictionary(true);
            classToStylesDict = new Dictionary(true);
            classToDefaultStylesDict = new Dictionary(true);
            globalStyles = UIComponent.getStyleDefinition();
        }

        public static function clearComponentStyle(_arg_1:Object, _arg_2:String):void
        {
            var _local_3:Class;
            var _local_4:Object;
            _local_3 = getClassDef(_arg_1);
            _local_4 = getInstance().classToStylesDict[_local_3];
            if (((!(_local_4 == null)) && (!(_local_4[_arg_2] == null))))
            {
                delete _local_4[_arg_2];
                invalidateComponentStyle(_local_3, _arg_2);
            };
        }

        private static function getClassDef(component:Object):Class
        {
            if ((component is Class))
            {
                return (component as Class);
            };
            try
            {
                return (getDefinitionByName(getQualifiedClassName(component)) as Class);
            }
            catch(e:Error)
            {
                if ((component is UIComponent))
                {
                    try
                    {
                        return (component.loaderInfo.applicationDomain.getDefinition(getQualifiedClassName(component)) as Class);
                    }
                    catch(e:Error)
                    {
                    };
                };
            };
            return (null);
        }

        public static function clearStyle(_arg_1:String):void
        {
            setStyle(_arg_1, null);
        }

        public static function setComponentStyle(_arg_1:Object, _arg_2:String, _arg_3:Object):void
        {
            var _local_4:Class;
            var _local_5:Object;
            _local_4 = getClassDef(_arg_1);
            _local_5 = getInstance().classToStylesDict[_local_4];
            if (_local_5 == null)
            {
                _local_5 = (getInstance().classToStylesDict[_local_4] = {});
            };
            if (_local_5 == _arg_3)
            {
                return;
            };
            _local_5[_arg_2] = _arg_3;
            invalidateComponentStyle(_local_4, _arg_2);
        }

        private static function setSharedStyles(_arg_1:UIComponent):void
        {
            var _local_2:StyleManager;
            var _local_3:Class;
            var _local_4:Object;
            var _local_5:String;
            _local_2 = getInstance();
            _local_3 = getClassDef(_arg_1);
            _local_4 = _local_2.classToDefaultStylesDict[_local_3];
            for (_local_5 in _local_4)
            {
                _arg_1.setSharedStyle(_local_5, getSharedStyle(_arg_1, _local_5));
            };
        }

        public static function getComponentStyle(_arg_1:Object, _arg_2:String):Object
        {
            var _local_3:Class;
            var _local_4:Object;
            _local_3 = getClassDef(_arg_1);
            _local_4 = getInstance().classToStylesDict[_local_3];
            return ((_local_4 == null) ? null : _local_4[_arg_2]);
        }

        private static function getInstance():*
        {
            if (_instance == null)
            {
                _instance = new (StyleManager)();
            };
            return (_instance);
        }

        private static function invalidateComponentStyle(_arg_1:Class, _arg_2:String):void
        {
            var _local_3:Dictionary;
            var _local_4:Object;
            var _local_5:UIComponent;
            _local_3 = getInstance().classToInstancesDict[_arg_1];
            if (_local_3 == null)
            {
                return;
            };
            for (_local_4 in _local_3)
            {
                _local_5 = (_local_4 as UIComponent);
                if (_local_5 != null)
                {
                    _local_5.setSharedStyle(_arg_2, getSharedStyle(_local_5, _arg_2));
                };
            };
        }

        private static function invalidateStyle(_arg_1:String):void
        {
            var _local_2:Dictionary;
            var _local_3:Object;
            _local_2 = getInstance().styleToClassesHash[_arg_1];
            if (_local_2 == null)
            {
                return;
            };
            for (_local_3 in _local_2)
            {
                invalidateComponentStyle(Class(_local_3), _arg_1);
            };
        }

        public static function registerInstance(instance:UIComponent):void
        {
            var inst:StyleManager;
            var classDef:Class;
            var target:Class;
            var defaultStyles:Object;
            var styleToClasses:Object;
            var n:String;
            inst = getInstance();
            classDef = getClassDef(instance);
            if (classDef == null)
            {
                return;
            };
            if (inst.classToInstancesDict[classDef] == null)
            {
                inst.classToInstancesDict[classDef] = new Dictionary(true);
                target = classDef;
                while (defaultStyles == null)
                {
                    if (target["getStyleDefinition"] != null)
                    {
                        defaultStyles = target["getStyleDefinition"]();
                        break;
                    };
                    try
                    {
                        target = (instance.loaderInfo.applicationDomain.getDefinition(getQualifiedSuperclassName(target)) as Class);
                    }
                    catch(err:Error)
                    {
                        try
                        {
                            target = (getDefinitionByName(getQualifiedSuperclassName(target)) as Class);
                        }
                        catch(e:Error)
                        {
                            defaultStyles = UIComponent.getStyleDefinition();
                            break;
                        };
                    };
                };
                styleToClasses = inst.styleToClassesHash;
                for (n in defaultStyles)
                {
                    if (styleToClasses[n] == null)
                    {
                        styleToClasses[n] = new Dictionary(true);
                    };
                    styleToClasses[n][classDef] = true;
                };
                inst.classToDefaultStylesDict[classDef] = defaultStyles;
                inst.classToStylesDict[classDef] = {};
            };
            inst.classToInstancesDict[classDef][instance] = true;
            setSharedStyles(instance);
        }

        public static function getStyle(_arg_1:String):Object
        {
            return (getInstance().globalStyles[_arg_1]);
        }

        private static function getSharedStyle(_arg_1:UIComponent, _arg_2:String):Object
        {
            var _local_3:Class;
            var _local_4:StyleManager;
            var _local_5:Object;
            _local_3 = getClassDef(_arg_1);
            _local_4 = getInstance();
            _local_5 = _local_4.classToStylesDict[_local_3][_arg_2];
            if (_local_5 != null)
            {
                return (_local_5);
            };
            _local_5 = _local_4.globalStyles[_arg_2];
            if (_local_5 != null)
            {
                return (_local_5);
            };
            return (_local_4.classToDefaultStylesDict[_local_3][_arg_2]);
        }

        public static function setStyle(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:Object;
            _local_3 = getInstance().globalStyles;
            if (((_local_3[_arg_1] === _arg_2) && (!(_arg_2 is TextFormat))))
            {
                return;
            };
            _local_3[_arg_1] = _arg_2;
            invalidateStyle(_arg_1);
        }


    }
}//package fl.managers

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
    import flash.display.*;
    import flash.events.*;
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
//admin_configs

package 
{
    import com.cocolani.panels.admin_configs;

    public dynamic class admin_configs extends com.cocolani.panels.admin_configs 
    {


    }
}//package 

//------------------------------------------------------------
//admin_template_bt

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class admin_template_bt extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_activitymon

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_activitymon extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_auto

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_auto extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_ban

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_ban extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_bannedplyrs

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_bannedplyrs extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_broadcaster

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_broadcaster extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_chats

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_chats extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_configs

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_configs extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_generic_toggle

package 
{
    import com.cocolani.common.togglebutton;

    public dynamic class bt_generic_toggle extends togglebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_infosearch

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_infosearch extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_ipban

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_ipban extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_kick

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_kick extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_mod_chat

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_mod_chat extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_msg

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_msg extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_quickipban

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_quickipban extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_refreshsettings

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_refreshsettings extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_restart

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_restart extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_rooms

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_rooms extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_save

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_save extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_scrolldown

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_scrolldown extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_scrollup

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_scrollup extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_sorttoggle

package 
{
    import com.cocolani.common.togglebutton;

    public dynamic class bt_sorttoggle extends togglebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_swears

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_swears extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_teleport

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_teleport extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_teleporttouser

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_teleporttouser extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_user

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_user extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//CellRenderer_disabledSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class CellRenderer_disabledSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//CellRenderer_downSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class CellRenderer_downSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//CellRenderer_overSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class CellRenderer_overSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//CellRenderer_selectedDisabledSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class CellRenderer_selectedDisabledSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//CellRenderer_selectedDownSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class CellRenderer_selectedDownSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//CellRenderer_selectedOverSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class CellRenderer_selectedOverSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//CellRenderer_selectedUpSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class CellRenderer_selectedUpSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//CellRenderer_upSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class CellRenderer_upSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//close_button

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class close_button extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//focusRectSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class focusRectSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//List_skin

package 
{
    import flash.display.MovieClip;

    public dynamic class List_skin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//mc_hackreport

package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;

    public dynamic class mc_hackreport extends MovieClip 
    {

        public var count:TextField;


    }
}//package 

//------------------------------------------------------------
//mc_permitlogins

package 
{
    import com.cocolani.common.togglebutton;

    public dynamic class mc_permitlogins extends togglebutton 
    {


    }
}//package 

//------------------------------------------------------------
//mc_swearreport

package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;

    public dynamic class mc_swearreport extends MovieClip 
    {

        public var count:TextField;


    }
}//package 

//------------------------------------------------------------
//mc_userreport

package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;

    public dynamic class mc_userreport extends MovieClip 
    {

        public var count:TextField;


    }
}//package 

//------------------------------------------------------------
//ScrollArrowDown_disabledSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class ScrollArrowDown_disabledSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//ScrollArrowDown_downSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class ScrollArrowDown_downSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//ScrollArrowDown_overSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class ScrollArrowDown_overSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//ScrollArrowDown_upSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class ScrollArrowDown_upSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//ScrollArrowUp_disabledSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class ScrollArrowUp_disabledSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//ScrollArrowUp_downSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class ScrollArrowUp_downSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//ScrollArrowUp_overSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class ScrollArrowUp_overSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//ScrollArrowUp_upSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class ScrollArrowUp_upSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//ScrollBar_thumbIcon

package 
{
    import flash.display.MovieClip;

    public dynamic class ScrollBar_thumbIcon extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//ScrollThumb_downSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class ScrollThumb_downSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//ScrollThumb_overSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class ScrollThumb_overSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//ScrollThumb_upSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class ScrollThumb_upSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//ScrollTrack_skin

package 
{
    import flash.display.MovieClip;

    public dynamic class ScrollTrack_skin extends MovieClip 
    {


    }
}//package 

