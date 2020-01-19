// Decompiled by AS3 Sorcerer 5.72
// www.as3sorcerer.com

//------------------------------------------------------------
//com.novelgames.flashgames.common.Game

package com.novelgames.flashgames.common
{
    import flash.display.MovieClip;
    import flash.display.Stage;

    public class Game extends MovieClip 
    {

        public static var gameStage:Stage;


        public function pause():void
        {
            NewTimer.pause();
        }

        public function destroy():*
        {
        }

        public function unpause():void
        {
            NewTimer.unpause();
        }


    }
}//package com.novelgames.flashgames.common

//------------------------------------------------------------
//com.novelgames.flashgames.common.Instructions

package com.novelgames.flashgames.common
{
    import flash.display.MovieClip;

    public class Instructions extends MovieClip 
    {

        private var shownFromGame:Boolean;

        public function Instructions(_arg_1:Boolean=false)
        {
            this.shownFromGame = _arg_1;
        }

    }
}//package com.novelgames.flashgames.common

//------------------------------------------------------------
//com.novelgames.flashgames.common.InstructionsButton

package com.novelgames.flashgames.common
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.events.*;
    import flash.display.*;

    public class InstructionsButton extends MovieClip 
    {

        public function InstructionsButton()
        {
            super();
            this.buttonMode = true;
            this.addEventListener(MouseEvent.CLICK, function ():void
            {
                Object(parent.parent).showInstructionsFromGame();
            });
        }

    }
}//package com.novelgames.flashgames.common

//------------------------------------------------------------
//com.novelgames.flashgames.common.MainDevelopment

package com.novelgames.flashgames.common
{
    import flash.display.MovieClip;
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import flash.media.*;
    import flash.events.*;
    import flash.display.*;

    public class MainDevelopment extends MovieClip 
    {

        private var thisref:*;
        public var title:Title;
        private var instructions:Instructions;
        public var game:Game;
        private var musicGame:Sound;
        private var musicGameSoundChannel:SoundChannel;
        public var highScoreContainer:*;
        private var legitHosting:Boolean;
        private var titleIndex:int;
        public var gameID:* = -1;
        internal var seperator:*;
        internal var seperator2:*;

        public function MainDevelopment()
        {
            this.thisref = this;
            this.seperator = String.fromCharCode(1);
            this.seperator2 = String.fromCharCode(2);
            super();
            stop();
            this.thisref.outerFrame.bt_close.addEventListener(MouseEvent.CLICK, this.closeme);
            this.gotoTitlePage();
        }

        public function GAMELOADED():*
        {
            trace("GAME LOADED SUCCESSFULLY");
        }

        public function setGameID(_arg_1:Number):*
        {
            this.gameID = _arg_1;
            this.legitHosting = this.thisref.parent.parent.gamesAS3Connector("GAMELOADED", this.gameID);
        }

        public function closeme(_arg_1:MouseEvent):*
        {
            trace("Closing");
            this.thisref.parent.parent.gamesAS3Connector("SHUTDOWN");
        }

        public function gotoTitlePage():void
        {
            this.removePage();
            this.title = this.getTitle();
            this.addChildAt(this.title, 0);
        }

        public function gotoInstructionsPage():void
        {
            if (this.legitHosting)
            {
                this.removePage();
                this.instructions = this.getInstructions();
                this.addChildAt(this.instructions, 0);
                this.instructions["startButton"].addEventListener(MouseEvent.CLICK, this.inGameInstructionsStartClicked);
            };
        }

        private function inGameInstructionsStartClicked(_arg_1:MouseEvent):*
        {
            this.instructions["startButton"].removeEventListener(MouseEvent.CLICK, this.inGameInstructionsStartClicked);
            this.gotoGamePage();
        }

        public function gotoGamePage():void
        {
            if (this.legitHosting)
            {
                Game.gameStage = stage;
                this.removePage();
                this.game = this.getGame();
                this.game["helpButton"].addEventListener(MouseEvent.CLICK, this.showInstructionsFromGame);
                this.addChildAt(this.game, 0);
                this.musicGame = this.getMusicGame();
                if (this.musicGame)
                {
                    this.musicGameSoundChannel = this.musicGame.play(0, int.MAX_VALUE);
                };
            };
        }

        public function showInstructionsFromGame(_arg_1:MouseEvent):void
        {
            this.game.pause();
            this.game.visible = false;
            this.instructions = this.getInstructions();
            this.addChildAt(this.instructions, (this.titleIndex + 1));
            this.instructions["startButton"].addEventListener(MouseEvent.CLICK, this.hideInstructionsFromGame);
        }

        public function hideInstructionsFromGame(_arg_1:MouseEvent):void
        {
            this.instructions["startButton"].removeEventListener(MouseEvent.CLICK, this.hideInstructionsFromGame);
            this.removeChild(this.instructions);
            this.instructions = null;
            this.game.visible = true;
            this.game.unpause();
        }

        public function showHighScores():void
        {
            var _local_1:* = getDefinitionByName("mc_highscore");
            this.highScoreContainer = addChild(new (_local_1)());
            this.highScoreContainer.x = (((this.highScoreContainer.width / 2) - (600 / 2)) + 30);
            this.highScoreContainer.y = (((this.highScoreContainer.height / 2) - (400 / 2)) + 50);
            this.highScoreContainer.bt_close.addEventListener(MouseEvent.CLICK, this.closeHS);
            this.highScoreContainer.topname.text = "";
            this.highScoreContainer.topscore.text = "";
            this.thisref.parent.parent.gamesAS3Connector("GETSCORES", this.gameID);
        }

        public function sendHack(_arg_1:*):void
        {
            this.thisref.parent.parent.gamesAS3Connector("SENDHACK", this.gameID, _arg_1);
        }

        public function closeHS(_arg_1:MouseEvent):*
        {
            removeChild(this.highScoreContainer);
            this.highScoreContainer = undefined;
        }

        public function sendResponse(_arg_1:Object):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            if (((_arg_1.hs) && (this.highScoreContainer)))
            {
                _local_2 = _arg_1.hs.split(this.seperator2);
                _local_3 = "";
                _local_4 = "";
                _local_5 = 0;
                while (_local_5 < _local_2.length)
                {
                    _local_6 = _local_2[_local_5].split(this.seperator);
                    _local_4 = ((_local_4 + _local_6[0]) + "\n");
                    _local_3 = ((_local_3 + _local_6[1]) + "\n");
                    _local_5++;
                };
                this.highScoreContainer.topname.text = _local_4;
                this.highScoreContainer.topscore.text = _local_3;
            };
        }

        public function showEnterHighScore(_arg_1:int, _arg_2:Boolean):void
        {
            this.thisref.parent.parent.gamesAS3Connector("HIGHSCORE", _arg_1, _arg_2, this.gameID);
        }

        protected function getTitle():Title
        {
            return (null);
        }

        protected function getGame():Game
        {
            return (null);
        }

        protected function getInstructions():Instructions
        {
            return (null);
        }

        protected function getMusicGame():Sound
        {
            return (null);
        }

        private function removePage():void
        {
            if (this.title)
            {
                removeChild(this.title);
                this.title = null;
            };
            if (this.instructions)
            {
                removeChild(this.instructions);
                this.instructions = null;
            };
            if (this.game)
            {
                this.game.unpause();
                removeChild(this.game);
                this.game = null;
            };
            if (this.musicGame)
            {
                this.musicGameSoundChannel.stop();
                this.musicGame = null;
                this.musicGameSoundChannel = null;
            };
        }


    }
}//package com.novelgames.flashgames.common

//------------------------------------------------------------
//com.novelgames.flashgames.common.MuteButton

package com.novelgames.flashgames.common
{
    import flash.display.MovieClip;
    import flash.media.SoundTransform;
    import flash.media.SoundMixer;
    import flash.events.MouseEvent;

    public class MuteButton extends MovieClip 
    {

        private var gameSoundTransform:SoundTransform;

        public function MuteButton()
        {
            if (SoundMixer.soundTransform.volume == 0)
            {
                this.showOff();
            }
            else
            {
                this.showOn();
            };
            this.addEventListener(MouseEvent.CLICK, this.buttonClicked);
            this.buttonMode = true;
        }

        private function buttonClicked(_arg_1:MouseEvent):void
        {
            var _local_2:SoundTransform = new SoundTransform();
            if (SoundMixer.soundTransform.volume == 0)
            {
                _local_2.volume = 1;
                SoundMixer.soundTransform = _local_2;
                this.showOn();
            }
            else
            {
                _local_2.volume = 0;
                SoundMixer.soundTransform = _local_2;
                this.showOff();
            };
        }

        private function showOff():void
        {
            gotoAndStop("off");
        }

        private function showOn():void
        {
            gotoAndStop("on");
        }


    }
}//package com.novelgames.flashgames.common

//------------------------------------------------------------
//com.novelgames.flashgames.common.NewSound

package com.novelgames.flashgames.common
{
    import flash.media.Sound;
    import flash.media.SoundTransform;
    import flash.media.SoundChannel;

    public class NewSound extends Sound 
    {

        private static var __soundTransform:SoundTransform;


        public static function get soundTransform():SoundTransform
        {
            if (!__soundTransform)
            {
                __soundTransform = new SoundTransform();
            };
            return (__soundTransform);
        }


        override public function play(_arg_1:Number=0, _arg_2:int=0, _arg_3:SoundTransform=null):SoundChannel
        {
            return (super.play(0, 0, __soundTransform));
        }


    }
}//package com.novelgames.flashgames.common

//------------------------------------------------------------
//com.novelgames.flashgames.common.NewTimer

package com.novelgames.flashgames.common
{
    import flash.utils.Timer;
    import flash.utils.getTimer;
    import flash.events.TimerEvent;
    import flash.events.*;
    import flash.utils.*;

    public class NewTimer extends Timer 
    {

        private static var paused:Boolean = false;
        private static var pauseTime:int;
        private static var totalPausedTime:int = 0;
        private static var timers:Array = [];

        private var originalDelay:int;
        private var originalRepeatCount:int;
        private var listener:Function;
        private var adjustedStartTime:int;
        private var arrListeners:Array;

        public function NewTimer(_arg_1:Number, _arg_2:int=0):void
        {
            super(_arg_1, _arg_2);
            timers.push(this);
            this.originalDelay = _arg_1;
            this.originalRepeatCount = _arg_2;
        }

        public static function getTimer():int
        {
            if (paused)
            {
                return (pauseTime - totalPausedTime);
            };
            return (flash.utils.getTimer() - totalPausedTime);
        }

        public static function pause():void
        {
            if (paused)
            {
                return;
            };
            paused = true;
            pauseTime = flash.utils.getTimer();
        }

        public static function unpause():void
        {
            if (!paused)
            {
                return;
            };
            paused = false;
            totalPausedTime = (totalPausedTime + (flash.utils.getTimer() - pauseTime));
        }


        public function destroySelf():*
        {
            var _local_1:Number;
            if (this.arrListeners)
            {
                trace("arr listeners exist!");
                _local_1 = 0;
                while (_local_1 < this.arrListeners.length)
                {
                    trace(("Destroying ... " + _local_1));
                    trace(("type" + this.arrListeners[_local_1]));
                    if (this.hasEventListener(this.arrListeners[_local_1].type))
                    {
                        trace("Attempting removal..");
                        this.removeEventListener(this.arrListeners[_local_1].type, this.arrListeners[_local_1].listener);
                    };
                    _local_1++;
                };
            };
            this.arrListeners = null;
            if (super.hasEventListener(TimerEvent.TIMER))
            {
                super.removeEventListener(TimerEvent.TIMER, this.timerEventListener);
            };
        }

        override public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false, _arg_4:int=0, _arg_5:Boolean=true):void
        {
            if (_arg_1 != TimerEvent.TIMER)
            {
                this.arrListeners.push({
                    "type":_arg_1,
                    "listener":_arg_2
                });
                super.addEventListener(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
                return;
            };
            this.listener = _arg_2;
            super.addEventListener(_arg_1, this.timerEventListener);
        }

        override public function start():void
        {
            this.adjustedStartTime = NewTimer.public::getTimer();
            pauseTime = this.adjustedStartTime;
            totalPausedTime = 0;
            paused = false;
            super.start();
        }

        private function timerEventListener(_arg_1:TimerEvent):void
        {
            if (paused)
            {
                stop();
                delay = Math.max((this.originalDelay - (NewTimer.public::getTimer() - this.adjustedStartTime)), 1);
                if (this.originalRepeatCount > 0)
                {
                    repeatCount++;
                };
                super.start();
                return;
            };
            if ((NewTimer.public::getTimer() - this.adjustedStartTime) >= this.originalDelay)
            {
                this.adjustedStartTime = NewTimer.public::getTimer();
                if (delay != this.originalDelay)
                {
                    stop();
                    delay = this.originalDelay;
                    super.start();
                };
                this.listener(_arg_1);
            }
            else
            {
                stop();
                delay = Math.max((this.originalDelay - (NewTimer.public::getTimer() - this.adjustedStartTime)), 1);
                if (this.originalRepeatCount > 0)
                {
                    repeatCount++;
                };
                super.start();
            };
        }


    }
}//package com.novelgames.flashgames.common

//------------------------------------------------------------
//com.novelgames.flashgames.common.Title

package com.novelgames.flashgames.common
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.events.*;
    import flash.display.*;
    import flash.net.*;

    public class Title extends MovieClip 
    {

        public function Title()
        {
            getChildByName("startButton").addEventListener(MouseEvent.CLICK, this.startButtonClicked);
            getChildByName("highScoresButton").addEventListener(MouseEvent.CLICK, this.highScoresButtonClicked);
            getChildByName("exitButton").addEventListener(MouseEvent.CLICK, this.exitButtonClicked);
        }

        private function startButtonClicked(_arg_1:MouseEvent):void
        {
            Object(parent).gotoInstructionsPage();
        }

        private function highScoresButtonClicked(_arg_1:MouseEvent):void
        {
            Object(parent).showHighScores();
        }

        private function exitButtonClicked(_arg_1:Event):void
        {
            Object(parent).closeme(_arg_1);
        }


    }
}//package com.novelgames.flashgames.common

//------------------------------------------------------------
//com.novelgames.flashgames.goldfishing.Config

package com.novelgames.flashgames.goldfishing
{
    public class Config 
    {

        public static var HOOK_INITIALLENGTH:Number = 20;
        public static var HOOK_MAXANGLE:Number = 60;
        public static var HOOK_PERIOD:int = 3000;
        public static var HOOK_SHOOTSPEED:Number = 500;
        public static var HOOK_RETURNSPEED:Number = 500;
        public static var GOLD_MINSCALE:Number = 1;
        public static var GOLD_MAXSCALE:Number = 3;
        public static var GOLD_MINVALUE:int = 10;
        public static var GOLD_MAXVALUE:int = 1000;
        public static var GOLD_MINRETURNSPEED:Number = 20;
        public static var GOLD_MAXRETURNSPEED:Number = 200;
        public static var GOLD_MINDISTANCE:Number = 100;
        public static var STONE_MINSCALE:Number = 1;
        public static var STONE_MAXSCALE:Number = 2;
        public static var STONE_MINVALUE:int = 1;
        public static var STONE_MAXVALUE:int = 10;
        public static var STONE_MINRETURNSPEED:Number = 20;
        public static var STONE_MAXRETURNSPEED:Number = 200;
        public static var STONE_MINDISTANCE:Number = 100;
        public static var LEVEL_INITIALTARGET:int = 1000;
        public static var LEVEL_TARGETINCREASE:int = 1000;
        public static var LEVEL_INITIALTIME:int = 30;
        public static var LEVEL_TIMEINCREASE:int = 8;
        public static var LEVEL_INITIALGOLDS:int = 5;
        public static var LEVEL_GOLDSINCREASE:int = 2;
        public static var LEVEL_INITIALSTONES:int = 2;
        public static var LEVEL_STONESINCREASE:int = 1;
        public static var LEVEL_INITIALTOTALVALUE:int = 2000;
        public static var LEVEL_TOTALVALUEINCREASE:int = 1000;
        public static var VALUEPOPUP_MOVETIME:int = 1000;
        public static var VALUEPOPUP_STARTDISAPPEARTIME:int = 750;
        public static var VALUEPOPUP_MOVEHEIGHT:Number = 50;
        public static var MESSAGE_LEVELTIME:int = 2000;
        public static var MESSAGE_LEVELCLEARTIME:int = 1500;
        public static var MESSAGE_GAMEOVERTIME:int = 1500;


    }
}//package com.novelgames.flashgames.goldfishing

//------------------------------------------------------------
//com.novelgames.flashgames.goldfishing.Game

package com.novelgames.flashgames.goldfishing
{
    import com.novelgames.flashgames.common.Game;
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.utils.Timer;
    import flash.media.Sound;
    import __AS3__.vec.Vector;
    import com.novelgames.flashgames.common.NewTimer;
    import flash.events.TimerEvent;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import flash.media.*;
    import flash.events.*;
    import com.novelgames.flashgames.common.*;
    import flash.utils.*;
    import flash.display.*;
    import flash.text.*;
    import __AS3__.vec.*;

    public class Game extends com.novelgames.flashgames.common.Game 
    {

        public var thingsHolder:MovieClip;
        public var helpButton:SimpleButton;
        public var clickDetector:MovieClip;
        public var hook:Hook;
        public var targetText:TextField;
        public var timeText:TextField;
        public var valuesHolder:MovieClip;
        public var man:MovieClip;
        public var message:Message;
        public var currentText:TextField;
        private var thisref:*;
        private var level:int;
        private var levelTime:int;
        private var __current:int;
        private var __target:int;
        private var __time:int;
        public var score:int;
        private var things:Array;
        private var hookedThing:Thing;
        private var hookedThingOffsetX:Number;
        private var hookedThingOffsetY:Number;
        private var startTime:int;
        private var timer:Timer;
        private var soundShoot:Sound;
        private var soundCatch:Sound;
        private var soundAward:Sound;
        private var soundClear:Sound;
        private var soundGameOver:Sound;
        public var lookup:Array;
        public var revsc:Vector.<uint>;

        public function Game()
        {
            this.thisref = this;
            this.lookup = new Array();
            this.revsc = new Vector.<uint>();
            super();
            this.initLookup();
            this.thisref = this;
            this.score = 0;
            this.setRev(this.score);
            this.startLevel(1);
            this.soundShoot = new SoundShoot();
            this.soundCatch = new SoundCatch();
            this.soundAward = new SoundAward();
            this.soundClear = new SoundClear();
            this.soundGameOver = new SoundGameOver();
        }

        private function initLookup():*
        {
            var _local_2:*;
            var _local_1:* = 0;
            while (_local_1 < 10)
            {
                _local_2 = new <uint>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
                this.rndmVector(_local_2);
                this.lookup.push(_local_2);
                _local_1++;
            };
        }

        public function set current(_arg_1:int):void
        {
            this.__current = _arg_1;
            this.currentText.text = _arg_1.toString();
        }

        public function get current():int
        {
            return (this.__current);
        }

        public function set target(_arg_1:int):void
        {
            this.__target = _arg_1;
            this.targetText.text = _arg_1.toString();
        }

        public function get target():int
        {
            return (this.__target);
        }

        public function set time(_arg_1:int):void
        {
            this.__time = _arg_1;
            this.timeText.text = _arg_1.toString();
        }

        public function get time():int
        {
            return (this.__time);
        }

        private function startLevel(_arg_1:int):void
        {
            this.level = _arg_1;
            this.levelTime = (Config.LEVEL_INITIALTIME + ((_arg_1 - 1) * Config.LEVEL_TIMEINCREASE));
            this.current = 0;
            this.target = (Config.LEVEL_INITIALTARGET + ((_arg_1 - 1) * Config.LEVEL_TARGETINCREASE));
            this.time = this.levelTime;
            this.hook.initialize();
            this.createThings();
            this.message.showLevel(_arg_1);
            this.timer = new NewTimer(Config.MESSAGE_LEVELTIME, 1);
            this.timer.addEventListener(TimerEvent.TIMER, this.startPlay);
            this.timer.start();
        }

        private function createThings():void
        {
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:int;
            var _local_11:Thing;
            var _local_12:int;
            var _local_1:int = (Config.LEVEL_INITIALGOLDS + ((this.level - 1) * Config.LEVEL_GOLDSINCREASE));
            var _local_2:int = (Config.LEVEL_INITIALSTONES + ((this.level - 1) * Config.LEVEL_STONESINCREASE));
            var _local_3:int = (Config.LEVEL_INITIALTOTALVALUE + ((this.level - 1) * Config.LEVEL_TOTALVALUEINCREASE));
            var _local_4:Array = this.generateGoldValues(_local_1, _local_3);
            if (this.things)
            {
                _local_12 = 0;
                while (_local_12 < this.things.length)
                {
                    this.thingsHolder.removeChild(this.things[_local_12]);
                    _local_12++;
                };
            };
            this.things = new Array();
            _local_12 = 0;
            while (_local_12 < _local_2)
            {
                _local_5 = (-(Config.HOOK_MAXANGLE) + ((Math.random() * Config.HOOK_MAXANGLE) * 2));
                _local_6 = this.getMaxDistance(_local_5);
                _local_7 = (Config.STONE_MINDISTANCE + (Math.random() * (_local_6 - Config.STONE_MINDISTANCE)));
                _local_8 = (this.hook.x - (_local_7 * Math.sin(((_local_5 * Math.PI) / 180))));
                _local_9 = (this.hook.y + (_local_7 * Math.cos(((_local_5 * Math.PI) / 180))));
                _local_10 = (Config.STONE_MINVALUE + Math.floor((Math.random() * ((Config.STONE_MAXVALUE - Config.STONE_MINVALUE) + 1))));
                _local_11 = new Thing();
                _local_11.initialize(Thing.TYPE_STONE, _local_10, _local_8, _local_9);
                this.things.push(_local_11);
                this.thingsHolder.addChild(_local_11);
                _local_12++;
            };
            _local_12 = 0;
            while (_local_12 < _local_1)
            {
                _local_5 = (-(Config.HOOK_MAXANGLE) + ((Math.random() * Config.HOOK_MAXANGLE) * 2));
                _local_6 = this.getMaxDistance(_local_5);
                _local_7 = (Config.GOLD_MINDISTANCE + (Math.random() * (_local_6 - Config.GOLD_MINDISTANCE)));
                _local_8 = (this.hook.x - (_local_7 * Math.sin(((_local_5 * Math.PI) / 180))));
                _local_9 = (this.hook.y + (_local_7 * Math.cos(((_local_5 * Math.PI) / 180))));
                _local_11 = new Thing();
                _local_11.initialize(Thing.TYPE_GOLD, _local_4[_local_12], _local_8, _local_9);
                this.things.push(_local_11);
                this.thingsHolder.addChild(_local_11);
                _local_12++;
            };
        }

        private function generateGoldValues(_arg_1:int, _arg_2:int):Array
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_3:Array = new Array();
            _local_8 = 0;
            while (_local_8 < _arg_1)
            {
                _local_3[_local_8] = 0;
                _local_8++;
            };
            _local_4 = _arg_2;
            _local_5 = _arg_1;
            _local_8 = 0;
            while (_local_8 < _arg_1)
            {
                _local_6 = Math.max(Config.GOLD_MINVALUE, (_local_4 - (Config.GOLD_MAXVALUE * (_local_5 - 1))));
                _local_7 = Math.min(Config.GOLD_MAXVALUE, (_local_4 - (Config.GOLD_MINVALUE * (_local_5 - 1))));
                _local_3[_local_8] = (_local_6 + Math.floor((Math.random() * ((_local_7 - _local_6) + 1))));
                _local_4 = (_local_4 - _local_3[_local_8]);
                _local_5--;
                _local_8++;
            };
            return (_local_3);
        }

        private function getMaxDistance(_arg_1:Number):Number
        {
            var _local_2:Number;
            if (_arg_1 > 0)
            {
                _local_2 = ((Math.atan2(this.hook.x, (400 - this.hook.y)) * 180) / Math.PI);
                if (_arg_1 < _local_2)
                {
                    return ((400 - this.hook.y) / Math.cos(((_arg_1 * Math.PI) / 180)));
                };
                return (this.hook.x / Math.sin(((_arg_1 * Math.PI) / 180)));
            };
            _local_2 = ((Math.atan2((this.hook.x - 600), (400 - this.hook.y)) * 180) / Math.PI);
            if (_arg_1 > _local_2)
            {
                return ((400 - this.hook.y) / Math.cos(((_arg_1 * Math.PI) / 180)));
            };
            return ((this.hook.x - 600) / Math.sin(((_arg_1 * Math.PI) / 180)));
        }

        private function startPlay(_arg_1:TimerEvent):void
        {
            this.message.hide();
            this.clickDetector.addEventListener(MouseEvent.MOUSE_DOWN, this.startShoot);
            this.startTime = NewTimer.getTimer();
            this.hook.startSwinging(this.startTime);
            this.timer = new NewTimer(1, 0);
            this.timer.addEventListener(TimerEvent.TIMER, this.onSwingTime);
            this.timer.start();
        }

        private function onSwingTime(_arg_1:TimerEvent):void
        {
            var _local_2:int = NewTimer.getTimer();
            _arg_1.updateAfterEvent();
            this.hook.swing(_local_2);
            this.updateTime(_local_2);
        }

        private function updateTime(_arg_1:int):void
        {
            this.time = (this.levelTime - Math.floor(((_arg_1 - this.startTime) / 1000)));
            if (this.time <= 0)
            {
                this.clickDetector.removeEventListener(MouseEvent.MOUSE_DOWN, this.startShoot);
                this.timer.stop();
                if (this.current >= this.target)
                {
                    this.message.showLevelClear();
                    this.timer = new NewTimer(Config.MESSAGE_LEVELCLEARTIME, 1);
                    this.timer.addEventListener(TimerEvent.TIMER, this.startNextLevel);
                    this.timer.start();
                    if (this.thisref.stage.getChildAt(0).mc_interface.audio.audioMain)
                    {
                        this.soundClear.play();
                    };
                }
                else
                {
                    this.message.showGameOver();
                    this.timer = new NewTimer(Config.MESSAGE_GAMEOVERTIME, 1);
                    this.timer.addEventListener(TimerEvent.TIMER, this.showPlayAgain);
                    this.timer.start();
                    if (this.checkRev(this.score))
                    {
                        Object(parent).showEnterHighScore(this.score, false);
                    }
                    else
                    {
                        Object(parent).sendHack(this.score);
                    };
                    if (this.thisref.stage.getChildAt(0).mc_interface.audio.audioMain)
                    {
                        this.soundGameOver.play();
                    };
                };
            };
        }

        private function startShoot(_arg_1:MouseEvent):void
        {
            var _local_2:int = NewTimer.getTimer();
            this.clickDetector.removeEventListener(MouseEvent.MOUSE_DOWN, this.startShoot);
            this.timer.stop();
            this.hook.startShoot(_local_2, this.getMaxDistance(this.hook.angle));
            this.timer = new NewTimer(1, 0);
            this.timer.addEventListener(TimerEvent.TIMER, this.onShootTime);
            this.timer.start();
            if (this.thisref.stage.getChildAt(0).mc_interface.audio.audioMain)
            {
                this.soundShoot.play();
            };
        }

        private function onShootTime(_arg_1:TimerEvent):void
        {
            var _local_3:Boolean;
            var _local_4:Number;
            var _local_2:int = NewTimer.getTimer();
            _arg_1.updateAfterEvent();
            _local_3 = this.hook.shoot(_local_2);
            this.hookedThing = this.getHookedThing();
            if (this.hookedThing)
            {
                _local_4 = this.getReturnSpeed(this.hookedThing);
                this.hook.startReturn(_local_2, _local_4);
                this.timer.stop();
                this.timer = new NewTimer(1, 0);
                this.timer.addEventListener(TimerEvent.TIMER, this.onReturnTime);
                this.timer.start();
                this.updateTime(_local_2);
                if (this.thisref.stage.getChildAt(0).mc_interface != null)
                {
                    if (this.thisref.stage.getChildAt(0).mc_interface.audio.audioMain)
                    {
                        this.soundCatch.play();
                    };
                };
            }
            else
            {
                if (_local_3)
                {
                    this.hook.startReturn(_local_2, Config.HOOK_RETURNSPEED);
                    this.timer.stop();
                    this.timer = new NewTimer(1, 0);
                    this.timer.addEventListener(TimerEvent.TIMER, this.onReturnTime);
                    this.timer.start();
                    this.updateTime(_local_2);
                };
            };
        }

        private function getHookedThing():Thing
        {
            var _local_2:int;
            var _local_1:Point = this.hook.localToGlobal(new Point(this.hook.hook.x, this.hook.hook.y));
            _local_2 = 0;
            while (_local_2 < this.things.length)
            {
                if (this.things[_local_2].visible)
                {
                    if (this.things[_local_2].hitTestPoint(_local_1.x, _local_1.y, true))
                    {
                        this.hookedThing = this.things[_local_2];
                        this.hookedThingOffsetX = (this.hookedThing.x - _local_1.x);
                        this.hookedThingOffsetY = (this.hookedThing.y - _local_1.y);
                        return (this.hookedThing);
                    };
                };
                _local_2++;
            };
            return (null);
        }

        private function getReturnSpeed(_arg_1:Thing):Number
        {
            var _local_2:Number;
            if (_arg_1.type == Thing.TYPE_GOLD)
            {
                _local_2 = ((_arg_1.value - Config.GOLD_MINVALUE) / (Config.GOLD_MAXVALUE - Config.GOLD_MINVALUE));
                return (Config.GOLD_MAXRETURNSPEED - (_local_2 * (Config.GOLD_MAXRETURNSPEED - Config.GOLD_MINRETURNSPEED)));
            };
            _local_2 = ((_arg_1.value - Config.STONE_MINVALUE) / (Config.STONE_MAXVALUE - Config.STONE_MINVALUE));
            return (Config.STONE_MAXRETURNSPEED - (_local_2 * (Config.STONE_MAXRETURNSPEED - Config.STONE_MINRETURNSPEED)));
        }

        private function onReturnTime(_arg_1:TimerEvent):void
        {
            var _local_3:Point;
            var _local_4:Boolean;
            var _local_2:int = NewTimer.getTimer();
            _arg_1.updateAfterEvent();
            _local_4 = this.hook.returnHook(_local_2);
            _local_3 = this.hook.localToGlobal(new Point(this.hook.hook.x, this.hook.hook.y));
            if (this.hookedThing)
            {
                this.hookedThing.x = (_local_3.x + this.hookedThingOffsetX);
                this.hookedThing.y = (_local_3.y + this.hookedThingOffsetY);
            };
            if (_local_4)
            {
                if (this.hookedThing)
                {
                    this.hookedThing.visible = false;
                    this.current = (this.current + this.hookedThing.value);
                    if (this.checkRev(this.score))
                    {
                        this.score = (this.score + this.hookedThing.value);
                        this.setRev(this.score);
                    }
                    else
                    {
                        Object(parent).sendHack(this.score);
                    };
                    this.showValuePopup(this.hookedThing.x, this.hookedThing.y, this.hookedThing.value);
                };
                this.clickDetector.addEventListener(MouseEvent.MOUSE_DOWN, this.startShoot);
                this.hook.startSwinging(_local_2);
                this.timer.stop();
                this.timer = new NewTimer(1, 0);
                this.timer.addEventListener(TimerEvent.TIMER, this.onSwingTime);
                this.timer.start();
                this.updateTime(_local_2);
                if (this.hookedThing)
                {
                    if (this.thisref.stage.getChildAt(0).mc_interface.audio.audioMain)
                    {
                        this.soundAward.play();
                    };
                };
            }
            else
            {
                this.updateTime(_local_2);
            };
        }

        private function showValuePopup(_arg_1:Number, _arg_2:Number, _arg_3:int):void
        {
            var _local_4:ValuePopup = new ValuePopup();
            _local_4.initialize(_arg_1, _arg_2, _arg_3);
            this.valuesHolder.addChild(_local_4);
        }

        private function startNextLevel(_arg_1:TimerEvent):void
        {
            this.startLevel((this.level + 1));
        }

        private function showPlayAgain(_arg_1:TimerEvent):void
        {
            this.message.showPlayAgain();
        }

        private function rndmVector(_arg_1:*):*
        {
            _arg_1 = _arg_1.sort(this.sortRndm);
        }

        private function sortRndm(_arg_1:*, _arg_2:*):*
        {
            return (Math.floor((Math.random() * 2)) - 1);
        }

        private function setRev(_arg_1:*):*
        {
            var _local_3:*;
            var _local_4:*;
            _arg_1 = String(_arg_1);
            this.revsc = new Vector.<uint>(0);
            var _local_2:* = 0;
            while (_local_2 < _arg_1.length)
            {
                _local_3 = this.getIndex(_local_2);
                _local_4 = 0;
                while (_local_4 < this.lookup[_local_3].length)
                {
                    if (this.lookup[_local_3][_local_4] == Number(_arg_1.charAt(_local_2)))
                    {
                        this.revsc[_local_2] = _local_4;
                        break;
                    };
                    _local_4++;
                };
                _local_2++;
            };
        }

        private function getIndex(_arg_1:*):*
        {
            var _local_2:* = 0;
            _local_2 = Math.floor((_arg_1 % 10));
            if ((_arg_1 % 2) == 1)
            {
                _local_2 = (_local_2 * 2);
            };
            if (_local_2 > 9)
            {
                _local_2 = (_local_2 - 10);
            };
            return (_local_2);
        }

        private function checkRev(_arg_1:*):*
        {
            var _local_4:*;
            _arg_1 = String(_arg_1);
            var _local_2:* = true;
            var _local_3:* = 0;
            while (_local_3 < _arg_1.length)
            {
                _local_4 = this.getIndex(_local_3);
                if (this.lookup[_local_4][this.revsc[_local_3]] != Number(_arg_1.charAt(_local_3)))
                {
                    _local_2 = false;
                    break;
                };
                _local_3++;
            };
            return (_local_2);
        }


    }
}//package com.novelgames.flashgames.goldfishing

//------------------------------------------------------------
//com.novelgames.flashgames.goldfishing.Hook

package com.novelgames.flashgames.goldfishing
{
    import flash.display.MovieClip;

    public class Hook extends MovieClip 
    {

        public var hook:MovieClip;
        public var angle:Number;
        public var period:Number;
        public var length:Number;
        private var startTime:int;
        private var startPeriod:Number;
        private var startLength:int;
        private var returnSpeed:Number;
        private var maxLength:Number;


        public function initialize():void
        {
            this.angle = 0;
            this.period = 0;
            this.length = Config.HOOK_INITIALLENGTH;
            this.hook.y = this.length;
            this.rotation = this.angle;
        }

        public function startSwinging(_arg_1:int):void
        {
            this.startTime = _arg_1;
            this.startPeriod = this.period;
        }

        public function swing(_arg_1:int):void
        {
            var _local_2:int = (_arg_1 - this.startTime);
            this.period = ((this.startPeriod + (_local_2 / Config.HOOK_PERIOD)) % Config.HOOK_PERIOD);
            this.angle = (Math.sin(((this.period * Math.PI) * 2)) * Config.HOOK_MAXANGLE);
            this.rotation = this.angle;
        }

        public function startShoot(_arg_1:int, _arg_2:Number):void
        {
            this.startTime = _arg_1;
            this.maxLength = _arg_2;
        }

        public function shoot(_arg_1:int):Boolean
        {
            this.length = (Config.HOOK_INITIALLENGTH + ((Config.HOOK_SHOOTSPEED * (_arg_1 - this.startTime)) / 1000));
            if (this.length > this.maxLength)
            {
                this.length = this.maxLength;
            };
            this.hook.y = this.length;
            return (this.length >= this.maxLength);
        }

        public function startReturn(_arg_1:int, _arg_2:Number):void
        {
            this.startTime = _arg_1;
            this.startLength = this.length;
            this.returnSpeed = _arg_2;
        }

        public function returnHook(_arg_1:int):Boolean
        {
            this.length = (this.startLength - ((this.returnSpeed * (_arg_1 - this.startTime)) / 1000));
            if (this.length < 0)
            {
                this.length = 0;
            };
            this.hook.y = this.length;
            return (this.length <= 0);
        }


    }
}//package com.novelgames.flashgames.goldfishing

//------------------------------------------------------------
//com.novelgames.flashgames.goldfishing.Instructions

package com.novelgames.flashgames.goldfishing
{
    import com.novelgames.flashgames.common.Instructions;
    import flash.display.SimpleButton;

    public class Instructions extends com.novelgames.flashgames.common.Instructions 
    {

        public var startButton:SimpleButton;


    }
}//package com.novelgames.flashgames.goldfishing

//------------------------------------------------------------
//com.novelgames.flashgames.goldfishing.Main

package com.novelgames.flashgames.goldfishing
{
    import com.novelgames.flashgames.common.MainDevelopment;
    import flash.display.MovieClip;
    import com.novelgames.flashgames.common.Game;
    import com.novelgames.flashgames.common.Instructions;
    import com.novelgames.flashgames.common.Title;

    public class Main extends MainDevelopment 
    {

        public var outerFrame:MovieClip;

        public function Main()
        {
            addFrameScript(0, this.frame1);
        }

        override protected function getGame():com.novelgames.flashgames.common.Game
        {
            return (new com.novelgames.flashgames.goldfishing.Game());
        }

        override protected function getInstructions():com.novelgames.flashgames.common.Instructions
        {
            return (new com.novelgames.flashgames.goldfishing.Instructions());
        }

        override protected function getTitle():com.novelgames.flashgames.common.Title
        {
            return (new com.novelgames.flashgames.goldfishing.Title());
        }

        internal function frame1():*
        {
            stop();
            setGameID(8);
        }


    }
}//package com.novelgames.flashgames.goldfishing

//------------------------------------------------------------
//com.novelgames.flashgames.goldfishing.Message

package com.novelgames.flashgames.goldfishing
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;

    public class Message extends MovieClip 
    {

        public var txtScore:TextField;
        private var messageLevel:MessageLevel;
        private var messagePlayAgain:MessagePlayAgain;

        public function Message()
        {
            this.txtScore.visible = false;
        }

        public function showLevel(_arg_1:int):void
        {
            this.hide();
            gotoAndStop("hide");
            this.messageLevel = new MessageLevel();
            this.messageLevel.levelText.text = _arg_1.toString();
            this.addChild(this.messageLevel);
        }

        public function showLevelClear():void
        {
            this.hide();
            gotoAndStop("levelClear");
        }

        public function showGameOver():void
        {
            this.hide();
            this.txtScore.visible = true;
            this.txtScore.text = Object(parent.parent).game.score;
            gotoAndStop("gameOver");
        }

        public function showPlayAgain():void
        {
            this.messagePlayAgain = new MessagePlayAgain();
            this.messagePlayAgain.playAgainButton.addEventListener(MouseEvent.CLICK, this.playAgainButtonClicked);
            this.messagePlayAgain.homeButton.addEventListener(MouseEvent.CLICK, this.homeButtonClicked);
            this.addChild(this.messagePlayAgain);
        }

        public function hide():void
        {
            if (this.messageLevel)
            {
                this.removeChild(this.messageLevel);
                this.messageLevel = null;
            };
            if (this.messagePlayAgain)
            {
                this.removeChild(this.messagePlayAgain);
                this.messagePlayAgain = null;
            };
        }

        private function playAgainButtonClicked(_arg_1:MouseEvent):void
        {
            Object(parent.parent).gotoGamePage();
        }

        private function homeButtonClicked(_arg_1:MouseEvent):void
        {
            Object(parent.parent).gotoTitlePage();
            this.hide();
            gotoAndStop("hide");
        }


    }
}//package com.novelgames.flashgames.goldfishing

//------------------------------------------------------------
//com.novelgames.flashgames.goldfishing.MessageLevel

package com.novelgames.flashgames.goldfishing
{
    import flash.display.MovieClip;
    import flash.text.TextField;

    public dynamic class MessageLevel extends MovieClip 
    {

        public var levelText:TextField;


    }
}//package com.novelgames.flashgames.goldfishing

//------------------------------------------------------------
//com.novelgames.flashgames.goldfishing.MessagePlayAgain

package com.novelgames.flashgames.goldfishing
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;

    public dynamic class MessagePlayAgain extends MovieClip 
    {

        public var playAgainButton:SimpleButton;
        public var homeButton:SimpleButton;


    }
}//package com.novelgames.flashgames.goldfishing

//------------------------------------------------------------
//com.novelgames.flashgames.goldfishing.SoundAward

package com.novelgames.flashgames.goldfishing
{
    import com.novelgames.flashgames.common.NewSound;

    public dynamic class SoundAward extends NewSound 
    {


    }
}//package com.novelgames.flashgames.goldfishing

//------------------------------------------------------------
//com.novelgames.flashgames.goldfishing.SoundCatch

package com.novelgames.flashgames.goldfishing
{
    import com.novelgames.flashgames.common.NewSound;

    public dynamic class SoundCatch extends NewSound 
    {


    }
}//package com.novelgames.flashgames.goldfishing

//------------------------------------------------------------
//com.novelgames.flashgames.goldfishing.SoundClear

package com.novelgames.flashgames.goldfishing
{
    import com.novelgames.flashgames.common.NewSound;

    public dynamic class SoundClear extends NewSound 
    {


    }
}//package com.novelgames.flashgames.goldfishing

//------------------------------------------------------------
//com.novelgames.flashgames.goldfishing.SoundGameOver

package com.novelgames.flashgames.goldfishing
{
    import com.novelgames.flashgames.common.NewSound;

    public dynamic class SoundGameOver extends NewSound 
    {


    }
}//package com.novelgames.flashgames.goldfishing

//------------------------------------------------------------
//com.novelgames.flashgames.goldfishing.SoundShoot

package com.novelgames.flashgames.goldfishing
{
    import com.novelgames.flashgames.common.NewSound;

    public dynamic class SoundShoot extends NewSound 
    {


    }
}//package com.novelgames.flashgames.goldfishing

//------------------------------------------------------------
//com.novelgames.flashgames.goldfishing.Thing

package com.novelgames.flashgames.goldfishing
{
    import flash.display.MovieClip;

    public class Thing extends MovieClip 
    {

        public static var TYPE_GOLD:int = 1;
        public static var TYPE_STONE:int = 2;

        public var obj:MovieClip;
        public var type:int;
        public var value:int;
        public var subtype:int;


        public function initialize(_arg_1:int, _arg_2:int, _arg_3:Number, _arg_4:Number):void
        {
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:*;
            this.type = _arg_1;
            this.value = _arg_2;
            this.x = _arg_3;
            this.y = _arg_4;
            gotoAndStop(_arg_1);
            rotation = (Math.random() * 360);
            if (_arg_1 == TYPE_GOLD)
            {
                _local_5 = ((_arg_2 - Config.GOLD_MINVALUE) / (Config.GOLD_MAXVALUE - Config.GOLD_MINVALUE));
                _local_6 = (Config.GOLD_MINSCALE + (_local_5 * (Config.GOLD_MAXSCALE - Config.GOLD_MINSCALE)));
                _local_7 = (Math.floor((Math.random() * this.obj.totalFrames)) + 1);
                this.obj.gotoAndStop(_local_7);
            }
            else
            {
                _local_5 = ((_arg_2 - Config.STONE_MINVALUE) / (Config.STONE_MAXVALUE - Config.STONE_MINVALUE));
                _local_6 = (Config.STONE_MINSCALE + (_local_5 * (Config.STONE_MAXSCALE - Config.STONE_MINSCALE)));
            };
            scaleX = _local_6;
            scaleY = _local_6;
        }


    }
}//package com.novelgames.flashgames.goldfishing

//------------------------------------------------------------
//com.novelgames.flashgames.goldfishing.Title

package com.novelgames.flashgames.goldfishing
{
    import com.novelgames.flashgames.common.Title;
    import flash.display.SimpleButton;
    import flash.display.MovieClip;

    public class Title extends com.novelgames.flashgames.common.Title 
    {

        public var startButton:SimpleButton;
        public var exitButton:SimpleButton;
        public var title:MovieClip;
        public var highScoresButton:SimpleButton;


    }
}//package com.novelgames.flashgames.goldfishing

//------------------------------------------------------------
//com.novelgames.flashgames.goldfishing.ValuePopup

package com.novelgames.flashgames.goldfishing
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.utils.Timer;
    import com.novelgames.flashgames.common.NewTimer;
    import flash.events.TimerEvent;

    public class ValuePopup extends MovieClip 
    {

        public var valueText:TextField;
        private var startY:Number;
        private var startTime:int;
        private var timer:Timer;


        public function initialize(_arg_1:Number, _arg_2:Number, _arg_3:int):void
        {
            this.x = _arg_1;
            this.y = _arg_2;
            this.valueText.text = _arg_3.toString();
            this.startY = _arg_2;
            this.startTime = NewTimer.getTimer();
            this.timer = new NewTimer(1, 0);
            this.timer.addEventListener(TimerEvent.TIMER, this.onTime);
            this.timer.start();
        }

        private function onTime(_arg_1:TimerEvent):void
        {
            var _local_4:Number;
            var _local_2:int = NewTimer.getTimer();
            var _local_3:Number = ((_local_2 - this.startTime) / Config.VALUEPOPUP_MOVETIME);
            if (_local_3 > 1)
            {
                _local_3 = 1;
            };
            _arg_1.updateAfterEvent();
            y = (this.startY - (_local_3 * Config.VALUEPOPUP_MOVEHEIGHT));
            _local_4 = (((_local_2 - this.startTime) - Config.VALUEPOPUP_STARTDISAPPEARTIME) / (Config.VALUEPOPUP_MOVETIME - Config.VALUEPOPUP_STARTDISAPPEARTIME));
            if (_local_4 > 1)
            {
                _local_4 = 1;
            };
            if (_local_4 > 0)
            {
                alpha = (1 - _local_4);
            };
            if (_local_3 >= 1)
            {
                this.timer.stop();
                parent.removeChild(this);
            };
        }


    }
}//package com.novelgames.flashgames.goldfishing

//------------------------------------------------------------
//crystal_caves_ar_fla.gameover_restart_hoverc_59

package crystal_caves_ar_fla
{
    import flash.display.MovieClip;

    public dynamic class gameover_restart_hoverc_59 extends MovieClip 
    {

        public function gameover_restart_hoverc_59()
        {
            addFrameScript(5, this.frame6);
        }

        internal function frame6():*
        {
            stop();
        }


    }
}//package crystal_caves_ar_fla

//------------------------------------------------------------
//crystal_caves_ar_fla.stoneGraphic_65

package crystal_caves_ar_fla
{
    import flash.display.MovieClip;

    public dynamic class stoneGraphic_65 extends MovieClip 
    {

        public var thisref:*;
        public var rand:*;

        public function stoneGraphic_65()
        {
            addFrameScript(0, this.frame1);
        }

        internal function frame1():*
        {
            this.thisref = this;
            this.rand = (Math.floor((Math.random() * totalFrames)) + 1);
            gotoAndStop(this.rand);
        }


    }
}//package crystal_caves_ar_fla

//------------------------------------------------------------
//mc_highscore

package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.SimpleButton;

    public dynamic class mc_highscore extends MovieClip 
    {

        public var topname:TextField;
        public var bt_close:SimpleButton;
        public var topscore:TextField;


    }
}//package 

