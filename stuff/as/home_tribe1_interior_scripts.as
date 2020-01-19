// Decompiled by AS3 Sorcerer 5.72
// www.as3sorcerer.com

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
                trace("this is a furntiure item.");
                this.sceneRef.commonSceneObjClick(this.refobj, _arg_1.currentTarget.currentFrame);
            }
            else
            {
                trace(("obj handles ... clicks " + this.refobj.handlesOptions));
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
            trace("get options called on this object..");
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
            if (this.seatinglist.length == 0)
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
            trace(("Checking my seating..." + this.mySeating));
            trace(("seating list ..." + this.seatinglist));
            for (_local_2 in this.mySeating)
            {
                trace(((("myseatng " + _local_2) + " = ") + this.mySeating[_local_2]));
                if (!this.seatinglist[this.mySeating[_local_2]])
                {
                    trace("found spare slot...");
                    _local_1.push(this.mySeating[_local_2]);
                };
            };
            trace(("Spare seat = " + _local_1));
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
            trace(("Call for avatar to sit on pos " + _arg_2));
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
                    trace(("is sitting in pos " + _local_3));
                    _local_4 = _local_3;
                    this.thisref[("sitpos" + _local_4)].removeChild(this.seatinglist[_local_4]);
                    _local_5 = this.thisref.localToGlobal(new Point(this.thisref[("standpos" + _local_4)].x, this.thisref[("standpos" + _local_4)].y));
                    _local_5 = this.thisref.parent.globalToLocal(_local_5);
                    _arg_1.x = _local_5.x;
                    _arg_1.y = _local_5.y;
                    this.seatinglist[_local_3] = null;
                };
            };
            trace(("seating after stand  = " + this.seatinglist));
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
                    trace("seating found..");
                    if (((!(this.thisref.getChildByName(("sitpos" + _local_1)))) && (this.thisref.stage.getChildAt(0).statusType > 5)))
                    {
                    };
                    if (!this.thisref.getChildByName(("sitpos" + _local_1)))
                    {
                        trace(((((_local_1 + "  = ") + this.seatinglist[_local_1]) + " is avatar contained ? ") + this.thisref[("sitpos" + _local_1)].contains(this.seatinglist[_local_1])));
                    }
                    else
                    {
                        trace((("sitpos " + _local_1) + " already exists..."));
                        if (!this.thisref[("sitpos" + _local_1)].contains(this.seatinglist[_local_1]))
                        {
                            trace(("Missing AV on seat " + this.seatinglist[_local_1].sfsAV.getName()));
                            this.thisref[("sitpos" + _local_1)].addChild(this.seatinglist[_local_1]);
                        };
                    };
                };
                _local_1++;
            };
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
//com.cocolani.scenes.home_tribe1_interior

package com.cocolani.scenes
{
    import flash.display.MovieClip;

    public class home_tribe1_interior extends homes_internal 
    {

        public var background:MovieClip;
        public var exitpad1:MovieClip;
        public var startpos1:MovieClip;
        public var startpos2:MovieClip;
        public var walktopos1:MovieClip;
        public var foreground:MovieClip;
        public var door:door_yeknom_interior;
        public var wallLocation1:MovieClip;
        public var collide1:MovieClip;
        public var mask1:MovieClip;


    }
}//package com.cocolani.scenes

//------------------------------------------------------------
//com.cocolani.scenes.homes_internal

package com.cocolani.scenes
{
    import flash.events.MouseEvent;
    import flash.geom.Point;

    public class homes_internal extends scene 
    {

        public function homes_internal()
        {
            isRoomReady = false;
            setChildren(thisref.background, ["mail", "bt_mail"]);
            thisref.door.sceneObjId = 1;
            thisref.door.stop();
            thisref.door.setInteractive();
            thisref.background.mail.sceneObjId = 2;
            thisref.background.bt_mail.addEventListener(MouseEvent.CLICK, this.mailout);
            hideconfig("wallLocation");
            thisref.wallLocation1.wall_c.mouseChildren = false;
            thisref.wallLocation1.wall_r.mouseChildren = false;
            thisref.wallLocation1.wall_l.mouseChildren = false;
            thisref.background.mail.visible = false;
        }

        public function mailout(_arg_1:MouseEvent=null):*
        {
            var _local_2:*;
            var _local_3:*;
            if (egosHome)
            {
                _local_2 = false;
                _local_3 = 0;
                while (_local_3 < rootref.popupWindows.length)
                {
                    if (rootref.popupWindows[_local_3].popupName == "mail")
                    {
                        _local_2 = true;
                        break;
                    };
                    _local_3++;
                };
                if (!_local_2)
                {
                    rootref.newpopup((thisref.stage.getChildAt(0).baseURL + "panels/mail.swf"), "load", "mail");
                };
            }
            else
            {
                rootref.showmsg(rootref.langObj.getText("com08"));
            };
        }

        override public function optionResult(_arg_1:*, _arg_2:*):*
        {
            var _local_3:*;
            var _local_4:*;
            hideOptions();
            if (_arg_2 == 1)
            {
                if (_arg_1.state != 2)
                {
                    _local_3 = new Object();
                    _local_3.ext = "home";
                    _local_3.cmd = "door";
                    _local_3.id = thisref.stage.getChildAt(0).mc_scene.loadHomeID;
                    rootref.sendXTmessage(_local_3);
                    if (_arg_1.currentFrame == 1)
                    {
                        rootref.mc_interface.feedback.revealmessage(langObj.getText("hom04"), "");
                    }
                    else
                    {
                        rootref.mc_interface.feedback.revealmessage(langObj.getText("hom05"), "");
                    };
                }
                else
                {
                    rootref.mc_interface.feedback.revealmessage(langObj.getText("hom06"), "");
                };
            }
            else
            {
                if (_arg_2 == 2)
                {
                    if (egosHome)
                    {
                        _local_3 = new Object();
                        _local_3.ext = "home";
                        _local_3.cmd = "door";
                        _local_3.lk = 1;
                        _local_3.id = thisref.stage.getChildAt(0).mc_scene.loadHomeID;
                        rootref.sendXTmessage(_local_3);
                        if (_arg_1.state != 2)
                        {
                            rootref.mc_interface.feedback.revealmessage(langObj.getText("hom16"), "");
                        }
                        else
                        {
                            rootref.mc_interface.feedback.revealmessage(langObj.getText("hom17"), "");
                        };
                    };
                }
                else
                {
                    if (_arg_2 == 3)
                    {
                        _local_4 = thisref.stage.getChildAt(0).mc_scene.loadHomeID;
                        egoref.commandList.push({
                            "walkto":new Point(thisref.startpos1.x, thisref.startpos1.y),
                            "sendupdate":true,
                            "setListener":false,
                            "setUserControl":false,
                            "fadeout":10,
                            "hideUsername":true
                        });
                        egoref.commandList.push({
                            "loadHome":_local_4,
                            "fileName":"home_tribe1_exterior.swf",
                            "inside":false
                        });
                        egoref.executeNextCommand();
                    }
                    else
                    {
                        if (_arg_2 != 5)
                        {
                            rootref.showmsg("Coming soon..");
                        };
                    };
                };
            };
        }

        override public function checkPermEditObj():*
        {
            return (egosHome);
        }

        override public function roomObjClicked(_arg_1:*):*
        {
            var _local_3:*;
            var _local_2:* = getDistanceToObject(_arg_1);
            if (_arg_1.sceneObjId == 1)
            {
                if (_local_2 <= 80)
                {
                    _local_3 = [];
                    _local_3.push({"id":1});
                    if (egosHome)
                    {
                        _local_3.push({"id":2});
                    };
                    if (_arg_1.state == 1)
                    {
                        _local_3.push({"id":3});
                    };
                    _local_3.push({"id":5});
                    newOptions(_arg_1, _local_3);
                }
                else
                {
                    if (egosHome)
                    {
                        if (_arg_1.currentFrame == 1)
                        {
                            rootref.mc_interface.feedback.revealmessage(langObj.getText("hom12"), "");
                        }
                        else
                        {
                            rootref.mc_interface.feedback.revealmessage(langObj.getText("hom13"), "");
                        };
                    }
                    else
                    {
                        if (_arg_1.currentFrame == 1)
                        {
                            rootref.mc_interface.feedback.revealmessage(langObj.getText("hom14"), "");
                        }
                        else
                        {
                            rootref.mc_interface.feedback.revealmessage(langObj.getText("hom15"), "");
                        };
                    };
                };
            }
            else
            {
                if (_arg_1.sceneObjId == 2)
                {
                    this.mailout();
                };
            };
        }

        override public function addInventoryItem():*
        {
        }

        override public function getPlayerSceneEntryInstructions(_arg_1:*):*
        {
            if (getChildByName("mask1"))
            {
                _arg_1.setMasking(thisref["mask1"]);
            };
            _arg_1.commandList.push({
                "walkto":new Point(thisref.walktopos1.x, thisref.walktopos1.y),
                "sendupdate":true,
                "setListener":false,
                "setUserControl":false
            }, {
                "setUserControl":true,
                "setListener":true,
                "setMask":true,
                "maskTarget":null
            });
            _arg_1.executeNextCommand();
        }

        override public function getStartPos(_arg_1:*):*
        {
            return (new Point(thisref.startpos1.x, thisref.startpos1.y));
        }

        override public function joinRoomOverride():*
        {
            this.setDoors(true);
            this.showmail();
            if (!egosHome)
            {
                thisref.background.bt_mail.visible = false;
            };
            if (preloadList.length == 0)
            {
                if (rootref.mc_scene)
                {
                    isRoomReady = true;
                    rootref.mc_scene.removePreloader();
                };
            };
        }

        override public function roomVarUpdateOverride(_arg_1:*):*
        {
            var _local_2:String;
            for (_local_2 in _arg_1)
            {
                if (_local_2.substr(0, 4) == "data")
                {
                    this.setDoors();
                    this.showmail();
                };
            };
        }

        public function setDoors(_arg_1:*=false):*
        {
            var _local_2:* = roomSFSobj.getVariable("data").split(",");
            if (thisref.door.state != _local_2[0])
            {
                thisref.door.state = _local_2[0];
                if (Number(_local_2[0]) == 1)
                {
                    if (((thisref.door.currentLabel == "closed") && (!(_arg_1))))
                    {
                        rootref.mc_interface.audio.playSound("sfx_dooropen", 0, 1, true);
                    };
                    thisref.door.gotoAndStop("open");
                    thisref.collide1.doorblocker.gotoAndStop(2);
                }
                else
                {
                    if (((thisref.door.currentLabel == "open") && (!(_arg_1))))
                    {
                        rootref.mc_interface.audio.playSound("sfx_doorclose", 0, 1, true);
                    };
                    thisref.door.gotoAndStop("closed");
                    thisref.collide1.doorblocker.gotoAndStop(1);
                };
            };
        }

        override public function AVMonitorOverride(_arg_1:*=false):*
        {
        }

        override public function executeExit(_arg_1:*, _arg_2:*):*
        {
            var _local_3:* = thisref.stage.getChildAt(0).mc_scene.loadHomeID;
            if (getChildByName("mask1"))
            {
                _arg_1.setMasking(thisref["mask1"]);
            };
            _arg_1.commandList.push({
                "walkto":new Point(thisref.startpos1.x, thisref.startpos1.y),
                "sendupdate":true,
                "setListener":false,
                "setUserControl":false,
                "fadeout":10,
                "hideUsername":true
            });
            _arg_1.commandList.push({
                "loadHome":_local_3,
                "fileName":"home_tribe1_exterior.swf",
                "inside":false
            });
            _arg_1.executeNextCommand();
        }

        override public function shutdown_override():*
        {
            rootref.mc_interface.audio.stopAudioStream(1);
            rootref.mc_interface.audio.stopBgdLoop();
        }

        public function showmail():*
        {
            var _local_1:* = roomSFSobj.getVariable("data").split(",");
            trace(("MAILS WAITING : " + _local_1[3]));
            if (Number(_local_1[3]) > 0)
            {
                thisref.background.mail.visible = true;
            }
            else
            {
                thisref.background.mail.visible = false;
                if (rootref.mc_interface.mailIcon)
                {
                    rootref.mc_interface.removeChild(rootref.mc_interface.mailIcon);
                    rootref.mc_interface.mailIcon = null;
                };
            };
        }

        override public function initroomfn():*
        {
        }

        override public function get isReady():*
        {
            return (isRoomReady);
        }


    }
}//package com.cocolani.scenes

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
    import com.cocolani.sceneObject;
    import flash.geom.Point;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;
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
                if ((getChildAt(_local_2) is sceneObjectSit))
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
            trace("Init scene.");
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
            trace(("Status of PATHFINDING = " + this.rootref.mc_interface.bt_pathfinding.status));
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

        public function extReply(_arg_1:*):*
        {
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
                _local_2 = {};
                _local_2.cmd = "pracBattleResp";
                _local_2.ext = "gameManager";
                _local_2.uid = _arg_1.currentTarget.parent.data.uid;
                this.rootref.sendXTmessage(_local_2);
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
            removeChild(_arg_1);
            if (_arg_1.ego)
            {
                _arg_1.FollowCursor(false);
                this.rootref.mc_scene.clickEnable = false;
            };
            _arg_1.sitav(_arg_2.myDir);
            _arg_2.avSit(_arg_1, _arg_3);
        }

        public function avatarStand(_arg_1:*, _arg_2:*):*
        {
            _arg_2.avStand(_arg_1);
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
            trace(((("ref x " + _arg_1.x) + " width = ") + _arg_1.width));
            trace(((("ref y " + _arg_1.y) + " height = ") + _arg_1.height));
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
            return (Point.distance(_arg_1, this.egoref.parent.localToGlobal(new Point(this.egoref.x, this.egoref.y))));
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
                                if ((this.ObjCat[_local_11].ref is sceneObjectSit))
                                {
                                    if (this.ObjCat[_local_11].ref.seatID == _local_2[_local_3].getVariable("stob"))
                                    {
                                        this.avatarSit(_local_7, this.ObjCat[_local_11].ref, 1);
                                    };
                                };
                                _local_11++;
                            };
                        };
                    };
                    trace("added to object categories");
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
            trace("Before preloading...");
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
            trace("Complete...");
        }

        private function sceneObjClick(e:MouseEvent):*
        {
            var avatarContainerLoc:* = undefined;
            var tgt:* = undefined;
            var opt:* = undefined;
            if (!this.rootref.cursorRef)
            {
                if (this.selectedItem)
                {
                    this.unselectSelected();
                };
                avatarContainerLoc = false;
                tgt = e.target.parent.parent.parent;
                while (tgt.parent)
                {
                    try
                    {
                        if (tgt.avatarContainer)
                        {
                            avatarContainerLoc = true;
                            break;
                        };
                    }
                    catch(e:Error)
                    {
                    };
                    tgt = tgt.parent;
                };
                if (!avatarContainerLoc)
                {
                    opt = e.currentTarget.getoptions(this.thisref);
                    this.newOptions(e.currentTarget, opt);
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
            trace((("got option number " + _arg_2) + " clicked.."));
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
                        _local_5 = _arg_1.getSpareSeat();
                        if (_local_5.length > 0)
                        {
                            this.avatarSit(this.egoref, _arg_1, _local_5[0]);
                            _local_6 = {};
                            _local_6.stob = _arg_1.mydata[0];
                            _local_6.stsid = _local_5[0];
                            this.rootref.sfs.setUserVariables(_local_6);
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
                            this.rootref.sfs.setUserVariables(_local_6);
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

        public function initializePathFinder():*
        {
            trace("Create path finder / initialize");
            this.pathFinderRef = new pathFinder(this.thisref);
        }

        public function preload(_arg_1:*):*
        {
            this.rootref.resourceloader.addResources(_arg_1, "lang");
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
                            this.avlist[i].parent.parent.releaseAV(this.avlist[i]);
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
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_3:Array = _arg_2;
            trace("uservarupd..");
            if (!this.uservarupdate_override(_arg_1, _arg_2))
            {
                return;
            };
            for (_local_4 in this.avlist)
            {
                if (((this.avlist[_local_4]) && (this.avlist[_local_4].sfsAV.getId() == _arg_1.getId())))
                {
                    if (_local_3["cld"])
                    {
                        this.avlist[_local_4].monitorActive = _arg_1.getVariable("cld");
                    };
                    if (_local_3["ps"])
                    {
                        _local_5 = _arg_1.getVariable("ps").split(",");
                        this.avlist[_local_4].initStartPos(new Point(_local_5[0], _local_5[1]));
                    };
                    if (_local_3["dst"])
                    {
                        _local_6 = _arg_1.getVariable("dst").split(",");
                        if (_arg_1.getVariable("pth") == true)
                        {
                            this.setAVPath(this.avlist[_local_4], new Point(_local_6[0], _local_6[1]));
                        }
                        else
                        {
                            this.avlist[_local_4].walkto(new Point(_local_6[0], _local_6[1]));
                        };
                    };
                    if (_local_3["clth"])
                    {
                        this.avlist[_local_4].setoutfit();
                    };
                    if (_local_3["stob"])
                    {
                        if (_arg_1.getVariable("stob") != undefined)
                        {
                            _local_7 = 0;
                            while (_local_7 < this.ObjCat.length)
                            {
                                if ((this.ObjCat[_local_7].ref is sceneObjectSit))
                                {
                                    if (this.ObjCat[_local_7].ref.seatID == _arg_1.getVariable("stob"))
                                    {
                                        this.avatarSit(this.avlist[_local_4], this.ObjCat[_local_7].ref, 1);
                                    };
                                };
                                if ((this.ObjCat[_local_7].ref is furnItem))
                                {
                                    if (this.ObjCat[_local_7].ref.mydata[0] == _arg_1.getVariable("stob"))
                                    {
                                        this.avatarSit(this.avlist[_local_4], this.ObjCat[_local_7].ref, _arg_1.getVariable("stsid"));
                                    };
                                };
                                _local_7++;
                            };
                        }
                        else
                        {
                            this.avatarStand(this.avlist[_local_4], this.avlist[_local_4].parent.parent);
                        };
                    };
                    break;
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
            trace(("Pathfidning  = " + this.pathFinding));
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
        internal var ownsInteractity:* = false;
        internal var objSeperated:* = false;
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
                    trace("Sit down....");
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
            if (this.thisref.parent.getChildByName("background"))
            {
                this.thisref.parent.setObjY(this.thisref, this.thisYcoord.y);
            };
            this.stageRef = this.thisref.stage.getChildAt(0);
            this.sceneRef = this.stageRef.mc_scene.sceneRef;
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
//com.cocolani.sceneObjectNosit

package com.cocolani
{
    import flash.display.MovieClip;

    public dynamic class sceneObjectNosit extends sceneObject 
    {

        public var yline:MovieClip;


        override public function optionResult(_arg_1:*):*
        {
            if (stageRef.mc_scene.sceneRef)
            {
                stageRef.mc_scene.sceneRef.hideOptions();
                if (_arg_1 == 7)
                {
                };
            };
        }

        override public function get mySeating():*
        {
            return ([1]);
        }

        override public function getoptions():*
        {
            var _local_1:* = [];
            _local_1.push({"id":5});
            return (_local_1);
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

        public function sceneObjectSit()
        {
            ownsInteractity = true;
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
                        _local_2 = this.getSpareSeat();
                        if (_local_2.length > 0)
                        {
                            stageRef.mc_scene.sceneRef.avatarSit(stageRef.mc_scene.sceneRef.egoref, thisref, _local_2[0]);
                            _local_3 = {};
                            _local_3.stob = this.seatID;
                            _local_3.stsid = _arg_1;
                            stageRef.sfs.setUserVariables(_local_3);
                            this.setInteractiveChildren();
                        }
                        else
                        {
                            stageRef.showmsg(stageRef.langObj.getText("com09"));
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
                        stageRef.sfs.setUserVariables(_local_3);
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
                trace(("SEATING LIST = " + this.seatinglist));
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
                if (_arg_1.sfsAV.getId() == _arg_1.getId())
                {
                    this.releaseSeat(_local_2);
                };
            };
        }

        public function avSit(_arg_1:*, _arg_2:*):*
        {
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
                if (this.seatinglist[_local_3] == _arg_1)
                {
                    _local_4 = _local_3;
                    thisref[("sitpos" + _local_4)].removeChild(this.seatinglist[_local_4]);
                    _local_5 = thisref.localToGlobal(new Point(thisref[("standpos" + _local_4)].x, thisref[("standpos" + _local_4)].y));
                    _local_5 = thisref.parent.globalToLocal(_local_5);
                    _arg_1.x = _local_5.x;
                    _arg_1.y = _local_5.y;
                    this.seatinglist[_local_4] = undefined;
                    _local_2 = true;
                };
            };
            if (!_local_2)
            {
                thisref.stage.getChildAt(0).showmsg("Problem in object. Please contact technical support.");
            };
        }

        override public function get mySeating():*
        {
            return ([1]);
        }

        override public function getoptions():*
        {
            var _local_1:* = [];
            trace(("stageref = " + stageRef.mc_scene.sceneRef));
            if ((((!(stageRef.mc_scene.sceneRef)) || (stageRef.mc_scene.sceneRef.egoref.isSitting == false)) || (this.isEgoSittingHere())))
            {
                if (this.isEgoSitting())
                {
                    _local_1.push({"id":8});
                }
                else
                {
                    trace(("get spare seat = " + this.getSpareSeat()));
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
//close_button

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class close_button extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//door_layer_top

package 
{
    import com.cocolani.sceneObjectNosit;

    public dynamic class door_layer_top extends sceneObjectNosit 
    {


    }
}//package 

//------------------------------------------------------------
//door_yeknom_interior

package 
{
    import com.cocolani.sceneObjectNosit;

    public dynamic class door_yeknom_interior extends sceneObjectNosit 
    {

        public function door_yeknom_interior()
        {
            addFrameScript(0, this.frame1, 9, this.frame10);
        }

        internal function frame1():*
        {
            updateY();
        }

        internal function frame10():*
        {
            updateY();
        }


    }
}//package 

//------------------------------------------------------------
//home_tribe1_interior_wall_overlay

package 
{
    import com.cocolani.sceneObjectNosit;

    public dynamic class home_tribe1_interior_wall_overlay extends sceneObjectNosit 
    {


    }
}//package 

//------------------------------------------------------------
//homes_bt_mail

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class homes_bt_mail extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//mc_newmail

package 
{
    import com.cocolani.sceneInteractive;

    public dynamic class mc_newmail extends sceneInteractive 
    {


    }
}//package 

