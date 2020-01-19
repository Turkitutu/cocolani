// Decompiled by AS3 Sorcerer 5.72
// www.as3sorcerer.com

//------------------------------------------------------------
//com.cocolani.common.avatar_snapshot

package com.cocolani.common
{
    import flash.display.MovieClip;
    import flash.utils.getDefinitionByName;
    import flash.display.Sprite;
    import flash.geom.ColorTransform;
    import flash.events.Event;

    public class avatar_snapshot extends MovieClip 
    {

        internal var thisref:*;
        internal var avatarparts:* = [];
        internal var avatarContainer:*;
        internal var avatar:*;
        internal var maskInfo:* = [];
        internal var maskColours:* = [];
        internal var sex:* = "M";
        internal var tribe:* = 1;
        internal var direction:* = 0;
        internal var ischief:* = false;

        public function avatar_snapshot(_arg_1:String, _arg_2:String, _arg_3:Number=1, _arg_4:String="M", _arg_5:Number=1, _arg_6:*=false)
        {
            this.ischief = _arg_6;
            if (!this.ischief)
            {
                this.maskInfo = _arg_1.split(",");
                this.maskColours = _arg_2.split("|");
            };
            this.direction = _arg_5;
            this.tribe = _arg_3;
            this.sex = _arg_4;
            trace(((((((((("got " + this.maskInfo) + " ,  ") + this.maskColours) + " , ") + this.direction) + " , ") + this.tribe) + " , ") + this.sex));
            this.setupAvatar();
            this.thisref = this;
        }

        public function setupAvatar():*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            if (this.avatar)
            {
                for (_local_3 in this.avatarparts)
                {
                    this.avatarContainer.removeChild(this.avatarparts[_local_3]);
                };
                this.avatarContainer.removeChild(this.avatar);
                removeChild(this.avatarContainer);
                this.avatarparts = [];
                this.avatar = null;
                this.avatarContainer = null;
            };
            var _local_1:* = getDefinitionByName(("avatar" + this.tribe));
            this.avatarContainer = addChild(new Sprite());
            this.avatarContainer.scaleX = 2;
            this.avatarContainer.scaleY = 2;
            this.avatar = this.avatarContainer.addChild(new (_local_1)());
            this.avatar.gotoAndStop(("dir" + this.direction));
            this.avatarContainer.x = -281;
            this.avatarContainer.y = -168;
            for (_local_2 in this.maskInfo)
            {
                this.maskInfo[_local_2] = Number(this.maskInfo[_local_2]);
            };
            if (this.ischief)
            {
                _local_4 = getDefinitionByName((("avatar" + this.tribe) + "chief"));
                this.avatarparts[0] = this.avatarContainer.addChildAt(new (_local_4)(), this.avatarContainer.numChildren);
                this.avatarparts[0].gotoAndStop(("dir" + this.direction));
                this.avatarparts[0].partid = 0;
            }
            else
            {
                _local_4 = getDefinitionByName((((("avatar" + this.tribe) + this.sex) + "mask") + (this.maskInfo[0] + 1)));
                this.avatarparts[0] = this.avatarContainer.addChildAt(new (_local_4)(), this.avatarContainer.numChildren);
                this.avatarparts[0].gotoAndStop(("dir" + this.direction));
                this.avatarparts[0].partid = 0;
                _local_4 = getDefinitionByName((((("avatar" + this.tribe) + this.sex) + "mouth") + (this.maskInfo[3] + 1)));
                this.avatarparts[1] = this.avatarContainer.addChildAt(new (_local_4)(), this.avatarContainer.numChildren);
                this.avatarparts[1].gotoAndStop(("dir" + this.direction));
                this.avatarparts[1].partid = 3;
                _local_4 = getDefinitionByName((((("avatar" + this.tribe) + this.sex) + "eyeL") + (this.maskInfo[1] + 1)));
                this.avatarparts[2] = this.avatarContainer.addChildAt(new (_local_4)(), this.avatarContainer.numChildren);
                this.avatarparts[2].gotoAndStop(("dir" + this.direction));
                this.avatarparts[2].partid = 1;
                _local_4 = getDefinitionByName((((("avatar" + this.tribe) + this.sex) + "nose") + (this.maskInfo[2] + 1)));
                this.avatarparts[3] = this.avatarContainer.addChildAt(new (_local_4)(), this.avatarContainer.numChildren);
                this.avatarparts[3].gotoAndStop(("dir" + this.direction));
                this.avatarparts[3].partid = 2;
                _local_4 = getDefinitionByName((((("avatar" + this.tribe) + this.sex) + "eyeR") + (this.maskInfo[1] + 1)));
                this.avatarparts[4] = this.avatarContainer.addChildAt(new (_local_4)(), this.avatarContainer.numChildren);
                this.avatarparts[4].gotoAndStop(("dir" + this.direction));
                this.avatarparts[4].partid = 1;
                _local_3 = 0;
                while (_local_3 < this.maskColours.length)
                {
                    this.maskColours[_local_3] = this.maskColours[_local_3].split(",");
                    _local_5 = new ColorTransform(1, 1, 1, 1, this.maskColours[_local_3][0], this.maskColours[_local_3][1], this.maskColours[_local_3][2], 0);
                    _local_6 = 0;
                    while (_local_6 < 5)
                    {
                        if (this.avatarparts[_local_6].partid == _local_3)
                        {
                            this.avatarparts[_local_6].transform.colorTransform = _local_5;
                        };
                        _local_6++;
                    };
                    _local_3++;
                };
            };
            if (!this.avatarparts[0].getChildByName("obj"))
            {
                this.avatarContainer.addEventListener(Event.ENTER_FRAME, this.renderedFrame);
            }
            else
            {
                this.avatarparts[0].obj.gotoAndStop(1);
                this.avatar.av.gotoAndStop(1);
                if (!this.ischief)
                {
                    this.avatarparts[1].obj.gotoAndStop(1);
                    this.avatarparts[2].obj.gotoAndStop(1);
                    this.avatarparts[3].obj.gotoAndStop(1);
                    this.avatarparts[4].obj.gotoAndStop(1);
                };
            };
        }

        public function setClothing(_arg_1:*):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            if (!this.ischief)
            {
                _local_2 = _arg_1.split(",");
                _local_3 = 0;
                while (_local_3 < 5)
                {
                    if (this.avatarparts[(7 + _local_3)])
                    {
                        if (this.avatarparts[(7 + _local_3)].opposite)
                        {
                            this.avatarContainer.removeChild(this.avatarparts[(7 + _local_3)].opposite);
                        };
                        this.avatarContainer.removeChild(this.avatarparts[(7 + _local_3)]);
                        this.avatarparts[(7 + _local_3)] = null;
                    };
                    _local_3++;
                };
                if (_local_2 != undefined)
                {
                    _local_3 = 0;
                    while (_local_3 < _local_2.length)
                    {
                        if (_local_2[_local_3])
                        {
                            if (this.checkClassExist(("obj" + _local_2[_local_3])))
                            {
                                if (_local_3 == 2)
                                {
                                    _local_4 = getDefinitionByName((("obj" + _local_2[_local_3]) + "_l"));
                                    this.avatarparts[(7 + _local_3)] = this.avatarContainer.addChildAt(new (_local_4)(), this.avatarContainer.numChildren);
                                    this.avatarparts[(7 + _local_3)].gotoAndStop(("dir" + this.direction));
                                    if (this.avatarparts[(7 + _local_3)].getChildByName("obj"))
                                    {
                                        this.avatarparts[(7 + _local_3)].obj.stop();
                                    }
                                    else
                                    {
                                        this.avatarparts[(7 + _local_3)].addEventListener(Event.ENTER_FRAME, this.framefix);
                                    };
                                    _local_4 = getDefinitionByName((("obj" + _local_2[_local_3]) + "_r"));
                                    this.avatarparts[(7 + _local_3)].opposite = this.avatarContainer.addChildAt(new (_local_4)(), this.avatarContainer.numChildren);
                                    this.avatarparts[(7 + _local_3)].opposite.gotoAndStop(("dir" + this.direction));
                                    if (this.avatarparts[(7 + _local_3)].getChildByName("obj"))
                                    {
                                        this.avatarparts[(7 + _local_3)].opposite.obj.stop();
                                    }
                                    else
                                    {
                                        this.avatarparts[(7 + _local_3)].opposite.addEventListener(Event.ENTER_FRAME, this.framefix);
                                    };
                                }
                                else
                                {
                                    _local_4 = getDefinitionByName(("obj" + _local_2[_local_3]));
                                    this.avatarparts[(7 + _local_3)] = this.avatarContainer.addChildAt(new (_local_4)(), this.avatarContainer.numChildren);
                                    this.avatarparts[(7 + _local_3)].gotoAndStop("dir1");
                                    this.avatarparts[(7 + _local_3)].gotoAndStop(("dir" + this.direction));
                                    if (this.avatarparts[(7 + _local_3)].getChildByName("obj"))
                                    {
                                        this.avatarparts[(7 + _local_3)].obj.stop();
                                    }
                                    else
                                    {
                                        this.avatarparts[(7 + _local_3)].addEventListener(Event.ENTER_FRAME, this.framefix);
                                    };
                                    if (((_local_3 == 1) && (this.sex == "F")))
                                    {
                                        this.avatarparts[(7 + _local_3)].y = (this.avatarparts[(7 + _local_3)].y + 7.5);
                                    };
                                };
                            }
                            else
                            {
                                this.thisref.stage.getChildAt(0).showmsg("Profile displaying while avatar clothing downloading. Please contact tech support to let them know about this message.");
                            };
                        };
                        _local_3++;
                    };
                };
                this.setLayers();
            };
        }

        private function setLayers():*
        {
            if (this.avatarparts[7])
            {
                this.avatarContainer.setChildIndex(this.avatarparts[7], 1);
            };
            if (this.avatarparts[8])
            {
                this.avatarContainer.setChildIndex(this.avatarparts[8], (this.avatarContainer.numChildren - 1));
            };
            if (this.avatarparts[9])
            {
                this.avatarContainer.setChildIndex(this.avatarparts[9], (this.avatarContainer.getChildIndex(this.avatarparts[2]) - 1));
                this.avatarContainer.setChildIndex(this.avatarparts[9].opposite, (this.avatarContainer.getChildIndex(this.avatarparts[4]) - 1));
            };
            if (this.avatarparts[10])
            {
                this.avatarContainer.setChildIndex(this.avatarparts[10], (this.avatarContainer.numChildren - 1));
            };
        }

        private function framefix(_arg_1:Event):*
        {
            if (_arg_1.currentTarget.getChildByName("obj"))
            {
                _arg_1.currentTarget.obj.gotoAndStop(1);
                _arg_1.currentTarget.removeEventListener(Event.ENTER_FRAME, this.framefix);
            };
        }

        private function renderedFrame(_arg_1:Event):*
        {
            if (this.avatarparts[0].getChildByName("obj"))
            {
                this.avatarContainer.removeEventListener(Event.ENTER_FRAME, this.renderedFrame);
                this.avatarparts[0].obj.gotoAndStop(1);
                if (!this.ischief)
                {
                    this.avatarparts[1].obj.gotoAndStop(1);
                    this.avatarparts[2].obj.gotoAndStop(1);
                    this.avatarparts[3].obj.gotoAndStop(1);
                    this.avatarparts[4].obj.gotoAndStop(1);
                    this.avatar.av.gotoAndStop(1);
                };
            };
        }

        private function checkClassExist(className:String):*
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
}//package com.cocolani.common

//------------------------------------------------------------
//com.cocolani.common.collission_detect

package com.cocolani.common
{
    import flash.display.Sprite;

    public class collission_detect extends Sprite 
    {


    }
}//package com.cocolani.common

//------------------------------------------------------------
//com.cocolani.common.cursor

package com.cocolani.common
{
    import flash.display.MovieClip;
    import flash.utils.getDefinitionByName;
    import flash.geom.Rectangle;
    import flash.ui.Mouse;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Point;

    public class cursor extends MovieClip 
    {

        internal static var offsetStandard:* = [165, 117];

        internal var cursorRef:*;
        internal var objdata:*;
        public var ctype:String;
        internal var stageRef:*;
        internal var thisref:*;
        internal var col_ref:*;
        internal var col_collide:* = [];
        internal var counter:* = 0;
        internal var dropOKalpha:* = 0.6;
        internal var dropnotOKalpha:* = 0.2;
        public var dropOK:* = false;
        public var isfurniture:* = false;

        public function cursor()
        {
            this.thisref = this;
        }

        public function getCursorSize():*
        {
            return (new Array(this.cursorRef.width, this.cursorRef.height));
        }

        public function getObjData():*
        {
            return (this.objdata);
        }

        public function setcursor(_arg_1:*, _arg_2:String, _arg_3:*):*
        {
            var _local_4:*;
            this.objdata = _arg_1;
            this.ctype = _arg_2;
            if (this.ctype == "simple")
            {
                _local_4 = getDefinitionByName("gui_cursor");
                this.cursorRef = addChild(new (_local_4)());
                this.cursorRef.gotoAndStop(_arg_1);
                this.thisref.startDrag(true, new Rectangle(0, 0, this.thisref.stage.stageWidth, this.thisref.stage.stageHeight));
                Mouse.hide();
                mouseEnabled = false;
                mouseChildren = false;
            }
            else
            {
                if (((this.ctype == "SCENEINV") || (this.objdata.type == "6")))
                {
                    this.isfurniture = true;
                };
                this.stageRef = _arg_3;
                if (((this.ctype == "INV") || (this.ctype == "SCENEINV")))
                {
                    if (this.ctype == "INV")
                    {
                        trace(((((("data: type= " + _arg_1.type) + " rid = ") + _arg_1.rid) + " desc : ") + _arg_1.desc));
                    };
                    if (this.ctype == "INV")
                    {
                        _local_4 = getDefinitionByName(("obj" + _arg_1.rid));
                    }
                    else
                    {
                        _local_4 = getDefinitionByName(("obj" + _arg_1[1]));
                    };
                    this.cursorRef = addChild(new (_local_4)());
                    if (this.ctype == "INV")
                    {
                        if (_arg_1.type == 6)
                        {
                            if (!_arg_1.rot)
                            {
                                _arg_1.rot = 1;
                            };
                            if (!this.objdata.rot)
                            {
                                this.objdata.rot = 1;
                            };
                            _local_4 = getDefinitionByName((("obj" + _arg_1.rid) + "_col"));
                            this.col_ref = addChild(new (_local_4)());
                            this.col_ref.visible = 0;
                            this.col_ref.gotoAndStop(("dir" + _arg_1.rot));
                            this.cursorRef.gotoAndStop("thumbnail");
                        }
                        else
                        {
                            this.cursorRef.gotoAndStop("thumbnail");
                            this.cursorRef.x = -30;
                            this.cursorRef.y = -20;
                        };
                    }
                    else
                    {
                        _local_4 = getDefinitionByName((("obj" + _arg_1[1]) + "_col"));
                        this.col_ref = addChild(new (_local_4)());
                        this.col_ref.alpha = 0;
                        this.col_ref.gotoAndStop(("dir" + _arg_1[4]));
                        this.cursorRef.setdir(_arg_1[4], false);
                        this.cursorRef.x = -(this.cursorRef.offsetStandard[0]);
                        this.cursorRef.y = -(this.cursorRef.offsetStandard[1]);
                        this.col_ref.x = this.cursorRef.x;
                        this.col_ref.y = this.cursorRef.y;
                        if (this.checkDropPerm())
                        {
                            this.thisref.alpha = this.dropOKalpha;
                        }
                        else
                        {
                            this.thisref.alpha = this.dropnotOKalpha;
                        };
                    };
                    if (this.col_ref)
                    {
                        if (this.col_ref.hasEventListener(Event.ENTER_FRAME))
                        {
                            this.col_ref.removeEventListener(Event.ENTER_FRAME, this.getCollissionCat);
                        };
                        this.col_ref.addEventListener(Event.ENTER_FRAME, this.getCollissionCat);
                        this.counter = 0;
                    };
                    this.thisref.startDrag(true, new Rectangle(0, 0, this.thisref.stage.stageWidth, this.thisref.stage.stageHeight));
                    this.stageRef.addEventListener(MouseEvent.MOUSE_MOVE, this.chkTargets);
                    this.stageRef.mc_interface.playerPopupRef.inventoryContainer.trade_drop.addEventListener(MouseEvent.MOUSE_OVER, this.mouse_target);
                    this.stageRef.mc_interface.playerPopupRef.inventoryContainer.trade_drop.addEventListener(MouseEvent.MOUSE_OUT, this.mouse_target);
                };
                mouseEnabled = false;
                mouseChildren = false;
            };
        }

        private function mouse_target(_arg_1:MouseEvent):*
        {
            if (_arg_1.type == "mouseOver")
            {
                this.stageRef.mc_interface.playerPopupContainer.inventoryContainer.trade_drop.gotoAndStop(2);
            }
            else
            {
                this.stageRef.mc_interface.playerPopupContainer.inventoryContainer.trade_drop.gotoAndStop(1);
            };
        }

        private function getCollissionCat(_arg_1:Event):*
        {
            this.col_collide = [];
            var _local_2:* = 0;
            while (_local_2 < this.col_ref.numChildren)
            {
                if ((this.col_ref.getChildAt(_local_2) is collission_detect))
                {
                    this.col_collide.push(this.col_ref.getChildAt(_local_2));
                };
                _local_2++;
            };
            if (this.col_collide < 5)
            {
                trace((("Found " + this.col_collide.length) + " collission detectors in object."));
            };
            if (this.col_collide.length > 0)
            {
                this.col_ref.removeEventListener(Event.ENTER_FRAME, this.getCollissionCat);
            };
            this.counter++;
            if (this.counter == 20)
            {
                trace("Warning : There are no collission detectors in this furniture object.");
            };
        }

        private function centre():*
        {
            this.cursorRef.x = (this.cursorRef.width / 2);
            this.cursorRef.y = (this.cursorRef.height / 2);
        }

        public function checkDropPerm():*
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            this.dropOK = true;
            if (this.stageRef.mc_scene.loadHomeID)
            {
                _local_3 = {};
                if ((this.objdata is Array))
                {
                    _local_3.subtype = this.objdata[5];
                    _local_3.type = 6;
                }
                else
                {
                    _local_3.subtype = this.objdata.subtype;
                    _local_3.type = this.objdata.type;
                };
                if (((_local_3.subtype == "3") && (_local_3.type == "6")))
                {
                    for (_local_1 in this.col_collide)
                    {
                        _local_2 = this.col_ref.localToGlobal(new Point(this.col_collide[_local_1].x, this.col_collide[_local_1].y));
                        if (!this.stageRef.mc_scene.sceneRef.wallLocation1.hitTestPoint(_local_2.x, _local_2.y, true))
                        {
                            this.dropOK = false;
                            break;
                        };
                    };
                }
                else
                {
                    if (((_local_3.subtype == "1") && (_local_3.type == "6")))
                    {
                        this.stageRef.mc_scene.sceneRef.collide1.visible = true;
                        this.stageRef.mc_scene.sceneRef.collide1.alpha = 0;
                        this.stageRef.mc_scene.sceneRef.collide1.mouseChildren = false;
                        this.stageRef.mc_scene.sceneRef.collide1.mouseEnabled = false;
                        for (_local_1 in this.col_collide)
                        {
                            _local_2 = this.col_ref.localToGlobal(new Point(this.col_collide[_local_1].x, this.col_collide[_local_1].y));
                            if (this.stageRef.mc_scene.sceneRef.collide1.hitTestPoint(_local_2.x, _local_2.y, true))
                            {
                                _local_4 = this.stageRef.mc_scene.sceneRef.collide1.getObjectsUnderPoint(_local_2);
                                for (_local_5 in _local_4)
                                {
                                    if (this.stageRef.mc_scene.sceneRef.collide1.contains(_local_4[_local_5]))
                                    {
                                        trace("GOT A RESULT!!");
                                    };
                                    if (((this.getParentMCname(_local_4[_local_5]) == "collide1") || (this.getParentMCname(_local_4[_local_5]) == "doorblocker")))
                                    {
                                        this.dropOK = false;
                                        break;
                                    };
                                };
                                if (!this.dropOK) break;
                            };
                        };
                    }
                    else
                    {
                        for (_local_1 in this.col_collide)
                        {
                            _local_2 = this.col_ref.localToGlobal(new Point(this.col_collide[_local_1].x, this.col_collide[_local_1].y));
                            if (this.stageRef.mc_scene.sceneRef.collide1.hitTestPoint(_local_2.x, _local_2.y, true))
                            {
                                this.dropOK = false;
                                break;
                            };
                        };
                    };
                };
            };
            return (this.dropOK);
        }

        private function getParentMCname(_arg_1:*):*
        {
            while ((!(_arg_1 is MovieClip)))
            {
                _arg_1 = _arg_1.parent;
            };
            return (_arg_1.name);
        }

        public function dropOverTradeItem():*
        {
            if (this.stageRef.mc_interface.playerPopupRef.inventoryContainer.trade_drop.hitTestPoint(this.stageRef.mouseX, this.stageRef.mouseY, true))
            {
                return (true);
            };
            return (false);
        }

        private function chkTargets(_arg_1:MouseEvent):*
        {
            var _local_2:* = this.stageRef.mc_interface.hitTestPoint(this.thisref.x, this.thisref.y, true);
            if ((((_local_2) && (this.stageRef.mc_interface.playerPopupContainer)) && (this.stageRef.mc_interface.playerPopupContainer.hitTestPoint(this.thisref.x, this.thisref.y, true))))
            {
                if (!this.stageRef.mc_interface.playerPopupContainer.bgd.hitTestPoint(this.thisref.x, this.thisref.y, true))
                {
                    _local_2 = false;
                };
            };
            if (this.isfurniture)
            {
                if (_local_2)
                {
                    this.cursorRef.gotoAndStop("thumbnail");
                    this.cursorRef.x = -25;
                    this.cursorRef.y = -25;
                    this.thisref.alpha = 1;
                    this.dropOK = false;
                }
                else
                {
                    this.cursorRef.x = -(this.cursorRef.offsetStandard[0]);
                    this.cursorRef.y = -(this.cursorRef.offsetStandard[1]);
                    this.col_ref.x = this.cursorRef.x;
                    this.col_ref.y = this.cursorRef.y;
                    if (this.checkDropPerm())
                    {
                        this.cursorRef.alpha = this.dropOKalpha;
                    }
                    else
                    {
                        this.cursorRef.alpha = this.dropnotOKalpha;
                    };
                    if (this.ctype == "SCENEINV")
                    {
                        if (this.objdata[5] == "3")
                        {
                            this.checkWallHanging();
                            this.objdata[4] = this.cursorRef.myDir;
                        }
                        else
                        {
                            if (this.cursorRef.currentLabel != ("dir" + this.objdata[4]))
                            {
                                this.cursorRef.setdir(this.objdata[4], false);
                            };
                        };
                    }
                    else
                    {
                        if (this.objdata.subtype == "3")
                        {
                            this.checkWallHanging();
                            this.objdata.rot = this.cursorRef.myDir;
                        }
                        else
                        {
                            this.cursorRef.gotoAndStop("dir1");
                            this.cursorRef.setdir(1, false);
                        };
                    };
                };
            }
            else
            {
                if (((!(this.stageRef.mc_scene.loadHomeID)) && (this.stageRef.mc_scene.sceneRef)))
                {
                    try
                    {
                        this.stageRef.mc_scene.sceneRef.checkForInteract(new Point(this.cursorRef.x, this.cursorRef.y));
                    }
                    catch(e:Error)
                    {
                    };
                };
            };
        }

        private function checkWallHanging():*
        {
            var _local_1:* = this.stageRef.mc_scene.sceneRef.globalToLocal(new Point(this.stageRef.cursorRef.x, this.stageRef.cursorRef.y));
            if (this.stageRef.mc_scene.sceneRef.wallLocation1.hitTestPoint(_local_1.x, _local_1.y))
            {
                if (this.stageRef.mc_scene.sceneRef.wallLocation1.wall_c.hitTestPoint(_local_1.x, _local_1.y))
                {
                    this.cursorRef.setdir(1, false);
                }
                else
                {
                    if (this.stageRef.mc_scene.sceneRef.wallLocation1.wall_r.hitTestPoint(_local_1.x, _local_1.y))
                    {
                        this.cursorRef.setdir(3, false);
                    }
                    else
                    {
                        if (this.stageRef.mc_scene.sceneRef.wallLocation1.wall_l.hitTestPoint(_local_1.x, _local_1.y))
                        {
                            this.cursorRef.setdir(2, false);
                        };
                    };
                };
            }
            else
            {
                if (this.cursorRef.myDir != 1)
                {
                    this.cursorRef.setdir(1, false);
                };
            };
        }

        public function hideCursor():*
        {
            if (this.ctype != "simple")
            {
                this.stageRef.removeEventListener(MouseEvent.MOUSE_MOVE, this.chkTargets);
                this.stageRef.mc_interface.playerPopupRef.inventoryContainer.trade_drop.removeEventListener(MouseEvent.MOUSE_OVER, this.mouse_target);
                this.stageRef.mc_interface.playerPopupRef.inventoryContainer.trade_drop.removeEventListener(MouseEvent.MOUSE_OUT, this.mouse_target);
                if (this.col_ref)
                {
                    this.col_ref.removeEventListener(Event.ENTER_FRAME, this.getCollissionCat);
                };
            };
            Mouse.show();
            this.cursorRef.visible = false;
            this.thisref.stopDrag();
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
        public var mc_name2:MovieClip;
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
//com.cocolani.gui.actionsMenu

package com.cocolani.gui
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.display.Shape;

    public class actionsMenu extends MovieClip 
    {

        public var powicon:MovieClip;
        private var thisref:*;
        public var actions:* = [];
        public var actionButtons:* = [];
        public var background:*;
        public var backgroundContainer:*;
        internal var lastSave:*;

        public function actionsMenu()
        {
            stop();
            this.thisref = this;
            buttonMode = true;
            this.addListener(this.thisref.powicon);
            this.powicon.gotoAndStop(1);
            mouseChildren = true;
            this.backgroundContainer = this.thisref.addChildAt(new MovieClip(), 0);
            this.backgroundContainer.buttonMode = true;
            this.backgroundContainer.mouseChildren = false;
        }

        public function enable():*
        {
            this.addListener(this.thisref.powicon);
        }

        public function disable():*
        {
            this.closemenu();
            this.removeListener(this.thisref.powicon);
        }

        public function addListener(_arg_1:*):*
        {
            _arg_1.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseEvent);
            _arg_1.addEventListener(MouseEvent.CLICK, this.onMouseEvent);
            _arg_1.addEventListener(MouseEvent.MOUSE_OUT, this.onMouseEvent);
        }

        public function removeListener(_arg_1:*):*
        {
            _arg_1.removeEventListener(MouseEvent.MOUSE_OVER, this.onMouseEvent);
            _arg_1.removeEventListener(MouseEvent.CLICK, this.onMouseEvent);
            _arg_1.removeEventListener(MouseEvent.MOUSE_OUT, this.onMouseEvent);
        }

        public function setDefinitions(_arg_1:Array):*
        {
            this.actions = _arg_1;
        }

        private function closemenu():*
        {
            var _local_1:*;
            for (_local_1 in this.actionButtons)
            {
                removeChild(this.actionButtons[_local_1]);
            };
            this.actionButtons = [];
            if (this.background)
            {
                this.backgroundContainer.removeChild(this.background);
                this.background = null;
            };
        }

        public function chkmouse(_arg_1:Event):*
        {
            if (!this.thisref.hitTestPoint(this.thisref.stage.mouseX, this.thisref.stage.mouseY, false))
            {
                this.closemenu();
                removeEventListener(Event.ENTER_FRAME, this.chkmouse);
            };
        }

        public function onMouseEvent(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            if (_arg_1.type == "mouseOver")
            {
                _arg_1.currentTarget.nextFrame();
                if (_arg_1.currentTarget.name == "powicon")
                {
                    if (!this.background)
                    {
                        for (_local_2 in this.actions)
                        {
                            this.actionButtons.push(this.thisref.addChild(new mc_genericbutton()));
                            _local_3 = this.actionButtons[(this.actionButtons.length - 1)];
                            _local_3.y = ((_local_2 * 20) + 35);
                            _local_3.txt.text = this.actions[_local_2].desc;
                            _local_3.gotoAndStop(1);
                            _local_3.buttonMode = true;
                            _local_3.mouseChildren = false;
                            _local_3.id = this.actions[_local_2].id;
                            _local_3.data = this.actions[_local_2].data;
                            this.addListener(_local_3);
                        };
                        this.background = this.backgroundContainer.addChild(new Shape());
                        this.background.graphics.beginFill(0, 0);
                        this.background.graphics.drawRect(0, 0, _local_3.width, (_local_3.y + _local_3.height));
                        this.background.graphics.endFill();
                        addEventListener(Event.ENTER_FRAME, this.chkmouse);
                    };
                };
            }
            else
            {
                if (_arg_1.type == "mouseOut")
                {
                    _arg_1.currentTarget.gotoAndStop(1);
                }
                else
                {
                    _arg_1.currentTarget.nextFrame();
                    if (!this.lastSave)
                    {
                        this.lastSave = new Date();
                    }
                    else
                    {
                        _local_4 = new Date();
                        if ((_local_4 - this.lastSave) < 1500)
                        {
                            return;
                        };
                        this.lastSave = _local_4;
                    };
                    if (_arg_1.currentTarget.stage.getChildAt(0).getChildByName("mc_interface"))
                    {
                        _arg_1.currentTarget.stage.getChildAt(0).mc_interface.audio.playSound("sfx_click");
                    };
                    if (_arg_1.currentTarget.name != "powicon")
                    {
                        this.thisref.parent.doaction(_arg_1.currentTarget.id, _arg_1.currentTarget.data);
                    };
                };
            };
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.audioController

package com.cocolani.gui
{
    import flash.display.MovieClip;
    import flash.media.SoundLoaderContext;
    import flash.media.SoundTransform;
    import flash.events.MouseEvent;
    import flash.net.URLRequest;
    import flash.media.Sound;
    import flash.events.IOErrorEvent;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;
    import flash.utils.Timer;
    import flash.events.TimerEvent;

    public class audioController extends MovieClip 
    {

        private static var sfx:Array = new Array(16);
        private static var bgdmusic:Array = new Array(8);

        public var audioMain:Boolean = true;
        private var audiolevels:* = [1, 1, 1, 1];
        private var audioLoaderContext:* = new SoundLoaderContext(1000, false);
        public var thisref:*;
        public var newTransform:*;
        public var timerSequence:*;
        public var timerData:*;
        public var fadeVelocity:* = 0.05;
        private var debugAudio:* = false;
        public var toolText:*;

        public function audioController()
        {
            this.thisref = this;
            this.newTransform = new SoundTransform(1, 0);
            this.timerSequence = [];
            this.timerData = [];
            super();
            stop();
            buttonMode = true;
            mouseChildren = false;
            addEventListener(MouseEvent.CLICK, this.toggleme);
            addEventListener(MouseEvent.MOUSE_OUT, this.toggleme);
            addEventListener(MouseEvent.MOUSE_OVER, this.toggleme);
            addEventListener(MouseEvent.MOUSE_DOWN, this.toggleme);
            addEventListener(MouseEvent.MOUSE_UP, this.toggleme);
        }

        public function setAudio(_arg_1:Number):*
        {
            this.audioMain = Boolean(_arg_1);
            if (this.audioMain)
            {
                gotoAndStop(1);
            }
            else
            {
                gotoAndStop(3);
            };
            var _local_2:* = ((this.audioMain) ? 1 : 0);
            var _local_3:* = {
                "setvolume":true,
                "volume":_local_2
            };
            this.setlevels(_local_3);
        }

        private function toggleme(_arg_1:MouseEvent):void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            if (_arg_1.type == "click")
            {
                this.audioMain = (!(this.audioMain));
                _local_2 = ((this.audioMain) ? 1 : 0);
                _local_3 = {
                    "setvolume":true,
                    "volume":_local_2
                };
                this.setlevels(_local_3);
                if (this.thisref.stage.getChildAt(0).mc_scene.gameRef)
                {
                    this.thisref.stage.getChildAt(0).mc_scene.broadcastGameSound(_local_2);
                };
                if (this.thisref.stage.getChildAt(0).loadedAVData)
                {
                    _local_4 = {};
                    _local_4.ext = "main";
                    _local_4.cmd = "updatePref";
                    _local_5 = this.thisref.stage.getChildAt(0).loadedAVData.prefs.split(",");
                    _local_5[0] = _local_2;
                    _local_4.prefs = _local_5.join(",");
                    this.thisref.stage.getChildAt(0).sendXTmessage(_local_4);
                };
            }
            else
            {
                if (_arg_1.type == "mouseOver")
                {
                    if (this.audioMain)
                    {
                        gotoAndStop(2);
                    }
                    else
                    {
                        gotoAndStop(4);
                    };
                }
                else
                {
                    if (((_arg_1.type == "mouseOut") || (_arg_1.type == "mouseUp")))
                    {
                        if (this.audioMain)
                        {
                            gotoAndStop(1);
                        }
                        else
                        {
                            gotoAndStop(3);
                        };
                    }
                    else
                    {
                        if (_arg_1.type == "mouseDown")
                        {
                            if (this.audioMain)
                            {
                                gotoAndStop(1);
                            }
                            else
                            {
                                gotoAndStop(3);
                            };
                        };
                    };
                };
            };
        }

        public function playAudioStream(file:String, chn:Number, rpt:Number=1):void
        {
            var streamURL:* = undefined;
            var i:* = undefined;
            var soundurl:* = undefined;
            if (this.audioMain)
            {
                this.stopFades();
                if (chn == -1)
                {
                    i = 0;
                    while (i < bgdmusic.length)
                    {
                        if (!bgdmusic[i])
                        {
                            chn = i;
                            break;
                        };
                        i++;
                    };
                };
                streamURL = new URLRequest(((this.thisref.stage.getChildAt(0).baseURL + "aud/") + file));
                try
                {
                    soundurl = new Sound(streamURL, this.audioLoaderContext);
                    soundurl.addEventListener(IOErrorEvent.IO_ERROR, this.loaderror);
                    if (bgdmusic[chn])
                    {
                        bgdmusic[chn].stop();
                    };
                    bgdmusic[chn] = soundurl.play(0, rpt);
                    bgdmusic[chn].addEventListener(Event.SOUND_COMPLETE, this.audioComplete);
                }
                catch(e:Error)
                {
                    trace(("Error playing music file : " + e));
                };
            };
        }

        private function audioComplete(_arg_1:Event):*
        {
            var _local_2:*;
            for (_local_2 in bgdmusic)
            {
                if (_arg_1.currentTarget == bgdmusic[_local_2])
                {
                    if (this.debugAudio)
                    {
                        trace("Found audio channel to kill");
                    };
                    delete bgdmusic[_local_2];
                    break;
                };
            };
        }

        private function loaderror(_arg_1:IOErrorEvent):*
        {
            trace(("Could not load audio file!!! " + _arg_1));
        }

        public function playBgdLoop(ref:String, chn:Number):void
        {
            var newsound:* = undefined;
            var soundref:* = undefined;
            if (this.audioMain)
            {
                this.stopFades();
                newsound = getDefinitionByName(ref);
                soundref = new (newsound)();
                if (sfx[chn])
                {
                    sfx[chn].stop();
                    delete sfx[chn];
                };
                try
                {
                    sfx[chn] = soundref.play(0, 999999);
                }
                catch(e:Error)
                {
                    trace(("Error playing sample file : " + e));
                };
                if (this.debugAudio)
                {
                    trace(((("Playing background loop " + ref) + " on ch: ") + chn));
                };
            };
        }

        public function sequencer(_arg_1:Array):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            this.stopSounds();
            removeEventListener(Event.ENTER_FRAME, this.fadeOutListener);
            if (this.audioMain)
            {
                this.newTransform.volume = 1;
                this.setlevels();
            };
            for (_local_2 in _arg_1)
            {
                if (_arg_1[_local_2].rMin)
                {
                    if (((isNaN(_arg_1[_local_2].rMax)) || (isNaN(_arg_1[_local_2].rMin))))
                    {
                        trace("WARNING, random Max or Min times not clear!");
                    };
                    _local_3 = ((_arg_1[_local_2].rMin + Math.round((Math.random() * (_arg_1[_local_2].rMax - _arg_1[_local_2].rMin)))) * 1000);
                    _local_4 = this.timerSequence.push(new Timer(_local_3, 1));
                    _local_4 = this.timerSequence[(_local_4 - 1)];
                    this.timerData.push(_arg_1[_local_2]);
                    _local_4.start();
                    _local_4.addEventListener(TimerEvent.TIMER, this.sequencerEvent);
                }
                else
                {
                    this.playSound(_arg_1[_local_2].name);
                    if (_arg_1[_local_2].delay)
                    {
                        _local_4 = this.timerSequence.push(new Timer((_arg_1[_local_2].delay * 1000), 0));
                        _local_4 = this.timerSequence[(_local_4 - 1)];
                        this.timerData.push(_arg_1[_local_2]);
                        _local_4.start();
                        _local_4.addEventListener(TimerEvent.TIMER, this.sequencerEvent);
                    };
                };
            };
        }

        private function sequencerEvent(e:TimerEvent):*
        {
            var i:* = undefined;
            var mydelay:* = undefined;
            for (i in this.timerSequence)
            {
                if (this.timerSequence[i] == e.currentTarget)
                {
                    if (this.timerData[i].rMin)
                    {
                        try
                        {
                            if (this.timerData[i].stream)
                            {
                                this.playAudioStream(this.timerData[i].name, -1);
                            }
                            else
                            {
                                this.playSound(this.timerData[i].name);
                            };
                        }
                        catch(e:Error)
                        {
                            trace(("Error playing sample file : " + e));
                        };
                        mydelay = ((this.timerData[i].rMin + Math.round((Math.random() * (this.timerData[i].rMax - this.timerData[i].rMin)))) * 1000);
                        if (this.debugAudio)
                        {
                            trace(("new delay set to : " + mydelay));
                        };
                        this.timerSequence[i].delay = mydelay;
                        this.timerSequence[i].repeatCount = 1;
                        this.timerSequence[i].reset();
                        this.timerSequence[i].start();
                    }
                    else
                    {
                        this.playSound(this.timerData[i].name);
                    };
                };
            };
        }

        public function fadeOutListener(_arg_1:Event):*
        {
            this.newTransform.volume = (this.newTransform.volume - this.fadeVelocity);
            if (this.debugAudio)
            {
                trace(((("Fade velocity = " + this.fadeVelocity) + " transform vol = ") + this.newTransform.volume));
            };
            this.setlevels();
            if (this.newTransform.volume <= 0)
            {
                removeEventListener(Event.ENTER_FRAME, this.fadeOutListener);
                this.stopSounds();
            };
        }

        public function fadeOut(_arg_1:*=0.05):*
        {
            this.fadeVelocity = _arg_1;
            if (this.audioMain)
            {
                addEventListener(Event.ENTER_FRAME, this.fadeOutListener);
            };
        }

        public function stopFades():*
        {
            if (hasEventListener(Event.ENTER_FRAME))
            {
                this.stopSounds();
                removeEventListener(Event.ENTER_FRAME, this.fadeOutListener);
                this.newTransform.volume = 1;
                this.setlevels({"volume":1});
            };
        }

        public function playSound(ref:String, chn:Number=0, vol:Number=1, forceplay:Boolean=false):void
        {
            var newsound:* = undefined;
            var soundref:* = undefined;
            var i:* = undefined;
            var tmpTransform:* = undefined;
            if (this.audioMain)
            {
                newsound = getDefinitionByName(ref);
                soundref = new (newsound)();
                if (!forceplay)
                {
                    if (((chn == 0) && (sfx[0])))
                    {
                        i = 0;
                        while (i < 16)
                        {
                            if (!sfx[i])
                            {
                                chn = i;
                                break;
                            };
                            i++;
                        };
                    };
                    if (((chn == 15) && (this.thisref.stage.getChildAt(0).statusType > 6)))
                    {
                        this.thisref.stage.getChildAt(0).showmsg("Filled up sound bank!");
                    };
                };
                if (sfx[chn])
                {
                    sfx[chn].stop();
                };
                try
                {
                    sfx[chn] = soundref.play();
                    if (this.debugAudio)
                    {
                        trace(((("Playing  " + ref) + " on ch: ") + chn));
                    };
                    sfx[chn].addEventListener(Event.SOUND_COMPLETE, this.killsoundchn);
                    tmpTransform = new SoundTransform(vol);
                    sfx[chn].soundTransform = tmpTransform;
                }
                catch(e:Error)
                {
                    trace(("Error playing sample file : " + e));
                };
            };
        }

        public function checkChannel(_arg_1:*):*
        {
            if (sfx[_arg_1])
            {
                return (true);
            };
            return (false);
        }

        private function killsoundchn(_arg_1:Event):*
        {
            var _local_2:*;
            for (_local_2 in sfx)
            {
                if (sfx[_local_2] == _arg_1.currentTarget)
                {
                    sfx[_local_2].removeEventListener(Event.SOUND_COMPLETE, this.killsoundchn);
                    delete sfx[_local_2];
                    break;
                };
            };
        }

        public function stopSounds():*
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:*;
            this.stopBgdLoop();
            for (_local_1 in bgdmusic)
            {
                this.stopAudioStream(_local_1);
            };
            for (_local_2 in this.timerSequence)
            {
                this.timerSequence[_local_2].removeEventListener(TimerEvent.TIMER, this.sequencerEvent);
                delete this.timerSequence[_local_2];
            };
            for (_local_3 in sfx)
            {
                sfx[_local_3].stop();
            };
            sfx = [];
            this.timerSequence = [];
            this.timerData = [];
        }

        public function stopBgdLoop(_arg_1:*=undefined):void
        {
            var _local_2:*;
            if (((_arg_1) && (sfx[_arg_1])))
            {
                sfx[_arg_1].stop();
            }
            else
            {
                for (_local_2 in sfx)
                {
                    sfx[_local_2].stop();
                };
            };
        }

        public function stopAudioStream(_arg_1:Number):void
        {
            if (bgdmusic[_arg_1])
            {
                bgdmusic[_arg_1].stop();
            };
        }

        public function setlevels(param:*=null):void
        {
            var i:* = undefined;
            try
            {
                if (param)
                {
                    if (param.setvolume)
                    {
                        this.newTransform.volume = param.volume;
                    };
                };
                for (i in sfx)
                {
                    sfx[i].soundTransform = this.newTransform;
                };
                for (i in bgdmusic)
                {
                    bgdmusic[i].soundTransform = this.newTransform;
                };
            }
            catch(e:Error)
            {
                trace(("Error adjusting volume : " + e));
            };
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.avatar_snap

package com.cocolani.gui
{
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.utils.getDefinitionByName;
    import flash.geom.ColorTransform;
    import flash.events.Event;

    public class avatar_snap extends MovieClip 
    {

        public var charholder:MovieClip;
        public var snap_response:Snapshot_Response;
        internal var thisref:*;
        internal var stageref:*;
        internal var avatarparts:* = [];
        internal var avatarContainer:*;
        internal var targetAvatarContainer:*;
        internal var avatar:*;
        internal var avatarVisible:* = true;
        internal var minimized:* = true;
        internal var ischief:* = false;

        public function avatar_snap()
        {
            gotoAndStop("In");
            this.thisref = this;
            this.snap_response.visible = false;
            this.snap_response.gotoAndStop(1);
            this.snap_response.phase = 0;
        }

        public function setCharacter(_arg_1:String):void
        {
            this.avatarVisible = false;
            this.avatarContainer.visible = false;
            if (this.targetAvatarContainer)
            {
                this.charholder.removeChild(this.targetAvatarContainer);
                this.targetAvatarContainer = null;
            };
            this.targetAvatarContainer = this.charholder.addChild(new Sprite());
            var _local_2:* = getDefinitionByName((_arg_1 + "_snap"));
            this.targetAvatarContainer.addChild(new (_local_2)());
            this.snap_response.phase = 1;
            this.snap_response.gotoAndPlay(1);
            this.snap_response.visible = true;
        }

        public function set_snapphase(_arg_1:Number):*
        {
            switch (this.snap_response.phase)
            {
                case 0:
                    break;
                default:
                    if (_arg_1 == 1)
                    {
                        this.snap_response.gotoAndStop("Speak");
                    }
                    else
                    {
                        if (_arg_1 == 2)
                        {
                            this.snap_response.gotoAndStop("Wait");
                        };
                    };
            };
            this.snap_response.phase = _arg_1;
        }

        public function reset(_arg_1:Boolean=false):void
        {
            if (this.targetAvatarContainer)
            {
                this.charholder.removeChild(this.targetAvatarContainer);
                this.targetAvatarContainer = null;
            };
            this.avatarVisible = true;
            if (this.minimized)
            {
                this.avatarContainer.visible = true;
            };
            if (_arg_1)
            {
                this.snap_response.gotoAndPlay("Bubble_Out");
                this.snap_response.phase = 0;
                trace("reset fn in char snap");
            };
        }

        public function updateframe():*
        {
            trace(("label == " + currentLabel));
            if (currentLabel == "isIn")
            {
                this.minimized = true;
                this.avatarContainer.visible = false;
                if (this.targetAvatarContainer)
                {
                    this.targetAvatarContainer.visible = false;
                };
            }
            else
            {
                this.minimized = false;
            };
            stop();
        }

        public function togglevis(_arg_1:Boolean=false):*
        {
            if (_arg_1)
            {
                this.reset(true);
            };
            if (this.minimized)
            {
                gotoAndPlay("In");
                if (this.avatarVisible)
                {
                    this.avatarContainer.visible = true;
                };
                if (this.targetAvatarContainer)
                {
                    this.targetAvatarContainer.visible = true;
                };
            }
            else
            {
                this.minimized = true;
                gotoAndPlay("Out");
                this.snap_response.gotoAndPlay("Bubble_Out");
                this.snap_response.phase = 0;
            };
        }

        public function setupAvatar(_arg_1:*):*
        {
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            var _local_11:*;
            if (this.avatar)
            {
                for (_local_6 in this.avatarparts)
                {
                    this.avatarContainer.removeChild(this.avatarparts[_local_6]);
                };
                this.avatarContainer.removeChild(this.avatar);
                this.charholder.removeChild(this.avatarContainer);
                this.avatarparts = [];
                this.avatar = null;
                this.avatarContainer = null;
            };
            this.ischief = _arg_1.loadedAVData.chief;
            if (!this.ischief)
            {
                _local_7 = _arg_1.loadedAVData.mask.split(",");
                _local_8 = _arg_1.loadedAVData.maskc.split("|");
            };
            var _local_2:* = _arg_1.myTribe;
            var _local_3:* = _arg_1.loadedAVData.sex;
            var _local_4:* = getDefinitionByName(("avatar" + _local_2));
            this.avatarContainer = this.charholder.addChild(new Sprite());
            this.avatarContainer.scaleX = 1.45;
            this.avatarContainer.scaleY = 1.45;
            this.avatar = this.avatarContainer.addChild(new (_local_4)());
            this.avatar.gotoAndStop("dir2");
            this.avatarContainer.x = -225;
            this.avatarContainer.y = -168;
            for (_local_5 in _local_7)
            {
                _local_7[_local_5] = Number(_local_7[_local_5]);
            };
            if (!this.ischief)
            {
                _local_9 = getDefinitionByName((((("avatar" + _local_2) + _local_3) + "mask") + (_local_7[0] + 1)));
                this.avatarparts[0] = this.avatarContainer.addChildAt(new (_local_9)(), this.avatarContainer.numChildren);
                this.avatarparts[0].gotoAndStop("dir2");
                this.avatarparts[0].partid = 0;
                _local_9 = getDefinitionByName((((("avatar" + _local_2) + _local_3) + "mouth") + (_local_7[3] + 1)));
                this.avatarparts[1] = this.avatarContainer.addChildAt(new (_local_9)(), this.avatarContainer.numChildren);
                this.avatarparts[1].gotoAndStop("dir2");
                this.avatarparts[1].partid = 3;
                _local_9 = getDefinitionByName((((("avatar" + _local_2) + _local_3) + "eyeL") + (_local_7[1] + 1)));
                this.avatarparts[2] = this.avatarContainer.addChildAt(new (_local_9)(), this.avatarContainer.numChildren);
                this.avatarparts[2].gotoAndStop("dir2");
                this.avatarparts[2].partid = 1;
                _local_9 = getDefinitionByName((((("avatar" + _local_2) + _local_3) + "nose") + (_local_7[2] + 1)));
                this.avatarparts[3] = this.avatarContainer.addChildAt(new (_local_9)(), this.avatarContainer.numChildren);
                this.avatarparts[3].gotoAndStop("dir2");
                this.avatarparts[3].partid = 2;
                _local_9 = getDefinitionByName((((("avatar" + _local_2) + _local_3) + "eyeR") + (_local_7[1] + 1)));
                this.avatarparts[4] = this.avatarContainer.addChildAt(new (_local_9)(), this.avatarContainer.numChildren);
                this.avatarparts[4].gotoAndStop("dir2");
                this.avatarparts[4].partid = 1;
                _local_6 = 0;
                while (_local_6 < _local_8.length)
                {
                    _local_8[_local_6] = _local_8[_local_6].split(",");
                    _local_10 = new ColorTransform(1, 1, 1, 1, _local_8[_local_6][0], _local_8[_local_6][1], _local_8[_local_6][2], 0);
                    _local_11 = 0;
                    while (_local_11 < 5)
                    {
                        if (this.avatarparts[_local_11].partid == _local_6)
                        {
                            this.avatarparts[_local_11].transform.colorTransform = _local_10;
                        };
                        _local_11++;
                    };
                    _local_6++;
                };
            }
            else
            {
                _local_9 = getDefinitionByName((("avatar" + _local_2) + "chief"));
                this.avatarparts[0] = this.avatarContainer.addChildAt(new (_local_9)(), this.avatarContainer.numChildren);
                this.avatarparts[0].gotoAndStop("dir2");
                this.avatarparts[0].partid = 0;
            };
            this.avatarContainer.addEventListener(Event.ENTER_FRAME, this.renderedFrame);
            this.avatarContainer.visible = false;
        }

        private function renderedFrame(_arg_1:Event):*
        {
            if (this.avatarparts[0].getChildByName("obj"))
            {
                this.avatarContainer.removeEventListener(Event.ENTER_FRAME, this.renderedFrame);
                this.avatarparts[0].obj.gotoAndStop(1);
                if (!this.ischief)
                {
                    this.avatarparts[1].obj.gotoAndStop(1);
                    this.avatarparts[2].obj.gotoAndStop(1);
                    this.avatarparts[3].obj.gotoAndStop(1);
                    this.avatarparts[4].obj.gotoAndStop(1);
                };
                this.avatar.av.gotoAndStop(1);
            };
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.avatar_snap_icon

package com.cocolani.gui
{
    import flash.display.MovieClip;

    public class avatar_snap_icon extends MovieClip 
    {

        public var thisref:*;
        public var phase:*;

        public function avatar_snap_icon()
        {
            this.thisref = this;
        }

    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.buddyList

package com.cocolani.gui
{
    import flash.display.MovieClip;
    import fl.containers.ScrollPane;
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;

    public class buddyList extends MovieClip 
    {

        public var buddy_tab:MovieClip;
        public var buddylist:ScrollPane;
        public var bt_min_buddies:bt_Snapshot_Min;
        internal var displayArr:Array;
        internal var buddyArray:Array;
        internal var buddylistContainer:* = new Sprite();
        internal var buddyopen:* = false;
        public var thisref:*;
        private var stageRef:*;

        public function buddyList()
        {
            this.thisref = this;
            super();
            this.buddylist.source = this.buddylistContainer;
            this.buddylistContainer.y = 20;
            this.buddylist.visible = false;
            this.buddy_tab.mouseChildren = false;
            this.buddy_tab.mouseEnabled = false;
            this.bt_min_buddies.addEventListener(MouseEvent.CLICK, this.togglebuddy);
            this.bt_min_buddies.toggle();
            stop();
        }

        public function setstageref(_arg_1:*):*
        {
            this.stageRef = _arg_1;
            this.bt_min_buddies.toolText = this.stageRef.langObj.getText("hlp11");
            this.stageRef.mc_interface.setHelpItem(this.bt_min_buddies);
        }

        private function togglebuddy(_arg_1:MouseEvent):*
        {
            if (((((this.thisref.currentLabel == "Up") || (this.thisref.currentLabel == "isdown")) || (this.thisref.currentLabel == "isup")) || (this.thisref.currentFrame == 1)))
            {
                this.bt_min_buddies.disable();
                if (!this.buddyopen)
                {
                    gotoAndPlay("Up");
                }
                else
                {
                    gotoAndPlay("Down");
                    this.buddylist.visible = false;
                };
            };
        }

        public function initFrame():*
        {
            if (this.thisref.currentLabel == "isup")
            {
                this.buddyopen = true;
                this.buddylist.visible = true;
            }
            else
            {
                this.buddyopen = false;
                trace("init frame, budy down..");
            };
            this.bt_min_buddies.enable();
            stop();
        }

        public function setBuddyList(_arg_1:Array, _arg_2:*=false):*
        {
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_3:* = false;
            if ((((!(_arg_2)) && (this.buddyArray)) && (_arg_1.length > 0)))
            {
                _local_3 = true;
            };
            if (_local_3)
            {
                if (_arg_1.length > this.buddyArray.length)
                {
                    this.stageRef.showmsg(this.stageRef.langObj.repText("gui40", _arg_1[(_arg_1.length - 1)].name));
                }
                else
                {
                    _local_4 = 0;
                    while (_local_4 < this.buddyArray.length)
                    {
                        _local_5 = false;
                        _local_6 = 0;
                        while (_local_6 < _arg_1.length)
                        {
                            if (((_arg_1[_local_6]) && (_arg_1[_local_6].name == this.buddyArray[_local_4].name)))
                            {
                                _local_5 = true;
                            };
                            _local_6++;
                        };
                        if (!_local_5)
                        {
                            this.stageRef.showmsg(this.stageRef.langObj.repText("gui41", this.buddyArray[_local_4].name));
                            break;
                        };
                        _local_4++;
                    };
                };
            };
            if (((_arg_1.length > 0) && (!(_arg_2))))
            {
                this.buddyArray = this.clone(_arg_1);
                this.displayList();
            };
        }

        public function displayList():*
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            this.buddyArray = this.buddyArray.sortOn(["isOnline", "name"], [Array.DESCENDING, Array.CASEINSENSITIVE]);
            for (_local_1 in this.displayArr)
            {
                this.buddylistContainer.removeChild(this.displayArr[_local_1]);
            };
            this.displayArr = [];
            _local_2 = getDefinitionByName("mc_friends_friend");
            for (_local_1 in this.buddyArray)
            {
                if (this.buddyArray[_local_1])
                {
                    _local_3 = this.displayArr[(this.displayArr.push(this.buddylistContainer.addChild(new (_local_2)())) - 1)];
                    _local_3.x = -15;
                    _local_3.y = ((7 + _local_3.height) * _local_1);
                    _local_3.mc_name.buddyname.text = this.buddyArray[_local_1].name;
                    this.stageRef.langObj.setFormat(_local_3.mc_name.buddyname);
                    _local_3.mc_name.mouseEnabled = false;
                    _local_3.mc_name.mouseChildren = false;
                    _local_3.data = this.buddyArray[_local_1];
                    if (!this.buddyArray[_local_1].variables["$had"])
                    {
                        _local_3.selector.bt_home.alpha = 0.5;
                        _local_3.selector.bt_home.disable(false);
                    }
                    else
                    {
                        _local_3.selector.bt_home.addEventListener(MouseEvent.CLICK, this.buddyButton);
                    };
                    _local_3.selector.onlinestat.gotoAndStop(((this.buddyArray[_local_1].isOnline) ? 2 : 1));
                    _local_3.selector.bt_remove.addEventListener(MouseEvent.CLICK, this.buddyButton);
                    _local_3.selector.bt_write.addEventListener(MouseEvent.CLICK, this.buddyButton);
                    _local_4 = this.stageRef.mc_interface.tooltipRef;
                    _local_5 = this.stageRef.langObj;
                    _local_4.init(_local_3.selector.onlinestat, _local_5.getText("hlp17"));
                    _local_4.init(_local_3.selector.bt_home, _local_5.getText("hlp18"));
                    _local_4.init(_local_3.selector.bt_remove, _local_5.getText("hlp19"));
                    _local_4.init(_local_3.selector.bt_write, _local_5.getText("hlp20"));
                };
            };
            this.buddylist.update();
        }

        public function buddyButton(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            if (_arg_1.currentTarget.name == "bt_write")
            {
                _local_2 = false;
                _local_3 = 0;
                while (_local_3 < this.stageRef.popupWindows.length)
                {
                    if (((this.stageRef.popupWindows[_local_3].popupName == "chat") && (this.stageRef.popupWindows[_local_3].contentref.avName == _arg_1.currentTarget.parent.parent.data.name)))
                    {
                        _local_2 = true;
                    };
                    _local_3++;
                };
                if (!_local_2)
                {
                    _local_4 = this.stageRef.newpopup("com.cocolani.gui.privateChat", "class", "chat", true);
                    _local_4.setstageref(this.stageRef);
                    if (_arg_1.currentTarget.parent.parent.data.id == -1)
                    {
                        _local_4.setupName(_arg_1.currentTarget.parent.parent.data.name);
                    }
                    else
                    {
                        _local_4.setupID(_arg_1.currentTarget.parent.parent.data.id);
                    };
                };
            }
            else
            {
                if (_arg_1.currentTarget.name == "bt_remove")
                {
                    _local_5 = getDefinitionByName("mc_request");
                    _local_6 = this.stageRef.addChild(new (_local_5)());
                    _local_7 = _arg_1.currentTarget.parent.parent.data.name;
                    _local_6.requesttxt.text = this.stageRef.langObj.repText("gui44", _local_7.toUpperCase());
                    _local_6.data = _local_7;
                    _local_6.bt_yes.addEventListener(MouseEvent.CLICK, this.removefriend);
                    _local_6.bt_no.addEventListener(MouseEvent.CLICK, this.removefriend);
                }
                else
                {
                    if (_arg_1.currentTarget.name == "bt_home")
                    {
                        if ((((this.stageRef.mc_scene.sceneRef) && (this.stageRef.mc_scene.sceneRef.egoref)) && (this.stageRef.mc_scene.sceneRef.egoref.checkAvatarIsLeaving() == false)))
                        {
                            if (this.stageRef.mc_interface.speechHandlerRef)
                            {
                                this.stageRef.mc_interface.speechHandlerRef.shutdown();
                            };
                            _local_8 = _arg_1.currentTarget.parent.parent.data.variables["$had"];
                            _local_9 = _arg_1.currentTarget.parent.parent.data.variables["$trb"];
                            if ((((this.stageRef.mc_scene.loadHomeID) && (int(((this.stageRef.mc_scene.loadHomeID - 1) / 3)) == int(((_local_8 - 1) / 3)))) && (Number(_local_9) == this.stageRef.mc_scene.loadTribeID)))
                            {
                                this.stageRef.showmsg(this.stageRef.langObj.getText("fdb05"));
                            }
                            else
                            {
                                this.stageRef.mc_scene.loadHome(_local_9, _local_8);
                            };
                        };
                    };
                };
            };
        }

        public function removefriend(_arg_1:MouseEvent):*
        {
            if (_arg_1.currentTarget.name == "bt_yes")
            {
                this.stageRef.sfs.removeBuddy(_arg_1.currentTarget.parent.data);
            };
            this.stageRef.removeChild(_arg_1.currentTarget.parent);
        }

        public function buddyUpdate(_arg_1:*):*
        {
            var _local_2:*;
            for (_local_2 in this.buddyArray)
            {
                if (this.buddyArray[_local_2].name == _arg_1.name)
                {
                    this.buddyArray[_local_2] = _arg_1;
                    break;
                };
            };
            this.displayList();
        }

        public function clone(_arg_1:Array):*
        {
            var _local_2:* = [];
            var _local_3:* = 0;
            while (_local_3 < _arg_1.length)
            {
                _local_2.push(_arg_1[_local_3]);
                _local_3++;
            };
            return (_local_2);
        }

        public function reset():*
        {
            var _local_1:*;
            gotoAndStop("isdown");
            this.buddylist.visible = false;
            this.buddyArray = undefined;
            for (_local_1 in this.displayArr)
            {
                this.buddylistContainer.removeChild(this.displayArr[_local_1]);
            };
            this.displayArr = [];
        }

        public function checkIsBuddy(_arg_1:*):*
        {
            var _local_2:*;
            for (_local_2 in this.buddyArray)
            {
                if (this.buddyArray[_local_2].name == _arg_1)
                {
                    return (true);
                };
            };
            return (false);
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.buddyList_simplelayout

package com.cocolani.gui
{
    import flash.display.MovieClip;
    import fl.containers.ScrollPane;
    import flash.display.Sprite;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;

    public class buddyList_simplelayout extends MovieClip 
    {

        public var buddycontainer:ScrollPane;
        internal var displayArr:Array;
        internal var buddyArray:*;
        internal var buddylistContainer:* = new Sprite();
        private var isopen:Boolean = false;
        private var thisref:*;
        private var stageRef:*;

        public function buddyList_simplelayout()
        {
            this.thisref = this;
            super();
            trace("######### INIT BUDDY LIST SIMPLE LAYOUT");
            this.buddycontainer.source = this.buddylistContainer;
            this.buddycontainer.update();
        }

        public function setstageref(_arg_1:*):*
        {
            this.stageRef = _arg_1;
        }

        public function setBuddyList(_arg_1:Array):*
        {
            this.buddyArray = [];
            this.buddyArray = this.clone(_arg_1);
            this.displayList();
        }

        public function displayList():*
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:*;
            this.buddyArray = this.buddyArray.sortOn(["isOnline", "name"], [Array.DESCENDING, Array.CASEINSENSITIVE]);
            for (_local_1 in this.displayArr)
            {
                this.buddylistContainer.removeChild(this.displayArr[_local_1]);
            };
            this.displayArr = [];
            _local_2 = getDefinitionByName("mc_friends_friend_simple");
            for (_local_1 in this.buddyArray)
            {
                if (this.buddyArray[_local_1])
                {
                    _local_3 = this.displayArr[(this.displayArr.push(this.buddylistContainer.addChild(new (_local_2)())) - 1)];
                    _local_3.x = 2;
                    _local_3.y = (0 + ((_local_3.height + 3) * _local_1));
                    _local_3.mc_name2.buddyname.text = this.buddyArray[_local_1].name;
                    _local_3.mc_name2.mouseEnabled = false;
                    _local_3.mc_name2.mouseChildren = false;
                    _local_3.mouseChildren = false;
                    _local_3.data = this.buddyArray[_local_1];
                    _local_3.name = "buddyIcon";
                    _local_3.addEventListener(MouseEvent.CLICK, this.buddyButton);
                };
            };
            this.buddycontainer.update();
        }

        public function buddyButton(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            if (_arg_1.currentTarget.name == "buddyIcon")
            {
                if (this.stageRef.sfs.activeRoomId)
                {
                    _local_2 = this.stageRef.sfs.getRoom(this.stageRef.sfs.activeRoomId);
                    if (_arg_1.currentTarget.data.faux)
                    {
                        this.thisref.parent.inventoryContainer.setTradeUser(_arg_1.currentTarget.data);
                    }
                    else
                    {
                        if (_local_2.getUser(_arg_1.currentTarget.data.name))
                        {
                            this.thisref.parent.inventoryContainer.setTradeUser(_local_2.getUser(_arg_1.currentTarget.data.name));
                            if (this.thisref.parent.selectedTab != 1)
                            {
                                this.thisref.parent.setTab(1);
                            };
                        }
                        else
                        {
                            this.stageRef.showmsg(this.stageRef.langObj.getText("gui42"));
                        };
                    };
                }
                else
                {
                    this.stageRef.showmsg(this.stageRef.langObj.getText("gui43"));
                };
            };
        }

        public function buddyUpdate(_arg_1:*):*
        {
            var _local_2:*;
            for (_local_2 in this.buddyArray)
            {
                if (this.buddyArray[_local_2].name == _arg_1.name)
                {
                    this.buddyArray[_local_2] = _arg_1;
                    break;
                };
            };
            this.displayList();
        }

        public function clone(_arg_1:Array):*
        {
            var _local_2:* = [];
            var _local_3:* = 0;
            while (_local_3 < _arg_1.length)
            {
                _local_2.push(_arg_1[_local_3]);
                _local_3++;
            };
            return (_local_2);
        }

        public function reset():*
        {
            var _local_1:*;
            this.buddyArray = undefined;
            for (_local_1 in this.displayArr)
            {
                this.buddylistContainer.removeChild(this.displayArr[_local_1]);
            };
            this.displayArr = [];
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.charProfile

package com.cocolani.gui
{
    import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.text.TextFormat;
    import flash.text.TextFieldType;
    import com.cocolani.common.avatar_snapshot;
    import flash.events.FocusEvent;
    import flash.utils.getDefinitionByName;

    public class charProfile extends Sprite 
    {

        public var bt_battleprac:mc_dobattleprac;
        public var box1:Button_Rollover;
        public var star1:MovieClip;
        public var bt1_n:bt_sml_next;
        public var box2:Button_Rollover;
        public var tribe_rep:MovieClip;
        public var star2:MovieClip;
        public var bt0_n:bt_sml_next;
        public var box3:Button_Rollover;
        public var star3:MovieClip;
        public var bt3_n:bt_sml_next;
        public var bt_buddy:Button_Template;
        public var star4:MovieClip;
        public var bt2_n:bt_sml_next;
        public var blurb:TextField;
        public var star5:MovieClip;
        public var bt_report:mc_icon_report;
        public var bt1_p:bt_sml_next;
        public var bt_msg:bt_privatemessage_main;
        public var av_container:MovieClip;
        public var title2:TextField;
        public var battleData:TextField;
        public var bt0_p:bt_sml_next;
        public var title3:TextField;
        public var bt3_p:bt_sml_next;
        public var personalicons:MovieClip;
        public var title4:TextField;
        public var bt2_p:bt_sml_next;
        public var title5:TextField;
        public var profile_title:TextField;
        public var title6:TextField;
        public var bt_save:Button_Template;
        public var bt_trade:bt_Give;
        public var usertype:TextField;
        public var bt_home:bt_gohome;
        public var joined_date:TextField;
        public var XPData:TextField;
        public var box0:Button_Rollover;
        internal var thisref:*;
        internal var stageref:*;
        public var AVref:*;
        public var isego:*;
        private var preloadlist:*;
        public var attachmentEdit:*;
        private var lastSentAttachments:*;
        public var wardrobe_attachments:*;
        internal var lastSave:*;

        public function charProfile()
        {
            this.thisref = this;
            this.preloadlist = [];
            this.attachmentEdit = [];
            this.lastSentAttachments = [];
            this.wardrobe_attachments = [];
            super();
            this.profile_title.text = "";
            this.battleData.text = "";
            this.bt_buddy.addEventListener(MouseEvent.CLICK, this.profilebt);
            this.bt_msg.addEventListener(MouseEvent.CLICK, this.profilebt);
            this.bt_save.addEventListener(MouseEvent.CLICK, this.profilebt);
            this.bt_trade.addEventListener(MouseEvent.CLICK, this.profilebt);
            this.bt_report.addEventListener(MouseEvent.CLICK, this.profilebt);
            addEventListener(Event.ADDED_TO_STAGE, this.init);
            this.box0.stop();
            this.tribe_rep.stop();
            var _local_1:* = new TextFormat();
            _local_1.color = 0;
            var _local_2:* = new TextFormat();
            _local_2.color = 0xFFFFFF;
            this.bt_buddy.setTextFormat(_local_1, _local_2);
            var _local_3:* = 1;
            while (_local_3 < 6)
            {
                this.thisref[("star" + _local_3)].gotoAndStop(2);
                _local_3++;
            };
            this.thisref.bt0_p.addEventListener(MouseEvent.CLICK, this.changeattachment);
            this.thisref.bt0_n.addEventListener(MouseEvent.CLICK, this.changeattachment);
            this.thisref.bt1_p.addEventListener(MouseEvent.CLICK, this.changeattachment);
            this.thisref.bt1_n.addEventListener(MouseEvent.CLICK, this.changeattachment);
            this.thisref.bt2_p.addEventListener(MouseEvent.CLICK, this.changeattachment);
            this.thisref.bt2_n.addEventListener(MouseEvent.CLICK, this.changeattachment);
            this.thisref.bt3_p.addEventListener(MouseEvent.CLICK, this.changeattachment);
            this.thisref.bt3_n.addEventListener(MouseEvent.CLICK, this.changeattachment);
        }

        private function init(_arg_1:Event):*
        {
            this.stageref = _arg_1.target.stage.getChildAt(0);
            var _local_2:* = this.stageref.langObj;
            this.bt_save.setText(_local_2.getText("gui24"));
            this.title2.text = _local_2.getText("gui07");
            this.title3.text = _local_2.getText("gui08");
            this.title4.text = _local_2.getText("gui09");
            this.title5.text = _local_2.getText("gui10");
            this.title6.text = _local_2.getText("gui94");
            this.bt_battleprac.setText(_local_2.getText("gui93"));
            this.XPData.text = "";
            this.stageref.langObj.setFormat(this.blurb);
            this.stageref.langObj.setFormat(this.title2);
            this.stageref.langObj.setFormat(this.title3);
            this.stageref.langObj.setFormat(this.title4);
            this.stageref.langObj.setFormat(this.title5);
            this.stageref.langObj.setFormat(this.usertype);
            this.stageref.langObj.setFormat(this.battleData);
            this.stageref.langObj.setFormat(this.joined_date);
            this.bt_report.toolText = this.stageref.langObj.getText("hlp37");
            this.bt_battleprac.toolText = this.stageref.langObj.getText("hlp38");
            this.bt_home.toolText = this.stageref.langObj.getText("hlp18");
            this.bt_msg.toolText = this.stageref.langObj.getText("hlp20");
            this.bt_trade.toolText = this.stageref.langObj.getText("hlp44");
            this.stageref.mc_interface.tooltipRef.init(this.bt_report, this.bt_report.toolText);
            this.stageref.mc_interface.tooltipRef.init(this.bt_battleprac, this.bt_battleprac.toolText);
            this.stageref.mc_interface.tooltipRef.init(this.bt_home, this.bt_home.toolText);
            this.stageref.mc_interface.tooltipRef.init(this.bt_msg, this.bt_msg.toolText);
            this.stageref.mc_interface.tooltipRef.init(this.bt_trade, this.bt_trade.toolText);
            var _local_3:* = 0;
            while (_local_3 < 4)
            {
                this.thisref[("box" + _local_3)].addEventListener(MouseEvent.MOUSE_OUT, this.boxMouseEvent);
                _local_3++;
            };
        }

        private function boxMouseEvent(_arg_1:MouseEvent):*
        {
            if (_arg_1.type == "mouseOut")
            {
                if (_arg_1.currentTarget.ref)
                {
                    _arg_1.currentTarget.setChildIndex(_arg_1.currentTarget.ref, (_arg_1.currentTarget.numChildren - 1));
                };
            };
        }

        public function setData(_arg_1:*):*
        {
            this.stageref.langObj.setTextJustify(this.blurb, _arg_1.abt);
            (this.blurb.type == TextFieldType.DYNAMIC);
            this.blurb.selectable = false;
            this.joined_date.text = _arg_1.rdt;
            var _local_2:* = _arg_1.btl;
            var _local_3:* = _arg_1.skl.split(",");
            this.XPData.text = this.stageref.mc_interface.getMyXP(_local_3[0]);
            this.stageref.langObj.setFormat(this.XPData);
            if (this.stageref.langObj.getLangDir() == 0)
            {
                this.battleData.text = ((_local_2[0] + "/") + (Number(_local_2[1]) - Number(_local_2[0])));
            }
            else
            {
                this.battleData.text = (((Number(_local_2[1]) - Number(_local_2[0])) + "/") + _local_2[0]);
            };
            var _local_4:* = _arg_1.gam;
            if (_local_4 == "")
            {
                _local_4 = [];
            }
            else
            {
                _local_4 = _local_4.split(",");
            };
            this.thisref.parent.rewardsContainer.setStats(_local_4);
            this.thisref.parent.rewardsContainer.setrewards(_arg_1.med);
            if (_arg_1.hom)
            {
                this.thisref.bt_home.visible = true;
                this.thisref.bt_home.addEventListener(MouseEvent.CLICK, this.profilebt);
                this.thisref.bt_home.hid = _arg_1.hom;
            }
            else
            {
                this.thisref.bt_home.visible = false;
            };
            if (this.stageref.mc_interface.buddylist.checkIsBuddy(this.AVref.getName()))
            {
                this.bt_msg.visible = true;
            }
            else
            {
                this.bt_msg.visible = false;
            };
        }

        public function setContent(_arg_1:*):*
        {
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            this.AVref = _arg_1;
            var _local_2:* = _arg_1.getVariable("chief");
            if (!_local_2)
            {
                _local_5 = _arg_1.getVariable("chr").split("!");
            };
            if (this.av_container.avatar)
            {
                this.av_container.removeChild(this.av_container.avatar);
            };
            if (!_local_2)
            {
                this.av_container.avatar = this.av_container.addChild(new avatar_snapshot(_local_5[1], _local_5[2], _arg_1.getVariable("trb"), _local_5[0], 1));
            }
            else
            {
                this.av_container.avatar = this.av_container.addChild(new avatar_snapshot("", "", _arg_1.getVariable("trb"), "", 1, true));
            };
            if (!_local_2)
            {
                this.wardrobe_attachments = this.AVref.getVariable("clth");
                this.attachmentEdit = this.wardrobe_attachments.split(",");
                this.av_container.avatar.setClothing(this.wardrobe_attachments);
            };
            this.profile_title.text = _arg_1.getName();
            var _local_3:* = this.stageref.usertypes.split("|");
            var _local_4:* = 0;
            while (_local_4 < _local_3.length)
            {
                _local_6 = _local_3[_local_4].split(",");
                if (Number(_local_6[0]) == Number(_arg_1.getVariable("usr")))
                {
                    this.usertype.text = _local_6[1];
                    break;
                };
                _local_4++;
            };
            if (this.stageref.sfs.myUserName == _arg_1.getName())
            {
                this.bt_trade.visible = false;
                this.bt_report.visible = false;
                this.bt_battleprac.visible = false;
                this.isego = true;
                this.blurb.text = this.stageref.loadedAVData.abt;
                this.joined_date.text = this.stageref.loadedAVData.jd;
                _local_7 = this.stageref.loadedAVData.btl.split(";");
                _local_8 = (!(_local_2));
                _local_4 = 0;
                while (_local_4 < 4)
                {
                    this.thisref[(("bt" + _local_4) + "_n")].visible = _local_8;
                    this.thisref[(("bt" + _local_4) + "_p")].visible = _local_8;
                    this.thisref[("box" + _local_4)].visible = _local_8;
                    _local_4++;
                };
                this.personalicons.visible = true;
                this.bt_save.visible = true;
                if (this.stageref.langObj.getLangDir() == 0)
                {
                    this.battleData.text = ((_local_7[0] + "/") + (Number(_local_7[1]) - Number(_local_7[0])));
                }
                else
                {
                    this.battleData.text = (((Number(_local_7[1]) - Number(_local_7[0])) + "/") + _local_7[0]);
                };
                this.XPData.text = this.stageref.mc_interface.getMyXP();
                this.stageref.langObj.setFormat(this.XPData);
                this.bt_buddy.visible = false;
                this.bt_home.visible = false;
                this.blurb.addEventListener(FocusEvent.FOCUS_OUT, this.updateblurb);
                (this.blurb.type == TextFieldType.INPUT);
                this.blurb.selectable = true;
                _local_9 = 0;
                if (Number(_local_7[1]) == 0)
                {
                    _local_9 = 5;
                }
                else
                {
                    _local_9 = Math.round(((Number(_local_7[0]) / Number(_local_7[1])) * 5));
                };
                _local_7[0] = Number(_local_7[0]);
                _local_7[1] = (Number(_local_7[1]) - Number(_local_7[0]));
                _local_4 = 1;
                while (_local_4 < 6)
                {
                    if (_local_4 <= _local_9)
                    {
                        this.thisref[("star" + _local_4)].gotoAndStop(1);
                    }
                    else
                    {
                        this.thisref[("star" + _local_4)].gotoAndStop(2);
                    };
                    _local_4++;
                };
                this.thisref.parent.rewardsContainer.setrewards(this.stageref.loadedAVData.medals);
            }
            else
            {
                if (((_arg_1.getVariable("trb") == this.stageref.myTribe) && (this.stageref.myTribe == this.stageref.currentTribe)))
                {
                    this.bt_battleprac.visible = true;
                    this.bt_battleprac.addEventListener(MouseEvent.CLICK, this.profilebt);
                }
                else
                {
                    this.bt_battleprac.visible = false;
                };
                if (_arg_1.getVariable("usr") < 6)
                {
                    this.bt_report.visible = true;
                }
                else
                {
                    this.bt_report.visible = false;
                };
                this.blurb.removeEventListener(FocusEvent.FOCUS_OUT, this.updateblurb);
                this.bt_buddy.visible = true;
                this.bt_trade.visible = true;
                this.personalicons.visible = false;
                this.bt_save.visible = false;
                _local_4 = 0;
                while (_local_4 < 4)
                {
                    this.thisref[(("bt" + _local_4) + "_n")].visible = false;
                    this.thisref[(("bt" + _local_4) + "_p")].visible = false;
                    this.thisref[("box" + _local_4)].visible = false;
                    _local_4++;
                };
                this.isego = false;
                this.blurb.text = "";
                this.joined_date.text = "";
                _local_10 = {};
                _local_10.ext = "main";
                _local_10.cmd = "profile";
                _local_10.id = _arg_1.getId();
                this.stageref.sendXTmessage(_local_10);
                if (this.checkifbuddy(_arg_1.getName()))
                {
                    this.bt_buddy.setText(this.stageref.langObj.getText("gui91"));
                }
                else
                {
                    this.bt_buddy.setText(this.stageref.langObj.getText("gui92"));
                };
            };
            this.tribe_rep.gotoAndStop(_arg_1.getVariable("trb"));
            this.stageref.langObj.setFormat(this.usertype);
            this.stageref.langObj.setFormat(this.battleData);
            this.stageref.langObj.setFormat(this.joined_date);
            this.bt_msg.visible = false;
            if (!_local_2)
            {
                this.renderAttachments();
            };
        }

        private function updateblurb(_arg_1:FocusEvent):*
        {
            var _local_2:*;
            if (this.blurb.text != this.stageref.loadedAVData.abt)
            {
                this.stageref.loadedAVData.abt = this.blurb.text;
                _local_2 = {};
                _local_2.ext = "main";
                _local_2.cmd = "blurb";
                _local_2.val = this.blurb.text;
                this.stageref.sendXTmessage(_local_2);
            };
        }

        public function preload(_arg_1:*):*
        {
            this.stageref.resourceloader.addResources(_arg_1, "obj");
            this.stageref.resourceloader.addEventListener("file_fin", this.onLoadResource);
            this.stageref.resourceloader.addEventListener("loading_fin", this.onLoadResource);
        }

        public function onLoadResource(_arg_1:Event):*
        {
            if (_arg_1.type == "file_fin")
            {
                this.preloadlist = [];
                this.stageref.resourceloader.removeEventListener("file_fin", this.onLoadResource);
                this.stageref.resourceloader.removeEventListener("loading_fin", this.onLoadResource);
            }
            else
            {
                this.renderAttachments(true);
            };
        }

        private function changeattachment(_arg_1:MouseEvent):*
        {
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_2:* = Number(_arg_1.currentTarget.name.substr(2, 1));
            var _local_3:* = this.thisref.parent.inventoryContainer.invlist;
            var _local_4:* = [];
            var _local_5:* = -1;
            var _local_6:* = 0;
            while (_local_6 < _local_3.length)
            {
                if (Number(_local_3[_local_6].type) == (_local_2 + 1))
                {
                    _local_7 = false;
                    _local_8 = _local_3[_local_6].rid;
                    _local_9 = 0;
                    while (_local_9 < _local_4.length)
                    {
                        if (_local_4[_local_9] == _local_8)
                        {
                            _local_7 = true;
                            break;
                        };
                        _local_9++;
                    };
                    if (!_local_7)
                    {
                        _local_4.push(_local_8);
                        if (_local_8 == _arg_1.currentTarget.parent[("box" + _local_2)].RID)
                        {
                            _local_5 = (_local_4.length - 1);
                        };
                    };
                };
                _local_6++;
            };
            if (_arg_1.currentTarget.name.substr(4, 1) == "n")
            {
                _local_5++;
            }
            else
            {
                _local_5--;
            };
            if (_local_5 > (_local_4.length - 1))
            {
                _local_5 = -1;
            };
            if (_local_5 < -1)
            {
                _local_5 = (_local_4.length - 1);
            };
            this.attachmentEdit[_local_2] = _local_4[_local_5];
            trace(("attachment edit = " + this.attachmentEdit));
            if (this.av_container.avatar)
            {
                this.av_container.avatar.setClothing(this.attachmentEdit.join(","));
            };
            this.renderAttachments(true);
        }

        private function fixlayer(_arg_1:MouseEvent):*
        {
            if (_arg_1.currentTarget.ref)
            {
                _arg_1.currentTarget.setChildIndex(_arg_1.currentTarget.ref, (_arg_1.currentTarget.numChildren - 1));
            };
        }

        public function removeAttachments():*
        {
            var _local_1:* = 0;
            while (_local_1 < 4)
            {
                if (this.thisref[("box" + _local_1)].ref)
                {
                    this.thisref[("box" + _local_1)].removeChild(this.thisref[("box" + _local_1)].ref);
                    this.thisref[("box" + _local_1)].ref = undefined;
                    this.thisref[("box" + _local_1)].RID = undefined;
                    this.thisref[("box" + _local_1)].removeEventListener(MouseEvent.MOUSE_OUT, this.fixlayer);
                };
                _local_1++;
            };
        }

        private function renderAttachments(_arg_1:Boolean=false):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            if (_arg_1)
            {
                _local_3 = this.attachmentEdit;
            }
            else
            {
                _local_3 = String(this.AVref.getVariable("clth")).split(",");
            };
            this.removeAttachments();
            var _local_2:* = 0;
            while (_local_2 < 4)
            {
                if (Number(_local_3[_local_2]) > 0)
                {
                    if (this.checkClassExist(("obj" + _local_3[_local_2])))
                    {
                        _local_4 = getDefinitionByName(("obj" + _local_3[_local_2]));
                        this.thisref[("box" + _local_2)].ref = this.thisref[("box" + _local_2)].addChild(new (_local_4)());
                        this.thisref[("box" + _local_2)].ref.gotoAndStop("thumbnail");
                    }
                    else
                    {
                        _local_5 = getDefinitionByName("mc_progress3");
                        this.thisref[("box" + _local_2)].ref = this.thisref[("box" + _local_2)].addChild(new (_local_5)());
                    };
                    this.thisref[("box" + _local_2)].RID = _local_3[_local_2];
                    this.attachmentEdit[_local_2] = _local_3[_local_2];
                };
                _local_2++;
            };
            if (this.preloadlist.length > 0)
            {
                this.preload(this.preloadlist);
            };
        }

        private function checkifbuddy(_arg_1:String):*
        {
            var _local_3:*;
            var _local_2:* = this.stageref.sfs.buddyList;
            if (_local_2)
            {
                _local_3 = 0;
                while (_local_3 < _local_2.length)
                {
                    if (((_local_2[_local_3]) && (_local_2[_local_3].name == _arg_1)))
                    {
                        return (true);
                    };
                    _local_3++;
                };
            };
            return (false);
        }

        public function removefriend(_arg_1:MouseEvent):*
        {
            if (_arg_1.currentTarget.name == "bt_yes")
            {
                this.stageref.sfs.removeBuddy(_arg_1.currentTarget.parent.data);
            };
            this.stageref.removeChild(_arg_1.currentTarget.parent);
        }

        private function profilebt(_arg_1:MouseEvent):*
        {
            var _local_2:*;
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
            var _local_14:*;
            if (_arg_1.currentTarget.name == "bt_buddy")
            {
                if (this.stageref.sfs.getBuddyByName(this.AVref.getName()))
                {
                    _local_2 = getDefinitionByName("mc_request");
                    _local_3 = this.stageref.addChild(new (_local_2)());
                    _local_4 = this.AVref.getName();
                    _local_3.requesttxt.text = this.stageref.langObj.repText("gui44", _local_4.toUpperCase());
                    _local_3.data = _local_4;
                    _local_3.bt_yes.addEventListener(MouseEvent.CLICK, this.removefriend);
                    _local_3.bt_no.addEventListener(MouseEvent.CLICK, this.removefriend);
                }
                else
                {
                    if (this.AVref.getVariable("bsy") == 1)
                    {
                        this.stageref.showmsg(this.stageref.langObj.getText("fdb11"));
                    }
                    else
                    {
                        this.stageref.sfs.addBuddy(this.AVref.getName());
                    };
                };
            }
            else
            {
                if (_arg_1.currentTarget.name == "bt_msg")
                {
                    _local_5 = false;
                    _local_6 = 0;
                    while (_local_6 < this.stageref.popupWindows.length)
                    {
                        if (((this.stageref.popupWindows[_local_6].popupName == "chat") && (this.stageref.popupWindows[_local_6].contentref.avName == this.AVref.getName())))
                        {
                            _local_5 = true;
                        };
                        _local_6++;
                    };
                    if (!_local_5)
                    {
                        _local_7 = this.stageref.newpopup("com.cocolani.gui.privateChat", "class", "chat", true);
                        _local_7.setstageref(this.stageref);
                        _local_7.setup(this.AVref);
                    };
                }
                else
                {
                    if (_arg_1.currentTarget.name == "bt_save")
                    {
                        _local_8 = this.thisref.parent.inventoryContainer.getInvIdFromObjId(this.attachmentEdit);
                        if (!this.lastSave)
                        {
                            this.lastSave = new Date();
                        }
                        else
                        {
                            _local_9 = new Date();
                            if ((_local_9 - this.lastSave) < 2500)
                            {
                                return;
                            };
                            this.lastSave = _local_9;
                        };
                        if (this.lastSentAttachments != _local_8.join(","))
                        {
                            _local_10 = {};
                            _local_10.cmd = "setClth";
                            _local_10.ext = "main";
                            _local_10.clthInvID = _local_8.join(",");
                            this.lastSentAttachments = _local_8.join(",");
                            this.stageref.sendXTmessage(_local_10);
                        };
                    }
                    else
                    {
                        if (_arg_1.currentTarget.name == "bt_trade")
                        {
                            if (this.AVref.getVariable("bsy") == 1)
                            {
                                this.stageref.showmsg(this.stageref.langObj.getText("fdb11"));
                            }
                            else
                            {
                                if (this.stageref.sfs.getRoom(this.stageref.sfs.activeRoomId).getUser(this.AVref.getId()))
                                {
                                    this.thisref.parent.inventoryContainer.setTradeUser(this.AVref);
                                }
                                else
                                {
                                    this.stageref.showmsg(this.stageref.langObj.getText("fdb00"));
                                };
                            };
                        }
                        else
                        {
                            if (_arg_1.currentTarget.name == "bt_battleprac")
                            {
                                if (this.stageref.sfs.getRoom(this.stageref.sfs.activeRoomId).getUser(this.AVref.getId()))
                                {
                                    if (this.AVref.getVariable("bsy") == 1)
                                    {
                                        this.stageref.showmsg(this.stageref.langObj.getText("fdb11"));
                                    }
                                    else
                                    {
                                        _local_11 = {};
                                        _local_11.cmd = "pracBattle";
                                        _local_11.ext = "gameManager";
                                        _local_11.uid = this.AVref.getId();
                                        this.stageref.sendXTmessage(_local_11);
                                        this.stageref.showmsg(this.stageref.langObj.getText("fdb10"));
                                        _arg_1.currentTarget.removeEventListener(MouseEvent.CLICK, this.profilebt);
                                    };
                                }
                                else
                                {
                                    this.stageref.showmsg(this.stageref.langObj.getText("fdb09"));
                                };
                            }
                            else
                            {
                                if (_arg_1.currentTarget.name == "bt_report")
                                {
                                    _local_12 = this.stageref.newpopup((this.stageref.baseURL + "/panels/reportPlayer.swf"), "load", "ReportPlayer");
                                    _local_12.mydata = this.AVref;
                                    _local_12.tweenOn = false;
                                }
                                else
                                {
                                    if (_arg_1.currentTarget.name == "bt_home")
                                    {
                                        if (this.stageref.mc_scene.sceneRef)
                                        {
                                            _local_13 = _arg_1.currentTarget.hid;
                                            _local_14 = this.AVref.getVariable("trb");
                                            if ((((this.stageref.mc_scene.loadHomeID) && (int(((this.stageref.mc_scene.loadHomeID - 1) / 3)) == int(((_local_13 - 1) / 3)))) && (Number(_local_14) == this.stageref.mc_scene.loadTribeID)))
                                            {
                                                this.stageref.showmsg(this.stageref.langObj.getText("fdb05"));
                                            }
                                            else
                                            {
                                                if ((((this.stageref.mc_scene.sceneRef) && (this.stageref.mc_scene.sceneRef.egoref)) && (this.stageref.mc_scene.sceneRef.egoref.checkAvatarIsLeaving() == false)))
                                                {
                                                    if (this.stageref.mc_interface.speechHandlerRef)
                                                    {
                                                        this.stageref.mc_interface.speechHandlerRef.shutdown();
                                                    };
                                                    this.stageref.mc_scene.loadHome(_local_14, _local_13);
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

        public function shutdown():*
        {
            this.removeAttachments();
        }

        private function checkClassExist(className:String):*
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
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.happynessMeter

package com.cocolani.gui
{
    import flash.display.MovieClip;
    import fl.transitions.Tween;
    import fl.transitions.easing.Regular;

    public class happynessMeter extends MovieClip 
    {

        internal const barEmpty:* = -170;
        internal const barFull:* = -10;

        public var bar:MovieClip;
        private var myTween:Tween;


        public function setvalue(_arg_1:*, _arg_2:Boolean=true):*
        {
            if (((this.myTween) && (this.myTween.isPlaying)))
            {
                this.myTween.stop();
            };
            var _local_3:* = (((_arg_1 / 100) * (this.barFull - this.barEmpty)) + this.barEmpty);
            if (_arg_2)
            {
                this.myTween = new Tween(this.bar, "x", Regular.easeInOut, this.bar.x, _local_3, 1, true);
                this.myTween.start();
            }
            else
            {
                this.bar.x = _local_3;
            };
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.inventory

package com.cocolani.gui
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import fl.containers.ScrollPane;
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import it.gotoandplay.smartfoxserver.data.User;
    import com.cocolani.resourceLoader;
    import flash.utils.getDefinitionByName;
    import flash.events.Event;
    import com.cocolani.common.cursor;
    import flash.geom.Point;

    public class inventory extends MovieClip 
    {

        public var itemfilter3:inv_list3;
        public var itemfilter2:inv_list1;
        public var trade_user:TextField;
        public var itemfilter1:inv_list2;
        public var bt_trade:Button_Template;
        public var itemfilter5:inv_list5;
        public var invcontainer:ScrollPane;
        public var itemfilter4:inv_list4;
        public var trade_drop:MovieClip;
        internal var thisref:*;
        internal var itemsFilter:* = 4;
        internal var invContainerClip:*;
        internal var invlist:Array;
        internal var endmarkerRef:Sprite;
        internal var invdispl:Array;
        internal var invTrade:*;
        internal var tradePartner:*;
        internal var stageRef:*;
        internal var lastTradeTime:*;

        public function inventory()
        {
            this.thisref = this;
            this.invContainerClip = new Sprite();
            this.invlist = new Array();
            this.invdispl = new Array();
            super();
            this.trade_drop.gotoAndStop(1);
            this.trade_drop.itemname.text = "";
            this.trade_user.text = "";
            this.bt_trade.addEventListener(MouseEvent.CLICK, this.invbt);
            this.bt_trade.setTextFormatStd();
            this.invcontainer.source = this.invContainerClip;
            this.invcontainer.update();
        }

        public function inventoryService(_arg_1:*):*
        {
            var _local_2:*;
            if (_arg_1.sub == "weaponUpd")
            {
                for (_local_2 in this.invlist)
                {
                    if (this.invlist[_local_2].iid == _arg_1.wid)
                    {
                        trace(("Changing data for this item to " + _arg_1.level));
                        this.invlist[_local_2].data1 = Number(_arg_1.level);
                        break;
                    };
                };
            };
        }

        public function setTradeUser(_arg_1:*):*
        {
            if (!(_arg_1 is User))
            {
                this.tradePartner = _arg_1;
                this.trade_user.text = _arg_1.name;
                this.thisref.parent.setTab("1");
            }
            else
            {
                this.tradePartner = _arg_1;
                this.thisref.trade_drop.itemname.text = "";
                this.thisref.trade_user.text = "";
                this.trade_user.text = _arg_1.getName();
                this.thisref.parent.setTab("1");
            };
        }

        public function shutdown():*
        {
            if (this.stageRef.cursorRef)
            {
                trace("Need to hide cursor stuff here..");
            };
            if (this.invTrade)
            {
                this.trade_drop.removeChild(this.invTrade);
                this.invTrade = undefined;
            };
        }

        public function setstageref(_arg_1:*):*
        {
            this.stageRef = _arg_1;
            this.bt_trade.setText(this.stageRef.langObj.getText("gui23"));
            var _local_2:* = 1;
            while (_local_2 < 6)
            {
                this.thisref[("itemfilter" + _local_2)].toolText = this.stageRef.langObj.getText(("gui10" + (_local_2 - 1)));
                this.stageRef.mc_interface.tooltipRef.init(this.thisref[("itemfilter" + _local_2)], this.thisref[("itemfilter" + _local_2)].toolText);
                this.thisref[("itemfilter" + _local_2)].addEventListener(MouseEvent.CLICK, this.updateFilter);
                _local_2++;
            };
        }

        private function updateFilter(_arg_1:MouseEvent):*
        {
            this.itemsFilter = Number(_arg_1.currentTarget.name.substr(10, 1));
            this.updateFilterGraphic();
            this.renderInv();
        }

        private function updateFilterGraphic():*
        {
            var _local_1:* = 1;
            while (_local_1 < 6)
            {
                if (this.itemsFilter == _local_1)
                {
                    this.thisref[("itemfilter" + _local_1)].disable();
                }
                else
                {
                    this.thisref[("itemfilter" + _local_1)].enable();
                };
                _local_1++;
            };
        }

        public function setinventory(_arg_1:*):*
        {
            var _local_4:Array;
            this.invlist = [];
            var _local_2:* = String(_arg_1).split("|");
            var _local_3:* = 0;
            while (_local_3 < _local_2.length)
            {
                _local_4 = String(_local_2[_local_3]).split("~");
                this.invlist.push({
                    "iid":_local_4[0],
                    "oid":_local_4[1],
                    "rid":_local_4[2],
                    "desc":_local_4[3],
                    "label":_local_4[4],
                    "type":_local_4[5],
                    "transfer":_local_4[6],
                    "subtype":_local_4[7],
                    "data1":_local_4[8]
                });
                _local_3++;
            };
            if (_local_2[0].length == 0)
            {
                this.invlist = [];
            };
            this.renderInv();
            this.updateFilterGraphic();
        }

        public function addInventoryItem(_arg_1:*):*
        {
            var _local_2:Array = _arg_1.split("~");
            this.invlist.push({
                "iid":_local_2[0],
                "oid":_local_2[1],
                "rid":_local_2[2],
                "desc":_local_2[3],
                "label":_local_2[4],
                "type":_local_2[5],
                "transfer":_local_2[6],
                "subtype":_local_2[7],
                "data1":_local_2[8]
            });
            this.renderInv();
        }

        public function editInventoryItem(_arg_1:*):*
        {
            var _local_2:*;
            _arg_1 = _arg_1.split("~");
            for (_local_2 in this.invlist)
            {
                if (this.invlist[_local_2].iid == _arg_1[0])
                {
                    this.invlist[_local_2].data1 = _arg_1[8];
                    break;
                };
            };
            this.renderInv();
        }

        public function dropInventoryItem(_arg_1:*):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            for (_local_3 in this.invlist)
            {
                if (this.invlist[_local_3].iid == _arg_1)
                {
                    _local_2 = this.invlist[_local_3];
                    this.invlist.splice(_local_3, 1);
                    break;
                };
            };
            if (((this.invTrade) && (this.invTrade.data.iid == _arg_1)))
            {
                this.trade_drop.removeChild(this.invTrade);
                this.invTrade = undefined;
                this.trade_drop.gotoAndStop(1);
                this.thisref.trade_drop.itemname.text = "";
            };
            this.renderInv();
            var _local_4:* = this.stageRef.sfs.getRoom(this.stageRef.sfs.activeRoomId);
            var _local_5:* = _local_4.getUser(this.stageRef.sfs.myUserId);
            if (((_local_5) && (_local_2)))
            {
                _local_6 = _local_5.getVariable("clth");
                if (_local_6)
                {
                    _local_6 = _local_6.split(",");
                    _local_7 = 0;
                    while (_local_7 < _local_6.length)
                    {
                        if (Number(_local_6[_local_7]) == Number(_local_2.oid))
                        {
                            _local_8 = false;
                            for (_local_9 in this.invlist)
                            {
                                if (Number(_local_2.oid) == Number(this.invlist[_local_9].oid))
                                {
                                    _local_8 = true;
                                };
                            };
                            if (!_local_8)
                            {
                                _local_6[_local_7] = "";
                            };
                            _local_6 = this.getInvIdFromObjId(_local_6);
                            _local_10 = {};
                            _local_10.cmd = "setClth";
                            _local_10.ext = "main";
                            _local_10.clthInvID = _local_6.join(",");
                            this.stageRef.sendXTmessage(_local_10);
                        };
                        _local_7++;
                    };
                };
            };
        }

        public function getInvIdFromObjId(_arg_1:*):*
        {
            var _local_4:*;
            var _local_5:*;
            var _local_2:* = this.invlist;
            var _local_3:* = new Array(4);
            for (_local_4 in _arg_1)
            {
                for (_local_5 in _local_2)
                {
                    if (_local_2[_local_5].rid == _arg_1[_local_4])
                    {
                        _local_3[_local_4] = _local_2[_local_5].iid;
                    };
                };
            };
            return (_local_3);
        }

        public function preload(_arg_1:*):*
        {
            this.stageRef.resourceloader.addResources(_arg_1, "obj");
            this.stageRef.resourceloader.addEventListener(resourceLoader.FILE_FIN, this.onLoadResourceLoading);
            this.stageRef.resourceloader.addEventListener(resourceLoader.LOADING_FIN, this.onDoneLoadResourceLoading);
        }

        public function onLoadResourceLoading(_arg_1:Event):*
        {
            var _local_2:*;
            var _local_4:*;
            var _local_3:* = 0;
            while (_local_3 < this.invdispl.length)
            {
                if (this.invdispl[_local_3].loaded == false)
                {
                    _local_4 = ("obj" + this.invdispl[_local_3].data.rid);
                    if (!this.checkClassExist(_local_4))
                    {
                        _local_4 = ("com.cocolani.obj.obj" + this.invdispl[_local_3].data.rid);
                    };
                    if (this.checkClassExist(_local_4))
                    {
                        trace((("Class obj" + this.invdispl[_local_3].data.rid) + " exists..."));
                        _local_2 = getDefinitionByName(_local_4);
                        this.invdispl[_local_3].icon = this.invdispl[_local_3].addChild(new (_local_2)());
                        this.invdispl[_local_3].icon.mouseEnabled = false;
                        this.invdispl[_local_3].icon.mouseChildren = false;
                        this.invdispl[_local_3].icon.x = -5;
                        this.invdispl[_local_3].icon.cacheAsBitMap = true;
                        this.invdispl[_local_3].loaded = true;
                        this.invdispl[_local_3].removeChild(this.invdispl[_local_3].preloader);
                        this.invdispl[_local_3].preloader = undefined;
                        if (this.invdispl[_local_3].data.type == "7")
                        {
                            this.invdispl[_local_3].icon.gotoAndStop(("thumbnail" + this.invdispl[_local_3].data.data1));
                        };
                    }
                    else
                    {
                        trace((("Class obj" + this.invdispl[_local_3].data.rid) + " not exist..."));
                        trace(((("Does com.cocolani.obj.obj" + this.invdispl[_local_3].data.rid) + "  one exist ? ") + this.checkClassExist(("com.cocolani.obj.obj" + this.invdispl[_local_3].data.rid))));
                    };
                };
                _local_3++;
            };
        }

        public function onDoneLoadResourceLoading(_arg_1:Event):*
        {
            this.stageRef.resourceloader.removeEventListener(resourceLoader.FILE_FIN, this.onLoadResourceLoading);
            this.stageRef.resourceloader.removeEventListener(resourceLoader.LOADING_FIN, this.onDoneLoadResourceLoading);
        }

        public function renderInv():*
        {
            var _local_2:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_1:* = 0;
            while (_local_1 < this.invdispl.length)
            {
                this.invContainerClip.removeChild(this.invdispl[_local_1]);
                _local_1++;
            };
            this.invdispl = [];
            var _local_3:* = getDefinitionByName("mc_inventoryitem");
            var _local_4:* = [];
            var _local_5:* = 0;
            _local_1 = 0;
            while (_local_1 < this.invlist.length)
            {
                _local_6 = false;
                if (this.itemsFilter == 4)
                {
                    _local_6 = true;
                }
                else
                {
                    if (((this.itemsFilter == 1) && (this.invlist[_local_1].type == "6")))
                    {
                        _local_6 = true;
                    }
                    else
                    {
                        if ((((this.itemsFilter == 2) && (Number(this.invlist[_local_1].type) >= 1)) && (Number(this.invlist[_local_1].type) < 5)))
                        {
                            _local_6 = true;
                        }
                        else
                        {
                            if (((this.itemsFilter == 3) && (this.invlist[_local_1].type == "0")))
                            {
                                _local_6 = true;
                            }
                            else
                            {
                                if (((this.itemsFilter == 5) && (this.invlist[_local_1].type == "7")))
                                {
                                    _local_6 = true;
                                };
                            };
                        };
                    };
                };
                if (_local_6)
                {
                    this.invdispl.push(this.invContainerClip.addChild(new (_local_3)()));
                    _local_7 = this.invdispl[(this.invdispl.length - 1)];
                    _local_7.data = this.invlist[_local_1];
                    _local_7.itemname.mouseEnabled = false;
                    _local_7.itemname.text = this.invlist[_local_1].label;
                    _local_8 = _local_7.itemname.getTextFormat();
                    _local_8.size = 9;
                    _local_7.itemname.setTextFormat(_local_8);
                    while (_local_7.itemname.numLines > 1)
                    {
                        _local_8.size--;
                        _local_7.itemname.setTextFormat(_local_8);
                    };
                    _local_7.mouseDownOnOver = false;
                    _local_7.x = (((_local_5 % 3) * 68) + 6);
                    _local_7.y = ((int((_local_5 / 3)) * 68) + 10);
                    this.stageRef.mc_interface.tooltipRef.init(_local_7, _local_7.data.desc);
                    _local_7.addEventListener(MouseEvent.MOUSE_OUT, this.dragout);
                    _local_7.addEventListener(MouseEvent.MOUSE_OVER, this.dragout);
                    if (this.checkClassExist(("obj" + _local_7.data.rid)))
                    {
                        _local_2 = getDefinitionByName(("obj" + _local_7.data.rid));
                        _local_7.icon = _local_7.addChild(new (_local_2)());
                        _local_7.icon.cacheAsBitMap = true;
                        _local_7.icon.mouseEnabled = false;
                        _local_7.icon.x = -5;
                        _local_7.icon.mouseChildren = false;
                        if (_local_7.data.type == "7")
                        {
                            _local_7.icon.gotoAndStop(("thumbnail" + _local_7.data.data1));
                        };
                        _local_7.loaded = true;
                    }
                    else
                    {
                        _local_2 = getDefinitionByName("mc_progress3");
                        _local_7.preloader = _local_7.addChild(new (_local_2)());
                        _local_7.preloader.width = 38;
                        _local_7.preloader.height = 38;
                        _local_7.preloader.x = 27;
                        _local_7.preloader.y = 27;
                        _local_7.preloader.mouseEnabled = false;
                        _local_4.push((("obj" + _local_7.data.rid) + ".swf"));
                        _local_7.loaded = false;
                    };
                    if (!this.endmarkerRef)
                    {
                        this.endmarkerRef = this.invContainerClip.addChild(new endmarker());
                    };
                    this.endmarkerRef.y = (((int((_local_5 / 3)) * 68) + _local_7.height) + 20);
                    this.endmarkerRef.x = 20;
                    _local_5++;
                };
                _local_1++;
            };
            this.invcontainer.update();
            if (_local_4.length > 0)
            {
                this.preload(_local_4);
            };
        }

        private function dragout(_arg_1:MouseEvent):*
        {
            if (_arg_1.type == "mouseOut")
            {
                if ((((_arg_1.buttonDown) && (_arg_1.currentTarget.mouseDownOnOver == false)) && (!(this.stageRef.cursorRef))))
                {
                    this.addCursor(_arg_1.currentTarget.data);
                };
            }
            else
            {
                if (_arg_1.type == "mouseOver")
                {
                    if (_arg_1.buttonDown)
                    {
                        _arg_1.currentTarget.mouseDownOnOver = true;
                    }
                    else
                    {
                        _arg_1.currentTarget.mouseDownOnOver = false;
                    };
                };
            };
        }

        public function addCursor(_arg_1:*, _arg_2:*="INV"):*
        {
            this.stageRef.stage.addEventListener(MouseEvent.MOUSE_UP, this.droptarget);
            this.stageRef.cursorRef = this.stageRef.addChild(new cursor());
            this.stageRef.cursorRef.setcursor(_arg_1, _arg_2, this.stageRef);
        }

        public function deleteCursor():*
        {
            this.stageRef.stage.removeEventListener(MouseEvent.MOUSE_UP, this.droptarget);
            this.stageRef.cursorRef.hideCursor();
            this.stageRef.removeChild(this.stageRef.cursorRef);
            this.stageRef.cursorRef = undefined;
        }

        private function droptarget(_arg_1:MouseEvent):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_2:* = this.stageRef.cursorRef.getObjData();
            this.stageRef.stage.removeEventListener(MouseEvent.MOUSE_UP, this.droptarget);
            if (((this.stageRef.cursorRef.dropOK) && (this.stageRef.mc_scene.loadHomeID)))
            {
                if (this.stageRef.cursorRef.ctype == "SCENEINV")
                {
                    _local_3 = new Object();
                    _local_3.ext = "home";
                    _local_3.cmd = "edt";
                    _local_3.data = _local_2;
                    _local_4 = this.stageRef.cursorRef.getCursorSize();
                    _local_5 = this.stageRef.mc_scene.sceneRef.globalToLocal(new Point(this.stageRef.cursorRef.x, this.stageRef.cursorRef.y));
                    _local_3.data[2] = Math.round(_local_5.x);
                    _local_3.data[3] = Math.round(_local_5.y);
                    _local_3.data = String(_local_3.data);
                    this.stageRef.sendXTmessage(_local_3);
                }
                else
                {
                    _local_3 = new Object();
                    _local_3.ext = "home";
                    _local_3.cmd = "drp";
                    _local_3.fid = _local_2.iid;
                    _local_6 = _local_2.rot;
                    if (!_local_6)
                    {
                        _local_6 = 1;
                    };
                    _local_4 = this.stageRef.cursorRef.getCursorSize();
                    _local_5 = this.stageRef.mc_scene.sceneRef.globalToLocal(new Point(this.stageRef.cursorRef.x, this.stageRef.cursorRef.y));
                    _local_3.co = ((((Math.round(_local_5.x) + ",") + Math.round(_local_5.y)) + ",") + _local_2.rot);
                    this.stageRef.sendXTmessage(_local_3);
                };
            }
            else
            {
                if (this.stageRef.cursorRef.checkDropPerm())
                {
                    _local_7 = _local_2.transfer;
                    if (this.stageRef.cursorRef.dropOverTradeItem())
                    {
                        if (_local_7 == "0")
                        {
                            this.stageRef.showmsg(this.stageRef.langObj.getText("fdb04"));
                        }
                        else
                        {
                            _local_8 = getDefinitionByName(("obj" + this.stageRef.cursorRef.getObjData().rid));
                            if (this.invTrade)
                            {
                                this.trade_drop.removeChild(this.invTrade);
                                this.invTrade = undefined;
                            };
                            this.invTrade = this.trade_drop.addChild(new (_local_8)());
                            this.invTrade.x = -5;
                            this.trade_drop.itemname.text = this.stageRef.cursorRef.getObjData().label;
                            this.invTrade.data = this.stageRef.cursorRef.getObjData();
                            this.trade_drop.gotoAndStop(3);
                        };
                    };
                };
                if (this.stageRef.cursorRef.ctype == "SCENEINV")
                {
                    if (this.stageRef.mc_scene.sceneRef)
                    {
                        this.stageRef.mc_scene.sceneRef.resetEdit();
                    };
                };
                try
                {
                    if (this.stageRef.mc_scene.sceneRef)
                    {
                        this.stageRef.mc_scene.sceneRef.checkForDrop(this.stageRef.cursorRef.x, this.stageRef.cursorRef.y, this.stageRef.cursorRef.getObjData());
                    };
                }
                catch(e:Error)
                {
                };
            };
            this.stageRef.cursorRef.hideCursor();
            this.stageRef.removeChild(this.stageRef.cursorRef);
            this.stageRef.cursorRef = undefined;
        }

        public function invbt(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            if (!this.invTrade)
            {
                this.stageRef.showmsg(this.stageRef.langObj.getText("fdb01"));
            };
            if (!this.tradePartner)
            {
                this.stageRef.showmsg(this.stageRef.langObj.getText("fdb02"));
            };
            if (((this.invTrade) && (this.tradePartner)))
            {
                if (!(this.tradePartner is User))
                {
                    this.tradePartner.faux(this.invTrade.data);
                }
                else
                {
                    if (this.stageRef.sfs.activeRoomId)
                    {
                        _local_2 = this.stageRef.sfs.getRoom(this.stageRef.sfs.activeRoomId);
                        if (_local_2.getUser(this.tradePartner.getName()))
                        {
                            if (!this.lastTradeTime)
                            {
                                this.lastTradeTime = new Date();
                            }
                            else
                            {
                                _local_4 = new Date();
                                if ((_local_4 - this.lastTradeTime) < 8000)
                                {
                                    return;
                                };
                                this.lastTradeTime = _local_4;
                            };
                            _local_3 = {};
                            _local_3.ext = "main";
                            _local_3.cmd = "trade";
                            _local_3.id = this.invTrade.data.iid;
                            _local_3.uid = _local_2.getUser(this.tradePartner.getName()).getId();
                            this.stageRef.sendXTmessage(_local_3);
                        }
                        else
                        {
                            this.stageRef.showmsg(this.stageRef.langObj.getText("gui42"));
                        };
                    }
                    else
                    {
                        this.stageRef.showmsg(this.stageRef.langObj.getText("gui43"));
                    };
                };
            };
        }

        private function checkClassExist(className:String):*
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

        public function getinv():*
        {
            return (this.invlist);
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.map

package com.cocolani.gui
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.events.Event;

    public class map extends MovieClip 
    {

        public var localDesc:TextField;
        public var visitorDesc:TextField;
        public var localsOnline:TextField;
        public var obj:map_Island_yeknom;
        public var visitorsOnline:TextField;
        internal var thisref:*;
        internal var stageRef:*;
        internal var lastMapUpdate:*;

        public function map()
        {
            this.thisref = this;
            super();
            stop();
            addEventListener(Event.ADDED_TO_STAGE, this.init);
            this.localsOnline.text = "";
            this.visitorsOnline.text = "";
        }

        private function init(_arg_1:Event):*
        {
            this.stageRef = _arg_1.currentTarget.stage.getChildAt(0);
            this.visitorDesc.text = this.stageRef.langObj.getText("gui25");
            this.localDesc.text = this.stageRef.langObj.getText("gui26");
            this.updateTribe();
            this.updateCounters();
        }

        public function updateCounters():*
        {
            var _local_2:*;
            if (!this.lastMapUpdate)
            {
                this.lastMapUpdate = new Date();
            }
            else
            {
                _local_2 = new Date();
                if ((_local_2 - this.lastMapUpdate) < 5000)
                {
                    return;
                };
                this.lastMapUpdate = _local_2;
            };
            var _local_1:* = {};
            _local_1.cmd = "getUserCounts";
            _local_1.ext = "main";
            this.stageRef.sendXTmessage(_local_1);
        }

        public function XTResponse(_arg_1:*):*
        {
            this.localsOnline.text = _arg_1.data[0];
            this.visitorsOnline.text = _arg_1.data[1];
        }

        public function updateTribe():*
        {
            if (this.stageRef.currentTribe > 0)
            {
                gotoAndStop(this.stageRef.currentTribe);
                this.updateCounters();
            }
            else
            {
                if (this.stageRef.currentTribe == 0)
                {
                    gotoAndStop("battlezone");
                    this.updateCounters();
                };
            };
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.moderatorChat

package com.cocolani.gui
{
    import com.cocolani.panels.simplepopup;
    import fl.controls.UIScrollBar;
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.ui.Keyboard;

    public class moderatorChat extends simplepopup 
    {

        internal static var attribs:* = {
            "dragbgd":true,
            "stageParent":true
        };
        internal static var maxlines:* = 50;

        public var scrollbar:UIScrollBar;
        public var bgd:MovieClip;
        public var bt_say:bt_say_private;
        public var saytxt:TextField;
        public var bt_close:Bt_mainpanelClose;
        public var chathistory:TextField;
        public var title:TextField;
        private var stageRef:*;
        public var targetRef:*;
        internal var chatter:Array = new Array();
        internal var chatHeader:*;

        public function moderatorChat()
        {
            setAttribs(attribs);
            this.title.mouseEnabled = false;
            this.saytxt.addEventListener(KeyboardEvent.KEY_DOWN, this.chatme);
            this.bt_say.addEventListener(MouseEvent.CLICK, this.chatmemouse);
            this.__setProp_scrollbar_mc_modchat_text_0();
        }

        private function chatmemouse(_arg_1:MouseEvent):*
        {
            this.sayfunction();
        }

        private function sayfunction():*
        {
            var _local_1:*;
            if (this.saytxt.text.length > 0)
            {
                _local_1 = {};
                _local_1.ext = "admin";
                _local_1.cmd = "modChat";
                _local_1.tgt = this.targetRef;
                _local_1.txt = this.saytxt.text;
                this.stageRef.sendXTmessage(_local_1, 1);
                if (this.stageRef.langObj.getLangDir() == 0)
                {
                    this.chatter.push((((("<b><font color='#FFFFFF'>" + this.stageRef.sfs.myUserName) + "</font></b>: ") + this.saytxt.text) + "\n"));
                }
                else
                {
                    this.chatter.push((((this.saytxt.text + "<b><font color='#FFFFFF'> :") + this.stageRef.sfs.myUserName) + "</font></b>\n"));
                };
            };
            if (this.chatter.length > maxlines)
            {
                this.chatter.shift();
            };
            this.refreshHistory();
            this.saytxt.htmlText = "";
            this.saytxt.scrollV = 0;
            this.stageRef.langObj.setFormat(this.saytxt);
        }

        private function chatme(_arg_1:KeyboardEvent):*
        {
            if (_arg_1.charCode == Keyboard.ENTER)
            {
                this.sayfunction();
                _arg_1.preventDefault();
            };
        }

        public function pvtResponse(_arg_1:*):*
        {
            if (this.stageRef.langObj.getLangDir() == 0)
            {
                this.chatter.push((((("<b><font color='#FFFFFF'>" + _arg_1.tgt.nm) + "</font></b> :") + _arg_1.txt) + "\n"));
            }
            else
            {
                this.chatter.push((((_arg_1.txt + "<b><font color='#FFFFFF'> :") + _arg_1.tgt.nm) + "</font></b>\n"));
            };
            if (this.chatter.length > maxlines)
            {
                this.chatter.shift();
            };
            this.refreshHistory();
        }

        public function refreshHistory():*
        {
            this.chathistory.htmlText = "";
            var _local_1:* = "";
            var _local_2:* = 0;
            while (_local_2 < this.chatter.length)
            {
                _local_1 = (_local_1 + this.chatter[_local_2]);
                _local_2++;
            };
            this.chathistory.htmlText = _local_1;
            this.stageRef.langObj.setFormat(this.chathistory);
            this.chathistory.scrollV = this.chathistory.maxScrollV;
            this.scrollbar.update();
        }

        public function setstageref(_arg_1:*):*
        {
            this.stageRef = _arg_1;
            this.chatHeader = _arg_1.langObj.getText("gui88");
            this.stageRef.langObj.setFormat(this.chathistory);
            this.stageRef.langObj.setFormat(this.saytxt);
            this.stageRef.langObj.setFormat(this.title);
            if (this.stageRef.statusType > 6)
            {
                this.chathistory.selectable = true;
            };
        }

        public function setup(_arg_1:*):*
        {
            this.targetRef = _arg_1;
            if (this.stageRef.langObj.getLangDir() == 1)
            {
                this.title.text = ((_arg_1.nm + "  ") + this.chatHeader);
            }
            else
            {
                this.title.text = (this.chatHeader + _arg_1.nm);
            };
            this.stageRef.langObj.setFormat(this.title);
        }

        internal function __setProp_scrollbar_mc_modchat_text_0():*
        {
            try
            {
                this.scrollbar["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            this.scrollbar.direction = "vertical";
            this.scrollbar.scrollTargetName = "chathistory";
            this.scrollbar.visible = true;
            try
            {
                this.scrollbar["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.playerPopup

package com.cocolani.gui
{
    import com.cocolani.panels.popup;
    import flash.display.MovieClip;
    import flash.utils.getDefinitionByName;
    import flash.events.Event;
    import flash.events.MouseEvent;

    public class playerPopup extends popup 
    {

        internal static var sections:* = ["PROFILE", "INVENTORY", "HOME", "MAP"];

        public var bgd:MovieClip;
        public var bt_panel:MovieClip;
        public var buddytitle:MovieClip;
        public var title:MovieClip;
        public var tab_buddylist_open:Paper_Tab_Main_In;
        public var tab_buddylist:Paper_Tab_Main;
        public var profileContainer:*;
        public var inventoryContainer:*;
        public var homeContainer:*;
        public var mapContainer:*;
        public var buddylistContainer:*;
        public var rewardsContainer:*;
        private var tabSelected:*;
        private var tabtoShow:* = "0";
        private var isopen:* = false;
        private var tabopen:* = false;
        private var closing:* = false;
        internal var thisref:*;
        internal var stageref:*;

        public function playerPopup()
        {
            this.thisref = this;
            super();
            addFrameScript(20, this.frame21, 27, this.frame28, 54, this.frame55, 86, this.frame87, 109, this.frame110);
            myname = "playerPanel";
            var _local_1:* = getDefinitionByName("mc_buddylist_simplelayout");
            this.buddylistContainer = addChild(new (_local_1)());
            this.buddylistContainer.x = 317;
            this.buddylistContainer.y = 5;
            addEventListener(Event.ADDED_TO_STAGE, this.init);
            this.buddylistContainer.visible = false;
            _local_1 = getDefinitionByName("mc_inventory");
            this.inventoryContainer = addChild(new (_local_1)());
            this.inventoryContainer.x = 10;
            this.inventoryContainer.y = 30;
            this.inventoryContainer.visible = false;
            _local_1 = getDefinitionByName("mc_playerprofile");
            this.profileContainer = addChild(new (_local_1)());
            this.profileContainer.x = 10;
            this.profileContainer.y = 30;
            this.profileContainer.visible = false;
            _local_1 = getDefinitionByName("mc_rewardstab");
            this.rewardsContainer = addChild(new (_local_1)());
            this.rewardsContainer.x = 10;
            this.rewardsContainer.y = 30;
            this.rewardsContainer.visible = false;
            this.title.mouseEnabled = false;
            this.title.mouseChildren = false;
            this.title.visible = false;
            this.bgd.stop();
            stop();
        }

        public function profileReady(_arg_1:*):*
        {
            if (_arg_1 == 0)
            {
                this.isopen = true;
                this.setTab(this.tabtoShow);
                this.bgd.stop();
                this.thisref.stop();
                this.thisref.tab_buddylist.addEventListener(MouseEvent.CLICK, this.openbuddy);
            }
            else
            {
                if (_arg_1 == 1)
                {
                    this.bgd.stop();
                    this.tabopen = true;
                    this.thisref.tab_buddylist_open.addEventListener(MouseEvent.CLICK, this.openbuddy);
                    this.buddylistContainer.visible = true;
                    this.buddytitle.gotoAndStop((this.stageref.langObj.selectedLang + 1));
                }
                else
                {
                    if (_arg_1 == 2)
                    {
                        if (!this.closing)
                        {
                            this.bgd.stop();
                            stop();
                            this.thisref.tab_buddylist.addEventListener(MouseEvent.CLICK, this.openbuddy);
                        }
                        else
                        {
                            this.hideContainers();
                        };
                        this.tabopen = false;
                    }
                    else
                    {
                        if (_arg_1 == 3)
                        {
                            this.bgd.stop();
                            stop();
                            this.isopen = false;
                            this.thisref.parent.hidePanel(myname);
                        };
                    };
                };
            };
        }

        private function openbuddy(_arg_1:MouseEvent):*
        {
            if (!this.tabopen)
            {
                gotoAndPlay("Tab_Roll_In");
            }
            else
            {
                gotoAndPlay("Tab_Roll_Out");
                this.buddylistContainer.visible = false;
            };
        }

        public function displayPage(_arg_1:*):*
        {
            _arg_1 = String(_arg_1);
            this.closing = false;
            if (!this.isopen)
            {
                this.bgd.gotoAndPlay(1);
                this.thisref.gotoAndPlay(1);
                this.tabtoShow = _arg_1;
                this.inventoryContainer.visible = false;
                this.profileContainer.visible = false;
                this.rewardsContainer.visible = false;
                if (this.buddylistContainer)
                {
                    this.buddylistContainer.visible = false;
                };
                if (this.mapContainer)
                {
                    this.mapContainer.visible = false;
                };
            }
            else
            {
                this.setTab(_arg_1);
            };
        }

        public function get selectedTab():String
        {
            return (this.tabSelected);
        }

        public function setstageref(_arg_1:*):*
        {
            this.stageref = _arg_1;
            this.buddylistContainer.setstageref(_arg_1);
            this.buddylistContainer.setBuddyList(this.stageref.sfs.buddyList);
            this.inventoryContainer.setstageref(_arg_1);
            this.rewardsContainer.setstageref(_arg_1);
            this.rewardsContainer.setrewards(this.stageref.loadedAVData.medals);
            var _local_2:* = this.stageref.langObj;
            var _local_3:* = 0;
            while (_local_3 < 5)
            {
                sections[_local_3] = _local_2.getText(("gui" + (_local_3 + 11)));
                _local_3++;
            };
            this.bt_panel.bt_close.addEventListener(MouseEvent.CLICK, this.clickbt);
        }

        public function shutdown():*
        {
            if (this.thisref.parent)
            {
                this.profileReady(3);
            };
            this.rewardsContainer.shutdown();
        }

        private function init(_arg_1:Event):*
        {
            this.buddylistContainer.setstageref(_arg_1.target.stage.getChildAt(0));
            removeEventListener(Event.ADDED_TO_STAGE, this.init);
        }

        public function setTab(_arg_1:*, _arg_2:*=false):*
        {
            var _local_4:*;
            this.tabSelected = _arg_1;
            this.title.sectionName.text = sections[_arg_1];
            var _local_3:* = 0;
            while (_local_3 < 4)
            {
                if (_local_3 == _arg_1)
                {
                    this.bt_panel[("tab" + _local_3)].disable();
                    this.bt_panel[("tab" + _local_3)].removeEventListener(MouseEvent.CLICK, this.tabclick);
                }
                else
                {
                    this.bt_panel[("tab" + _local_3)].enable();
                    this.bt_panel[("tab" + _local_3)].addEventListener(MouseEvent.CLICK, this.tabclick);
                };
                _local_3++;
            };
            if (this.profileContainer)
            {
                this.profileContainer.visible = false;
            };
            if (this.inventoryContainer)
            {
                this.inventoryContainer.visible = false;
            };
            if (this.homeContainer)
            {
                this.homeContainer.visible = false;
            };
            if (this.mapContainer)
            {
                this.mapContainer.visible = false;
            };
            this.rewardsContainer.visible = false;
            switch (_arg_1)
            {
                case "0":
                    this.profileContainer.visible = true;
                    return;
                case "1":
                    this.inventoryContainer.visible = true;
                    return;
                case "2":
                    if (!this.mapContainer)
                    {
                        _local_4 = getDefinitionByName("mc_map");
                        this.mapContainer = addChild(new (_local_4)());
                        this.mapContainer.x = 10;
                        this.mapContainer.y = 30;
                    }
                    else
                    {
                        this.mapContainer.visible = true;
                        this.mapContainer.updateCounters();
                    };
                    return;
                case "3":
                    this.rewardsContainer.visible = true;
                    return;
            };
        }

        private function hideContainers():*
        {
            this.inventoryContainer.visible = false;
            this.profileContainer.visible = false;
            this.rewardsContainer.visible = false;
            if (this.buddylistContainer)
            {
                this.buddylistContainer.visible = false;
            };
            if (this.mapContainer)
            {
                this.mapContainer.visible = false;
            };
        }

        override public function clickbt(_arg_1:MouseEvent):*
        {
            if (_arg_1.currentTarget.name == "bt_close")
            {
                this.closing = true;
                if (this.tabopen)
                {
                    gotoAndPlay("Tab_Roll_Out");
                    this.bgd.gotoAndPlay("Tab_Roll_Out");
                    this.inventoryContainer.visible = false;
                    this.buddylistContainer.visible = false;
                }
                else
                {
                    gotoAndPlay("Menu_Roll_Out");
                    this.bgd.gotoAndPlay("Menu_Roll_Out");
                    this.hideContainers();
                };
            };
        }

        public function tabclick(_arg_1:MouseEvent):*
        {
            var _local_2:* = _arg_1.currentTarget.name.substr(3, 1);
            this.setTab(_local_2, true);
        }

        internal function frame21():*
        {
            this.title.visible = true;
        }

        internal function frame28():*
        {
            stop();
            this.profileReady(0);
        }

        internal function frame55():*
        {
            stop();
            this.profileReady(1);
        }

        internal function frame87():*
        {
            this.profileReady(2);
        }

        internal function frame110():*
        {
            this.profileReady(3);
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.privateChat

package com.cocolani.gui
{
    import com.cocolani.panels.simplepopup;
    import fl.controls.UIScrollBar;
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.ui.Keyboard;

    public class privateChat extends simplepopup 
    {

        internal static var maxlines:* = 50;
        internal static var attribs:* = {
            "dragbgd":true,
            "stageParent":true
        };

        public var scrollbar:UIScrollBar;
        public var bgd:MovieClip;
        public var bt_say:bt_say_private;
        public var saytxt:TextField;
        public var bt_close:Bt_mainpanelClose;
        public var chathistory:TextField;
        public var bt_ignore:Bt_block_user;
        public var title:TextField;
        private var stageRef:*;
        public var avRef:*;
        public var avID:*;
        public var avName:*;
        internal var chatter:Array = new Array();
        internal var chatHeader:*;

        public function privateChat()
        {
            setAttribs(attribs);
            this.title.mouseEnabled = false;
            this.saytxt.addEventListener(KeyboardEvent.KEY_DOWN, this.chatme);
            this.bt_say.addEventListener(MouseEvent.CLICK, this.chatmemouse);
            this.bt_ignore.addEventListener(MouseEvent.CLICK, this.btListener);
            this.__setProp_scrollbar_mc_privatechat_text_0();
        }

        private function btListener(_arg_1:MouseEvent):*
        {
            if (_arg_1.currentTarget.name == "bt_ignore")
            {
                if (this.avName)
                {
                    this.stageRef.buddylistControl.setIgnore(this.avName, this.bt_ignore.toggleState);
                };
                if (this.avID)
                {
                    this.stageRef.buddylistControl.setIgnore(this.avID, this.bt_ignore.toggleState, "id");
                };
            };
        }

        private function checkForPresence():*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            if (this.stageRef.sfs.getBuddyByName(this.avName))
            {
                if (this.stageRef.sfs.getBuddyByName(this.avName).isOnline)
                {
                    return (true);
                };
                return (false);
            };
            if (this.stageRef.sfs.getRoom(this.stageRef.sfs.activeRoomId).getUser(this.avRef.getId()))
            {
                return (true);
            };
            var _local_1:* = this.stageRef.sfs.getAllRooms();
            for (_local_2 in _local_1)
            {
                _local_3 = _local_1[_local_2].getUserList();
                for (_local_4 in _local_3)
                {
                    if (_local_3[_local_4].getName() == this.avName)
                    {
                        this.avID = _local_3[_local_4].getId();
                        return (true);
                    };
                };
            };
            return (true);
        }

        private function chatmemouse(_arg_1:MouseEvent):*
        {
            this.sayfunction();
        }

        private function sayfunction():*
        {
            if (this.checkForPresence())
            {
                if (this.saytxt.text.length > 0)
                {
                    this.stageRef.sfs.sendPrivateMessage(this.saytxt.text, this.avID, -1);
                    if (this.stageRef.langObj.getLangDir() == 0)
                    {
                        this.chatter.push((((("<b><font color='#FFFFFF'>" + this.stageRef.sfs.myUserName) + "</font></b>: ") + this.saytxt.text) + "\n"));
                    }
                    else
                    {
                        this.chatter.push((((this.saytxt.text + "<b><font color='#FFFFFF'> :") + this.stageRef.sfs.myUserName) + "</font></b>\n"));
                    };
                };
            }
            else
            {
                this.chatter.push("<b>User is not online</b>\n");
            };
            if (this.chatter.length > maxlines)
            {
                this.chatter.shift();
            };
            this.refreshHistory();
            this.saytxt.htmlText = "";
            this.saytxt.scrollV = 0;
            this.stageRef.langObj.setFormat(this.saytxt);
        }

        private function chatme(_arg_1:KeyboardEvent):*
        {
            if (_arg_1.charCode == Keyboard.ENTER)
            {
                this.sayfunction();
                _arg_1.preventDefault();
            };
        }

        public function pvtResponse(_arg_1:*):*
        {
            if (_arg_1.sender)
            {
                if (this.stageRef.langObj.getLangDir() == 0)
                {
                    this.chatter.push((((("<b><font color='#FFFFFF'>" + _arg_1.sender.getName()) + "</font></b> :") + _arg_1.message) + "\n"));
                }
                else
                {
                    this.chatter.push((((_arg_1.message + "<b><font color='#FFFFFF'> :") + _arg_1.sender.getName()) + "</font></b>\n"));
                };
            }
            else
            {
                if (this.stageRef.langObj.getLangDir() == 0)
                {
                    this.chatter.push((((("<b><font color='#FFFFFF'>" + this.avName) + "</font></b>: ") + _arg_1.message) + "\n"));
                }
                else
                {
                    this.chatter.push((((_arg_1.message + "<b><font color='#FFFFFF'> :") + this.avName) + "</font></b>\n"));
                };
            };
            if (this.chatter.length > maxlines)
            {
                this.chatter.shift();
            };
            this.refreshHistory();
        }

        public function refreshHistory():*
        {
            this.chathistory.htmlText = "";
            var _local_1:* = "";
            var _local_2:* = 0;
            while (_local_2 < this.chatter.length)
            {
                _local_1 = (_local_1 + this.chatter[_local_2]);
                _local_2++;
            };
            this.chathistory.htmlText = _local_1;
            this.stageRef.langObj.setFormat(this.chathistory);
            this.chathistory.scrollV = this.chathistory.maxScrollV;
            this.scrollbar.update();
        }

        public function setstageref(_arg_1:*):*
        {
            this.stageRef = _arg_1;
            this.chatHeader = _arg_1.langObj.getText("gui15");
            this.stageRef.langObj.setFormat(this.chathistory);
            this.stageRef.langObj.setFormat(this.saytxt);
            this.stageRef.langObj.setFormat(this.title);
            if (this.stageRef.langObj.getLangDir() == 1)
            {
                this.bt_ignore.x = this.title.x;
            };
            this.bt_ignore.toolText = this.stageRef.langObj.getText("hlp42");
            this.stageRef.mc_interface.tooltipRef.init(this.bt_ignore, this.bt_ignore.toolText);
            if (this.stageRef.statusType > 6)
            {
                this.chathistory.selectable = true;
            };
        }

        public function setup(_arg_1:*):*
        {
            this.avRef = _arg_1;
            this.avID = _arg_1.getId();
            this.avName = _arg_1.getName();
            this.title.text = (this.chatHeader + this.avRef.getName());
            this.stageRef.langObj.setFormat(this.title);
            if (this.stageRef.buddylistControl.checkIfIgnored(this.avName))
            {
                this.bt_ignore.toggle();
            };
        }

        public function setupName(_arg_1:*):*
        {
            this.title.text = (this.stageRef.langObj.getText("gui15") + _arg_1);
            this.avName = _arg_1;
            this.avID = this.stageRef.sfs.getBuddyByName(_arg_1).id;
            this.stageRef.langObj.setFormat(this.title);
            if (this.stageRef.buddylistControl.checkIfIgnored(_arg_1))
            {
                this.bt_ignore.toggle();
            };
        }

        public function setupID(_arg_1:*):*
        {
            this.avID = _arg_1;
            this.avName = this.stageRef.sfs.getBuddyById(_arg_1).name;
            this.title.text = (this.stageRef.langObj.getText("gui15") + this.avName);
            this.stageRef.langObj.setFormat(this.title);
            if (this.stageRef.buddylistControl.checkIfIgnored(this.avName))
            {
                this.bt_ignore.toggle();
            };
        }

        internal function __setProp_scrollbar_mc_privatechat_text_0():*
        {
            try
            {
                this.scrollbar["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            this.scrollbar.direction = "vertical";
            this.scrollbar.scrollTargetName = "chathistory";
            this.scrollbar.visible = true;
            try
            {
                this.scrollbar["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.qualitySetter

package com.cocolani.gui
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.display.StageQuality;

    public class qualitySetter extends MovieClip 
    {

        public var quality:* = 0;
        private var thisref:*;

        public function qualitySetter()
        {
            stop();
            this.thisref = this;
            buttonMode = true;
            addEventListener(MouseEvent.MOUSE_OVER, this.onMouseEvent);
            addEventListener(MouseEvent.CLICK, this.onMouseEvent);
            addEventListener(MouseEvent.MOUSE_OUT, this.onMouseEvent);
        }

        public function onMouseEvent(_arg_1:MouseEvent):*
        {
            if (_arg_1.type == "mouseOver")
            {
                _arg_1.currentTarget.nextFrame();
            }
            else
            {
                if (_arg_1.type == "mouseOut")
                {
                    _arg_1.currentTarget.prevFrame();
                }
                else
                {
                    if (_arg_1.currentTarget.stage.getChildAt(0).getChildByName("mc_interface"))
                    {
                        _arg_1.currentTarget.stage.getChildAt(0).mc_interface.audio.playSound("sfx_click");
                    };
                    this.quality++;
                    if (this.quality == 3)
                    {
                        this.quality = 0;
                    };
                    this.setquality();
                };
            };
        }

        public function setquality(_arg_1:*=true):*
        {
            var _local_2:*;
            var _local_3:*;
            this.thisref.gotoAndStop(("quality" + this.quality));
            if (_arg_1)
            {
                this.thisref.nextFrame();
            };
            switch (this.quality)
            {
                case 0:
                    this.thisref.stage.quality = StageQuality.BEST;
                    break;
                case 1:
                    this.thisref.stage.quality = StageQuality.MEDIUM;
                    break;
                case 2:
                    this.thisref.stage.quality = StageQuality.LOW;
                    break;
            };
            if (((this.thisref.stage.getChildAt(0).loadedAVData) && (_arg_1)))
            {
                _local_2 = {};
                _local_2.ext = "main";
                _local_2.cmd = "updatePref";
                _local_3 = this.thisref.stage.getChildAt(0).loadedAVData.prefs.split(",");
                _local_3[1] = this.quality;
                _local_2.prefs = _local_3.join(",");
                this.thisref.stage.getChildAt(0).sendXTmessage(_local_2);
            };
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.rewards

package com.cocolani.gui
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import fl.containers.ScrollPane;
    import flash.display.Sprite;
    import it.gotoandplay.smartfoxserver.SFSEvent;
    import flash.utils.getDefinitionByName;
    import com.cocolani.resourceLoader;
    import flash.events.Event;

    public class rewards extends MovieClip 
    {

        public var rewardtext:TextField;
        public var txt_earned:TextField;
        public var rewardContainer:ScrollPane;
        public var txt_disc:TextField;
        internal var thisref:*;
        internal var rewardContainerClip:*;
        internal var rewardlist:Array;
        internal var rewarddispl:Array;
        internal var endmarkerRef:Sprite;
        internal var stageRef:*;
        internal var hasLoaded:* = false;
        internal var gamesList:*;
        internal var playerStats:*;

        public function rewards()
        {
            this.thisref = this;
            this.rewardContainerClip = new Sprite();
            this.rewardlist = new Array();
            this.rewarddispl = new Array();
            this.playerStats = [];
            super();
            this.rewardContainer.source = this.rewardContainerClip;
            this.rewardContainer.update();
        }

        public function shutdown():*
        {
            this.gamesList = undefined;
            this.stageRef.sfs.addEventListener(SFSEvent.onJoinRoom, this.getList);
        }

        public function setstageref(_arg_1:*):*
        {
            this.stageRef = _arg_1;
            if (!this.gamesList)
            {
                this.stageRef.sfs.addEventListener(SFSEvent.onJoinRoom, this.getList);
            };
        }

        public function getList(_arg_1:SFSEvent):*
        {
            var _local_2:*;
            if (!this.gamesList)
            {
                _local_2 = {};
                _local_2.cmd = "list";
                _local_2.ext = "gameManager";
                this.stageRef.sendXTmessage(_local_2);
            };
            this.stageRef.sfs.removeEventListener(SFSEvent.onJoinRoom, this.getList);
            if (!this.hasLoaded)
            {
                this.preload();
            };
        }

        public function XTResponse(_arg_1:*):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            if (_arg_1.list)
            {
                _local_2 = _arg_1.list.split("#");
                this.gamesList = [];
                for (_local_3 in _local_2)
                {
                    _local_4 = _local_2[_local_3].split("%");
                    this.gamesList[_local_3] = {
                        "ID":_local_4[0],
                        "name":_local_4[1]
                    };
                };
                this.renderRewards();
            }
            else
            {
                this.setrewards(_arg_1.md);
                this.stageRef.loadedAVData.medals = _arg_1.md;
                _local_5 = [this.stageRef.langObj.getText("medal01"), this.stageRef.langObj.getText("medal02"), this.stageRef.langObj.getText("medal03")];
                if (_arg_1.medupd)
                {
                    _local_6 = _arg_1.medupd.split(":");
                    this.stageRef.showmsg(this.stageRef.langObj.repText("medal10", this.getGameName(_local_6[0]), [_local_5[(Number(_local_6[1]) - 1)]]));
                };
                if (_arg_1.newmed)
                {
                    _local_6 = _arg_1.newmed.split(":");
                    this.stageRef.showmsg(this.stageRef.langObj.repText("medal11", _local_5[(Number(_local_6[1]) - 1)], [this.getGameName(_local_6[0])]));
                };
                if (((_arg_1.newmed) || (_arg_1.medupd)))
                {
                    if (this.checkClassExist("mc_medal_award_anim"))
                    {
                        _local_7 = getDefinitionByName("mc_medal_award_anim");
                        _local_8 = this.stageRef.addChild(new (_local_7)());
                        _local_8.x = 110;
                        _local_8.y = 100;
                    };
                    if (_local_8)
                    {
                        _local_9 = getDefinitionByName(("medal_gid" + _local_6[0]));
                        _local_10 = _local_8.medalcontainer.addChild(new (_local_9)());
                        _local_10.gotoAndStop(_local_6[1]);
                    };
                };
            };
        }

        public function setrewards(_arg_1:*):*
        {
            var _local_4:Array;
            this.rewardlist = [];
            var _local_2:* = String(_arg_1).split(",");
            var _local_3:* = 0;
            while (_local_3 < _local_2.length)
            {
                _local_4 = String(_local_2[_local_3]).split(":");
                this.rewardlist.push(_local_4);
                _local_3++;
            };
            if (_local_2[0].length == 0)
            {
                this.rewardlist = [];
            };
            this.renderRewards();
        }

        public function preload():*
        {
            this.stageRef.resourceloader.addResources(["medals.swf"], "panels");
            this.stageRef.resourceloader.addEventListener(resourceLoader.LOADING_FIN, this.onDoneLoadResourceLoading);
        }

        public function onDoneLoadResourceLoading(_arg_1:Event):*
        {
            this.stageRef.resourceloader.removeEventListener(resourceLoader.LOADING_FIN, this.onDoneLoadResourceLoading);
            this.hasLoaded = true;
            this.renderRewards();
        }

        public function getGameName(_arg_1:Number):*
        {
            var _local_2:*;
            if (this.gamesList)
            {
                _local_2 = 0;
                while (_local_2 < this.gamesList.length)
                {
                    if (this.gamesList[_local_2].ID == _arg_1)
                    {
                        return (this.gamesList[_local_2].name);
                    };
                    _local_2++;
                };
            };
            return (-1);
        }

        public function renderRewards():*
        {
            var _local_2:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_1:* = 0;
            while (_local_1 < this.rewarddispl.length)
            {
                this.rewardContainerClip.removeChild(this.rewarddispl[_local_1]);
                _local_1++;
            };
            this.rewarddispl = [];
            if (this.rewardlist.length == 0)
            {
                this.rewardtext.text = this.stageRef.langObj.getText("gui90");
                this.rewardtext.visible = true;
            }
            else
            {
                this.rewardtext.visible = false;
            };
            var _local_3:* = getDefinitionByName("mc_inventoryitem");
            var _local_4:* = false;
            _local_1 = 0;
            while (_local_1 < this.rewardlist.length)
            {
                this.rewarddispl.push(this.rewardContainerClip.addChild(new (_local_3)()));
                _local_5 = this.rewarddispl[(this.rewarddispl.length - 1)];
                _local_5.data = this.rewardlist[_local_1];
                _local_5.itemname.mouseEnabled = false;
                _local_5.scaleX = 1.3;
                _local_5.scaleY = 1.3;
                _local_6 = this.getGameName(this.rewardlist[_local_1][0]);
                _local_5.itemname.text = _local_6;
                _local_7 = _local_5.itemname.getTextFormat();
                _local_7.size = 9;
                _local_5.itemname.setTextFormat(_local_7);
                while (_local_5.itemname.numLines > 1)
                {
                    _local_7.size--;
                    _local_5.itemname.setTextFormat(_local_7);
                };
                _local_5.x = (((_local_1 % 3) * 90) + 27);
                _local_5.y = ((int((_local_1 / 3)) * 90) + 10);
                _local_5.bt.disable();
                this.stageRef.mc_interface.tooltipRef.init(_local_5, _local_6);
                if (this.checkClassExist(("medal_gid" + _local_5.data[0])))
                {
                    _local_2 = getDefinitionByName(("medal_gid" + _local_5.data[0]));
                    _local_5.icon = _local_5.addChild(new (_local_2)());
                    _local_5.icon.cacheAsBitMap = true;
                    _local_5.icon.mouseEnabled = false;
                    _local_5.icon.x = 10;
                    _local_5.icon.y = 3;
                    _local_5.icon.mouseChildren = false;
                    _local_5.icon.gotoAndStop(_local_5.data[1]);
                    _local_5.icon.scaleX = 0.4;
                    _local_5.icon.scaleY = 0.4;
                    _local_5.loaded = true;
                }
                else
                {
                    _local_4 = true;
                    _local_2 = getDefinitionByName("mc_progress3");
                    _local_5.preloader = _local_5.addChild(new (_local_2)());
                    _local_5.preloader.width = 38;
                    _local_5.preloader.height = 38;
                    _local_5.preloader.x = 27;
                    _local_5.preloader.y = 27;
                    _local_5.preloader.mouseEnabled = false;
                    _local_5.loaded = false;
                };
                if (!this.endmarkerRef)
                {
                    this.endmarkerRef = this.rewardContainerClip.addChild(new endmarker());
                };
                this.endmarkerRef.y = ((int((_local_1 / 3)) * 90) + 82);
                _local_1++;
            };
            this.rewardContainer.update();
            if (((_local_4) && (!(this.hasLoaded))))
            {
                this.preload();
            };
            this.updateStats();
        }

        public function setStats(_arg_1:Array):*
        {
            this.playerStats = _arg_1;
        }

        public function updateStats():*
        {
            var _local_1:*;
            if (((this.gamesList) && (this.stageRef.loadedAVData)))
            {
                if (this.stageRef.mc_interface.playerPopupRef.profileContainer.isego)
                {
                    if (((this.stageRef.loadedAVData.gam) && (this.stageRef.loadedAVData.gam.length > 0)))
                    {
                        _local_1 = this.stageRef.loadedAVData.gam.split(",");
                    }
                    else
                    {
                        _local_1 = [];
                    };
                }
                else
                {
                    _local_1 = this.playerStats;
                };
                this.txt_earned.text = this.stageRef.langObj.repText("gui86", this.rewardlist.length, [this.gamesList.length]);
                this.txt_disc.text = this.stageRef.langObj.repText("gui87", _local_1.length, [this.gamesList.length]);
            };
        }

        private function checkClassExist(className:String):*
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
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.scroller

package com.cocolani.gui
{
    import flash.display.MovieClip;
    import flash.geom.Rectangle;
    import flash.events.Event;
    import flash.events.FullScreenEvent;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import com.nexus.common.cursor;

    public class scroller extends MovieClip 
    {

        private var thisref:*;
        private var stageRef:*;
        private var scrollamt:* = 15;
        private var scrollmaxvel:* = 15;
        private var scrollvel:* = [0, 0];
        public var userscrollmax:* = 0;
        private var scrollevent:*;
        public var sceneBounds:Rectangle;
        public var currentPos:Rectangle;
        private var _initScrollPos:* = [0, 0];
        public var scrollerwidth:* = 847;
        public var scroll_l:*;
        public var scroll_r:*;
        public var scroll_t:*;
        public var scroll_b:*;
        private var scrollcoord:* = [new Rectangle(100, 54, 720, 45), new Rectangle(808, 98, 100, 371), new Rectangle(100, 464, 720, 45), new Rectangle(11, 98, 100, 371)];
        private var originalScale:* = [925, 600];

        public function scroller():void
        {
        }

        public function setStage(_arg_1:*):*
        {
            this.stageRef = _arg_1;
            this.thisref = this;
            mouseEnabled = true;
            mouseChildren = true;
            this.thisref.stage.addEventListener(Event.RESIZE, this.resized);
            this.thisref.stage.addEventListener(FullScreenEvent.FULL_SCREEN, this.fullscreen);
        }

        private function fullscreen(_arg_1:FullScreenEvent):*
        {
            this.checkAlignment();
            this.updateScrollPos();
        }

        private function resized(_arg_1:Event):*
        {
            this.checkAlignment();
            this.updateScrollPos();
        }

        private function updateScrollPos():*
        {
            this.setScrollers();
        }

        private function addListener(_arg_1:*):*
        {
            _arg_1.addEventListener(MouseEvent.MOUSE_OVER, this.scroll);
            _arg_1.addEventListener(MouseEvent.MOUSE_MOVE, this.scroll);
            _arg_1.addEventListener(MouseEvent.MOUSE_OUT, this.scroll);
            _arg_1.addEventListener(MouseEvent.CLICK, this.clickScroll);
        }

        private function removeListener(_arg_1:*):*
        {
            _arg_1.removeEventListener(MouseEvent.MOUSE_OVER, this.scroll);
            _arg_1.removeEventListener(MouseEvent.MOUSE_MOVE, this.scroll);
            _arg_1.removeEventListener(MouseEvent.MOUSE_OUT, this.scroll);
            _arg_1.removeEventListener(MouseEvent.CLICK, this.clickScroll);
        }

        public function initScrollPos(_arg_1:*):*
        {
            this._initScrollPos[0] = _arg_1;
        }

        public function disableScroller():*
        {
            removeEventListener(Event.ENTER_FRAME, this.scrollit);
            this.currentPos = new Rectangle(0, 0, this.stageRef.stage.stageWidth, this.stageRef.stage.stageHeight);
            this.sceneBounds = this.currentPos;
            this.setScrollers();
        }

        public function tempEnableScroller(_arg_1:Boolean):*
        {
            this.thisref.mouseEnabled = _arg_1;
            this.thisref.mouseChildren = _arg_1;
        }

        private function setScrollerprop(_arg_1:*, _arg_2:Rectangle):*
        {
            _arg_1.x = _arg_2.left;
            _arg_1.y = _arg_2.top;
            _arg_1.width = _arg_2.width;
            _arg_1.height = _arg_2.height;
        }

        public function setScrollers():*
        {
            var _local_2:*;
            var _local_1:* = 0;
            if (this.currentPos.right < this.sceneBounds.right)
            {
                if (!this.scroll_r)
                {
                    _local_2 = getDefinitionByName("scroller_hit");
                    this.scroll_r = addChild(new (_local_2)());
                    this.setScrollerprop(this.scroll_r, this.scrollcoord[1]);
                    this.scroll_r.name = "scroll_r";
                    this.scroll_r.alpha = _local_1;
                    this.addListener(this.scroll_r);
                    trace(("Added scrollbar ... xpos = " + this.scroll_r.x));
                };
            }
            else
            {
                if (this.scroll_r)
                {
                    removeChild(this.scroll_r);
                    this.scroll_r = null;
                    this.updateScrollPos();
                };
            };
            if (this.currentPos.top > this.sceneBounds.top)
            {
                if (!this.scroll_t)
                {
                    _local_2 = getDefinitionByName("scroller_hit");
                    this.scroll_t = addChild(new (_local_2)());
                    this.setScrollerprop(this.scroll_t, this.scrollcoord[0]);
                    this.scroll_t.name = "scroll_t";
                    this.scroll_t.alpha = _local_1;
                    this.addListener(this.scroll_t);
                };
            }
            else
            {
                if (this.scroll_t)
                {
                    removeChild(this.scroll_t);
                    this.scroll_t = null;
                    this.updateScrollPos();
                };
            };
            if (this.currentPos.left > this.sceneBounds.left)
            {
                if (!this.scroll_l)
                {
                    _local_2 = getDefinitionByName("scroller_hit");
                    this.scroll_l = addChild(new (_local_2)());
                    this.setScrollerprop(this.scroll_l, this.scrollcoord[3]);
                    this.scroll_l.name = "scroll_l";
                    this.scroll_l.alpha = _local_1;
                    this.addListener(this.scroll_l);
                };
            }
            else
            {
                if (this.scroll_l)
                {
                    removeChild(this.scroll_l);
                    this.scroll_l = null;
                    this.updateScrollPos();
                };
            };
            if (this.currentPos.bottom < this.sceneBounds.bottom)
            {
                if (!this.scroll_b)
                {
                    _local_2 = getDefinitionByName("scroller_hit");
                    this.scroll_b = addChild(new (_local_2)());
                    this.setScrollerprop(this.scroll_b, this.scrollcoord[2]);
                    this.scroll_b.name = "scroll_b";
                    this.scroll_b.alpha = _local_1;
                    this.addListener(this.scroll_b);
                };
            }
            else
            {
                if (this.scroll_b)
                {
                    removeChild(this.scroll_b);
                    this.scroll_b = null;
                    this.updateScrollPos();
                };
            };
        }

        public function enableScroller(_arg_1:*, _arg_2:*=null):*
        {
            removeEventListener(Event.ENTER_FRAME, this.scrollit);
            if ((_arg_1 is Rectangle))
            {
                this.sceneBounds = _arg_1;
                this.currentPos = _arg_2;
            }
            else
            {
                this.sceneBounds = new Rectangle(0, 0, this.originalScale[0], this.originalScale[1]);
                this.currentPos = new Rectangle(0, 0, this.originalScale[0], this.originalScale[1]);
            };
            if (this._initScrollPos[0] != 0)
            {
                this.currentPos.x = this._initScrollPos[0];
            };
            trace(("Enable scroller called........ xpos = " + this.currentPos.x));
            this.checkAlignment();
            this.setScrollers();
            this.updateScrollPos();
        }

        private function clickScroll(_arg_1:MouseEvent):*
        {
            if (this.stageRef.mc_scene)
            {
                this.stageRef.mc_scene.gotclick(_arg_1);
            };
        }

        private function hidecursor():*
        {
            if (((this.stageRef.cursorRef) && (this.stageRef.cursorRef.ctype == "simple")))
            {
                this.stageRef.cursorRef.hideCursor();
                this.stageRef.removeChild(this.stageRef.cursorRef);
                this.stageRef.cursorRef = undefined;
            };
        }

        private function checkAlignment():*
        {
            this.currentPos.width = this.thisref.stage.stageWidth;
            this.currentPos.height = this.thisref.stage.stageHeight;
            if ((this.currentPos.x + this.currentPos.width) > this.sceneBounds.right)
            {
                this.currentPos.x = (this.sceneBounds.right - this.currentPos.width);
            };
            if (this.currentPos.bottom > this.sceneBounds.bottom)
            {
                this.currentPos.y = (this.sceneBounds.bottom - this.currentPos.height);
            };
            if (this.currentPos.x < 0)
            {
                this.currentPos.x = 0;
            };
            if (this.currentPos.y < 0)
            {
                this.currentPos.y = 0;
            };
            this.stageRef.mc_scene.sceneRef.x = -(this.currentPos.left);
            this.stageRef.mc_scene.sceneRef.y = -(this.currentPos.top);
            this.stageRef.mc_scene.speechHolder.x = -(this.currentPos.left);
            this.stageRef.mc_scene.speechHolder.y = -(this.currentPos.top);
        }

        private function scrollit(_arg_1:Event):*
        {
            this.currentPos.x = (this.currentPos.x + this.scrollvel[0]);
            this.currentPos.y = (this.currentPos.y + this.scrollvel[1]);
            if (this.currentPos.right > this.sceneBounds.right)
            {
                this.stageRef.mc_scene.sceneRef.x = (-(this.sceneBounds.right) + this.currentPos.width);
                if (this.scrollvel > 0)
                {
                    removeEventListener(Event.ENTER_FRAME, this.scrollit);
                };
                this.setScrollers();
            };
            if (this.currentPos.left < this.sceneBounds.left)
            {
                this.stageRef.mc_scene.sceneRef.x = -(this.sceneBounds.left);
                this.setScrollers();
            };
            if (this.currentPos.top < this.sceneBounds.top)
            {
                this.stageRef.mc_scene.sceneRef.y = this.sceneBounds.top;
                this.setScrollers();
            };
            if (this.currentPos.bottom > this.sceneBounds.bottom)
            {
                this.stageRef.mc_scene.sceneRef.y = (-(this.sceneBounds.bottom) + this.currentPos.height);
                this.setScrollers();
            };
            this.checkAlignment();
        }

        private function scroll(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            if (_arg_1.type == "mouseMove")
            {
                if (_arg_1.currentTarget.name == "scroll_r")
                {
                    this.scrollvel = [(_arg_1.localX * this.scrollamt), 0];
                }
                else
                {
                    if (_arg_1.currentTarget.name == "scroll_l")
                    {
                        this.scrollvel = [(-(1 - _arg_1.localX) * this.scrollamt), 0];
                    }
                    else
                    {
                        if (_arg_1.currentTarget.name == "scroll_t")
                        {
                            this.scrollvel = [0, (-(1 - _arg_1.localY) * this.scrollamt)];
                        }
                        else
                        {
                            if (_arg_1.currentTarget.name == "scroll_b")
                            {
                                this.scrollvel = [0, (_arg_1.localY * this.scrollamt)];
                            };
                        };
                    };
                };
            }
            else
            {
                if (_arg_1.type == "mouseOver")
                {
                    if (this.stageRef.cursorRef)
                    {
                        return;
                    };
                    if (!this.scrollevent)
                    {
                        this.scrollevent = addEventListener(Event.ENTER_FRAME, this.scrollit);
                    };
                    this.stageRef.cursorRef = this.stageRef.addChild(new cursor());
                    _local_2 = "";
                    if (_arg_1.currentTarget.name == "scroll_l")
                    {
                        _local_2 = "left arrow";
                    }
                    else
                    {
                        if (_arg_1.currentTarget.name == "scroll_r")
                        {
                            _local_2 = "right arrow";
                        }
                        else
                        {
                            if (_arg_1.currentTarget.name == "scroll_t")
                            {
                                _local_2 = "tp arrw";
                            }
                            else
                            {
                                if (_arg_1.currentTarget.name == "scroll_b")
                                {
                                    _local_2 = "dwn arrw";
                                };
                            };
                        };
                    };
                    this.stageRef.cursorRef.setcursor(_local_2, "simple", this.stageRef);
                }
                else
                {
                    this.hidecursor();
                    removeEventListener(Event.ENTER_FRAME, this.scrollit);
                    this.updateScrollPos();
                };
            };
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.speechHandler

package com.cocolani.gui
{
    import flash.display.MovieClip;
    import flash.net.URLLoader;
    import flash.text.TextFormat;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.text.TextFieldAutoSize;
    import flash.events.IOErrorEvent;
    import flash.utils.getDefinitionByName;
    import flash.events.FocusEvent;
    import flash.events.KeyboardEvent;
    import flash.net.URLRequest;

    public class speechHandler extends MovieClip 
    {

        public var container:MovieClip;
        private var stageRef:*;
        public var thisref:*;
        public var answerArray:*;
        public var characterHolder:*;
        public var XMLLoader:*;
        public var XMLtxt:XML;
        public var contentHolder:*;
        public var dataHolder:*;
        private var feedbackFunction:*;
        public var speechIndex:* = 0;
        private var manualResponse:* = false;
        internal var selectedCurrency:*;
        internal var currenttribe:*;
        internal var exchangeRate:*;
        internal var myPurse:*;
        internal var selectedAmount:* = 0;
        internal var currency:*;
        internal var currencyResp:*;
        internal var preloaderHolder:*;
        internal var auto:* = false;
        internal var charSnapHolder:*;
        internal var isFB:* = false;
        internal var FontLG:*;
        internal var FontLG2:*;
        internal var FontSTD:*;

        public function speechHandler()
        {
            this.thisref = this;
            this.answerArray = [];
            this.XMLLoader = new URLLoader();
            this.exchangeRate = [1, 0.7, 0.3];
            this.FontLG = new TextFormat(null, 16);
            this.FontLG2 = new TextFormat(null, 14);
            this.FontSTD = new TextFormat(null, 12);
            super();
            addFrameScript(9, this.frame10);
            addEventListener(Event.ADDED_TO_STAGE, this.init);
            this.container.bt_next.addEventListener(MouseEvent.CLICK, this.answerHandlers);
            this.container.textContainer.visible = false;
            this.container.textContainer.thetext.autoSize = TextFieldAutoSize.LEFT;
            this.container.bt_next.visible = false;
            this.XMLLoader.addEventListener(Event.COMPLETE, this.loadedXML);
            this.XMLLoader.addEventListener(IOErrorEvent.IO_ERROR, this.errorloadXML);
        }

        public function shutdown():*
        {
            if (this.currency)
            {
                this.removeConvertor();
            };
            if (this.currencyResp)
            {
                this.removeResponse();
            };
            if (this.thisref.parent)
            {
                this.thisref.parent.owner.text = this.stageRef.sfs.myUserName;
            };
            if (this.stageRef.mc_scene.sceneRef)
            {
                this.stageRef.mc_scene.sceneRef.closeInteraction(this.thisref);
            };
            this.stageRef.mc_interface.hidePanel("speechHandler");
        }

        public function initCurrency():*
        {
            var _local_1:* = getDefinitionByName("mc_currencyexchange");
            this.currency = this.container.addChild(new (_local_1)());
            this.currency.x = 0;
            this.currency.y = 0;
            if (this.isFB)
            {
                this.currency.y = -30;
                this.currency.x = 40;
                this.currency.owncurrency.setTextFormat(this.FontLG);
                this.currency.amtcurrency.setTextFormat(this.FontLG);
            };
            this.currenttribe = Number(this.thisref.stage.getChildAt(0).currentTribe);
            this.myPurse = this.thisref.stage.getChildAt(0).mc_interface.bt_currency.myCurrency;
            this.thisref.stage.getChildAt(0).mc_interface.bt_currency.addEventListener("currency_update", this.currencyUpdated);
            this.selectedCurrency = (this.currenttribe + 1);
            if (this.selectedCurrency > this.thisref.stage.getChildAt(0).tribeData.length)
            {
                this.selectedCurrency = 1;
            };
            var _local_2:* = getDefinitionByName("mc_progress3");
            this.preloaderHolder = this.container.addChild(new (_local_2)());
            this.preloaderHolder.x = 160;
            this.preloaderHolder.y = 30;
            var _local_3:* = new Object();
            _local_3.cmd = "getExchange";
            _local_3.ext = "main";
            this.thisref.stage.getChildAt(0).sendXTmessage(_local_3);
            this.currency.visible = false;
            this.refreshCurrency();
            this.currency.bt_currencyU.addEventListener(MouseEvent.CLICK, this.currencyUpdate);
            this.currency.bt_currencyD.addEventListener(MouseEvent.CLICK, this.currencyUpdate);
            this.currency.bt_amountU.addEventListener(MouseEvent.CLICK, this.currencyUpdate);
            this.currency.bt_amountD.addEventListener(MouseEvent.CLICK, this.currencyUpdate);
            this.currency.amtcurrency.addEventListener(FocusEvent.FOCUS_OUT, this.currencyUpdate);
            this.currency.amtcurrency.addEventListener(KeyboardEvent.KEY_UP, this.currencyUpdate);
            this.currency.amtcurrency.restrict = "0-9";
            this.currency.btn_exchange.addEventListener(MouseEvent.CLICK, this.currencyNavigator);
            this.currency.btn_exchange.setText(this.stageRef.langObj.getText("gui55"));
        }

        private function currencyNavigator(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            if (_arg_1.currentTarget.name == "btn_cancel")
            {
                this.removeConvertor();
                this.removeResponse();
                if (this.feedbackFunction)
                {
                    this.feedbackFunction("conversionResponse", 1);
                }
                else
                {
                    this.shutdown();
                };
            }
            else
            {
                if (_arg_1.currentTarget.name == "btn_ok")
                {
                    this.removeResponse();
                    this.container.textContainer.visible = true;
                    this.currency.visible = true;
                    this.selectedAmount = 0;
                    this.refreshCurrency();
                }
                else
                {
                    if (_arg_1.currentTarget.name == "btn_done")
                    {
                        this.removeConvertor();
                        this.removeResponse();
                        this.selectedAmount = 0;
                        if (this.feedbackFunction)
                        {
                            this.feedbackFunction("conversionResponse", 1);
                        }
                        else
                        {
                            this.shutdown();
                        };
                    }
                    else
                    {
                        if (Number(this.currency.owncurrency.text) > 0)
                        {
                            if (Number(this.currency.amtcurrency.text) > this.stageRef.mc_interface.bt_currency.myCurrency[(this.selectedCurrency - 1)])
                            {
                                this.stageRef.showmsg(this.stageRef.langObj.repText("gui84", this.stageRef.mc_interface.bt_currency.myCurrency[(this.selectedCurrency - 1)]));
                                this.selectedAmount = this.stageRef.mc_interface.bt_currency.myCurrency[(this.selectedCurrency - 1)];
                                this.refreshCurrency();
                            }
                            else
                            {
                                _local_2 = new Object();
                                _local_2.cmd = "convertCurrency";
                                _local_2.amt = this.currency.amtcurrency.text;
                                _local_2.cur = (this.selectedCurrency - 1);
                                _local_2.ext = "main";
                                this.thisref.stage.getChildAt(0).sendXTmessage(_local_2);
                                _local_3 = getDefinitionByName("mc_progress3");
                                this.preloaderHolder = this.container.addChild(new (_local_3)());
                                this.preloaderHolder.x = 170;
                                this.preloaderHolder.y = 35;
                                if (this.isFB)
                                {
                                    this.preloaderHolder.x = 215;
                                    this.preloaderHolder.y = 21;
                                };
                                this.preloaderHolder.scaleX = 0.4;
                                this.preloaderHolder.scaleY = 0.4;
                                this.currency.visible = false;
                                this.container.textContainer.visible = false;
                                _local_4 = getDefinitionByName("mc_exchangeResponse");
                                this.currencyResp = this.container.addChild(new (_local_4)());
                                this.currencyResp.x = 0;
                                this.currencyResp.btn_ok.setText(this.thisref.stage.getChildAt(0).langObj.getText("gui17"));
                                this.currencyResp.btn_done.setText(this.thisref.stage.getChildAt(0).langObj.getText("gui18"));
                                this.currencyResp.txt_succ.text = this.stageRef.langObj.getText("gui62");
                                this.currencyResp.txt_rcvd.text = this.stageRef.langObj.getText("gui63");
                                this.currencyResp.txt_exchg.text = this.stageRef.langObj.getText("gui64");
                                this.stageRef.langObj.setFormat(this.currencyResp.txt_succ);
                                this.stageRef.langObj.setFormat(this.currencyResp.txt_rcvd);
                                this.stageRef.langObj.setFormat(this.currencyResp.txt_exchg);
                                if (this.isFB)
                                {
                                    this.currencyResp.x = 30;
                                    this.currencyResp.y = -12;
                                    this.currencyResp.amtbought.setTextFormat(this.FontLG);
                                    this.currencyResp.amtfrom.setTextFormat(this.FontLG);
                                };
                                this.currencyResp.btn_ok.addEventListener(MouseEvent.CLICK, this.currencyNavigator);
                                this.currencyResp.btn_done.addEventListener(MouseEvent.CLICK, this.currencyNavigator);
                                this.currencyResp.visible = false;
                            };
                        }
                        else
                        {
                            this.thisref.stage.getChildAt(0).showmsg(this.thisref.stage.getChildAt(0).langObj.getText("com12"));
                        };
                    };
                };
            };
        }

        private function currencyUpdated(_arg_1:Event):*
        {
            this.myPurse = this.thisref.stage.getChildAt(0).mc_interface.bt_currency.myCurrency;
            this.refreshCurrency();
        }

        public function setExchangeRate(_arg_1:*):*
        {
            this.exchangeRate = _arg_1.split(",");
            this.container.removeChild(this.preloaderHolder);
            this.preloaderHolder = undefined;
            this.refreshCurrency();
            this.currency.visible = true;
            this.container.textContainer.visible = true;
        }

        public function setExchangeResponse(_arg_1:*):*
        {
            this.currencyResp.amtbought.text = _arg_1.ambt;
            this.currencyResp.amtfrom.text = _arg_1.amfm;
            this.currencyResp.mycurrency.gotoAndStop(_arg_1.crbt);
            this.currencyResp.frmcurrency.gotoAndStop((Number(_arg_1.crfm) + 1));
            this.currencyResp.visible = true;
            this.container.removeChild(this.preloaderHolder);
            this.preloaderHolder = undefined;
        }

        private function currencyUpdate(_arg_1:*):*
        {
            if (_arg_1.currentTarget.name == "bt_currencyU")
            {
                if (this.selectedCurrency < this.exchangeRate.length)
                {
                    this.selectedCurrency++;
                    if (this.selectedCurrency == this.currenttribe)
                    {
                        this.selectedCurrency++;
                    };
                    if (this.selectedCurrency > this.myPurse.length)
                    {
                        this.selectedCurrency = 1;
                    };
                    this.selectedAmount = 0;
                };
            }
            else
            {
                if (_arg_1.currentTarget.name == "bt_currencyD")
                {
                    if (this.selectedCurrency > 1)
                    {
                        this.selectedCurrency--;
                        if (this.selectedCurrency == this.currenttribe)
                        {
                            this.selectedCurrency--;
                        };
                        if (this.selectedCurrency == 0)
                        {
                            this.selectedCurrency = (this.selectedCurrency + 2);
                        };
                        this.selectedAmount = 0;
                    };
                }
                else
                {
                    if (_arg_1.currentTarget.name == "bt_amountU")
                    {
                        if (this.selectedAmount < this.myPurse[(this.selectedCurrency - 1)])
                        {
                            this.selectedAmount++;
                        };
                    }
                    else
                    {
                        if (_arg_1.currentTarget.name == "bt_amountD")
                        {
                            if (this.selectedAmount > 0)
                            {
                                this.selectedAmount--;
                            };
                        }
                        else
                        {
                            if (_arg_1.currentTarget.name == "amtcurrency")
                            {
                                this.selectedAmount = Number(this.currency.amtcurrency.text);
                            };
                        };
                    };
                };
            };
            this.refreshCurrency();
        }

        private function refreshCurrency():*
        {
            this.currency.mycurrency.gotoAndStop(this.currenttribe);
            this.currency.selectedcurrency.gotoAndStop(this.selectedCurrency);
            this.currency.amtcurrency.text = this.selectedAmount;
            this.currency.owncurrency.text = Math.floor((this.selectedAmount * this.exchangeRate[(this.selectedCurrency - 1)]));
        }

        public function setupConvertor(_arg_1:String):*
        {
            var _local_2:*;
            for (_local_2 in this.answerArray)
            {
                this.container.removeChild(this.answerArray[_local_2]);
            };
            this.answerArray = [];
            this.container.textContainer.thetext.text = _arg_1;
            this.stageRef.langObj.setFormat(this.container.textContainer.thetext);
            this.initCurrency();
            this.container.bt_next.visible = false;
            if (!this.isFB)
            {
                this.container.textContainer.y = 0;
            };
            this.container.textContainer.visible = false;
        }

        public function removeConvertor():*
        {
            if (this.currency)
            {
                this.thisref.stage.getChildAt(0).mc_interface.bt_currency.removeEventListener("currency_update", this.currencyUpdated);
                this.container.removeChild(this.currency);
                this.currency = undefined;
            };
        }

        public function removeResponse():*
        {
            if (this.currencyResp)
            {
                this.container.removeChild(this.currencyResp);
                this.currencyResp = undefined;
            };
        }

        public function setupChat(_arg_1:String, _arg_2:*, _arg_3:*, _arg_4:*=undefined):*
        {
            if (this.thisref.parent.charsnaps.minimized)
            {
                this.thisref.parent.charsnaps.togglevis();
            };
            this.stageRef = _arg_3;
            this.feedbackFunction = _arg_2;
            this.XMLLoader.load(new URLRequest((((((this.stageRef.rootURL + "xml/") + _arg_1) + "_l") + this.stageRef.langObj.selectedLang) + ".xml")));
            if (_arg_4)
            {
                this.thisref.parent.charsnaps.setCharacter(_arg_4);
                this.thisref.parent.owner.text = "";
            };
            this.thisref.parent.feedback.showbubble();
        }

        public function setResponseManual():*
        {
            this.manualResponse = true;
        }

        public function setData(_arg_1:*):*
        {
            this.dataHolder = _arg_1;
        }

        private function errorloadXML(_arg_1:IOErrorEvent):*
        {
            this.stageRef.showmsg(this.stageRef.langObj.getText("err05"));
            trace(("error = " + _arg_1));
            this.shutdown();
        }

        private function loadedXML(e:Event):*
        {
            try
            {
                this.XMLtxt = new XML(e.target.data);
                if (this.XMLtxt.@auto == "true")
                {
                    this.auto = true;
                };
                if (this.XMLtxt.@characterName)
                {
                    this.thisref.parent.owner.text = this.XMLtxt.@characterName;
                };
                if (!this.auto)
                {
                    this.feedbackFunction("loaded");
                }
                else
                {
                    if (((this.manualResponse) && (this.feedbackFunction)))
                    {
                        this.feedbackFunction("loaded", 0);
                        this.manualResponse = false;
                    }
                    else
                    {
                        if (this.findAnsId(this.XMLtxt.Response, 1))
                        {
                            this.speechIndex = this.findAnsId(this.XMLtxt.Response, 1);
                            this.setupDialogueText(this.findAnsId(this.XMLtxt.Response, 1), this.findAnsId(this.XMLtxt.Response, 1));
                        }
                        else
                        {
                            this.speechIndex = this.XMLtxt.Question[0];
                            this.setupDialogueText(this.XMLtxt.Question[0], this.XMLtxt.Question[0]);
                        };
                    };
                };
            }
            catch(e:Error)
            {
                trace(("ERROR INITIALIZING XML.." + e));
                stageRef.showmsg(stageRef.langObj.getText("err05"));
            };
        }

        public function init(_arg_1:Event):*
        {
            this.stageRef = _arg_1.currentTarget.stage.getChildAt(0);
            parent.setChildIndex(this.thisref, (this.thisref.parent.getChildIndex(this.thisref.parent.feedback) + 1));
            this.stageRef.langObj.setFormat(this.thisref.container.textContainer.thetext);
            this.thisref.container.bt_next.setText(this.stageRef.langObj.getText("gui56"));
            if (this.stageRef.FID)
            {
                this.isFB = true;
            };
            if (this.isFB)
            {
                this.container.bt_next.x = 387;
                this.container.bt_next.thetext.setTextFormat(this.FontLG);
                this.container.textContainer.y = -31;
                this.container.textContainer.thetext.width = 450;
                this.container.textContainer.thetext.setTextFormat(this.FontLG);
            };
        }

        public function fingameEvent(_arg_1:*, _arg_2:*):*
        {
            if (((this.XMLtxt.Game) && (this.XMLtxt.Game.wingame.length() > 0)))
            {
                this.setupDialogueText(this.XMLtxt.Game.wingame);
            };
        }

        public function endgameEvent():*
        {
            if ((((this.XMLtxt) && (this.XMLtxt.Game)) && (this.XMLtxt.Game.endgame.length() > 0)))
            {
                this.setupDialogueText(this.XMLtxt.Game.endgame);
            };
        }

        public function respondById(_arg_1:*):*
        {
            var _local_2:* = this.findAnsId(this.XMLtxt.Question, _arg_1);
            if (!_local_2)
            {
                _local_2 = this.findAnsId(this.XMLtxt.Response, _arg_1);
            };
            if (_local_2)
            {
                this.setupDialogueText(_local_2, _local_2);
            };
        }

        public function setupDialogueText(_arg_1:*, _arg_2:XML=null):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            if ((_arg_1 is XML))
            {
                this.speechIndex = _arg_1;
            };
            if (((this.speechIndex == 0) && (_arg_2)))
            {
                this.speechIndex = _arg_2;
            };
            if (!_arg_2)
            {
                _arg_2 = _arg_1;
            };
            if (!(_arg_1 is String))
            {
                if (((_arg_1.@auto == "false") && (this.feedbackFunction)))
                {
                    _local_4 = _arg_1.@type;
                    if (_local_4.length() == 0)
                    {
                        _local_4 = "rep";
                    };
                    if (_arg_1.@txt.length() > 0)
                    {
                        _local_5 = this.feedbackFunction(_local_4, _arg_1, _arg_1.@id);
                        if ((_local_5 is String))
                        {
                            _arg_1.@txt = _local_5;
                            trace(("sum Response = " + _local_5));
                        }
                        else
                        {
                            _arg_1 = _local_5;
                            _arg_2 = _local_5;
                            this.speechIndex = _local_5;
                        };
                    }
                    else
                    {
                        _arg_1 = this.feedbackFunction(_local_4, _arg_1, _arg_1.@id);
                        if (!(_arg_1 is String))
                        {
                            _arg_2 = _arg_1;
                            this.speechIndex = _arg_1;
                        };
                    };
                };
            };
            if (!_arg_1)
            {
                this.stageRef.showmsg(this.stageRef.langObj.getText("err03"));
            };
            if (((!(_arg_1 is String)) && (_arg_1.@openstore == "true")))
            {
                _local_6 = "";
                if (_arg_1.@storetype)
                {
                    _local_6 = _arg_1.@storetype;
                };
                _local_7 = this.stageRef.sceneLists.getIDFromSFS(this.stageRef.sfs.activeRoomId);
                this.stageRef.mc_interface.showStore(_local_7, _local_6);
            };
            if (((!(_arg_1 is String)) && (_arg_1.@currencyexchange == "true")))
            {
                this.setupConvertor(String(_arg_1));
                return;
            };
            if (((!(_arg_1 is String)) && (_arg_1.@opengame == "true")))
            {
                if (this.XMLtxt.Game.type.length() > 0)
                {
                    if (this.XMLtxt.Game.type == "battle-practice")
                    {
                        this.stageRef.mc_scene.loadNewRoom("GamesRoom", true, {
                            "battlegame":true,
                            "battle":0
                        });
                    };
                }
                else
                {
                    if (this.XMLtxt.Game.version == "AS3")
                    {
                        trace("This game is set to AS3");
                        trace(this.XMLtxt.Game.version);
                        this.stageRef.mc_scene.loadGame(this.XMLtxt.Game.gamename, {"AS3":true});
                    }
                    else
                    {
                        this.stageRef.mc_scene.loadGame(this.XMLtxt.Game.gamename);
                    };
                };
            };
            this.removeConvertor();
            this.container.textContainer.y = 0;
            if (this.isFB)
            {
                this.container.textContainer.y = -31;
            };
            this.container.textContainer.visible = true;
            for (_local_3 in this.answerArray)
            {
                this.container.removeChild(this.answerArray[_local_3]);
            };
            this.answerArray = [];
            if (!(_arg_1 is String))
            {
                if (_arg_1.@txt.length() > 0)
                {
                    this.container.textContainer.thetext.text = _arg_1.@txt;
                }
                else
                {
                    this.container.textContainer.thetext.text = _arg_1;
                };
            }
            else
            {
                this.container.textContainer.thetext.text = _arg_1;
            };
            if (this.isFB)
            {
                this.container.textContainer.thetext.setTextFormat(this.FontLG);
            };
            this.stageRef.langObj.setTextJustify(this.container.textContainer.thetext, this.container.textContainer.thetext.text);
            if (((_arg_2) && (_arg_2.reply.length() > 0)))
            {
                this.container.bt_next.visible = false;
                this.thisref.parent.charsnaps.set_snapphase(2);
                _local_8 = ((this.container.textContainer.y + this.container.textContainer.height) + 2);
                for (_local_3 in _arg_2.reply)
                {
                    this.answerArray.push(this.container.addChild(new mc_speechresponseselect()));
                    _local_9 = this.answerArray[(this.answerArray.length - 1)];
                    _local_9.x = this.container.textContainer.x;
                    _local_9.y = _local_8;
                    if (this.isFB)
                    {
                        _local_9.thetext.width = (this.container.textContainer.thetext.width - _local_9.thetext.x);
                        _local_9.thetext.setTextFormat(this.FontLG2);
                        _local_9.bullet.scaleX = 1.2;
                        _local_9.bullet.scaleY = 1.2;
                    };
                    _local_9.id = _local_3;
                    _local_9.thetext.autoSize = TextFieldAutoSize.LEFT;
                    _local_9.thetext.text = _arg_2.reply[_local_3];
                    this.stageRef.langObj.setFormat(_local_9.thetext);
                    _local_8 = (_local_8 + (_local_9.height - 7));
                    if (this.stageRef.langObj.getLangDir() == 1)
                    {
                        _local_9.bullet.x = ((_local_9.thetext.x + _local_9.thetext.width) + 2);
                        if (this.isFB)
                        {
                            _local_9.thetext.x = 0;
                        };
                    };
                    _local_9.addEventListener(MouseEvent.MOUSE_OVER, this.answerHandlers);
                    _local_9.addEventListener(MouseEvent.MOUSE_OUT, this.answerHandlers);
                    _local_9.addEventListener(MouseEvent.CLICK, this.answerHandlers);
                };
            }
            else
            {
                if (((Boolean(this.speechIndex.@showNext)) && (this.speechIndex.@showNext == "false")))
                {
                    this.container.bt_next.visible = false;
                }
                else
                {
                    this.container.bt_next.visible = true;
                };
                if (this.thisref.parent)
                {
                    this.thisref.parent.charsnaps.set_snapphase(1);
                };
            };
        }

        private function answerHandlers(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            if (_arg_1.type == "mouseOver")
            {
                _arg_1.currentTarget.thetext.textColor = 0x660000;
            }
            else
            {
                if (_arg_1.type == "mouseOut")
                {
                    _arg_1.currentTarget.thetext.textColor = 0;
                }
                else
                {
                    if (_arg_1.type == "click")
                    {
                        if (_arg_1.currentTarget.name != "bt_next")
                        {
                            _local_2 = _arg_1.currentTarget.id;
                            if (this.auto)
                            {
                                _local_3 = -1;
                                if (((Boolean(this.speechIndex.reply[_local_2].@response)) && (this.speechIndex.reply[_local_2].@response == "true")))
                                {
                                    this.feedbackFunction("response", this.speechIndex.reply[_local_2]);
                                };
                                if (((Boolean(this.speechIndex.reply[_local_2].@auto)) && (this.speechIndex.reply[_local_2].@auto == "false")))
                                {
                                    if (this.speechIndex.reply[_local_2].@type)
                                    {
                                        this.feedbackFunction(this.speechIndex.reply[_local_2].@type, this.speechIndex.reply[_local_2]);
                                    }
                                    else
                                    {
                                        this.feedbackFunction("answer", this.speechIndex.reply[_local_2]);
                                    };
                                }
                                else
                                {
                                    _local_3 = this.speechIndex.reply[_local_2].@ans;
                                };
                            };
                        }
                        else
                        {
                            _local_2 = undefined;
                            if (((this.auto) && (!(this.speechIndex is String))))
                            {
                                _local_3 = this.speechIndex.@ans;
                            }
                            else
                            {
                                if ((this.speechIndex is String))
                                {
                                    this.shutdown();
                                    return;
                                };
                            };
                        };
                        if (!this.auto)
                        {
                            this.feedbackFunction("next", _local_2);
                        }
                        else
                        {
                            if (_local_3 > -1)
                            {
                                _local_4 = undefined;
                                _local_4 = this.findAnsId(this.XMLtxt.Question, _local_3);
                                if (_local_4)
                                {
                                    this.speechIndex = _local_4;
                                };
                                if (!_local_4)
                                {
                                    _local_4 = this.findAnsId(this.XMLtxt.Response, _local_3);
                                    this.speechIndex = _local_4;
                                };
                                if (_local_4)
                                {
                                    if (_local_4.@close == "true")
                                    {
                                        this.shutdown();
                                        return;
                                    };
                                    this.setupDialogueText(_local_4, _local_4);
                                }
                                else
                                {
                                    this.stageRef.showmsg("Missing response in speech XML!");
                                };
                            };
                        };
                    };
                };
            };
        }

        public function purchaseSuccess():*
        {
            if (((this.XMLtxt) && (this.XMLtxt.PurchaseResponse.length() > 0)))
            {
                this.speechIndex = this.XMLtxt.PurchaseResponse[Math.floor((Math.random() * this.XMLtxt.PurchaseResponse.length()))];
                this.setupDialogueText(this.speechIndex, this.XMLtxt.PurchaseResponse[0]);
            };
            if (((this.stageRef.mc_scene.sceneRef) && (this.feedbackFunction)))
            {
                this.feedbackFunction("purchaseSuccess", this.speechIndex);
            };
        }

        public function findAnsId(_arg_1:*, _arg_2:*):*
        {
            var _local_3:*;
            for (_local_3 in _arg_1)
            {
                if (_arg_1[_local_3].@id == _arg_2)
                {
                    return (_arg_1[_local_3]);
                };
            };
            return (false);
        }

        internal function frame10():*
        {
            stop();
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.tooltip

package com.cocolani.gui
{
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import flash.geom.Point;
    import flash.text.TextFieldAutoSize;
    import fl.transitions.Tween;
    import fl.transitions.easing.None;
    import fl.transitions.TweenEvent;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import fl.transitions.easing.*;

    public class tooltip 
    {

        public var thisref:*;
        public var mytext:*;
        public var tipContainer:*;
        public var tgt:*;
        private var myTween:*;
        private var myTimeOut:*;
        private var timeOut:* = 2000;
        private var stageRef:*;

        public function tooltip()
        {
            this.thisref = this;
            super();
        }

        public function init(tgtobject:*, text:*=""):*
        {
            this.tgt = tgtobject;
            try
            {
                if (text != "")
                {
                    tgtobject.toolText = text;
                };
            }
            catch(e:Error)
            {
                thisref.stage.getChildAt(0).showmsg(((("Could not set tooltip text for object " + tgtobject) + " :") + e));
            };
            tgtobject.addEventListener(MouseEvent.MOUSE_OVER, this.setDisplay);
            tgtobject.addEventListener(MouseEvent.MOUSE_OUT, this.setDisplay);
        }

        private function setDisplay(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            var _local_3:*;
            if (_arg_1.type == "mouseOver")
            {
                if (this.tipContainer)
                {
                    this.removeListener();
                    _arg_1.currentTarget.stage.removeChild(this.tipContainer);
                    this.tipContainer = undefined;
                };
                if (_arg_1.currentTarget.toolText)
                {
                    _local_2 = getDefinitionByName("mc_tooltip");
                    this.stageRef = _arg_1.currentTarget.stage;
                    this.tipContainer = this.stageRef.addChild(new (_local_2)());
                    this.tipContainer.gotoAndStop(1);
                    _local_3 = _arg_1.currentTarget.parent.localToGlobal(new Point(_arg_1.currentTarget.x, _arg_1.currentTarget.y));
                    this.tipContainer.x = _local_3.x;
                    this.tipContainer.y = _local_3.y;
                    if ((this.tipContainer.x - (this.tipContainer.width * 2)) < 40)
                    {
                        this.tipContainer.x = (this.tipContainer.width * 2);
                    };
                    this.tipContainer.mouseEnabled = false;
                    this.tipContainer.mouseChildren = false;
                    this.tipContainer.obj.thetext.autoSize = TextFieldAutoSize.LEFT;
                    this.tipContainer.obj.thetext.width = 130;
                    this.tipContainer.obj.thetext.text = _arg_1.currentTarget.toolText;
                    if (this.tipContainer.obj.thetext.textWidth < this.tipContainer.obj.thetext.width)
                    {
                        this.tipContainer.obj.thetext.width = (this.tipContainer.obj.thetext.textWidth + 5);
                    };
                    this.tipContainer.obj.thetext.x = -(this.tipContainer.obj.thetext.width);
                    this.tipContainer.obj.thetext.height = (this.tipContainer.obj.thetext.textHeight + 20);
                    this.tipContainer.obj.bgd.width = (this.tipContainer.obj.thetext.textWidth + 20);
                    if (this.tipContainer.obj.thetext.textHeight >= 18)
                    {
                        this.tipContainer.obj.bgd.height = (this.tipContainer.obj.thetext.height + 20);
                    };
                    this.tipContainer.alpha = 0;
                    this.myTween = new Tween(this.tipContainer, "alpha", None.easeNone, 0, 1, 0.2, true);
                    this.myTween.addEventListener(TweenEvent.MOTION_FINISH, this.fadeFIN);
                };
            }
            else
            {
                if (_arg_1.type == "mouseOut")
                {
                    this.removeListener();
                    if (this.tipContainer)
                    {
                        this.stageRef.removeChild(this.tipContainer);
                    };
                    this.tipContainer = undefined;
                };
            };
        }

        public function setText(_arg_1:*):*
        {
            this.mytext = _arg_1;
        }

        private function fadeFIN(_arg_1:TweenEvent):*
        {
            this.removeListener();
            if (this.tipContainer.alpha == 1)
            {
                this.myTimeOut = new Timer(this.timeOut, 1);
                this.myTimeOut.start();
                this.myTimeOut.addEventListener(TimerEvent.TIMER, this.timeIsUp);
            }
            else
            {
                if (this.tipContainer.alpha == 0)
                {
                    try
                    {
                        if (((this.tipContainer) && (this.thisref.stage)))
                        {
                            this.thisref.stage.removeChild(this.tipContainer);
                        };
                    }
                    catch(e)
                    {
                    };
                    this.tipContainer = undefined;
                };
            };
        }

        private function removeListener():*
        {
            if (this.myTween)
            {
                this.myTween.stop();
                this.myTween.removeEventListener(TweenEvent.MOTION_FINISH, this.fadeFIN);
                this.myTween = null;
            };
            if (this.myTimeOut)
            {
                this.myTimeOut.stop();
                this.myTimeOut.removeEventListener(TimerEvent.TIMER, this.timeIsUp);
                this.myTimeOut = null;
            };
        }

        private function timeIsUp(_arg_1:TimerEvent):*
        {
            this.myTween = new Tween(this.tipContainer, "alpha", None.easeNone, this.tipContainer.alpha, 0, 0.2, true);
            this.myTween.addEventListener(TweenEvent.MOTION_FINISH, this.fadeFIN);
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.world_chathistory

package com.cocolani.gui
{
    import flash.display.MovieClip;
    import fl.controls.UIScrollBar;
    import flash.text.TextField;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import com.cocolani.common.tools;

    public class world_chathistory extends MovieClip 
    {

        internal static var maxlines:* = 50;

        public var scrollbar:UIScrollBar;
        public var bt_history_expand:Chat_History_button;
        public var chathistory:TextField;
        public var thetitle:TextField;
        internal var chatter:Array = new Array();
        internal var stageref:*;
        internal var msgFilter:String;
        internal var thisref:*;

        public function world_chathistory()
        {
            this.thisref = this;
            super();
            stop();
            addEventListener(Event.ADDED_TO_STAGE, this.translate);
            addEventListener(Event.FRAME_CONSTRUCTED, this.frame_constructed);
        }

        private function frame_constructed(_arg_1:Event):*
        {
            if (((this.thisref.currentFrame == 1) && (this.bt_history_expand)))
            {
                this.initFrame();
                removeEventListener(Event.FRAME_CONSTRUCTED, this.frame_constructed);
            }
            else
            {
                if (((this.thisref.currentFrame == 19) && (this.bt_history_expand)))
                {
                    this.initFrame();
                    removeEventListener(Event.FRAME_CONSTRUCTED, this.frame_constructed);
                };
            };
        }

        public function btclick(_arg_1:MouseEvent):*
        {
            play();
            addEventListener(Event.FRAME_CONSTRUCTED, this.frame_constructed);
        }

        public function initFrame():*
        {
            var _local_1:*;
            stop();
            if (((this.thisref.stage) && (!(this.stageref))))
            {
                this.stageref = this.thisref.stage.getChildAt(0);
            };
            if (this.stageref)
            {
                if (getChildByName("thetitle"))
                {
                    this.refreshHistory();
                    _local_1 = this.stageref.langObj;
                    this.thetitle.text = _local_1.getText("gui01");
                    this.stageref.langObj.setFormat(this.thetitle);
                    this.stageref.langObj.setFormat(this.chathistory);
                };
                if (this.bt_history_expand)
                {
                    this.bt_history_expand.toolText = this.stageref.langObj.getText("hlp10");
                    this.thisref.parent.setHelpItem(this.bt_history_expand);
                    this.bt_history_expand.addEventListener(MouseEvent.CLICK, this.btclick);
                };
            };
        }

        private function translate(_arg_1:Event):*
        {
            this.stageref = _arg_1.currentTarget.stage.getChildAt(0);
            this.msgFilter = this.stageref.langObj.getText("cht01");
            this.initFrame();
        }

        public function publicmessage(_arg_1:*, _arg_2:*, _arg_3:*):*
        {
            var _local_4:*;
            if ((((_arg_3) && (_arg_2)) && (_arg_1)))
            {
                _local_4 = new tools();
                _arg_1 = _local_4.repChar(_arg_1, "<", "&lt;");
                _arg_1 = _local_4.repText(this.msgFilter, [_arg_2.getName(), _arg_1]);
                this.chatter.push(_arg_1);
                if (this.chatter.length > maxlines)
                {
                    this.chatter.shift();
                };
                this.refreshHistory();
                dispatchEvent(new Event("publicmessage"));
            };
        }

        public function getChat():*
        {
            return (this.chatter[(this.chatter.length - 1)]);
        }

        public function refreshHistory():*
        {
            var _local_1:*;
            var _local_2:*;
            if (getChildByName("chathistory"))
            {
                this.chathistory.htmlText = "";
                _local_1 = "";
                _local_2 = 0;
                while (_local_2 < this.chatter.length)
                {
                    _local_1 = (_local_1 + this.chatter[_local_2]);
                    _local_2++;
                };
                this.chathistory.htmlText = _local_1;
                this.stageref.langObj.setFormat(this.chathistory);
                this.chathistory.scrollV = this.chathistory.maxScrollV;
                this.scrollbar.update();
            };
        }

        public function addchat(_arg_1:*):*
        {
        }

        public function reset():*
        {
            this.chatter = [];
            if (getChildByName("chathistory"))
            {
                this.chathistory.htmlText = "";
            };
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.world_currency

package com.cocolani.gui
{
    import com.cocolani.common.simplebutton;
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;

    public class world_currency extends simplebutton 
    {

        private static var animFrames:* = 18;
        public static var CURRENCY_UPDATE:* = "currency_update";

        public var currencyIcon:MovieClip;
        public var coins:TextField;
        public var stageref:*;
        public var myref:*;
        public var myCurrency:*;
        private var containerArray:*;
        private var currencyWinPopup:*;
        private var targetCurrency:*;
        private var startCurrency:*;
        private var animPos:* = 0;
        public var myAltCurrency:* = 0;
        public var altCurrencyContainer:*;

        public function world_currency()
        {
            this.myref = this;
            this.myCurrency = [];
            super();
            this.coins.text = "0";
            addEventListener(Event.ADDED_TO_STAGE, this.init);
        }

        private function init(_arg_1:Event):*
        {
            this.stageref = _arg_1.currentTarget.stage.getChildAt(0);
        }

        public function checkPrice(_arg_1:*):*
        {
            var _local_2:* = (this.stageref.currentTribe - 1);
            if (_local_2 < 0)
            {
                _local_2 = (this.stageref.myTribe - 1);
            };
            if (Number(_arg_1) <= Number(this.myCurrency[_local_2]))
            {
                return (true);
            };
            return (false);
        }

        public function reset(_arg_1:*=false):*
        {
            if (!_arg_1)
            {
                this.myCurrency = [];
            };
            this.startCurrency = null;
            this.targetCurrency = null;
            removeEventListener(Event.ENTER_FRAME, this.currencyAnimate);
            if (!_arg_1)
            {
                if (this.currencyWinPopup)
                {
                    this.myref.parent.removeChild(this.currencyWinPopup);
                };
                this.currencyWinPopup = null;
            };
            if (this.altCurrencyContainer)
            {
                this.myref.parent.removeChild(this.altCurrencyContainer);
            };
            this.altCurrencyContainer = null;
        }

        public function setcredit(_arg_1:*, _arg_2:*=null):*
        {
            var _local_3:*;
            if (((this.myCurrency.length > 0) && (!(this.myCurrency == _arg_1))))
            {
                me.parent.audio.playSound("sfx_cashregister");
                _local_3 = (this.stageref.currentTribe - 1);
                if (_local_3 == -1)
                {
                    _local_3 = (Number(this.stageref.myTribe) - 1);
                };
                this.startCurrency = Number(this.myCurrency[_local_3]);
                this.myCurrency = _arg_1.split(",");
                this.targetCurrency = Number(this.myCurrency[_local_3]);
            }
            else
            {
                this.myCurrency = _arg_1.split(",");
            };
            this.refreshCredit();
        }

        public function setAltCredit(_arg_1:*):*
        {
            var _local_2:*;
            this.myAltCurrency = _arg_1;
            if (!this.altCurrencyContainer)
            {
                _local_2 = getDefinitionByName("mc_purse_alt");
                this.altCurrencyContainer = this.myref.parent.addChild(new (_local_2)());
                this.altCurrencyContainer.x = 724;
                this.altCurrencyContainer.y = 552;
            };
            this.altCurrencyContainer.coins.text = _arg_1;
        }

        private function currencyAnimate(_arg_1:Event):*
        {
            this.coins.text = (this.startCurrency + Math.round(((this.targetCurrency - this.startCurrency) * (this.animPos / animFrames))));
            this.animPos++;
            if (this.animPos > animFrames)
            {
                this.reset(true);
            };
        }

        public function hidePanel(_arg_1:*):*
        {
            if (this.currencyWinPopup)
            {
                this.myref.parent.removeChild(this.currencyWinPopup);
            };
            this.currencyWinPopup = null;
        }

        public function refreshCredit():*
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            if (this.stageref)
            {
                if (this.myCurrency)
                {
                    _local_1 = this.stageref.currentTribe;
                    if (_local_1 <= 0)
                    {
                        _local_1 = this.stageref.myTribe;
                    };
                    if (!this.startCurrency)
                    {
                        this.coins.text = this.myCurrency[(_local_1 - 1)];
                    };
                    if (this.startCurrency)
                    {
                        addEventListener(Event.ENTER_FRAME, this.currencyAnimate);
                        this.animPos = 0;
                        if ((this.targetCurrency - this.startCurrency) > 0)
                        {
                            if (!this.currencyWinPopup)
                            {
                                _local_3 = getDefinitionByName("mc_currencywin");
                                this.currencyWinPopup = this.myref.parent.addChild(new (_local_3)());
                                this.currencyWinPopup.myname = "currencyWin";
                                this.currencyWinPopup.fadein();
                            };
                            this.currencyWinPopup.textcontainer.receivetext.text = this.stageref.langObj.getText("gui51");
                            this.currencyWinPopup.textcontainer.amt.text = (this.targetCurrency - this.startCurrency);
                            this.currencyWinPopup.align();
                        };
                    };
                    me.dispatchEvent(new Event(world_currency.CURRENCY_UPDATE));
                    if (((!(this.currencyIcon.currentFrame == this.stageref.currentTribe)) && (!(this.stageref.currentTribe == 0))))
                    {
                        me.parent.audio.playAudioStream((("tribe" + this.stageref.currentTribe) + "_intro.mp3"), 3);
                        this.startCurrency = null;
                        this.targetCurrency = null;
                        removeEventListener(Event.ENTER_FRAME, this.currencyAnimate);
                    };
                    this.currencyIcon.gotoAndStop(_local_1);
                    _local_2 = 1;
                    if (this.containerArray)
                    {
                        for (_local_4 in this.containerArray)
                        {
                            removeChild(this.containerArray[_local_4]);
                        };
                    };
                    this.containerArray = [];
                    if (currentFrame >= 2)
                    {
                        _local_5 = 1;
                        _local_6 = 0;
                        while (_local_6 < this.stageref.tribeData.length)
                        {
                            if (_local_6 != (_local_1 - 1))
                            {
                                this.containerArray.push(addChild(new currency_popup()));
                                _local_7 = this.containerArray[(this.containerArray.length - 1)];
                                _local_7.y = (-(_local_5) * 25);
                                _local_7.x = 3;
                                _local_7.currencyIcon.gotoAndStop(this.stageref.tribeData[_local_6].id);
                                _local_7.amt.text = this.myCurrency[_local_6];
                                _local_5++;
                            };
                            _local_6++;
                        };
                    };
                }
                else
                {
                    trace("Can't display currency yet (world_currency.as)");
                };
            };
        }

        public function setCurrencies():*
        {
            this.refreshCredit();
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.world_feedback

package com.cocolani.gui
{
    import flash.display.MovieClip;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.text.TextFormat;

    public class world_feedback extends MovieClip 
    {

        public var desc:MovieClip;
        public var bubble:MovieClip;
        internal var revealmsg:String;
        internal var msgTimer:* = new Timer(6000);
        internal var thisref:*;

        public function world_feedback()
        {
            stop();
            this.thisref = this;
            visible = false;
            this.msgTimer.addEventListener(TimerEvent.TIMER, this.timeup);
            this.bubble.bt_close.addEventListener(MouseEvent.CLICK, this.closeme);
            addEventListener(Event.ADDED_TO_STAGE, this.init);
            stop();
        }

        private function init(_arg_1:Event):*
        {
            this.setBubbleSize();
        }

        public function setBubbleSize():*
        {
            var _local_1:* = new TextFormat();
            if (this.thisref.stage.getChildAt(0).FID)
            {
                this.bubble.gotoAndStop(2);
                this.desc.desc.y = -30;
                this.desc.desc.width = 450;
                _local_1.size = 15;
                this.desc.desc.setTextFormat(_local_1);
            }
            else
            {
                this.bubble.gotoAndStop(1);
                this.desc.desc.y = 0;
                this.desc.desc.width = 389;
            };
        }

        public function closeme(_arg_1:MouseEvent):*
        {
            this.shutdown();
        }

        public function shutdown():*
        {
            visible = false;
            gotoAndStop(1);
            if (this.msgTimer)
            {
                this.msgTimer.stop();
            };
            if (this.thisref.parent.speechHandlerRef)
            {
                this.thisref.parent.speechHandlerRef.shutdown();
            };
            if (!this.thisref.parent.charsnaps.minimized)
            {
                this.thisref.parent.charsnaps.togglevis();
            };
        }

        public function clear():*
        {
            this.desc.desc.text = "";
            this.resetTimer();
        }

        public function resetTimer():*
        {
            if (this.msgTimer)
            {
                this.msgTimer.reset();
            };
        }

        private function timeup(_arg_1:Event):*
        {
            visible = false;
            gotoAndStop(1);
            this.thisref.parent.owner.text = this.thisref.stage.getChildAt(0).sfs.myUserName;
            this.thisref.parent.charsnaps.reset();
            this.msgTimer.stop();
            if (!this.thisref.parent.charsnaps.minimized)
            {
                this.thisref.parent.charsnaps.togglevis();
            };
        }

        public function showbubble():*
        {
            visible = true;
            gotoAndPlay(1);
            this.clear();
        }

        public function revealmessage(_arg_1:String, _arg_2:String=""):*
        {
            visible = true;
            if (_arg_2)
            {
                this.thisref.parent.owner.text = _arg_2;
                this.thisref.parent.charsnaps.setCharacter(_arg_2);
            };
            this.thisref.stage.getChildAt(0).langObj.setTextJustify(this.desc.desc, _arg_1);
            play();
            this.msgTimer.reset();
            if (!_arg_2)
            {
                this.msgTimer.start();
            };
            if (this.thisref.parent.charsnaps.minimized)
            {
                this.thisref.parent.charsnaps.togglevis(true);
            };
        }


    }
}//package com.cocolani.gui

//------------------------------------------------------------
//com.cocolani.gui.world_interface

package com.cocolani.gui
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.events.FocusEvent;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;
    import flash.events.KeyboardEvent;
    import flash.display.StageDisplayState;
    import flash.system.Capabilities;
    import flash.events.FullScreenEvent;
    import flash.display.Sprite;
    import flash.external.ExternalInterface;
    import flash.ui.Keyboard;

    public class world_interface extends MovieClip 
    {

        public var bt_pathfinding:button_pathfinding;
        public var tribe_rep:MovieClip;
        public var bt_currency:BT_Currency_Pouch;
        public var bt_profile:Tab_Profile;
        public var bt_activateweapons:button_weapon_store_simple;
        public var bt_help:mc_helpbutton;
        public var bt_quality:btn_quality;
        public var bt_actions:btn_actions;
        public var bt_inv:bt_inventory;
        public var mc_happynessMeter:mc_happynessmeter;
        public var scroller:com.cocolani.gui.scroller;
        public var chathistory:Chat_History;
        public var bt_sayit:bt_say;
        public var owner:TextField;
        public var bt_paysms:bt_smspay;
        public var bt_battle_prac:bt_battlepractice;
        public var bt_logout:button_logout;
        public var charsnaps:av_snapshot;
        public var speech:TextField;
        public var bt_home:bt_gohome;
        public var bt_admin:bt_adminpanel;
        public var feedback:mc_feedback;
        public var buddylist:Buddy_newlayout;
        public var bt_battle:bt_guibattle;
        public var bt_map:bt_map_icon;
        public var bt_fullscreen:but_fullscreen;
        public var audio:audioController;
        internal var thisref:*;
        internal var stageref:*;
        public var buddyListContainer:*;
        public var playerPopupContainer:*;
        public var buddyRef:*;
        public var invRef:*;
        public var playerPopupRef:*;
        public var speechHandlerRef:*;
        public var storePopupRef:*;
        public var tooltipRef:*;
        public var mailIcon:*;
        public var poweredByRef:*;
        internal var borderMask:*;

        public function world_interface()
        {
            this.thisref = this;
            this.tooltipRef = new tooltip();
            super();
            this.thisref.visible = false;
            this.bt_logout.visible = false;
            this.bt_activateweapons.visible = false;
            this.speech.addEventListener(FocusEvent.FOCUS_IN, this.setspeechfocus);
            this.speech.addEventListener(FocusEvent.FOCUS_OUT, this.setspeechfocus);
            this.bt_admin.visible = false;
            addEventListener(Event.ADDED_TO_STAGE, this.init);
            var _local_1:* = getDefinitionByName("com.cocolani.gui.playerPopup");
            this.playerPopupRef = new (_local_1)();
            this.tribe_rep.gotoAndStop(1);
        }

        public function setInterfaceListeners(_arg_1:*, _arg_2:*=true):*
        {
            this.setHelpItem(_arg_1);
            if (_arg_2)
            {
                _arg_1.addEventListener(MouseEvent.CLICK, this.interfacebt);
            }
            else
            {
                _arg_1.removeEventListener(MouseEvent.CLICK, this.interfacebt);
            };
        }

        public function setHelpItem(_arg_1:*):*
        {
            this.tooltipRef.init(_arg_1, _arg_1.toolText);
        }

        public function launchSpeechHandler():*
        {
            if (!this.speechHandlerRef)
            {
                this.speechHandlerRef = addChild(new speechHandler());
                this.speechHandlerRef.x = 160;
                this.speechHandlerRef.y = 407;
                this.feedback.clear();
            };
            return (this.speechHandlerRef);
        }

        public function setstageref(_arg_1:*):*
        {
            this.stageref = _arg_1;
            this.scroller.setStage(this.stageref);
        }

        public function initializeLogin(_arg_1:Boolean=false):*
        {
            this.initInterface(_arg_1);
            this.charsnaps.setupAvatar(this.stageref);
            this.owner.text = this.stageref.sfs.myUserName;
            this.tribe_rep.gotoAndStop(this.stageref.myTribe);
            trace(this.stageref.loadedAVData);
            var _local_2:* = this.stageref.loadedAVData.prefs.split(",");
            this.audio.setAudio(Number(_local_2[0]));
            if (!_local_2[1])
            {
                _local_2[1] = 0;
            };
            if (!_local_2[2])
            {
                _local_2[2] = 0;
            };
            if (((Number(_local_2[2]) == 1) && (this.bt_pathfinding.toggleState == false)))
            {
                this.bt_pathfinding.toggle();
            }
            else
            {
                if (((Number(_local_2[2]) == 0) && (this.bt_pathfinding.toggleState == true)))
                {
                    this.bt_pathfinding.toggle();
                }
                else
                {
                    if (!((Number(_local_2[2]) == 0) && (this.bt_pathfinding.toggleState == false)))
                    {
                        if (this.bt_pathfinding.toggleState == false)
                        {
                            this.bt_pathfinding.toggle();
                        };
                    };
                };
            };
            this.bt_quality.quality = Number(_local_2[1]);
            this.bt_quality.setquality(false);
            if (this.stageref.statusType < 7)
            {
                this.bt_admin.visible = false;
                this.bt_battle_prac.visible = false;
                this.bt_battle.visible = false;
                if (this.stageref.getWindowByName("admin"))
                {
                    this.stageref.removepopup("admin");
                };
            }
            else
            {
                if (this.stageref.getWindowByName("admin") == false)
                {
                    this.stageref.newpopup((this.stageref.baseURL + "panels/administration.swf"), "load", "admin", false, false, {
                        "classes":"global",
                        "nopreloader":true
                    });
                };
                this.bt_admin.visible = true;
                this.bt_battle_prac.visible = true;
                this.bt_battle.visible = true;
            };
            this.updateHomeIcon();
            this.updateMailIcon();
            this.bt_activateweapons.visible = true;
        }

        public function updateHomeIcon():*
        {
            if (this.stageref.statusType < 4)
            {
                this.bt_home.alpha = 0.5;
            }
            else
            {
                this.bt_home.alpha = 1;
            };
        }

        private function updateMailIcon():*
        {
            var _local_1:*;
            if (((Number(this.stageref.loadedAVData.mail) > 0) && (this.stageref.statusType > 2)))
            {
                _local_1 = getDefinitionByName("mail_animation");
                this.mailIcon = addChild(new (_local_1)());
                this.mailIcon.x = 730;
                this.mailIcon.y = 27;
                this.mailIcon.toolText = this.stageref.langObj.getText("hlp21");
                this.setHelpItem(this.mailIcon);
            };
        }

        private function init(_arg_1:Event):*
        {
            var _local_2:*;
            this.stageref = _arg_1.currentTarget.stage.getChildAt(0);
            if (this.stageref.custID == 3)
            {
                if (!this.poweredByRef)
                {
                    _local_2 = getDefinitionByName("mc_ascii_poweredby");
                    this.poweredByRef = addChild(new (_local_2)());
                    this.poweredByRef.x = 378;
                    this.poweredByRef.y = 576;
                };
            };
        }

        private function initInterface(_arg_1:*=false):*
        {
            if (!this.stageref)
            {
                return;
            };
            var _local_2:* = this.stageref;
            _local_2.langObj.setFormat(this.speech);
            this.bt_paysms.toolText = _local_2.langObj.getText("hlp00");
            this.bt_home.toolText = _local_2.langObj.getText("hlp01");
            this.bt_actions.toolText = _local_2.langObj.getText("hlp02");
            this.bt_map.toolText = _local_2.langObj.getText("hlp03");
            this.bt_inv.toolText = _local_2.langObj.getText("hlp04");
            this.bt_profile.toolText = _local_2.langObj.getText("hlp05");
            this.mc_happynessMeter.toolText = _local_2.langObj.getText("hlp06");
            this.bt_battle_prac.toolText = _local_2.langObj.getText("hlp07");
            this.bt_battle.toolText = _local_2.langObj.getText("hlp08");
            this.bt_sayit.toolText = _local_2.langObj.getText("hlp09");
            this.bt_admin.toolText = _local_2.langObj.getText("hlp12");
            this.bt_quality.toolText = _local_2.langObj.getText("hlp13");
            this.audio.toolText = _local_2.langObj.getText("hlp14");
            this.bt_logout.toolText = _local_2.langObj.getText("hlp15");
            this.bt_help.toolText = _local_2.langObj.getText("hlp16");
            this.bt_pathfinding.toolText = _local_2.langObj.getText("hlp36");
            this.bt_activateweapons.toolText = _local_2.langObj.getText("hlp43");
            this.bt_fullscreen.toolText = _local_2.langObj.getText("hlp45");
            this.setHelpItem(this.mc_happynessMeter);
            this.setHelpItem(this.bt_quality);
            this.setHelpItem(this.audio);
            this.setInterfaceListeners(this.bt_paysms);
            this.setInterfaceListeners(this.bt_logout);
            this.setInterfaceListeners(this.bt_sayit);
            this.setInterfaceListeners(this.bt_admin);
            this.setInterfaceListeners(this.bt_battle);
            this.setInterfaceListeners(this.bt_battle_prac);
            this.setInterfaceListeners(this.bt_paysms);
            this.setInterfaceListeners(this.bt_help);
            this.setInterfaceListeners(this.bt_pathfinding);
            this.setInterfaceListeners(this.bt_activateweapons);
            this.setInterfaceListeners(this.bt_fullscreen);
            trace("4....");
            this.buddylist.buddy_tab.gotoAndStop((this.stageref.langObj.selectedLang + 1));
            this.playerPopupRef.setstageref(this.stageref);
            this.buddylist.setstageref(this.stageref);
            this.buddylist.setBuddyList(this.stageref.sfs.buddyList, _arg_1);
            trace("5....");
            var _local_3:* = this.stageref.langObj;
            this.bt_actions.setDefinitions([{
                "id":0,
                "desc":_local_3.getText("action08")
            }, {
                "id":1,
                "desc":_local_3.getText("action07")
            }, {
                "id":2,
                "desc":_local_3.getText("action06"),
                "animate":"head"
            }, {
                "id":3,
                "desc":_local_3.getText("action05"),
                "animate":"head"
            }, {
                "id":4,
                "desc":_local_3.getText("action04"),
                "animate":"head"
            }, {
                "id":5,
                "desc":_local_3.getText("action03"),
                "animate":"head"
            }, {
                "id":6,
                "desc":_local_3.getText("action01"),
                "animate":"head"
            }, {
                "id":7,
                "desc":_local_3.getText("action02"),
                "animate":"head"
            }]);
        }

        private function setspeechfocus(_arg_1:FocusEvent):*
        {
            if (_arg_1.type == FocusEvent.FOCUS_IN)
            {
                this.speech.addEventListener(KeyboardEvent.KEY_DOWN, this.checkspeech);
            }
            else
            {
                this.speech.removeEventListener(KeyboardEvent.KEY_DOWN, this.checkspeech);
            };
        }

        public function disableForLoad():*
        {
            this.bt_home.disable();
            this.bt_profile.disable();
            this.bt_actions.disable();
            this.bt_map.disable();
            this.bt_inv.disable();
            this.bt_help.disable();
            this.setInterfaceListeners(this.bt_profile, false);
            this.setInterfaceListeners(this.bt_home, false);
            this.setInterfaceListeners(this.bt_map, false);
            this.setInterfaceListeners(this.bt_inv, false);
        }

        public function enableForLoad():*
        {
            this.bt_home.enable();
            this.bt_actions.enable();
            this.bt_profile.enable();
            this.bt_map.enable();
            this.bt_inv.enable();
            this.bt_help.enable();
            this.setInterfaceListeners(this.bt_home);
            this.setInterfaceListeners(this.bt_actions);
            this.setInterfaceListeners(this.bt_map);
            this.setInterfaceListeners(this.bt_inv);
            this.setInterfaceListeners(this.bt_profile);
            this.setInterfaceListeners(this.bt_inv);
            this.setInterfaceListeners(this.bt_activateweapons);
        }

        private function checkLogOutResponse(_arg_1:MouseEvent):*
        {
            if (_arg_1.currentTarget.name == "bt_yes")
            {
                this.logout();
            };
            this.stageref.removeChild(_arg_1.currentTarget.parent);
        }

        private function interfacebt(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            switch (_arg_1.currentTarget.name)
            {
                case "bt_logout":
                    _local_2 = getDefinitionByName("mc_request");
                    _local_3 = this.stageref.addChild(new (_local_2)());
                    _local_3.requesttxt.text = this.stageref.langObj.getText("gui85");
                    _local_3.bt_yes.addEventListener(MouseEvent.CLICK, this.checkLogOutResponse);
                    _local_3.bt_no.addEventListener(MouseEvent.CLICK, this.checkLogOutResponse);
                    return;
                case "bt_sayit":
                    this.saytext();
                    return;
                case "bt_profile":
                    if (this.playerPopupContainer)
                    {
                        this.hidePanel("playerPanel");
                    }
                    else
                    {
                        if (this.stageref.mc_scene.sceneRef)
                        {
                            _local_5 = this.stageref.sfs.getActiveRoom().getUser(this.stageref.sfs.myUserId);
                        };
                        this.showAVPanel(_local_5, 0);
                    };
                    return;
                case "bt_map":
                    if (this.stageref.mc_scene.sceneRef)
                    {
                        _local_5 = this.stageref.sfs.getActiveRoom().getUser(this.stageref.sfs.myUserId);
                    };
                    this.showAVPanel(_local_5, 2);
                    return;
                case "bt_inv":
                    if (this.stageref.mc_scene.sceneRef)
                    {
                        _local_5 = this.stageref.sfs.getActiveRoom().getUser(this.stageref.sfs.myUserId);
                    };
                    this.showAVPanel(_local_5, 1);
                    return;
                case "bt_home":
                    if (this.stageref.statusType >= 4)
                    {
                        if (this.stageref.myHomeAddr < 1)
                        {
                            this.stageref.showmsg(this.stageref.langObj.getText("hom31"));
                        }
                        else
                        {
                            if ((((this.stageref.mc_scene.sceneRef) && (this.stageref.mc_scene.sceneRef.egoref)) && (this.stageref.mc_scene.sceneRef.egoref.checkAvatarIsLeaving() == false)))
                            {
                                if (this.speechHandlerRef)
                                {
                                    this.speechHandlerRef.shutdown();
                                };
                                this.stageref.mc_scene.loadHome(this.stageref.myTribe, this.stageref.myHomeAddr);
                            };
                        };
                    }
                    else
                    {
                        this.stageref.showmsg(this.stageref.langObj.getText("gui52"));
                    };
                    return;
                case "bt_admin":
                    _local_4 = this.stageref.getWindowByName("admin");
                    if (_local_4)
                    {
                        _local_4.contentref.setupListener();
                    };
                    return;
                case "bt_paysms":
                    stage.displayState = StageDisplayState.NORMAL;
                    this.openPaymentSystem();
                    return;
                case "bt_battle":
                    if (this.speechHandlerRef)
                    {
                        this.speechHandlerRef.shutdown();
                    };
                    this.stageref.mc_scene.loadNewRoom("GamesRoom", true, {
                        "battlegame":true,
                        "battle":1
                    });
                    return;
                case "bt_battle_prac":
                    if (this.speechHandlerRef)
                    {
                        this.speechHandlerRef.shutdown();
                    };
                    this.stageref.mc_scene.loadNewRoom("GamesRoom", true, {
                        "battlegame":true,
                        "battle":0
                    });
                    return;
                case "bt_help":
                    if (this.stageref.getpopup("tutorial_toon") == false)
                    {
                        _local_6 = this.stageref.newpopup((((((this.stageref.baseURL + "panels/tutorial_toon_c") + this.stageref.custID) + "_l") + this.stageref.langObj.selectedLang) + ".swf"), "load", "tutorial_toon", false, false, {
                            "nocentre":true,
                            "openIn":this.stageref.mc_scene,
                            "initVars":{"calledFromGame":true}
                        });
                    };
                    return;
                case "bt_pathfinding":
                    if (this.stageref.mc_scene.sceneRef)
                    {
                        this.stageref.mc_scene.sceneRef.pathFinding = this.bt_pathfinding.status;
                    };
                    if (this.thisref.stage.getChildAt(0).loadedAVData)
                    {
                        _local_7 = {};
                        _local_7.ext = "main";
                        _local_7.cmd = "updatePref";
                        _local_8 = this.thisref.stage.getChildAt(0).loadedAVData.prefs.split(",");
                        _local_8[2] = Number(this.bt_pathfinding.status);
                        _local_7.prefs = _local_8.join(",");
                        this.thisref.stage.getChildAt(0).sendXTmessage(_local_7);
                    };
                    return;
                case "bt_activateweapons":
                    this.showStore(-1, "weapons");
                    return;
                case "bt_fullscreen":
                    if (stage.displayState == StageDisplayState.NORMAL)
                    {
                        _local_9 = Capabilities.version.substr(4).split(",");
                        if (((Number(_local_9[0]) > 11) || (Number(((_local_9[0] == 11) && (Number(_local_9[1]) >= 3))))))
                        {
                            stage.addEventListener(FullScreenEvent.FULL_SCREEN, this.FullScreenMode);
                            stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
                        }
                        else
                        {
                            this.stageref.showmsg(this.stageref.langObj.getText("err13"));
                        };
                    }
                    else
                    {
                        stage.displayState = StageDisplayState.NORMAL;
                    };
                    return;
            };
        }

        private function FullScreenMode(_arg_1:FullScreenEvent):*
        {
            if (_arg_1.fullScreen)
            {
                if ((stage.fullScreenWidth / stage.fullScreenHeight) > (this.stageref.stageScale[0] / this.stageref.stageScale[1]))
                {
                    this.borderMask = addChild(new Sprite());
                    this.borderMask.graphics.beginFill(0, 1);
                    this.borderMask.graphics.drawRect((this.stageref.stageScale[0] - stage.fullScreenWidth), 0, Math.abs((this.stageref.stageScale[0] - stage.fullScreenWidth)), stage.fullScreenHeight);
                    this.borderMask.graphics.endFill();
                    this.borderMask.graphics.beginFill(0, 1);
                    this.borderMask.graphics.drawRect(this.stageref.stageScale[0], 0, Math.abs((this.stageref.stageScale[0] - stage.fullScreenWidth)), stage.fullScreenHeight);
                    this.borderMask.graphics.endFill();
                }
                else
                {
                    this.borderMask = addChild(new Sprite());
                    this.borderMask.graphics.beginFill(0, 1);
                    this.borderMask.graphics.drawRect(0, (this.stageref.stageScale[1] - stage.fullScreenHeight), stage.fullScreenWidth, Math.abs((this.stageref.stageScale[1] - stage.fullScreenHeight)));
                    this.borderMask.graphics.endFill();
                    this.borderMask.graphics.beginFill(0, 1);
                    this.borderMask.graphics.drawRect(0, this.stageref.stageScale[1], stage.fullScreenWidth, Math.abs((this.stageref.stageScale[1] - stage.fullScreenHeight)));
                    this.borderMask.graphics.endFill();
                };
            }
            else
            {
                removeChild(this.borderMask);
                this.borderMask = null;
                stage.removeEventListener(FullScreenEvent.FULL_SCREEN, this.FullScreenMode);
            };
        }

        public function openPaymentSystem():*
        {
            var _local_1:*;
            var _local_2:*;
            if (this.stageref.custID == 3)
            {
                _local_2 = ExternalInterface.call("open_p");
                if (_local_2 != "1")
                {
                    this.stageref.showmsg(_local_2);
                };
            }
            else
            {
                if (this.stageref.custID == 1)
                {
                    if (this.stageref.SRPaymentEnabled == true)
                    {
                        if (this.stageref.getWindowByName("paymentSelector") == false)
                        {
                            _local_1 = this.stageref.newpopup((((this.stageref.baseURL + "panels/payment_selector_c1_l") + this.stageref.langObj.selectedLang) + ".swf"), "load", "paymentSelector", false, false);
                            _local_1.x = 0;
                            _local_1.y = 0;
                        };
                    }
                    else
                    {
                        if (this.stageref.getWindowByName("SMSpay") == false)
                        {
                            this.stageref.newpopup((this.stageref.baseURL + "panels/mobile_payments.swf"), "load", "SMSpay");
                        };
                    };
                }
                else
                {
                    if (this.stageref.FID)
                    {
                        ExternalInterface.call("buy");
                    }
                    else
                    {
                        if (this.stageref.getWindowByName("SuperRewards") == false)
                        {
                            _local_1 = this.stageref.newpopup((this.stageref.baseURL + "panels/payment_SR.swf"), "load", "SuperRewards", false, false, {
                                "nocentre":true,
                                "classes":"global"
                            });
                            _local_1.x = 0;
                            _local_1.y = 0;
                        };
                    };
                };
            };
        }

        private function onPermSkipTutorial(_arg_1:MouseEvent):*
        {
            if (_arg_1.currentTarget.name == "bt_yes")
            {
                this.stageref.mc_scene.loadNewRoom("Tutorial Island1");
            };
            removeChild(_arg_1.currentTarget.parent);
        }

        public function showStore(_arg_1:Number, _arg_2:String=""):*
        {
            if (this.storePopupRef)
            {
                this.stageref.removepopup("store");
                this.storePopupRef = undefined;
            };
            if (!this.storePopupRef)
            {
                this.storePopupRef = this.stageref.newpopup((this.stageref.baseURL + "panels/store.swf"), "load", "store");
                this.storePopupRef.mydata = {
                    "locID":_arg_1,
                    "type":_arg_2
                };
            };
        }

        public function showAVPanel(_arg_1:*, _arg_2:*=0):*
        {
            if (!this.playerPopupContainer)
            {
                this.playerPopupContainer = addChild(this.playerPopupRef);
            };
            this.playerPopupRef.displayPage(_arg_2);
            this.playerPopupRef.profileContainer.setContent(_arg_1);
            var _local_3:* = this.thisref.stage.getChildAt(0).stageRatio;
            this.playerPopupRef.x = (((this.thisref.stage.stageWidth * _local_3[0]) / 2) - (330 / 2));
            this.playerPopupRef.y = (((this.thisref.stage.stageHeight * _local_3[1]) / 2) - (350 / 2));
        }

        public function doaction(_arg_1:*, _arg_2:*=null):*
        {
            if (((((this.stageref.mc_scene.sceneRef) && (this.stageref.mc_scene.sceneRef.egoref)) && (this.stageref.mc_scene.sceneRef.egoref.isSitting == false)) && (!(this.stageref.mc_scene.sceneRef.egoref.currentAction))))
            {
                if ((((!(_arg_1 == "1")) && (this.stageref.mc_scene.sceneRef.egoref.userHasControl)) || (_arg_1 == "1")))
                {
                    this.stageref.mc_scene.sceneRef.egoref.doaction(_arg_1, _arg_2);
                };
            };
        }

        private function checkspeech(_arg_1:KeyboardEvent):*
        {
            if (_arg_1.keyCode == Keyboard.ENTER)
            {
                this.saytext();
            };
        }

        public function saytext():*
        {
            var _local_1:*;
            if (this.speech.text.length > 0)
            {
                _local_1 = this.stageref.sfs.getActiveRoom();
                if ((((this.stageref.mc_scene.sceneRef) && (_local_1)) && (_local_1.getVariable("pvt") == true)))
                {
                    if (this.stageref.mc_scene.sceneRef)
                    {
                        this.stageref.mc_scene.sceneRef.privateSpeech(this.speech.text);
                        this.speech.text = "";
                    };
                }
                else
                {
                    dispatchEvent(new Event("speechEvent"));
                    this.thisref.stage.getChildAt(0).sfs.sendPublicMessage(this.speech.text, -1);
                    this.speech.text = "";
                };
            };
        }

        public function loadPanels():*
        {
            var _local_1:*;
            if (!this.invRef)
            {
                _local_1 = getDefinitionByName("mc_inventory");
                this.invRef = new (_local_1)();
                this.invRef.myname = "inv";
            };
        }

        public function hidePanel(_arg_1:String=""):*
        {
            switch (_arg_1)
            {
                case "buddy":
                    removeChild(this.buddyListContainer);
                    this.buddyListContainer = undefined;
                    return;
                case "playerPanel":
                    if (this.playerPopupContainer)
                    {
                        removeChild(this.playerPopupContainer);
                    };
                    this.playerPopupContainer = undefined;
                    return;
                case "speechHandler":
                    if (this.speechHandlerRef)
                    {
                        removeChild(this.speechHandlerRef);
                        this.speechHandlerRef = undefined;
                    };
                    this.feedback.shutdown();
                    return;
                case "storePanel":
                    if (this.storePopupRef)
                    {
                        this.stageref.removepopup("store");
                        this.storePopupRef = undefined;
                    };
                    return;
                case "currencyWin":
                    this.bt_currency.hidePanel(_arg_1);
                    return;
            };
        }

        private function logoutEvent(_arg_1:MouseEvent):*
        {
            this.logout();
        }

        public function logout(_arg_1:*=true):*
        {
            stage.displayState = StageDisplayState.NORMAL;
            this.playerPopupRef.buddylistContainer.reset();
            this.buddylist.reset();
            this.chathistory.reset();
            this.playerPopupRef.shutdown();
            this.bt_logout.visible = false;
            this.bt_admin.visible = false;
            this.bt_activateweapons.visible = false;
            this.bt_currency.reset();
            this.hidePanel("speechHandler");
            this.hidePanel("storePanel");
            var _local_2:* = this.stageref.getWindowByName("admin");
            if (_local_2)
            {
                _local_2.contentref.closepopup();
                this.stageref.removepopup("admin");
            };
            if (this.mailIcon)
            {
                removeChild(this.mailIcon);
                this.mailIcon = null;
            };
            if (_arg_1)
            {
                this.thisref.stage.getChildAt(0).logout();
            }
            else
            {
                visible = false;
            };
        }

        public function loggedin():*
        {
            this.bt_logout.visible = true;
            this.thisref.visible = true;
        }

        public function setcredit(_arg_1:*, _arg_2:*=null):*
        {
            this.bt_currency.setcredit(_arg_1, _arg_2);
        }

        public function getMyXP(_arg_1:*=null):*
        {
            var _local_4:*;
            var _local_2:* = this.stageref.levelThreshold;
            var _local_3:* = this.stageref.loadedAVData.skill[0];
            if (_arg_1)
            {
                _local_3 = _arg_1;
            };
            for (_local_4 in _local_2)
            {
                if (Number(_local_3) < Number(_local_2[_local_4]))
                {
                    return (_local_4);
                };
            };
            return (_local_2.length);
        }

        public function XTResponse(_arg_1:*):*
        {
            if (_arg_1.sub == "mapResponse")
            {
                if (this.playerPopupRef)
                {
                    this.playerPopupRef.mapContainer.XTResponse(_arg_1);
                };
            }
            else
            {
                if (_arg_1.sub == "med")
                {
                    if (this.playerPopupRef)
                    {
                        this.playerPopupRef.rewardsContainer.XTResponse(_arg_1);
                    };
                }
                else
                {
                    if (_arg_1.sub == "paymentSR")
                    {
                        if (this.stageref.getWindowByName("SuperRewards"))
                        {
                            this.stageref.getWindowByName("SuperRewards").contentref.extResponse(_arg_1);
                        };
                    }
                    else
                    {
                        if (_arg_1.sub == "currS")
                        {
                            this.bt_currency.setAltCredit(_arg_1.s);
                        }
                        else
                        {
                            if (_arg_1.sub == "newMail")
                            {
                                this.stageref.loadedAVData.mail = _arg_1.ct;
                                this.updateMailIcon();
                            };
                        };
                    };
                };
            };
            switch (_arg_1.req)
            {
                case "paymentServices":
                    if (this.stageref.getWindowByName("SMSpay"))
                    {
                        this.stageref.getWindowByName("SMSpay").contentref.extResponse(_arg_1);
                    };
                    return;
                case "inventoryServices":
                    if (this.playerPopupRef.inventoryContainer)
                    {
                        this.playerPopupRef.inventoryContainer.inventoryService(_arg_1);
                    };
                    return;
            };
        }

        public function incomingInvOffer(_arg_1:*):*
        {
            var _local_2:* = getDefinitionByName("mc_request");
            var _local_3:* = addChild(new (_local_2)());
            var _local_4:* = _arg_1.inv.split("~");
            var _local_5:* = this.stageref.sfs.getRoom(this.stageref.sfs.activeRoomId).getUser(_arg_1.uid);
            var _local_6:* = this.stageref.langObj.repText("fdb03", _local_4[3], [_local_5.getName()]);
            this.stageref.langObj.setTextJustify(_local_3.requesttxt, _local_6);
            _local_3.bt_yes.addEventListener(MouseEvent.CLICK, this.onInvPermResponse);
            _local_3.bt_no.addEventListener(MouseEvent.CLICK, this.onInvPermResponse);
            _local_3.data = _arg_1;
            _local_3.invdata = _local_4;
        }

        public function onInvPermResponse(_arg_1:MouseEvent):*
        {
            var _local_2:* = new Object();
            _local_2.ext = "main";
            _local_2.cmd = "tradecnf";
            _local_2.id = _arg_1.currentTarget.parent.invdata[0];
            _local_2.uid = _arg_1.currentTarget.parent.data.uid;
            if (_arg_1.currentTarget.name == "bt_yes")
            {
                _local_2.rply = 1;
            }
            else
            {
                _local_2.rply = 0;
            };
            this.stageref.sendXTmessage(_local_2);
            removeChild(_arg_1.currentTarget.parent);
        }

        public function updatehappyness(_arg_1:*, _arg_2:*=true):*
        {
            this.mc_happynessMeter.setvalue(_arg_1, _arg_2);
        }

        public function getInventory():*
        {
            return (this.playerPopupRef.inventoryContainer.invlist);
        }

        public function addInventoryItem(_arg_1:*):*
        {
            if (!this.playerPopupRef)
            {
                trace("INVENTORY PANEL NOT LOADED, BUT TRYING TO SET INVENTORY!");
            }
            else
            {
                this.playerPopupRef.inventoryContainer.addInventoryItem(_arg_1);
            };
        }

        public function editInventoryItem(_arg_1:*):*
        {
            if (!this.playerPopupRef)
            {
                trace("INVENTORY PANEL NOT LOADED, BUT TRYING TO SET INVENTORY!");
            }
            else
            {
                this.playerPopupRef.inventoryContainer.editInventoryItem(_arg_1);
            };
        }

        public function dropInventoryItem(_arg_1:*):*
        {
            if (!this.playerPopupRef)
            {
                trace("INVENTORY PANEL NOT LOADED, BUT TRYING TO SET INVENTORY!");
            }
            else
            {
                this.playerPopupRef.inventoryContainer.dropInventoryItem(_arg_1);
            };
        }

        public function setInv(_arg_1:*):*
        {
            if (!this.playerPopupRef)
            {
                trace("INVENTORY PANEL NOT LOADED, BUT TRYING TO SET INVENTORY!");
            }
            else
            {
                this.playerPopupRef.inventoryContainer.setinventory(_arg_1);
            };
        }

        public function publicmessage(_arg_1:*, _arg_2:*, _arg_3:*):*
        {
            this.chathistory.publicmessage(_arg_1, _arg_2, _arg_3);
        }


    }
}//package com.cocolani.gui

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
//com.nexus.common.collission_detect

package com.nexus.common
{
    import flash.display.Sprite;

    public class collission_detect extends Sprite 
    {


    }
}//package com.nexus.common

//------------------------------------------------------------
//com.nexus.common.cursor

package com.nexus.common
{
    import flash.display.MovieClip;
    import flash.utils.getDefinitionByName;
    import flash.geom.Rectangle;
    import flash.ui.Mouse;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Point;

    public class cursor extends MovieClip 
    {

        internal static var offsetStandard:* = [165, 117];

        internal var cursorRef:*;
        internal var objdata:*;
        public var ctype:String;
        internal var stageRef:*;
        internal var thisref:*;
        internal var col_ref:*;
        internal var col_collide:* = [];
        internal var counter:* = 0;
        internal var dropOKalpha:* = 0.6;
        internal var dropnotOKalpha:* = 0.2;
        public var dropOK:* = false;
        public var isfurniture:* = false;

        public function cursor()
        {
            this.thisref = this;
        }

        public function getCursorSize():*
        {
            return (new Array(this.cursorRef.width, this.cursorRef.height));
        }

        public function getObjData():*
        {
            return (this.objdata);
        }

        public function setcursor(_arg_1:*, _arg_2:String, _arg_3:*):*
        {
            var _local_4:*;
            this.objdata = _arg_1;
            this.ctype = _arg_2;
            if (this.ctype == "simple")
            {
                _local_4 = getDefinitionByName("gui_cursor");
                this.cursorRef = addChild(new (_local_4)());
                this.cursorRef.gotoAndStop(_arg_1);
                this.thisref.startDrag(true, new Rectangle(0, 0, this.thisref.stage.stageWidth, this.thisref.stage.stageHeight));
                Mouse.hide();
                mouseEnabled = false;
                mouseChildren = false;
            }
            else
            {
                if (((this.ctype == "SCENEINV") || (this.objdata.type == "6")))
                {
                    this.isfurniture = true;
                };
                this.stageRef = _arg_3;
                if (((this.ctype == "INV") || (this.ctype == "SCENEINV")))
                {
                    if (this.ctype == "INV")
                    {
                        trace(((((("data: type= " + _arg_1.type) + " rid = ") + _arg_1.rid) + " desc : ") + _arg_1.desc));
                    };
                    if (this.ctype == "INV")
                    {
                        _local_4 = getDefinitionByName(("obj" + _arg_1.rid));
                    }
                    else
                    {
                        _local_4 = getDefinitionByName(("obj" + _arg_1[1]));
                    };
                    this.cursorRef = addChild(new (_local_4)());
                    if (this.ctype == "INV")
                    {
                        if (_arg_1.type == 6)
                        {
                            if (!_arg_1.rot)
                            {
                                _arg_1.rot = 1;
                            };
                            if (!this.objdata.rot)
                            {
                                this.objdata.rot = 1;
                            };
                            _local_4 = getDefinitionByName((("obj" + _arg_1.rid) + "_col"));
                            this.col_ref = addChild(new (_local_4)());
                            this.col_ref.visible = 0;
                            this.col_ref.gotoAndStop(("dir" + _arg_1.rot));
                            this.cursorRef.gotoAndStop("thumbnail");
                        }
                        else
                        {
                            this.cursorRef.gotoAndStop("thumbnail");
                            this.cursorRef.x = -30;
                            this.cursorRef.y = -20;
                        };
                    }
                    else
                    {
                        _local_4 = getDefinitionByName((("obj" + _arg_1[1]) + "_col"));
                        this.col_ref = addChild(new (_local_4)());
                        this.col_ref.alpha = 0;
                        this.col_ref.gotoAndStop(("dir" + _arg_1[4]));
                        this.cursorRef.setdir(_arg_1[4], false);
                        this.cursorRef.x = -(this.cursorRef.offsetStandard[0]);
                        this.cursorRef.y = -(this.cursorRef.offsetStandard[1]);
                        this.col_ref.x = this.cursorRef.x;
                        this.col_ref.y = this.cursorRef.y;
                        if (this.checkDropPerm())
                        {
                            this.thisref.alpha = this.dropOKalpha;
                        }
                        else
                        {
                            this.thisref.alpha = this.dropnotOKalpha;
                        };
                    };
                    if (this.col_ref)
                    {
                        if (this.col_ref.hasEventListener(Event.ENTER_FRAME))
                        {
                            this.col_ref.removeEventListener(Event.ENTER_FRAME, this.getCollissionCat);
                        };
                        this.col_ref.addEventListener(Event.ENTER_FRAME, this.getCollissionCat);
                        this.counter = 0;
                    };
                    this.thisref.startDrag(true, new Rectangle(0, 0, this.thisref.stage.stageWidth, this.thisref.stage.stageHeight));
                    this.stageRef.addEventListener(MouseEvent.MOUSE_MOVE, this.chkTargets);
                    this.stageRef.mc_interface.playerPopupRef.inventoryContainer.trade_drop.addEventListener(MouseEvent.MOUSE_OVER, this.mouse_target);
                    this.stageRef.mc_interface.playerPopupRef.inventoryContainer.trade_drop.addEventListener(MouseEvent.MOUSE_OUT, this.mouse_target);
                };
                mouseEnabled = false;
                mouseChildren = false;
            };
        }

        private function mouse_target(_arg_1:MouseEvent):*
        {
            if (_arg_1.type == "mouseOver")
            {
                this.stageRef.mc_interface.playerPopupContainer.inventoryContainer.trade_drop.gotoAndStop(2);
            }
            else
            {
                this.stageRef.mc_interface.playerPopupContainer.inventoryContainer.trade_drop.gotoAndStop(1);
            };
        }

        private function getCollissionCat(_arg_1:Event):*
        {
            this.col_collide = [];
            var _local_2:* = 0;
            while (_local_2 < this.col_ref.numChildren)
            {
                if ((this.col_ref.getChildAt(_local_2) is collission_detect))
                {
                    this.col_collide.push(this.col_ref.getChildAt(_local_2));
                };
                _local_2++;
            };
            if (this.col_collide < 5)
            {
                trace((("Found " + this.col_collide.length) + " collission detectors in object."));
            };
            if (this.col_collide.length > 0)
            {
                this.col_ref.removeEventListener(Event.ENTER_FRAME, this.getCollissionCat);
            };
            this.counter++;
            if (this.counter == 20)
            {
                trace("Warning : There are no collission detectors in this furniture object.");
            };
        }

        private function centre():*
        {
            this.cursorRef.x = (this.cursorRef.width / 2);
            this.cursorRef.y = (this.cursorRef.height / 2);
        }

        public function checkDropPerm():*
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            this.dropOK = true;
            if (this.stageRef.mc_scene.loadHomeID)
            {
                _local_3 = {};
                if ((this.objdata is Array))
                {
                    _local_3.subtype = this.objdata[5];
                    _local_3.type = 6;
                }
                else
                {
                    _local_3.subtype = this.objdata.subtype;
                    _local_3.type = this.objdata.type;
                };
                if (((_local_3.subtype == "3") && (_local_3.type == "6")))
                {
                    for (_local_1 in this.col_collide)
                    {
                        _local_2 = this.col_ref.localToGlobal(new Point(this.col_collide[_local_1].x, this.col_collide[_local_1].y));
                        if (!this.stageRef.mc_scene.sceneRef.wallLocation1.hitTestPoint(_local_2.x, _local_2.y, true))
                        {
                            this.dropOK = false;
                            break;
                        };
                    };
                }
                else
                {
                    if (((_local_3.subtype == "1") && (_local_3.type == "6")))
                    {
                        this.stageRef.mc_scene.sceneRef.collide1.visible = true;
                        this.stageRef.mc_scene.sceneRef.collide1.alpha = 0;
                        this.stageRef.mc_scene.sceneRef.collide1.mouseChildren = false;
                        this.stageRef.mc_scene.sceneRef.collide1.mouseEnabled = false;
                        for (_local_1 in this.col_collide)
                        {
                            _local_2 = this.col_ref.localToGlobal(new Point(this.col_collide[_local_1].x, this.col_collide[_local_1].y));
                            if (this.stageRef.mc_scene.sceneRef.collide1.hitTestPoint(_local_2.x, _local_2.y, true))
                            {
                                _local_4 = this.stageRef.mc_scene.sceneRef.collide1.getObjectsUnderPoint(_local_2);
                                for (_local_5 in _local_4)
                                {
                                    if (this.stageRef.mc_scene.sceneRef.collide1.contains(_local_4[_local_5]))
                                    {
                                        trace("GOT A RESULT!!");
                                    };
                                    if (((this.getParentMCname(_local_4[_local_5]) == "collide1") || (this.getParentMCname(_local_4[_local_5]) == "doorblocker")))
                                    {
                                        this.dropOK = false;
                                        break;
                                    };
                                };
                                if (!this.dropOK) break;
                            };
                        };
                    }
                    else
                    {
                        for (_local_1 in this.col_collide)
                        {
                            _local_2 = this.col_ref.localToGlobal(new Point(this.col_collide[_local_1].x, this.col_collide[_local_1].y));
                            if (this.stageRef.mc_scene.sceneRef.collide1.hitTestPoint(_local_2.x, _local_2.y, true))
                            {
                                this.dropOK = false;
                                break;
                            };
                        };
                    };
                };
            };
            return (this.dropOK);
        }

        private function getParentMCname(_arg_1:*):*
        {
            while ((!(_arg_1 is MovieClip)))
            {
                _arg_1 = _arg_1.parent;
            };
            return (_arg_1.name);
        }

        public function dropOverTradeItem():*
        {
            if (this.stageRef.mc_interface.playerPopupRef.inventoryContainer.trade_drop.hitTestPoint(this.stageRef.mouseX, this.stageRef.mouseY, true))
            {
                return (true);
            };
            return (false);
        }

        private function chkTargets(_arg_1:MouseEvent):*
        {
            var _local_2:* = this.stageRef.mc_interface.hitTestPoint(this.thisref.x, this.thisref.y, true);
            if ((((_local_2) && (this.stageRef.mc_interface.playerPopupContainer)) && (this.stageRef.mc_interface.playerPopupContainer.hitTestPoint(this.thisref.x, this.thisref.y, true))))
            {
                if (!this.stageRef.mc_interface.playerPopupContainer.bgd.hitTestPoint(this.thisref.x, this.thisref.y, true))
                {
                    _local_2 = false;
                };
            };
            if (this.isfurniture)
            {
                if (_local_2)
                {
                    this.cursorRef.gotoAndStop("thumbnail");
                    this.cursorRef.x = -25;
                    this.cursorRef.y = -25;
                    this.thisref.alpha = 1;
                    this.dropOK = false;
                }
                else
                {
                    this.cursorRef.x = -(this.cursorRef.offsetStandard[0]);
                    this.cursorRef.y = -(this.cursorRef.offsetStandard[1]);
                    this.col_ref.x = this.cursorRef.x;
                    this.col_ref.y = this.cursorRef.y;
                    if (this.checkDropPerm())
                    {
                        this.cursorRef.alpha = this.dropOKalpha;
                    }
                    else
                    {
                        this.cursorRef.alpha = this.dropnotOKalpha;
                    };
                    if (this.ctype == "SCENEINV")
                    {
                        if (this.objdata[5] == "3")
                        {
                            this.checkWallHanging();
                            this.objdata[4] = this.cursorRef.myDir;
                        }
                        else
                        {
                            if (this.cursorRef.currentLabel != ("dir" + this.objdata[4]))
                            {
                                this.cursorRef.setdir(this.objdata[4], false);
                            };
                        };
                    }
                    else
                    {
                        if (this.objdata.subtype == "3")
                        {
                            this.checkWallHanging();
                            this.objdata.rot = this.cursorRef.myDir;
                        }
                        else
                        {
                            this.cursorRef.gotoAndStop("dir1");
                            this.cursorRef.setdir(1, false);
                        };
                    };
                };
            }
            else
            {
                if (((!(this.stageRef.mc_scene.loadHomeID)) && (this.stageRef.mc_scene.sceneRef)))
                {
                    this.stageRef.mc_scene.sceneRef.checkForInteract(new Point(this.cursorRef.x, this.cursorRef.y));
                };
            };
        }

        private function checkWallHanging():*
        {
            var _local_1:* = this.stageRef.mc_scene.sceneRef.globalToLocal(new Point(this.stageRef.cursorRef.x, this.stageRef.cursorRef.y));
            if (this.stageRef.mc_scene.sceneRef.wallLocation1.hitTestPoint(_local_1.x, _local_1.y))
            {
                if (this.stageRef.mc_scene.sceneRef.wallLocation1.wall_c.hitTestPoint(_local_1.x, _local_1.y))
                {
                    this.cursorRef.setdir(1, false);
                }
                else
                {
                    if (this.stageRef.mc_scene.sceneRef.wallLocation1.wall_r.hitTestPoint(_local_1.x, _local_1.y))
                    {
                        this.cursorRef.setdir(3, false);
                    }
                    else
                    {
                        if (this.stageRef.mc_scene.sceneRef.wallLocation1.wall_l.hitTestPoint(_local_1.x, _local_1.y))
                        {
                            this.cursorRef.setdir(2, false);
                        };
                    };
                };
            }
            else
            {
                if (this.cursorRef.myDir != 1)
                {
                    this.cursorRef.setdir(1, false);
                };
            };
        }

        public function hideCursor():*
        {
            if (this.ctype != "simple")
            {
                this.stageRef.removeEventListener(MouseEvent.MOUSE_MOVE, this.chkTargets);
                this.stageRef.mc_interface.playerPopupRef.inventoryContainer.trade_drop.removeEventListener(MouseEvent.MOUSE_OVER, this.mouse_target);
                this.stageRef.mc_interface.playerPopupRef.inventoryContainer.trade_drop.removeEventListener(MouseEvent.MOUSE_OUT, this.mouse_target);
                if (this.col_ref)
                {
                    this.col_ref.removeEventListener(Event.ENTER_FRAME, this.getCollissionCat);
                };
            };
            Mouse.show();
            this.cursorRef.visible = false;
            this.thisref.stopDrag();
        }


    }
}//package com.nexus.common

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
//fl.controls.ComboBox

package fl.controls
{
    import fl.core.UIComponent;
    import fl.managers.IFocusManagerComponent;
    import fl.data.SimpleCollectionItem;
    import fl.events.ComponentEvent;
    import fl.core.InvalidationType;
    import flash.events.Event;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;
    import flash.events.FocusEvent;
    import flash.display.DisplayObject;
    import flash.events.MouseEvent;
    import fl.events.DataChangeEvent;
    import fl.controls.listClasses.ICellRenderer;
    import fl.events.ListEvent;
    import flash.geom.Point;
    import fl.data.DataProvider;
    import flash.text.TextFormat;

    public class ComboBox extends UIComponent implements IFocusManagerComponent 
    {

        private static var defaultStyles:Object = {
            "upSkin":"ComboBox_upSkin",
            "downSkin":"ComboBox_downSkin",
            "overSkin":"ComboBox_overSkin",
            "disabledSkin":"ComboBox_disabledSkin",
            "focusRectSkin":null,
            "focusRectPadding":null,
            "textFormat":null,
            "disabledTextFormat":null,
            "textPadding":3,
            "buttonWidth":24,
            "disabledAlpha":null,
            "listSkin":null
        };
        protected static const LIST_STYLES:Object = {
            "upSkin":"comboListUpSkin",
            "overSkin":"comboListOverSkin",
            "downSkin":"comobListDownSkin",
            "disabledSkin":"comboListDisabledSkin",
            "downArrowDisabledSkin":"downArrowDisabledSkin",
            "downArrowDownSkin":"downArrowDownSkin",
            "downArrowOverSkin":"downArrowOverSkin",
            "downArrowUpSkin":"downArrowUpSkin",
            "upArrowDisabledSkin":"upArrowDisabledSkin",
            "upArrowDownSkin":"upArrowDownSkin",
            "upArrowOverSkin":"upArrowOverSkin",
            "upArrowUpSkin":"upArrowUpSkin",
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
            "repeatInterval":"repeatInterval",
            "textFormat":"textFormat",
            "disabledAlpha":"disabledAlpha",
            "skin":"listSkin"
        };
        protected static const BACKGROUND_STYLES:Object = {
            "overSkin":"overSkin",
            "downSkin":"downSkin",
            "upSkin":"upSkin",
            "disabledSkin":"disabledSkin",
            "repeatInterval":"repeatInterval"
        };
        public static var createAccessibilityImplementation:Function;

        protected var _dropdownWidth:Number;
        protected var _prompt:String;
        protected var list:List;
        protected var currentIndex:int;
        protected var _labels:Array;
        protected var background:BaseButton;
        protected var inputField:TextInput;
        protected var listOverIndex:uint;
        protected var editableValue:String;
        private var collectionItemImport:SimpleCollectionItem;

        protected var _rowCount:uint = 5;
        protected var _editable:Boolean = false;
        protected var isOpen:Boolean = false;
        protected var highlightedCell:int = -1;
        protected var isKeyDown:Boolean = false;


        public static function getStyleDefinition():Object
        {
            return (mergeStyles(defaultStyles, List.getStyleDefinition()));
        }


        protected function drawList():void
        {
            list.rowCount = Math.max(0, Math.min(_rowCount, list.dataProvider.length));
        }

        public function set imeMode(_arg_1:String):void
        {
            inputField.imeMode = _arg_1;
        }

        public function get dropdown():List
        {
            return (list);
        }

        public function get dropdownWidth():Number
        {
            return (list.width);
        }

        public function sortItemsOn(_arg_1:String, _arg_2:Object=null):*
        {
            return (list.sortItemsOn(_arg_1, _arg_2));
        }

        protected function onEnter(_arg_1:ComponentEvent):void
        {
            _arg_1.stopPropagation();
        }

        public function removeItemAt(_arg_1:uint):void
        {
            list.removeItemAt(_arg_1);
            invalidate(InvalidationType.DATA);
        }

        public function open():void
        {
            currentIndex = selectedIndex;
            if (((isOpen) || (length == 0)))
            {
                return;
            };
            dispatchEvent(new Event(Event.OPEN));
            isOpen = true;
            addEventListener(Event.ENTER_FRAME, addCloseListener, false, 0, true);
            positionList();
            list.scrollToSelected();
            stage.addChild(list);
        }

        public function get selectedItem():Object
        {
            return (list.selectedItem);
        }

        public function set text(_arg_1:String):void
        {
            if (!editable)
            {
                return;
            };
            inputField.text = _arg_1;
        }

        public function get labelField():String
        {
            return (list.labelField);
        }

        override protected function keyDownHandler(_arg_1:KeyboardEvent):void
        {
            var _local_2:int;
            var _local_3:uint;
            var _local_4:Number;
            var _local_5:int;
            isKeyDown = true;
            if (_arg_1.ctrlKey)
            {
                switch (_arg_1.keyCode)
                {
                    case Keyboard.UP:
                        if (highlightedCell > -1)
                        {
                            selectedIndex = highlightedCell;
                            dispatchEvent(new Event(Event.CHANGE));
                        };
                        close();
                        return;
                    case Keyboard.DOWN:
                        open();
                        return;
                };
                return;
            };
            _arg_1.stopPropagation();
            _local_2 = int(Math.max(((calculateAvailableHeight() / list.rowHeight) << 0), 1));
            _local_3 = selectedIndex;
            _local_4 = ((highlightedCell == -1) ? selectedIndex : highlightedCell);
            _local_5 = -1;
            switch (_arg_1.keyCode)
            {
                case Keyboard.SPACE:
                    if (isOpen)
                    {
                        close();
                    }
                    else
                    {
                        open();
                    };
                    return;
                case Keyboard.ESCAPE:
                    if (isOpen)
                    {
                        if (highlightedCell > -1)
                        {
                            selectedIndex = selectedIndex;
                        };
                        close();
                    };
                    return;
                case Keyboard.UP:
                    _local_5 = Math.max(0, (_local_4 - 1));
                    break;
                case Keyboard.DOWN:
                    _local_5 = Math.min((length - 1), (_local_4 + 1));
                    break;
                case Keyboard.PAGE_UP:
                    _local_5 = Math.max((_local_4 - _local_2), 0);
                    break;
                case Keyboard.PAGE_DOWN:
                    _local_5 = Math.min((_local_4 + _local_2), (length - 1));
                    break;
                case Keyboard.HOME:
                    _local_5 = 0;
                    break;
                case Keyboard.END:
                    _local_5 = (length - 1);
                    break;
                case Keyboard.ENTER:
                    if (((_editable) && (highlightedCell == -1)))
                    {
                        editableValue = inputField.text;
                        selectedIndex = -1;
                    }
                    else
                    {
                        if (((isOpen) && (highlightedCell > -1)))
                        {
                            editableValue = null;
                            selectedIndex = highlightedCell;
                            dispatchEvent(new Event(Event.CHANGE));
                        };
                    };
                    dispatchEvent(new ComponentEvent(ComponentEvent.ENTER));
                    close();
                    return;
                default:
                    if (editable) break;
                    _local_5 = list.getNextIndexAtLetter(String.fromCharCode(_arg_1.keyCode), _local_4);
            };
            if (_local_5 > -1)
            {
                if (isOpen)
                {
                    highlightCell(_local_5);
                    inputField.text = list.itemToLabel(getItemAt(_local_5));
                }
                else
                {
                    highlightCell();
                    selectedIndex = _local_5;
                    dispatchEvent(new Event(Event.CHANGE));
                };
            };
        }

        public function set dropdownWidth(_arg_1:Number):void
        {
            _dropdownWidth = _arg_1;
            invalidate(InvalidationType.SIZE);
        }

        public function get editable():Boolean
        {
            return (_editable);
        }

        override protected function focusInHandler(_arg_1:FocusEvent):void
        {
            super.focusInHandler(_arg_1);
            if (editable)
            {
                stage.focus = inputField.textField;
            };
        }

        protected function onStageClick(_arg_1:MouseEvent):void
        {
            if (!isOpen)
            {
                return;
            };
            if (((!(contains((_arg_1.target as DisplayObject)))) && (!(list.contains((_arg_1.target as DisplayObject))))))
            {
                if (highlightedCell != -1)
                {
                    selectedIndex = highlightedCell;
                    dispatchEvent(new Event(Event.CHANGE));
                };
                close();
            };
        }

        protected function handleDataChange(_arg_1:DataChangeEvent):void
        {
            invalidate(InvalidationType.DATA);
        }

        override protected function keyUpHandler(_arg_1:KeyboardEvent):void
        {
            isKeyDown = false;
        }

        protected function onListItemUp(_arg_1:MouseEvent):void
        {
            var _local_2:*;
            stage.removeEventListener(MouseEvent.MOUSE_UP, onListItemUp);
            if (((!(_arg_1.target is ICellRenderer)) || (!(list.contains((_arg_1.target as DisplayObject))))))
            {
                return;
            };
            editableValue = null;
            _local_2 = selectedIndex;
            selectedIndex = _arg_1.target.listData.index;
            if (_local_2 != selectedIndex)
            {
                dispatchEvent(new Event(Event.CHANGE));
            };
            close();
        }

        public function removeAll():void
        {
            list.removeAll();
            inputField.text = "";
            invalidate(InvalidationType.DATA);
        }

        public function set selectedItem(_arg_1:Object):void
        {
            list.selectedItem = _arg_1;
            invalidate(InvalidationType.SELECTED);
        }

        protected function highlightCell(_arg_1:int=-1):void
        {
            var _local_2:ICellRenderer;
            if (highlightedCell > -1)
            {
                _local_2 = list.itemToCellRenderer(getItemAt(highlightedCell));
                if (_local_2 != null)
                {
                    _local_2.setMouseState("up");
                };
            };
            if (_arg_1 == -1)
            {
                return;
            };
            list.scrollToIndex(_arg_1);
            list.drawNow();
            _local_2 = list.itemToCellRenderer(getItemAt(_arg_1));
            if (_local_2 != null)
            {
                _local_2.setMouseState("over");
                highlightedCell = _arg_1;
            };
        }

        public function itemToLabel(_arg_1:Object):String
        {
            if (_arg_1 == null)
            {
                return ("");
            };
            return (list.itemToLabel(_arg_1));
        }

        public function addItemAt(_arg_1:Object, _arg_2:uint):void
        {
            list.addItemAt(_arg_1, _arg_2);
            invalidate(InvalidationType.DATA);
        }

        public function replaceItemAt(_arg_1:Object, _arg_2:uint):Object
        {
            return (list.replaceItemAt(_arg_1, _arg_2));
        }

        protected function showPrompt():void
        {
            inputField.text = _prompt;
        }

        public function set rowCount(_arg_1:uint):void
        {
            _rowCount = _arg_1;
            invalidate(InvalidationType.SIZE);
        }

        public function get restrict():String
        {
            return (inputField.restrict);
        }

        protected function setEmbedFonts():void
        {
            var _local_1:Object;
            _local_1 = getStyleValue("embedFonts");
            if (_local_1 != null)
            {
                inputField.textField.embedFonts = _local_1;
            };
        }

        public function sortItems(... _args):*
        {
            return (list.sortItems.apply(list, _args));
        }

        public function set labelField(_arg_1:String):void
        {
            list.labelField = _arg_1;
            invalidate(InvalidationType.DATA);
        }

        public function set editable(_arg_1:Boolean):void
        {
            _editable = _arg_1;
            drawTextField();
        }

        public function set prompt(_arg_1:String):void
        {
            if (_arg_1 == "")
            {
                _prompt = null;
            }
            else
            {
                _prompt = _arg_1;
            };
            invalidate(InvalidationType.STATE);
        }

        public function get length():int
        {
            return (list.length);
        }

        protected function drawTextField():void
        {
            inputField.setStyle("upSkin", "");
            inputField.setStyle("disabledSkin", "");
            inputField.enabled = enabled;
            inputField.editable = _editable;
            inputField.textField.selectable = ((enabled) && (_editable));
            inputField.mouseEnabled = (inputField.mouseChildren = ((enabled) && (_editable)));
            inputField.focusEnabled = false;
            if (_editable)
            {
                inputField.addEventListener(FocusEvent.FOCUS_IN, onInputFieldFocus, false, 0, true);
                inputField.addEventListener(FocusEvent.FOCUS_OUT, onInputFieldFocusOut, false, 0, true);
            }
            else
            {
                inputField.removeEventListener(FocusEvent.FOCUS_IN, onInputFieldFocus);
                inputField.removeEventListener(FocusEvent.FOCUS_OUT, onInputFieldFocusOut);
            };
        }

        protected function onInputFieldFocusOut(_arg_1:FocusEvent):void
        {
            inputField.removeEventListener(ComponentEvent.ENTER, onEnter);
            selectedIndex = selectedIndex;
        }

        protected function passEvent(_arg_1:Event):void
        {
            dispatchEvent(_arg_1);
        }

        public function get imeMode():String
        {
            return (inputField.imeMode);
        }

        public function get labelFunction():Function
        {
            return (list.labelFunction);
        }

        protected function calculateAvailableHeight():Number
        {
            var _local_1:Number;
            _local_1 = Number(getStyleValue("contentPadding"));
            return (list.height - (_local_1 * 2));
        }

        public function get selectedIndex():int
        {
            return (list.selectedIndex);
        }

        override protected function focusOutHandler(_arg_1:FocusEvent):void
        {
            isKeyDown = false;
            if (isOpen)
            {
                if (((!(_arg_1.relatedObject)) || (!(list.contains(_arg_1.relatedObject)))))
                {
                    if (((!(highlightedCell == -1)) && (!(highlightedCell == selectedIndex))))
                    {
                        selectedIndex = highlightedCell;
                        dispatchEvent(new Event(Event.CHANGE));
                    };
                    close();
                };
            };
            super.focusOutHandler(_arg_1);
        }

        public function get selectedLabel():String
        {
            if (editableValue != null)
            {
                return (editableValue);
            };
            if (selectedIndex == -1)
            {
                return (null);
            };
            return (itemToLabel(selectedItem));
        }

        public function get text():String
        {
            return (inputField.text);
        }

        protected function onListChange(_arg_1:Event):void
        {
            editableValue = null;
            dispatchEvent(_arg_1);
            invalidate(InvalidationType.SELECTED);
            if (isKeyDown)
            {
                return;
            };
            close();
        }

        protected function onToggleListVisibility(_arg_1:MouseEvent):void
        {
            _arg_1.stopPropagation();
            dispatchEvent(_arg_1);
            if (isOpen)
            {
                close();
            }
            else
            {
                open();
                stage.addEventListener(MouseEvent.MOUSE_UP, onListItemUp, false, 0, true);
            };
        }

        override protected function draw():void
        {
            var _local_1:*;
            _local_1 = selectedIndex;
            if (((_local_1 == -1) && (((!(prompt == null)) || (editable)) || (length == 0))))
            {
                _local_1 = Math.max(-1, Math.min(_local_1, (length - 1)));
            }
            else
            {
                editableValue = null;
                _local_1 = Math.max(0, Math.min(_local_1, (length - 1)));
            };
            if (list.selectedIndex != _local_1)
            {
                list.selectedIndex = _local_1;
                invalidate(InvalidationType.SELECTED, false);
            };
            if (isInvalid(InvalidationType.STYLES))
            {
                setStyles();
                setEmbedFonts();
                invalidate(InvalidationType.SIZE, false);
            };
            if (isInvalid(InvalidationType.SIZE, InvalidationType.DATA, InvalidationType.STATE))
            {
                drawTextFormat();
                drawLayout();
                invalidate(InvalidationType.DATA);
            };
            if (isInvalid(InvalidationType.DATA))
            {
                drawList();
                invalidate(InvalidationType.SELECTED, true);
            };
            if (isInvalid(InvalidationType.SELECTED))
            {
                if (((_local_1 == -1) && (!(editableValue == null))))
                {
                    inputField.text = editableValue;
                }
                else
                {
                    if (_local_1 > -1)
                    {
                        if (length > 0)
                        {
                            inputField.horizontalScrollPosition = 0;
                            inputField.text = itemToLabel(list.selectedItem);
                        };
                    }
                    else
                    {
                        if (((_local_1 == -1) && (!(_prompt == null))))
                        {
                            showPrompt();
                        }
                        else
                        {
                            inputField.text = "";
                        };
                    };
                };
                if ((((editable) && (selectedIndex > -1)) && (stage.focus == inputField.textField)))
                {
                    inputField.setSelection(0, inputField.length);
                };
            };
            drawTextField();
            super.draw();
        }

        public function addItem(_arg_1:Object):void
        {
            list.addItem(_arg_1);
            invalidate(InvalidationType.DATA);
        }

        public function get rowCount():uint
        {
            return (_rowCount);
        }

        override protected function configUI():void
        {
            super.configUI();
            background = new BaseButton();
            background.focusEnabled = false;
            copyStylesToChild(background, BACKGROUND_STYLES);
            background.addEventListener(MouseEvent.MOUSE_DOWN, onToggleListVisibility, false, 0, true);
            addChild(background);
            inputField = new TextInput();
            inputField.focusTarget = (this as IFocusManagerComponent);
            inputField.focusEnabled = false;
            inputField.addEventListener(Event.CHANGE, onTextInput, false, 0, true);
            addChild(inputField);
            list = new List();
            list.focusEnabled = false;
            copyStylesToChild(list, LIST_STYLES);
            list.addEventListener(Event.CHANGE, onListChange, false, 0, true);
            list.addEventListener(ListEvent.ITEM_CLICK, onListChange, false, 0, true);
            list.addEventListener(ListEvent.ITEM_ROLL_OUT, passEvent, false, 0, true);
            list.addEventListener(ListEvent.ITEM_ROLL_OVER, passEvent, false, 0, true);
            list.verticalScrollBar.addEventListener(Event.SCROLL, passEvent, false, 0, true);
        }

        protected function positionList():void
        {
            var _local_1:Point;
            _local_1 = localToGlobal(new Point(0, 0));
            list.x = _local_1.x;
            if (((_local_1.y + height) + list.height) > stage.stageHeight)
            {
                list.y = (_local_1.y - list.height);
            }
            else
            {
                list.y = (_local_1.y + height);
            };
        }

        public function get value():String
        {
            var _local_1:Object;
            if (editableValue != null)
            {
                return (editableValue);
            };
            _local_1 = selectedItem;
            if (((!(_editable)) && (!(_local_1.data == null))))
            {
                return (_local_1.data);
            };
            return (itemToLabel(_local_1));
        }

        public function get prompt():String
        {
            return (_prompt);
        }

        public function set dataProvider(_arg_1:DataProvider):void
        {
            _arg_1.addEventListener(DataChangeEvent.DATA_CHANGE, handleDataChange, false, 0, true);
            list.dataProvider = _arg_1;
            invalidate(InvalidationType.DATA);
        }

        public function set restrict(_arg_1:String):void
        {
            if (((componentInspectorSetting) && (_arg_1 == "")))
            {
                _arg_1 = null;
            };
            if (!_editable)
            {
                return;
            };
            inputField.restrict = _arg_1;
        }

        protected function onTextInput(_arg_1:Event):void
        {
            _arg_1.stopPropagation();
            if (!_editable)
            {
                return;
            };
            editableValue = inputField.text;
            selectedIndex = -1;
            dispatchEvent(new Event(Event.CHANGE));
        }

        protected function onInputFieldFocus(_arg_1:FocusEvent):void
        {
            inputField.addEventListener(ComponentEvent.ENTER, onEnter, false, 0, true);
            close();
        }

        public function getItemAt(_arg_1:uint):Object
        {
            return (list.getItemAt(_arg_1));
        }

        override protected function initializeAccessibility():void
        {
            if (ComboBox.createAccessibilityImplementation != null)
            {
                ComboBox.createAccessibilityImplementation(this);
            };
        }

        protected function drawLayout():void
        {
            var _local_1:Number;
            var _local_2:Number;
            _local_1 = (getStyleValue("buttonWidth") as Number);
            _local_2 = (getStyleValue("textPadding") as Number);
            background.setSize(width, height);
            inputField.x = (inputField.y = _local_2);
            inputField.setSize(((width - _local_1) - _local_2), (height - _local_2));
            list.width = ((isNaN(_dropdownWidth)) ? width : _dropdownWidth);
            background.enabled = enabled;
            background.drawNow();
        }

        public function removeItem(_arg_1:Object):Object
        {
            return (list.removeItem(_arg_1));
        }

        private function addCloseListener(_arg_1:Event):*
        {
            removeEventListener(Event.ENTER_FRAME, addCloseListener);
            if (!isOpen)
            {
                return;
            };
            stage.addEventListener(MouseEvent.MOUSE_DOWN, onStageClick, false, 0, true);
        }

        public function get dataProvider():DataProvider
        {
            return (list.dataProvider);
        }

        public function get textField():TextInput
        {
            return (inputField);
        }

        protected function setStyles():void
        {
            copyStylesToChild(background, BACKGROUND_STYLES);
            copyStylesToChild(list, LIST_STYLES);
        }

        public function set labelFunction(_arg_1:Function):void
        {
            list.labelFunction = _arg_1;
            invalidate(InvalidationType.DATA);
        }

        protected function drawTextFormat():void
        {
            var _local_1:TextFormat;
            _local_1 = (getStyleValue(((_enabled) ? "textFormat" : "disabledTextFormat")) as TextFormat);
            if (_local_1 == null)
            {
                _local_1 = new TextFormat();
            };
            inputField.textField.defaultTextFormat = _local_1;
            inputField.textField.setTextFormat(_local_1);
            setEmbedFonts();
        }

        public function set selectedIndex(_arg_1:int):void
        {
            list.selectedIndex = _arg_1;
            highlightCell();
            invalidate(InvalidationType.SELECTED);
        }

        public function close():void
        {
            highlightCell();
            highlightedCell = -1;
            if (!isOpen)
            {
                return;
            };
            dispatchEvent(new Event(Event.CLOSE));
            stage.removeEventListener(MouseEvent.MOUSE_DOWN, onStageClick);
            isOpen = false;
            stage.removeChild(list);
        }


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
//fl.controls.TextInput

package fl.controls
{
    import fl.core.UIComponent;
    import fl.managers.IFocusManagerComponent;
    import flash.display.DisplayObject;
    import flash.text.TextField;
    import flash.ui.Keyboard;
    import fl.events.ComponentEvent;
    import flash.events.KeyboardEvent;
    import fl.core.InvalidationType;
    import flash.text.TextFieldType;
    import fl.managers.IFocusManager;
    import flash.events.FocusEvent;
    import flash.text.TextLineMetrics;
    import flash.events.TextEvent;
    import flash.events.Event;
    import flash.text.TextFormat;

    public class TextInput extends UIComponent implements IFocusManagerComponent 
    {

        private static var defaultStyles:Object = {
            "upSkin":"TextInput_upSkin",
            "disabledSkin":"TextInput_disabledSkin",
            "focusRectSkin":null,
            "focusRectPadding":null,
            "textFormat":null,
            "disabledTextFormat":null,
            "textPadding":0,
            "embedFonts":false
        };
        public static var createAccessibilityImplementation:Function;

        protected var _savedHTML:String;
        protected var background:DisplayObject;
        public var textField:TextField;

        protected var _editable:Boolean = true;
        protected var _html:Boolean = false;


        public static function getStyleDefinition():Object
        {
            return (defaultStyles);
        }


        override public function drawFocus(_arg_1:Boolean):void
        {
            if (focusTarget != null)
            {
                focusTarget.drawFocus(_arg_1);
                return;
            };
            super.drawFocus(_arg_1);
        }

        public function set imeMode(_arg_1:String):void
        {
            _imeMode = _arg_1;
        }

        override protected function isOurFocus(_arg_1:DisplayObject):Boolean
        {
            return ((_arg_1 == textField) || (super.isOurFocus(_arg_1)));
        }

        protected function handleKeyDown(_arg_1:KeyboardEvent):void
        {
            if (_arg_1.keyCode == Keyboard.ENTER)
            {
                dispatchEvent(new ComponentEvent(ComponentEvent.ENTER, true));
            };
        }

        public function set text(_arg_1:String):void
        {
            textField.text = _arg_1;
            _html = false;
            invalidate(InvalidationType.DATA);
            invalidate(InvalidationType.STYLES);
        }

        protected function updateTextFieldType():void
        {
            textField.type = (((enabled) && (editable)) ? TextFieldType.INPUT : TextFieldType.DYNAMIC);
            textField.selectable = enabled;
        }

        public function get selectionEndIndex():int
        {
            return (textField.selectionEndIndex);
        }

        public function get editable():Boolean
        {
            return (_editable);
        }

        override protected function focusInHandler(_arg_1:FocusEvent):void
        {
            var _local_2:IFocusManager;
            if (_arg_1.target == this)
            {
                stage.focus = textField;
            };
            _local_2 = focusManager;
            if (((editable) && (_local_2)))
            {
                _local_2.showFocusIndicator = true;
                if (((textField.selectable) && (textField.selectionBeginIndex == textField.selectionBeginIndex)))
                {
                    setSelection(0, textField.length);
                };
            };
            super.focusInHandler(_arg_1);
            if (editable)
            {
                setIMEMode(true);
            };
        }

        public function get selectionBeginIndex():int
        {
            return (textField.selectionBeginIndex);
        }

        public function set alwaysShowSelection(_arg_1:Boolean):void
        {
            textField.alwaysShowSelection = _arg_1;
        }

        override public function set enabled(_arg_1:Boolean):void
        {
            super.enabled = _arg_1;
            updateTextFieldType();
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

        public function get horizontalScrollPosition():int
        {
            return (textField.scrollH);
        }

        public function set condenseWhite(_arg_1:Boolean):void
        {
            textField.condenseWhite = _arg_1;
        }

        public function set displayAsPassword(_arg_1:Boolean):void
        {
            textField.displayAsPassword = _arg_1;
        }

        public function set horizontalScrollPosition(_arg_1:int):void
        {
            textField.scrollH = _arg_1;
        }

        public function get restrict():String
        {
            return (textField.restrict);
        }

        public function get textWidth():Number
        {
            return (textField.textWidth);
        }

        public function get textHeight():Number
        {
            return (textField.textHeight);
        }

        public function set editable(_arg_1:Boolean):void
        {
            _editable = _arg_1;
            updateTextFieldType();
        }

        public function get maxChars():int
        {
            return (textField.maxChars);
        }

        public function get length():int
        {
            return (textField.length);
        }

        public function getLineMetrics(_arg_1:int):TextLineMetrics
        {
            return (textField.getLineMetrics(_arg_1));
        }

        public function get imeMode():String
        {
            return (_imeMode);
        }

        override protected function focusOutHandler(_arg_1:FocusEvent):void
        {
            super.focusOutHandler(_arg_1);
            if (editable)
            {
                setIMEMode(false);
            };
        }

        public function set htmlText(_arg_1:String):void
        {
            if (_arg_1 == "")
            {
                text = "";
                return;
            };
            _html = true;
            _savedHTML = _arg_1;
            textField.htmlText = _arg_1;
            invalidate(InvalidationType.DATA);
            invalidate(InvalidationType.STYLES);
        }

        public function get text():String
        {
            return (textField.text);
        }

        override public function get enabled():Boolean
        {
            return (super.enabled);
        }

        public function get condenseWhite():Boolean
        {
            return (textField.condenseWhite);
        }

        public function get alwaysShowSelection():Boolean
        {
            return (textField.alwaysShowSelection);
        }

        override protected function draw():void
        {
            var _local_1:Object;
            if (isInvalid(InvalidationType.STYLES, InvalidationType.STATE))
            {
                drawTextFormat();
                drawBackground();
                _local_1 = getStyleValue("embedFonts");
                if (_local_1 != null)
                {
                    textField.embedFonts = _local_1;
                };
                invalidate(InvalidationType.SIZE, false);
            };
            if (isInvalid(InvalidationType.SIZE))
            {
                drawLayout();
            };
            super.draw();
        }

        protected function handleTextInput(_arg_1:TextEvent):void
        {
            _arg_1.stopPropagation();
            dispatchEvent(new TextEvent(TextEvent.TEXT_INPUT, true, false, _arg_1.text));
        }

        override protected function configUI():void
        {
            super.configUI();
            tabChildren = true;
            textField = new TextField();
            addChild(textField);
            updateTextFieldType();
            textField.addEventListener(TextEvent.TEXT_INPUT, handleTextInput, false, 0, true);
            textField.addEventListener(Event.CHANGE, handleChange, false, 0, true);
            textField.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown, false, 0, true);
        }

        public function setSelection(_arg_1:int, _arg_2:int):void
        {
            textField.setSelection(_arg_1, _arg_2);
        }

        public function get displayAsPassword():Boolean
        {
            return (textField.displayAsPassword);
        }

        public function appendText(_arg_1:String):void
        {
            textField.appendText(_arg_1);
        }

        public function set restrict(_arg_1:String):void
        {
            if (((componentInspectorSetting) && (_arg_1 == "")))
            {
                _arg_1 = null;
            };
            textField.restrict = _arg_1;
        }

        public function get htmlText():String
        {
            return (textField.htmlText);
        }

        protected function drawBackground():void
        {
            var _local_1:DisplayObject;
            var _local_2:String;
            _local_1 = background;
            _local_2 = ((enabled) ? "upSkin" : "disabledSkin");
            background = getDisplayObjectInstance(getStyleValue(_local_2));
            if (background == null)
            {
                return;
            };
            addChildAt(background, 0);
            if ((((!(_local_1 == null)) && (!(_local_1 == background))) && (contains(_local_1))))
            {
                removeChild(_local_1);
            };
        }

        override public function setFocus():void
        {
            stage.focus = textField;
        }

        protected function drawLayout():void
        {
            var _local_1:Number;
            _local_1 = Number(getStyleValue("textPadding"));
            if (background != null)
            {
                background.width = width;
                background.height = height;
            };
            textField.width = (width - (2 * _local_1));
            textField.height = (height - (2 * _local_1));
            textField.x = (textField.y = _local_1);
        }

        public function set maxChars(_arg_1:int):void
        {
            textField.maxChars = _arg_1;
        }

        public function get maxHorizontalScrollPosition():int
        {
            return (textField.maxScrollH);
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
            if (_html)
            {
                textField.htmlText = _savedHTML;
            };
        }

        protected function handleChange(_arg_1:Event):void
        {
            _arg_1.stopPropagation();
            dispatchEvent(new Event(Event.CHANGE, true));
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
//fl.transitions.easing.Regular

package fl.transitions.easing
{
    public class Regular 
    {


        public static function easeIn(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number):Number
        {
            return (((_arg_3 * (_arg_1 = (_arg_1 / _arg_4))) * _arg_1) + _arg_2);
        }

        public static function easeOut(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number):Number
        {
            return (((-(_arg_3) * (_arg_1 = (_arg_1 / _arg_4))) * (_arg_1 - 2)) + _arg_2);
        }

        public static function easeInOut(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number):Number
        {
            if ((_arg_1 = (_arg_1 / (_arg_4 / 2))) < 1)
            {
                return ((((_arg_3 / 2) * _arg_1) * _arg_1) + _arg_2);
            };
            return (((-(_arg_3) / 2) * ((--_arg_1 * (_arg_1 - 2)) - 1)) + _arg_2);
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
//gui_fla.bt_audio_up_animate_6

package gui_fla
{
    import flash.display.MovieClip;

    public dynamic class bt_audio_up_animate_6 extends MovieClip 
    {

        public function bt_audio_up_animate_6()
        {
            addFrameScript(0, this.frame1, 89, this.frame90);
        }

        internal function frame1():*
        {
            stop();
        }

        internal function frame90():*
        {
            stop();
        }


    }
}//package gui_fla

//------------------------------------------------------------
//gui_fla.Currency_Icon_127

package gui_fla
{
    import flash.display.MovieClip;

    public dynamic class Currency_Icon_127 extends MovieClip 
    {

        public function Currency_Icon_127()
        {
            addFrameScript(0, this.frame1);
        }

        internal function frame1():*
        {
            stop();
        }


    }
}//package gui_fla

//------------------------------------------------------------
//gui_fla.Dialogue_Bulletpoint_210

package gui_fla
{
    import flash.display.MovieClip;

    public dynamic class Dialogue_Bulletpoint_210 extends MovieClip 
    {

        public function Dialogue_Bulletpoint_210()
        {
            addFrameScript(0, this.frame1);
        }

        internal function frame1():*
        {
            stop();
        }


    }
}//package gui_fla

//------------------------------------------------------------
//gui_fla.Paper_Roll_Animate_176

package gui_fla
{
    import flash.display.MovieClip;

    public dynamic class Paper_Roll_Animate_176 extends MovieClip 
    {

        public function Paper_Roll_Animate_176()
        {
            addFrameScript(27, this.frame28);
        }

        internal function frame28():*
        {
        }


    }
}//package gui_fla

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
//av_snapshot

package 
{
    import com.cocolani.gui.avatar_snap;

    public dynamic class av_snapshot extends avatar_snap 
    {

        public function av_snapshot()
        {
            addFrameScript(7, this.frame8, 19, this.frame20);
        }

        internal function frame8():*
        {
            updateframe();
        }

        internal function frame20():*
        {
            updateframe();
        }


    }
}//package 

//------------------------------------------------------------
//bt_adminpanel

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_adminpanel extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_attachmentsave

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_attachmentsave extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_battlepractice

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_battlepractice extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//Bt_block_user

package 
{
    import com.cocolani.common.togglebutton;

    public dynamic class Bt_block_user extends togglebutton 
    {


    }
}//package 

//------------------------------------------------------------
//BT_Buddy

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class BT_Buddy extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_buddy_profile

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_buddy_profile extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_buddylist_simple_tab

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_buddylist_simple_tab extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_cancel

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_cancel extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//BT_Currency_Pouch

package 
{
    import com.cocolani.gui.world_currency;

    public dynamic class BT_Currency_Pouch extends world_currency 
    {

        public var thisref:*;

        public function BT_Currency_Pouch()
        {
            addFrameScript(0, this.frame1, 1, this.frame2);
        }

        internal function frame1():*
        {
            this.thisref = this;
            setCurrencies();
        }

        internal function frame2():*
        {
            setCurrencies();
        }


    }
}//package 

//------------------------------------------------------------
//bt_exchange

package 
{
    import com.cocolani.common.simplebutton;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;
    import flash.net.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.ui.*;
    import flash.external.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.filters.*;
    import flash.globalization.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.xml.*;

    public dynamic class bt_exchange extends simplebutton 
    {

        public function bt_exchange()
        {
            addFrameScript(0, this.frame1, 1, this.frame2);
        }

        internal function frame1():*
        {
            me.updtext();
        }

        internal function frame2():*
        {
            me.updtext();
        }


    }
}//package 

//------------------------------------------------------------
//bt_Give

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_Give extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_gohome

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_gohome extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_guibattle

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_guibattle extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_inv_trade

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_inv_trade extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_inventory

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_inventory extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//Bt_mainpanelClose

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class Bt_mainpanelClose extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_map_icon

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_map_icon extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_privatemessage

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_privatemessage extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_privatemessage_main

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_privatemessage_main extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//BT_Rewards

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class BT_Rewards extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_say

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_say extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_say_private

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_say_private extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_sml_next

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_sml_next extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_smspay

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_smspay extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_Snapshot_Min

package 
{
    import com.cocolani.common.togglebutton;

    public dynamic class bt_Snapshot_Min extends togglebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_standardbt

package 
{
    import com.cocolani.common.simplebutton;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;
    import flash.net.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.ui.*;
    import flash.external.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.filters.*;
    import flash.globalization.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.xml.*;

    public dynamic class bt_standardbt extends simplebutton 
    {

        public function bt_standardbt()
        {
            addFrameScript(0, this.frame1, 1, this.frame2);
        }

        internal function frame1():*
        {
            me.updtext();
        }

        internal function frame2():*
        {
            me.updtext();
        }


    }
}//package 

//------------------------------------------------------------
//btn_actions

package 
{
    import com.cocolani.gui.actionsMenu;

    public dynamic class btn_actions extends actionsMenu 
    {


    }
}//package 

//------------------------------------------------------------
//btn_quality

package 
{
    import com.cocolani.gui.qualitySetter;

    public dynamic class btn_quality extends qualitySetter 
    {


    }
}//package 

//------------------------------------------------------------
//Buddy_newlayout

package 
{
    import com.cocolani.gui.buddyList;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;
    import flash.net.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.ui.*;
    import flash.external.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.filters.*;
    import flash.globalization.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.xml.*;

    public dynamic class Buddy_newlayout extends buddyList 
    {

        public function Buddy_newlayout()
        {
            addFrameScript(18, this.frame19, 43, this.frame44);
        }

        internal function frame19():*
        {
            thisref.initFrame();
        }

        internal function frame44():*
        {
            thisref.initFrame();
        }


    }
}//package 

//------------------------------------------------------------
//bui_Bt_wave

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bui_Bt_wave extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//but_fullscreen

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class but_fullscreen extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//button_logout

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class button_logout extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//button_pathfinding

package 
{
    import com.cocolani.common.togglebutton;

    public dynamic class button_pathfinding extends togglebutton 
    {


    }
}//package 

//------------------------------------------------------------
//Button_Rollover

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class Button_Rollover extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//Button_Template

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class Button_Template extends simplebutton 
    {

        public function Button_Template()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3);
        }

        internal function frame1():*
        {
            updtext();
        }

        internal function frame2():*
        {
            updtext();
        }

        internal function frame3():*
        {
            updtext();
        }


    }
}//package 

//------------------------------------------------------------
//button_weapon_store_simple

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class button_weapon_store_simple extends simplebutton 
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
//Chat_History

package 
{
    import com.cocolani.gui.world_chathistory;
    import flash.utils.Dictionary;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;
    import flash.net.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.ui.*;
    import flash.external.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.filters.*;
    import flash.globalization.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.xml.*;

    public dynamic class Chat_History extends world_chathistory 
    {

        public var __setPropDict:Dictionary = new Dictionary(true);

        public function Chat_History()
        {
            addFrameScript(18, this.frame19);
        }

        internal function __setProp_scrollbar_Chat_History_Layer8_18():*
        {
            if (((this.__setPropDict[scrollbar] == undefined) || (!(int(this.__setPropDict[scrollbar]) == 19))))
            {
                this.__setPropDict[scrollbar] = 19;
                try
                {
                    scrollbar["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                scrollbar.direction = "vertical";
                scrollbar.scrollTargetName = "chathistory";
                scrollbar.visible = true;
                try
                {
                    scrollbar["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function frame19():*
        {
            this.__setProp_scrollbar_Chat_History_Layer8_18();
        }


    }
}//package 

//------------------------------------------------------------
//Chat_History_button

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class Chat_History_button extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//ComboBox_disabledSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class ComboBox_disabledSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//ComboBox_downSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class ComboBox_downSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//ComboBox_overSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class ComboBox_overSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//ComboBox_upSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class ComboBox_upSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//currency_popup

package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;

    public dynamic class currency_popup extends MovieClip 
    {

        public var currencyIcon:MovieClip;
        public var amt:TextField;


    }
}//package 

//------------------------------------------------------------
//endmarker

package 
{
    import flash.display.Sprite;

    public dynamic class endmarker extends Sprite 
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
//friend_bt_friendRemove

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class friend_bt_friendRemove extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//friend_bt_home

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class friend_bt_home extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//gui_cursor

package 
{
    import flash.display.MovieClip;

    public dynamic class gui_cursor extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//intfc_bt_stopaction

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class intfc_bt_stopaction extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//inv_list1

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class inv_list1 extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//inv_list2

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class inv_list2 extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//inv_list3

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class inv_list3 extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//inv_list4

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class inv_list4 extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//inv_list5

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class inv_list5 extends simplebutton 
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
//mail_animation

package 
{
    import flash.display.MovieClip;

    public dynamic class mail_animation extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//map_Island_battle

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class map_Island_battle extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//map_Island_huhu

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class map_Island_huhu extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//map_Island_yeknom

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class map_Island_yeknom extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//mc_ascii_poweredby

package 
{
    import flash.display.MovieClip;

    public dynamic class mc_ascii_poweredby extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//mc_buddylist_simplelayout

package 
{
    import com.cocolani.gui.buddyList_simplelayout;

    public dynamic class mc_buddylist_simplelayout extends buddyList_simplelayout 
    {


    }
}//package 

//------------------------------------------------------------
//mc_currencyexchange

package 
{
    import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.text.TextField;

    public dynamic class mc_currencyexchange extends Sprite 
    {

        public var bt_currencyD:mc_currencysetbutton_down;
        public var bt_currencyU:mc_currencysetbutton_up;
        public var mycurrency:MovieClip;
        public var btn_exchange:bt_exchange;
        public var owncurrency:TextField;
        public var bt_amountD:mc_currencysetbutton_down;
        public var bt_amountU:mc_currencysetbutton_up;
        public var amtcurrency:TextField;
        public var selectedcurrency:MovieClip;


    }
}//package 

//------------------------------------------------------------
//mc_currencysetbutton_down

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class mc_currencysetbutton_down extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//mc_currencysetbutton_up

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class mc_currencysetbutton_up extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//mc_dobattleprac

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class mc_dobattleprac extends simplebutton 
    {

        public function mc_dobattleprac()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3);
        }

        internal function frame1():*
        {
            updtext();
        }

        internal function frame2():*
        {
            updtext();
        }

        internal function frame3():*
        {
            updtext();
        }


    }
}//package 

//------------------------------------------------------------
//mc_exchangeResponse

package 
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.display.MovieClip;

    public dynamic class mc_exchangeResponse extends Sprite 
    {

        public var amtfrom:TextField;
        public var txt_succ:TextField;
        public var btn_ok:bt_exchange;
        public var frmcurrency:MovieClip;
        public var mycurrency:MovieClip;
        public var txt_rcvd:TextField;
        public var amtbought:TextField;
        public var btn_done:bt_exchange;
        public var txt_exchg:TextField;


    }
}//package 

//------------------------------------------------------------
//mc_feedback

package 
{
    import com.cocolani.gui.world_feedback;

    public dynamic class mc_feedback extends world_feedback 
    {

        public var thisref:*;

        public function mc_feedback()
        {
            addFrameScript(0, this.frame1, 9, this.frame10);
        }

        internal function frame1():*
        {
            this.thisref = this;
        }

        internal function frame10():*
        {
            stop();
        }


    }
}//package 

//------------------------------------------------------------
//mc_friends_friend

package 
{
    import flash.display.MovieClip;

    public dynamic class mc_friends_friend extends MovieClip 
    {

        public var mc_name:MovieClip;
        public var selector:MovieClip;


    }
}//package 

//------------------------------------------------------------
//mc_friends_friend_simple

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class mc_friends_friend_simple extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//mc_genericbutton

package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;

    public dynamic class mc_genericbutton extends MovieClip 
    {

        public var txt:TextField;


    }
}//package 

//------------------------------------------------------------
//mc_happynessmeter

package 
{
    import com.cocolani.gui.happynessMeter;

    public dynamic class mc_happynessmeter extends happynessMeter 
    {


    }
}//package 

//------------------------------------------------------------
//mc_helpbutton

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class mc_helpbutton extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//mc_icon_report

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class mc_icon_report extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//mc_inventory

package 
{
    import com.cocolani.gui.inventory;

    public dynamic class mc_inventory extends inventory 
    {


    }
}//package 

//------------------------------------------------------------
//mc_inventoryitem

package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;

    public dynamic class mc_inventoryitem extends MovieClip 
    {

        public var itemname:TextField;
        public var bt:Button_Rollover;


    }
}//package 

//------------------------------------------------------------
//mc_map

package 
{
    import com.cocolani.gui.map;

    public dynamic class mc_map extends map 
    {


    }
}//package 

//------------------------------------------------------------
//mc_next

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class mc_next extends simplebutton 
    {

        public function mc_next()
        {
            addFrameScript(0, this.frame1, 1, this.frame2);
        }

        internal function frame1():*
        {
            updtext();
        }

        internal function frame2():*
        {
            updtext();
        }


    }
}//package 

//------------------------------------------------------------
//mc_playerprofile

package 
{
    import com.cocolani.gui.charProfile;

    public dynamic class mc_playerprofile extends charProfile 
    {


    }
}//package 

//------------------------------------------------------------
//mc_purse_alt

package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;

    public dynamic class mc_purse_alt extends MovieClip 
    {

        public var coins:TextField;


    }
}//package 

//------------------------------------------------------------
//mc_rewardstab

package 
{
    import com.cocolani.gui.rewards;

    public dynamic class mc_rewardstab extends rewards 
    {


    }
}//package 

//------------------------------------------------------------
//mc_speechresponseselect

package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;

    public dynamic class mc_speechresponseselect extends MovieClip 
    {

        public var bullet:MovieClip;
        public var thetext:TextField;


    }
}//package 

//------------------------------------------------------------
//mc_text

package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;

    public dynamic class mc_text extends MovieClip 
    {

        public var thetext:TextField;


    }
}//package 

//------------------------------------------------------------
//mc_tooltip

package 
{
    import flash.display.MovieClip;

    public dynamic class mc_tooltip extends MovieClip 
    {

        public var obj:MovieClip;


    }
}//package 

//------------------------------------------------------------
//panel_BT_Buddy_opener

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class panel_BT_Buddy_opener extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//Paper_Tab_Main

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class Paper_Tab_Main extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//Paper_Tab_Main_In

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class Paper_Tab_Main_In extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//PlayerPanel_BT_Inventory

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class PlayerPanel_BT_Inventory extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//PlayerPanel_BT_Map

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class PlayerPanel_BT_Map extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//playerpn_BT_Profile

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class playerpn_BT_Profile extends simplebutton 
    {


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
//scroller_hit

package 
{
    import flash.display.MovieClip;

    public dynamic class scroller_hit extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//ScrollPane_disabledSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class ScrollPane_disabledSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//ScrollPane_upSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class ScrollPane_upSkin extends MovieClip 
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

//------------------------------------------------------------
//sfx_cashregister

package 
{
    import flash.media.Sound;

    public dynamic class sfx_cashregister extends Sound 
    {


    }
}//package 

//------------------------------------------------------------
//sfx_click

package 
{
    import flash.media.Sound;

    public dynamic class sfx_click extends Sound 
    {


    }
}//package 

//------------------------------------------------------------
//sfx_triumph

package 
{
    import flash.media.Sound;

    public dynamic class sfx_triumph extends Sound 
    {


    }
}//package 

//------------------------------------------------------------
//Snapshot_Response

package 
{
    import com.cocolani.gui.avatar_snap_icon;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;
    import flash.net.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.ui.*;
    import flash.external.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.filters.*;
    import flash.globalization.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.xml.*;

    public dynamic class Snapshot_Response extends avatar_snap_icon 
    {

        public function Snapshot_Response()
        {
            addFrameScript(0, this.frame1, 13, this.frame14, 37, this.frame38);
        }

        internal function frame1():*
        {
            switch (phase)
            {
                case 0:
                    stop();
                    return;
            };
        }

        internal function frame14():*
        {
            switch (phase)
            {
                case 0:
                    gotoAndPlay("Bubble_Out");
                    return;
                case 1:
                    gotoAndStop("Speak");
                    return;
                case 2:
                    gotoAndStop("Wait");
                    return;
            };
        }

        internal function frame38():*
        {
            switch (phase)
            {
                case 0:
                    stop();
                    thisref.visible = false;
                    return;
            };
        }


    }
}//package 

//------------------------------------------------------------
//Tab_Profile

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class Tab_Profile extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//TextInput_disabledSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class TextInput_disabledSkin extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//TextInput_upSkin

package 
{
    import flash.display.MovieClip;

    public dynamic class TextInput_upSkin extends MovieClip 
    {


    }
}//package 

