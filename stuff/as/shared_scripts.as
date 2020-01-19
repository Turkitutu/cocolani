// Decompiled by AS3 Sorcerer 5.72
// www.as3sorcerer.com

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
            me = this;
            super();
            stop();
            buttonMode = true;
            mouseChildren = false;
            enable();
        }

        public function setTextFormat(_arg_1:TextFormat, _arg_2:TextFormat):*
        {
            textFormat1 = _arg_1;
            textFormat2 = _arg_2;
            textSt = me.thetext.y;
        }

        public function setTextFormatStd():*
        {
            var _local_1:* = new TextFormat();
            _local_1.color = 0;
            var _local_2:* = new TextFormat();
            _local_2.color = 0xFFFFFF;
            setTextFormat(_local_1, _local_2);
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
            if (((getChildByName("thetext")) && (mytext)))
            {
                me.thetext.text = mytext;
                if (((textFormat2) && (currentFrame == 2)))
                {
                    me.thetext.setTextFormat(textFormat2);
                    me.thetext.y = (textSt - 2);
                }
                else
                {
                    if (textFormat1)
                    {
                        me.thetext.y = textSt;
                        me.thetext.setTextFormat(textFormat1);
                    };
                };
            };
        }

        public function setText(_arg_1:*):*
        {
            if (getChildByName("thetext"))
            {
                mytext = _arg_1;
                me.thetext.text = mytext;
            }
            else
            {
                trace(("problem setting text to  " + _arg_1));
            };
        }

        public function disable(_arg_1:Boolean=true):*
        {
            removeEventListener(MouseEvent.MOUSE_OVER, rollover);
            removeEventListener(MouseEvent.MOUSE_OUT, rollover);
            removeEventListener(MouseEvent.MOUSE_DOWN, rollover);
            removeEventListener(MouseEvent.MOUSE_UP, rollover);
            buttonMode = false;
            if (_arg_1)
            {
                gotoAndStop(4);
            };
        }

        public function enable():*
        {
            addEventListener(MouseEvent.MOUSE_OVER, rollover);
            addEventListener(MouseEvent.MOUSE_OUT, rollover);
            addEventListener(MouseEvent.MOUSE_DOWN, rollover);
            addEventListener(MouseEvent.MOUSE_UP, rollover);
            buttonMode = true;
            gotoAndStop(1);
        }


    }
}//package com.cocolani.common

//------------------------------------------------------------
//com.cocolani.gui.currencyWinPopup

package com.cocolani.gui
{
    import com.cocolani.panels.popup;
    import flash.display.MovieClip;

    public class currencyWinPopup extends popup 
    {

        public var bgd:MovieClip;
        public var textcontainer:MovieClip;
        public var bt_close:panel_close;

        public function currencyWinPopup()
        {
            textcontainer.mouseEnabled = false;
            textcontainer.mouseChildren = false;
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
            thisref = this;
            super();
            if (thisref.getChildByName("bgd"))
            {
                thisref.bgd.addEventListener(MouseEvent.MOUSE_DOWN, dragfn);
                thisref.bgd.addEventListener(MouseEvent.MOUSE_UP, dragfn);
            }
            else
            {
                addEventListener(MouseEvent.MOUSE_DOWN, dragfn);
                addEventListener(MouseEvent.MOUSE_UP, dragfn);
            };
            addEventListener(Event.ADDED_TO_STAGE, align);
            if (!thisref.getChildByName("bt_close"))
            {
                trace("No close button in the popup!");
            }
            else
            {
                thisref.bt_close.addEventListener(MouseEvent.CLICK, clickbt);
            };
        }

        public function setAttribs(_arg_1:Object):*
        {
            if (_arg_1.dragbgd)
            {
                if (!thisref.getChildByName("bgd"))
                {
                    trace(("Warning: there is no mc called 'bgd' in movieclip " + myname));
                };
                thisref.bgd.addEventListener(MouseEvent.MOUSE_DOWN, dragfn);
                thisref.bgd.addEventListener(MouseEvent.MOUSE_UP, dragfn);
                thisref.removeEventListener(MouseEvent.MOUSE_DOWN, dragfn);
                thisref.removeEventListener(MouseEvent.MOUSE_UP, dragfn);
            };
        }

        public function align(_arg_1:Event=null):*
        {
            thisref.x = ((thisref.stage.getChildAt(0).stageScale[0] / 2) - (thisref.width / 2));
            thisref.y = ((thisref.stage.getChildAt(0).stageScale[1] / 2) - (thisref.height / 2));
        }

        public function clickbt(_arg_1:MouseEvent):*
        {
            if (_arg_1.currentTarget.name == "bt_close")
            {
                TweenLite.killTweensOf(thisref);
                thisref.parent.hidePanel(myname);
            };
        }

        public function dragfn(_arg_1:MouseEvent):*
        {
            if (_arg_1.type == "mouseUp")
            {
                thisref.stopDrag();
            }
            else
            {
                if (_arg_1.type == "mouseDown")
                {
                    thisref.startDrag();
                    trace(("parent = " + thisref.parent));
                    thisref.parent.setChildIndex(thisref, (thisref.parent.numChildren - 1));
                };
            };
        }

        public function fadein():*
        {
            thisref.alpha = 0;
            new TweenLite(thisref, 0.5, {"alpha":1});
        }


    }
}//package com.cocolani.panels

//------------------------------------------------------------
//com.cocolani.panels.request_window

package com.cocolani.panels
{
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import it.gotoandplay.smartfoxserver.SFSEvent;

    public class request_window extends popup 
    {

        public var bt_close:panel_close;
        public var bt_yes:requestpopup_yes;
        public var requesttxt:TextField;
        public var title:TextField;
        public var bt_no:requestpopup_no;

        public function request_window()
        {
            bt_yes.addEventListener(MouseEvent.CLICK, chkresponse);
            bt_no.addEventListener(MouseEvent.CLICK, chkresponse);
            addEventListener(Event.ADDED_TO_STAGE, init);
            addEventListener(Event.REMOVED_FROM_STAGE, shutdown);
            bt_close.visible = false;
        }

        private function shutdown(_arg_1:Event):*
        {
            var _local_2:* = _arg_1.currentTarget.stage.getChildAt(0);
            _local_2.sfs.removeEventListener(SFSEvent.onLogout, removeme);
            _local_2.sfs.removeEventListener(SFSEvent.onConnectionLost, removeme);
        }

        private function init(_arg_1:Event):*
        {
            var _local_3:*;
            var _local_2:* = _arg_1.currentTarget.stage.getChildAt(0);
            title.text = _local_2.langObj.getText("gui76");
            _local_2.langObj.setFormat(title);
            bt_yes.setText(_local_2.langObj.getText("gui77"));
            bt_no.setText(_local_2.langObj.getText("gui78"));
            _local_2.sfs.addEventListener(SFSEvent.onLogout, removeme);
            _local_2.sfs.addEventListener(SFSEvent.onConnectionLost, removeme);
            if (_local_2.langObj.getLangDir() == 1)
            {
                _local_3 = bt_yes.x;
                bt_yes.x = bt_no.x;
                bt_no.x = _local_3;
            };
        }

        private function removeme(_arg_1:SFSEvent):*
        {
            thisref.parent.removeChild(thisref);
        }

        private function chkresponse(_arg_1:MouseEvent):*
        {
        }


    }
}//package com.cocolani.panels

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
            if (_firstChild)
            {
                _firstChild.prevNode = _arg_1;
            };
            _arg_1.nextNode = _firstChild;
            _firstChild = _arg_1;
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
                if (_lastChild == _arg_1)
                {
                    _lastChild = _arg_1.prevNode;
                };
            };
            if (_arg_1.prevNode)
            {
                _arg_1.prevNode.nextNode = _arg_1.nextNode;
            }
            else
            {
                if (_firstChild == _arg_1)
                {
                    _firstChild = _arg_1.nextNode;
                };
            };
        }

        override public function renderTime(_arg_1:Number, _arg_2:Boolean=false, _arg_3:Boolean=false):void
        {
            var _local_5:Number;
            var _local_6:TweenCore;
            var _local_4:TweenCore = _firstChild;
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
            _delay = ((this.vars.delay) || (0));
            this.cachedTimeScale = ((this.vars.timeScale) || (1));
            this.active = Boolean((((_arg_1 == 0) && (_delay == 0)) && (!(this.vars.immediateRender == false))));
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
            this.cachedStartTime = (_local_3.cachedTotalTime + _delay);
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
            this.setTotalTime(((_arg_1) ? -(_delay) : 0), _arg_2);
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
                renderTime(this.cachedTotalDuration, _arg_2, false);
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
            setEnabled(false, false);
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
                _local_3 = (((_pauseTime) || (_pauseTime == 0)) ? _pauseTime : this.timeline.cachedTotalTime);
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
                    setDirtyCache(false);
                };
                if (this.cachedTotalTime != _arg_1)
                {
                    renderTime(_arg_1, _arg_2, false);
                };
            };
        }

        public function get delay():Number
        {
            return (_delay);
        }

        public function set delay(_arg_1:Number):void
        {
            this.startTime = (this.startTime + (_arg_1 - _delay));
            _delay = _arg_1;
        }

        public function get duration():Number
        {
            return (this.cachedDuration);
        }

        public function set duration(_arg_1:Number):void
        {
            this.cachedDuration = (this.cachedTotalDuration = _arg_1);
            setDirtyCache(false);
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
            setTotalTime(_arg_1, false);
        }

        public function get totalTime():Number
        {
            return (this.cachedTotalTime);
        }

        public function set totalTime(_arg_1:Number):void
        {
            setTotalTime(_arg_1, false);
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
                setTotalTime(this.cachedTotalTime, true);
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
                    _pauseTime = this.timeline.rawTime;
                }
                else
                {
                    this.cachedStartTime = (this.cachedStartTime + (this.timeline.rawTime - _pauseTime));
                    _pauseTime = NaN;
                    setDirtyCache(false);
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
    import com.greensock.core.*;
    import flash.events.*;
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
            propTweenLookup = {};
            _ease = defaultEase;
            _overwrite = (((!(Number(_arg_3.overwrite) > -1)) || ((!(overwriteManager.enabled)) && (_arg_3.overwrite > 1))) ? overwriteManager.mode : int(_arg_3.overwrite));
            var _local_4:Array = masterList[_arg_1];
            if (!_local_4)
            {
                masterList[_arg_1] = [this];
            }
            else
            {
                if (_overwrite == 1)
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
                renderTime(0, false, true);
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
                _ease = this.vars.ease;
            };
            if (this.vars.easeParams)
            {
                this.vars.proxiedEase = _ease;
                _ease = easeProxy;
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
                            _notifyPluginsOfEnabled = true;
                        };
                        _hasPlugins = true;
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
            if (_overwrittenProps)
            {
                killVars(_overwrittenProps);
                if (this.cachedPT1 == null)
                {
                    this.setEnabled(false, false);
                };
            };
            if (((((_overwrite > 1) && (this.cachedPT1)) && (_local_5 = masterList[this.target])) && (_local_5.length > 1)))
            {
                if (overwriteManager.manageOverwrites(this, this.propTweenLookup, _local_5, _overwrite))
                {
                    init();
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
                    this.ratio = _ease(_arg_1, 0, 1, this.cachedDuration);
                };
            };
            if (((this.cachedTime == _local_5) && (!(_arg_3))))
            {
                return;
            };
            if (!this.initted)
            {
                init();
                if (((!(_local_4)) && (this.cachedTime)))
                {
                    this.ratio = _ease(this.cachedTime, 0, 1, this.cachedDuration);
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
                if (((_hasPlugins) && (this.cachedPT1)))
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
            if (_overwrittenProps == null)
            {
                _overwrittenProps = {};
            };
            for (_local_3 in _arg_1)
            {
                if ((_local_3 in propTweenLookup))
                {
                    _local_4 = propTweenLookup[_local_3];
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
                        delete propTweenLookup[_local_3];
                    };
                };
                if (_arg_2)
                {
                    _overwrittenProps[_local_3] = 1;
                };
            };
            return (_local_5);
        }

        override public function invalidate():void
        {
            if (((_notifyPluginsOfEnabled) && (this.cachedPT1)))
            {
                onPluginEvent("onDisable", this);
            };
            this.cachedPT1 = null;
            _overwrittenProps = null;
            _hasUpdate = (this.initted = (this.active = (_notifyPluginsOfEnabled = false)));
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
            if (((_notifyPluginsOfEnabled) && (this.cachedPT1)))
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
//shared_fla.mask_outro_29

package shared_fla
{
    import flash.display.MovieClip;
    import flash.events.*;
    import flash.text.*;
    import flash.display.*;
    import flash.utils.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.system.*;
    import flash.ui.*;
    import flash.xml.*;

    public dynamic class mask_outro_29 extends MovieClip 
    {

        public var thisref:*;

        public function mask_outro_29()
        {
            addFrameScript(0, frame1, 30, frame31);
        }

        internal function frame1():*
        {
            thisref = this;
        }

        internal function frame31():*
        {
            stop();
            thisref.parent.parent.removePreloader();
        }


    }
}//package shared_fla

//------------------------------------------------------------
//Arial1

package 
{
    import flash.text.Font;

    public dynamic class Arial1 extends Font 
    {


    }
}//package 

//------------------------------------------------------------
//avatar_whirl

package 
{
    import flash.display.MovieClip;
    import flash.events.*;
    import flash.text.*;
    import flash.display.*;
    import flash.utils.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.system.*;
    import flash.ui.*;
    import flash.xml.*;

    public dynamic class avatar_whirl extends MovieClip 
    {

        public var thisref:*;

        public function avatar_whirl()
        {
            addFrameScript(10, frame11, 26, frame27);
        }

        internal function frame11():*
        {
            thisref = this;
            thisref.parent.toggleAvatarVis();
        }

        internal function frame27():*
        {
            thisref.parent.charexit();
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
//bt_privatemessage_main

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_privatemessage_main extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_rotate_ac

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_rotate_ac extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//bt_rotate_cl

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_rotate_cl extends simplebutton 
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
//Ego_Marker

package 
{
    import flash.display.MovieClip;

    public dynamic class Ego_Marker extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//mc_avatar_speech_bubble

package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;

    public dynamic class mc_avatar_speech_bubble extends MovieClip 
    {

        public var avatartext:TextField;
        public var bubble:MovieClip;


    }
}//package 

//------------------------------------------------------------
//mc_currencywin

package 
{
    import com.cocolani.gui.currencyWinPopup;

    public dynamic class mc_currencywin extends currencyWinPopup 
    {


    }
}//package 

//------------------------------------------------------------
//mc_progress2

package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;

    public dynamic class mc_progress2 extends MovieClip 
    {

        public var bgd:MovieClip;
        public var gfx:MovieClip;
        public var percentagetxt:TextField;
        public var MOTD:TextField;


    }
}//package 

//------------------------------------------------------------
//mc_progress3

package 
{
    import flash.display.MovieClip;

    public dynamic class mc_progress3 extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//mc_request

package 
{
    import com.cocolani.panels.request_window;

    public dynamic class mc_request extends request_window 
    {


    }
}//package 

//------------------------------------------------------------
//menu_popup_bt

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class menu_popup_bt extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//menu_popup_icon

package 
{
    import flash.display.MovieClip;

    public dynamic class menu_popup_icon extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//panel_close

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class panel_close extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//requestpopup_no

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class requestpopup_no extends simplebutton 
    {

        public function requestpopup_no()
        {
            addFrameScript(0, frame1, 1, frame2, 2, frame3);
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
//requestpopup_yes

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class requestpopup_yes extends simplebutton 
    {

        public function requestpopup_yes()
        {
            addFrameScript(0, frame1, 1, frame2, 2, frame3);
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

