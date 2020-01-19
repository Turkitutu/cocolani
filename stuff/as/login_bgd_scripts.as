// Decompiled by AS3 Sorcerer 5.72
// www.as3sorcerer.com

//------------------------------------------------------------
//com.cocolani.panels.loginBgd

package com.cocolani.panels
{
    import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.events.Event;

    public class loginBgd extends Sprite 
    {

        public var bgd:MovieClip;

        public function loginBgd()
        {
            addEventListener(Event.ADDED_TO_STAGE, this.init);
            this.bgd.logocontainer.gotoAndStop(1);
        }

        private function init(_arg_1:Event):*
        {
            var _local_2:* = _arg_1.currentTarget.stage.getChildAt(0);
            if (_local_2.custID == 1)
            {
                this.bgd.logocontainer.gotoAndStop(("cl" + _local_2.custID));
            }
            else
            {
                if (_local_2.langObj.selectedLang == 1)
                {
                    this.bgd.logocontainer.gotoAndStop(("cl_0_l" + _local_2.langObj.selectedLang));
                };
            };
        }


    }
}//package com.cocolani.panels

//------------------------------------------------------------
//login_bgd_fla.mc_Doors_18

package login_bgd_fla
{
    import flash.display.MovieClip;
    import flash.events.*;
    import flash.display.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.globalization.*;
    import flash.media.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class mc_Doors_18 extends MovieClip 
    {

        public var thisref:*;

        public function mc_Doors_18()
        {
            addFrameScript(0, this.frame1, 40, this.frame41);
        }

        internal function frame1():*
        {
            stop();
        }

        internal function frame41():*
        {
            stop();
            this.thisref = this;
            this.thisref.parent.parent.parent.parent.fadeout();
        }


    }
}//package login_bgd_fla

