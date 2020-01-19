// Decompiled by AS3 Sorcerer 5.72
// www.as3sorcerer.com

//------------------------------------------------------------
//com.cocolani.common.checkbox

package com.cocolani.common
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;

    public class checkbox extends MovieClip 
    {

        public var check:MovieClip;
        public var me:*;

        public function checkbox()
        {
            me = this;
            super();
            stop();
            buttonMode = true;
            mouseChildren = false;
            addEventListener(MouseEvent.MOUSE_OVER, rollover);
            addEventListener(MouseEvent.MOUSE_OUT, rollover);
            addEventListener(MouseEvent.MOUSE_DOWN, rollover);
            addEventListener(MouseEvent.CLICK, rollover);
            check.visible = false;
        }

        public function get status():*
        {
            return (check.visible);
        }

        public function toggle():*
        {
            check.visible = (!(check.visible));
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
                            e.currentTarget.gotoAndStop(2);
                        };
                    }
                    catch(e)
                    {
                        e.currentTarget.gotoAndStop(3);
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
                            if (e.currentTarget.stage.getChildAt(0).getChildByName("mc_interface"))
                            {
                                e.currentTarget.stage.getChildAt(0).mc_interface.audio.playSound("sfx_click");
                                e.currentTarget.gotoAndStop(3);
                            };
                        }
                        else
                        {
                            if (e.type == "click")
                            {
                                toggle();
                            };
                        };
                    };
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
        public var holder:MovieClip;
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
//com.cocolani.panels.registration

package com.cocolani.panels
{
    import flash.display.MovieClip;
    import fl.controls.ComboBox;
    import flash.text.TextField;
    import flash.utils.Dictionary;
    import fl.data.DataProvider;
    import flash.net.URLVariables;
    import flash.display.BitmapData;
    import flash.text.TextFormat;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextFieldType;
    import flash.net.URLRequest;
    import flash.net.URLLoader;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.net.URLLoaderDataFormat;
    import flash.events.ProgressEvent;
    import flash.geom.ColorTransform;
    import flash.filters.DropShadowFilter;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import flash.display.Loader;
    import flash.events.KeyboardEvent;
    import fl.data.SimpleCollectionItem;
    import flash.events.*;

    public class registration extends MovieClip 
    {

        protected static const WINDOW_OPEN_FUNCTION:String = "window.open";
        internal static var debug:* = false;

        public var birth_year:ComboBox;
        public var title_firstname:MovieClip;
        public var bubbletxt:TextField;
        public var title_username:MovieClip;
        public var mc_progress:MovieClip;
        public var selectors:MovieClip;
        public var bt_randomize:Bt_Randomize;
        public var title_renterpwd:MovieClip;
        public var lastname:TextField;
        public var key0:MovieClip;
        public var btn_boy_1:Mask_Male_tribe1;
        public var key1:MovieClip;
        public var title_m2:MovieClip;
        public var key2:MovieClip;
        public var title_m1:MovieClip;
        public var tribe_text2:TextField;
        public var title_terms:TextField;
        public var balloon:MovieClip;
        public var av_container:MovieClip;
        public var responsetxt:TextField;
        public var key3:MovieClip;
        public var bt_close:panel_close;
        public var btn_boy_2:Mask_Male_tribe2;
        public var tribe_text1:TextField;
        public var checkb:mc_togglebt;
        public var email_confirm:TextField;
        public var title_email_confirm:MovieClip;
        public var password:TextField;
        public var next:MovieClip;
        public var email:TextField;
        public var header:MovieClip;
        public var sectionHeading:TextField;
        public var note0:MovieClip;
        public var title_month:TextField;
        public var sectionHeading1:TextField;
        public var prev:registration_previous;
        public var note1:MovieClip;
        public var note2:MovieClip;
        public var title_birthdate:MovieClip;
        public var birth_month:ComboBox;
        public var tribe_title:MovieClip;
        public var birth_date:ComboBox;
        public var tab0:MovieClip;
        public var password2:TextField;
        public var username:TextField;
        public var tab1:MovieClip;
        public var title_f2:MovieClip;
        public var termslink:terms_container;
        public var title_year:TextField;
        public var title_password:MovieClip;
        public var tab2:MovieClip;
        public var btn_girl_2:Mask_Female_tribe2;
        public var title_f1:MovieClip;
        public var firstname:TextField;
        public var tab3:MovieClip;
        public var colourbin:mc_colourbin;
        public var tribe_title2:MovieClip;
        public var title_day:TextField;
        public var title_email:MovieClip;
        public var bgd_location:MovieClip;
        public var tribe_title1:MovieClip;
        public var title_lastname:MovieClip;
        public var tribeicon:MovieClip;
        public var maskinfotxt:TextField;
        public var btn_girl_1:Mask_Female_tribe1;
        public var __setPropDict:Dictionary = new Dictionary(true);
        private var fadeinContainer:*;
        internal var birthdayDP:DataProvider = new DataProvider();
        internal var birthmonthDP:DataProvider = new DataProvider();
        internal var birthyearDP:DataProvider = new DataProvider();
        internal var URLOADER:*;
        internal var URLVAR:* = new URLVariables();
        internal var passwordRM:*;
        internal var XMLLOADER:*;
        internal var XMLDATA:*;
        internal var months:*;
        internal var transformArr:* = [];
        internal var returnmsg:* = "";
        internal var thisref:*;
        internal var usernameApproved:* = false;
        internal var USERNAMEREQLOADER:*;
        internal var masksettings:*;
        internal var maskcolors:*;
        internal var tribeIndex:* = 0;
        internal var tribeIconList:*;
        internal var tribeData:*;
        internal var tribeMaskData:*;
        internal var sexSelector:*;
        internal var preloaderGfx:*;
        internal var stageRef:*;
        internal var colourBinHolder:*;
        internal var colorIndexes:*;
        internal var detectionBitmap:*;
        internal var avatarLoc:*;
        internal var avatarSpeechIndex:* = 0;
        internal var avatarSpeech:*;
        internal var avatarSpeechFinal:*;
        internal var notes:*;
        internal var selectedTab:* = 0;
        internal var standalone:* = false;
        internal var selectedLanguage:* = 0;
        internal var confirmedTerms:* = false;
        internal var textFormat:*;
        internal var langObj:*;
        public var DBURL:* = "http://localhost:8080/Cocolani/php/req/";
        public var ip:* = "127.0.0.1";
        public var sfsPort:* = "9339";
        public var swfURL:* = "swf/";
        public var baseURL:* = "";
        public var rootURL:* = "";
        public var zoneName:* = "cocolani";
        public var custID:* = 0;

        public function registration()
        {
            thisref = this;
            masksettings = [0, 0, 0, 0];
            maskcolors = [0, 0, 0, 0];
            tribeIconList = [];
            colorIndexes = [];
            detectionBitmap = new BitmapData(300, 60);
            avatarLoc = [-135, -60];
            textFormat = new TextFormat();
            super();
            addFrameScript(0, frame1, 1, frame2, 2, frame3, 3, frame4, 4, frame5, 5, frame6, 6, frame7, 7, frame8, 8, frame9);
            gotoAndStop(1);
            bt_close.addEventListener(MouseEvent.CLICK, closeme);
            next.addEventListener(MouseEvent.CLICK, nav);
            prev.addEventListener(MouseEvent.CLICK, nav);
            next.buttonMode = true;
            prev.tabIndex = 9;
            var _local_1:* = getDefinitionByName("mc_colourbin");
            colourBinHolder = new (_local_1)();
            addEventListener(Event.ENTER_FRAME, getColorIndex);
            addEventListener(Event.ADDED_TO_STAGE, init);
            updateProgress();
            visible = false;
        }

        public static function openWindow(_arg_1:String, _arg_2:String="_blank", _arg_3:String=""):void
        {
            ExternalInterface.call(WINDOW_OPEN_FUNCTION, _arg_1, _arg_2, _arg_3);
        }


        private function setFormat(_arg_1:TextField, _arg_2:Object=null):*
        {
            var _local_3:* = new TextFormat();
            _local_3.align = textFormat.align;
            if (_arg_2)
            {
                if (_arg_2.forceAlign)
                {
                    _local_3.align = _arg_2.forceAlign;
                };
            };
            _arg_1.setTextFormat(_local_3);
            if (((_arg_1.type == TextFieldType.INPUT) && (textFormat.align)))
            {
                _arg_1.defaultTextFormat = _local_3;
            };
        }

        private function updateProgress():*
        {
            if (currentFrame < 3)
            {
                mc_progress.gotoAndStop(1);
                if (XMLDATA)
                {
                    sectionHeading.text = XMLDATA.sections.section[0];
                };
            }
            else
            {
                if (currentFrame < 4)
                {
                    mc_progress.gotoAndStop(2);
                    if (XMLDATA)
                    {
                        sectionHeading.text = XMLDATA.sections.section[1];
                    };
                }
                else
                {
                    if (currentFrame < 8)
                    {
                        mc_progress.gotoAndStop(3);
                        if (XMLDATA)
                        {
                            sectionHeading.text = XMLDATA.sections.section[2];
                        };
                    }
                    else
                    {
                        if (currentFrame >= 8)
                        {
                            mc_progress.gotoAndStop(4);
                            if (XMLDATA)
                            {
                                sectionHeading.text = XMLDATA.sections.section[2];
                            };
                        };
                    };
                };
            };
            setFormat(sectionHeading, {"forceAlign":"center"});
        }

        private function init(_arg_1:Event):*
        {
            var _local_2:*;
            stageRef = _arg_1.currentTarget.stage.getChildAt(0);
            if (!debug)
            {
                selectedLanguage = stageRef.langObj.selectedLang;
            };
            if (debug)
            {
                _local_2 = new URLRequest("http://192.168.0.5/cocolani/php/req/registrationData.php");
            }
            else
            {
                _local_2 = new URLRequest(((stageRef.DBURL + "registrationData.php?rnd=") + Math.floor((Math.random() * 10000))));
            };
            XMLLOADER = new URLLoader();
            XMLLOADER.addEventListener(Event.COMPLETE, loadedXML);
            XMLLOADER.addEventListener(IOErrorEvent.IO_ERROR, errorloadXML);
            XMLLOADER.load(_local_2);
            fadeinContainer = thisref.parent.parent.addChild(new reg_fadein());
            fadeinContainer.x = 450;
            fadeinContainer.y = 300;
            fadeinContainer.stop();
            fadeinContainer.myparent = thisref;
            langObj = stageRef.langObj;
            next.gotoAndPlay(("lang" + langObj.selectedLang));
        }

        private function loadedXML(e:Event):*
        {
            var i:* = undefined;
            var obj:* = undefined;
            try
            {
                XMLDATA = new XML(e.currentTarget.data);
            }
            catch(e:Error)
            {
                trace(("Error in XML " + e));
                if (!debug)
                {
                    thisref.stage.getChildAt(0).showmsg(thisref.stage.getChildAt(0).langObj.showmsg("err08"));
                };
            };
            var langNode:* = XMLDATA.lang[selectedLanguage];
            XMLDATA = langNode;
            textFormat.align = XMLDATA.@layout;
            months = [];
            for (i in langNode.monthlist.month)
            {
                months.push(langNode.monthlist.month[i]);
            };
            tribeData = [];
            for (i in langNode.tribedata.tribe)
            {
                obj = langNode.tribedata.tribe[i];
                tribeData.push([obj.name, obj.desc, obj.active, obj.maskdesc]);
            };
            avatarSpeech = [];
            for (i in langNode.avatarSpeech.section0.speech)
            {
                obj = langNode.avatarSpeech.section0.speech[i];
                avatarSpeech.push(obj);
            };
            avatarSpeechFinal = [];
            for (i in langNode.avatarSpeech.section1.speech)
            {
                obj = langNode.avatarSpeech.section1.speech[i];
                avatarSpeechFinal.push(obj);
            };
            notes = langNode.notes;
            tribeIndex = Number(XMLDATA.defaultTribe);
            fadeinContainer.gotoAndPlay(1);
            preparepage();
        }

        private function errorloadXML(_arg_1:IOErrorEvent):*
        {
            if (!debug)
            {
                thisref.stage.getChildAt(0).showmsg(thisref.stage.getChildAt(0).langObj.getText("err07"));
            };
        }

        public function fadeInContainerFin():*
        {
            thisref.visible = true;
            fadeinContainer.stop();
            fadeinContainer.visible = false;
        }

        private function getColorIndex(_arg_1:Event):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            colorIndexes[(colourBinHolder.currentFrame - 1)] = new Array();
            var _local_2:* = 0;
            while (_local_2 < colourBinHolder.numChildren)
            {
                _local_3 = colourBinHolder.getChildAt(_local_2).transform.colorTransform;
                _local_4 = ((((_local_3.redOffset + ",") + _local_3.greenOffset) + ",") + _local_3.blueOffset);
                colorIndexes[(colourBinHolder.currentFrame - 1)].push(_local_4);
                _local_2++;
            };
            if (colourBinHolder.currentFrame < colourBinHolder.totalFrames)
            {
                colourBinHolder.nextFrame();
            }
            else
            {
                removeEventListener(Event.ENTER_FRAME, getColorIndex);
                colourBinHolder = undefined;
                transformArr = [];
                _local_5 = 0;
                while (_local_5 < 4)
                {
                    transformArr.push(colorIndexes[_local_5][0]);
                    _local_5++;
                };
            };
        }

        private function closeme(_arg_1:MouseEvent):*
        {
            thisref.stage.getChildAt(0).removepopup("registration");
        }

        private function loadedUsernameResponse(_arg_1:Event):*
        {
            if (_arg_1.currentTarget.data.result == "true")
            {
                responsetxt.text = "";
                usernameApproved = true;
                next.dispatchEvent(new MouseEvent(MouseEvent.CLICK, true, false));
            }
            else
            {
                if (_arg_1.currentTarget.data.error)
                {
                    username.selectable = true;
                    responsetxt.text = _arg_1.currentTarget.data.error;
                    usernameApproved = false;
                }
                else
                {
                    username.selectable = true;
                    responsetxt.text = "Database Error.";
                    usernameApproved = false;
                };
            };
            USERNAMEREQLOADER = null;
        }

        private function showterms(_arg_1:MouseEvent):*
        {
            openWindow(((stageRef.rootURL + stageRef.langObj.getLangExtensionWeb()) + "/terms-and-conditions"), "terms", "status=1,toolbar=0,width=800,height=800,scrollbars=1");
        }

        private function nav(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            var _local_3:RegExp;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:RegExp;
            switch (thisref.currentFrame)
            {
                case 1:
                    for (_local_2 in tribeIconList)
                    {
                        removeChild(tribeIconList[_local_2]);
                    };
                    tribeIconList = [];
                    URLVAR.clan = (tribeIndex + 1);
                    fadeinContainer.visible = true;
                    fadeinContainer.gotoAndPlay("fadeinout");
                    visible = false;
                    break;
                case 3:
                    URLVAR.username = username.text;
                    break;
                case 5:
                    URLVAR.firstname = firstname.text;
                    URLVAR.lastname = lastname.text;
                    break;
                case 6:
                    URLVAR.password = password.text;
                    passwordRM = password2.text;
                    break;
                case 7:
                    URLVAR.email = email.text;
                    break;
                case 8:
                    URLVAR.birthdate = ((((birth_year.selectedItem.label + "/") + birth_month.selectedItem.value) + "/") + birth_date.selectedItem.label);
                    confirmedTerms = checkb.status;
                    break;
            };
            if (_arg_1.currentTarget.name == "next")
            {
                if (thisref.currentFrame == 3)
                {
                    if (usernameApproved)
                    {
                        av_container.removeChild(av_container.bodycontainer);
                        av_container.maskcontainer.removeChild(av_container.maskcontainer.part0);
                        av_container.maskcontainer.removeChild(av_container.maskcontainer.part1);
                        av_container.maskcontainer.removeChild(av_container.maskcontainer.part2);
                        av_container.maskcontainer.removeChild(av_container.maskcontainer.part3);
                        av_container.maskcontainer.removeChild(av_container.maskcontainer.part4);
                        av_container.bodycontainer = undefined;
                        av_container.maskcontainer.part0 = undefined;
                        av_container.maskcontainer.part1 = undefined;
                        av_container.maskcontainer.part2 = undefined;
                        av_container.maskcontainer.part3 = undefined;
                        av_container.maskcontainer.part4 = undefined;
                        thisref.gotoAndStop(4);
                    }
                    else
                    {
                        responsetxt.text = XMLDATA.errors.error[6];
                        _local_3 = /([a-z0-9._-]+)@([a-z0-9.-]+)\.([a-z]{2,4})/;
                        if (_local_3.test(username.text) == true)
                        {
                            responsetxt.text = XMLDATA.errors.error[9];
                        };
                        if (((!(USERNAMEREQLOADER)) && (_local_3.test(username.text) == false)))
                        {
                            username.selectable = false;
                            if (standalone)
                            {
                                _local_4 = new URLRequest("192.168.0.5/cocolani/php/req/checkusername.php");
                            }
                            else
                            {
                                _local_4 = new URLRequest((thisref.stage.getChildAt(0).DBURL + "checkusername.php"));
                            };
                            _local_5 = new URLVariables();
                            _local_5.username = username.text;
                            _local_5.lang_id = thisref.stage.getChildAt(0).langObj.selectedLang;
                            USERNAMEREQLOADER = new URLLoader(_local_4);
                            USERNAMEREQLOADER.addEventListener(Event.COMPLETE, loadedUsernameResponse);
                            USERNAMEREQLOADER.addEventListener(IOErrorEvent.IO_ERROR, errorloading);
                            USERNAMEREQLOADER.addEventListener(SecurityErrorEvent.SECURITY_ERROR, errorsecurityloading);
                            if (debug)
                            {
                                USERNAMEREQLOADER.dataFormat = URLLoaderDataFormat.TEXT;
                            }
                            else
                            {
                                USERNAMEREQLOADER.dataFormat = URLLoaderDataFormat.VARIABLES;
                            };
                            _local_4.method = "POST";
                            _local_4.data = _local_5;
                            USERNAMEREQLOADER.load(_local_4);
                        };
                    };
                }
                else
                {
                    if (thisref.currentFrame == 4)
                    {
                        avatarSpeechIndex++;
                        if (avatarSpeechIndex >= avatarSpeech.length)
                        {
                            bubbletxt.text = "";
                            gotoAndStop(5);
                            bubbletxt.visible = false;
                            balloon.visible = false;
                        }
                        else
                        {
                            _local_6 = repText(avatarSpeech[avatarSpeechIndex], URLVAR.username);
                            langObj.setTextJustify(bubbletxt, _local_6, {"forceAlign":"center"});
                        };
                    }
                    else
                    {
                        if (thisref.currentFrame == 5)
                        {
                            _local_7 = "";
                            _local_7 = (_local_7 + checkminchar(firstname.text, 2, XMLDATA.terms.general.term[3]));
                            _local_7 = (_local_7 + checkminchar(lastname.text, 2, XMLDATA.terms.general.term[4]));
                            if (_local_7 != "")
                            {
                                responsetxt.text = _local_7;
                                responsetxt.visible = true;
                            }
                            else
                            {
                                responsetxt.visible = false;
                                thisref.nextFrame();
                            };
                        }
                        else
                        {
                            if (thisref.currentFrame == 6)
                            {
                                _local_7 = "";
                                _local_7 = (_local_7 + checkminchar(password.text, 6, XMLDATA.terms.general.term[5]));
                                if (password.text != password2.text)
                                {
                                    _local_7 = (_local_7 + (XMLDATA.errors.error[4] + "\n"));
                                };
                                if (_local_7 != "")
                                {
                                    responsetxt.text = _local_7;
                                    responsetxt.visible = true;
                                }
                                else
                                {
                                    responsetxt.visible = false;
                                    thisref.nextFrame();
                                };
                            }
                            else
                            {
                                if (thisref.currentFrame == 7)
                                {
                                    _local_7 = "";
                                    if (email.text != email_confirm.text)
                                    {
                                        _local_7 = (_local_7 + (XMLDATA.errors.error[7] + "\n"));
                                    };
                                    _local_8 = /([a-z0-9._-]+)@([a-z0-9.-]+)\.([a-z]{2,4})/;
                                    if (_local_8.test(email.text) == false)
                                    {
                                        _local_7 = (_local_7 + (XMLDATA.errors.error[5] + "\n"));
                                    };
                                    if (_local_7 != "")
                                    {
                                        responsetxt.text = _local_7;
                                        responsetxt.visible = true;
                                    }
                                    else
                                    {
                                        thisref.nextFrame();
                                        responsetxt.visible = false;
                                    };
                                }
                                else
                                {
                                    if (thisref.currentFrame == 8)
                                    {
                                        _local_7 = "";
                                        if (((Number(XMLDATA.termsEnabled) == 1) && (!(checkb.status))))
                                        {
                                            _local_7 = XMLDATA.errors.error[8];
                                        };
                                        if (_local_7 != "")
                                        {
                                            responsetxt.text = _local_7;
                                            responsetxt.visible = true;
                                        }
                                        else
                                        {
                                            responsetxt.text = "";
                                            thisref.nextFrame();
                                        };
                                    }
                                    else
                                    {
                                        if (thisref.currentFrame == 9)
                                        {
                                            responsetxt.text = "";
                                            doregister();
                                            next.visible = false;
                                            prev.visible = false;
                                            langObj.setTextJustify(bubbletxt, avatarSpeechFinal[1], {"forceAlign":"center"});
                                        }
                                        else
                                        {
                                            if (thisref.currentFrame == 1)
                                            {
                                                if (transformArr.length == 0)
                                                {
                                                    transformArr = colorIndexes.slice((tribeIndex * 4), ((tribeIndex * 4) + 4));
                                                };
                                                if (checkClassExist(("avatar" + (tribeIndex + 1))))
                                                {
                                                    thisref.gotoAndStop(3);
                                                }
                                                else
                                                {
                                                    thisref.gotoAndStop(2);
                                                };
                                            }
                                            else
                                            {
                                                thisref.nextFrame();
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            }
            else
            {
                if (thisref.currentFrame == 3)
                {
                    thisref.gotoAndStop(1);
                    this.visible = false;
                    fadeinContainer.gotoAndPlay("fadereverse");
                    fadeinContainer.visible = true;
                }
                else
                {
                    if (thisref.currentFrame == 5)
                    {
                        thisref.gotoAndStop(3);
                    }
                    else
                    {
                        thisref.prevFrame();
                    };
                };
            };
        }

        private function initFrames(_arg_1:*):*
        {
            switch (_arg_1.state)
            {
                case 0:
                    _arg_1.gotoAndStop("Centre_In");
                    return;
                case 1:
                    _arg_1.gotoAndStop("Centre_Out");
                    return;
                case 2:
                    _arg_1.gotoAndStop("Fade_Out");
                    return;
                default:
                    _arg_1.gotoAndStop(1);
            };
        }

        public function setsex(_arg_1:MouseEvent):*
        {
            if (_arg_1.currentTarget.name.substr(0, 8) == "btn_girl")
            {
                URLVAR.sex = "F";
                tribeIndex = (Number(_arg_1.currentTarget.name.substr(9, 1)) - 1);
            }
            else
            {
                URLVAR.sex = "M";
                tribeIndex = (Number(_arg_1.currentTarget.name.substr(8, 1)) - 1);
            };
            updateTribeSelector();
        }

        public function updateTribeSelector():*
        {
            var _local_1:*;
            var _local_2:*;
            if (URLVAR.sex)
            {
                if (URLVAR.sex == "M")
                {
                    _local_1 = ("btn_boy_" + (tribeIndex + 1));
                }
                else
                {
                    _local_1 = ("btn_girl_" + (tribeIndex + 1));
                };
                _local_2 = 1;
                while (_local_2 < 3)
                {
                    if (_local_1 != ("btn_boy_" + _local_2))
                    {
                        thisref[("btn_boy_" + _local_2)].enable();
                    }
                    else
                    {
                        thisref[("btn_boy_" + _local_2)].disable(true);
                    };
                    if (_local_1 != ("btn_girl_" + _local_2))
                    {
                        thisref[("btn_girl_" + _local_2)].enable();
                    }
                    else
                    {
                        thisref[("btn_girl_" + _local_2)].disable(true);
                    };
                    _local_2++;
                };
            };
            if (tribeData[tribeIndex][2] == 1)
            {
                next.visible = true;
                next.tabIndex = 8;
            }
            else
            {
                next.visible = false;
            };
        }

        public function updatesexselector():*
        {
        }

        private function loadingSectionListener(_arg_1:ProgressEvent):*
        {
            preloaderGfx.percentagetxt.text = (Math.round(((_arg_1.bytesLoaded / _arg_1.bytesTotal) * 100)) + "%");
        }

        private function loadingInitListener(_arg_1:Event):*
        {
            gotoAndStop(3);
        }

        private function ioErrorListener(_arg_1:IOErrorEvent):*
        {
        }

        private function tablistener(_arg_1:MouseEvent):*
        {
            if (_arg_1.type == "mouseOver")
            {
                _arg_1.currentTarget.gotoAndStop(2);
            }
            else
            {
                if (_arg_1.type == "mouseOut")
                {
                    _arg_1.currentTarget.gotoAndStop(3);
                }
                else
                {
                    selectedTab = Number(_arg_1.currentTarget.name.substr(3, 1));
                };
            };
            settabs();
        }

        private function stopanim(_arg_1:*):*
        {
            _arg_1.gotoAndStop(1);
            if (_arg_1.getChildByName("obj"))
            {
                _arg_1.obj.gotoAndStop(1);
            };
            if (_arg_1.getChildByName("av"))
            {
                _arg_1.av.gotoAndStop(1);
            };
        }

        private function gettransform(_arg_1:*):*
        {
            var _local_2:* = _arg_1.split(",");
            return (new ColorTransform(1, 1, 1, 1, Number(_local_2[0]), Number(_local_2[1]), Number(_local_2[2]), 1));
        }

        private function renderCharacter(_arg_1:*=false):*
        {
            var _local_6:*;
            if (!av_container.bodycontainer)
            {
                av_container.bodycontainer = av_container.addChild(new MovieClip());
                _local_6 = getDefinitionByName(("avatar" + (tribeIndex + 1)));
                av_container.bodycontainer.body = av_container.bodycontainer.addChild(new (_local_6)());
                stopanim(av_container.bodycontainer.body);
                av_container.maskcontainer = av_container.addChild(new MovieClip());
            }
            else
            {
                trace("body container already eist");
                av_container.maskcontainer.removeChild(av_container.maskcontainer.part0);
                av_container.maskcontainer.removeChild(av_container.maskcontainer.part1);
                av_container.maskcontainer.removeChild(av_container.maskcontainer.part2);
                av_container.maskcontainer.removeChild(av_container.maskcontainer.part3);
                av_container.maskcontainer.removeChild(av_container.maskcontainer.part4);
                av_container.maskcontainer.part0 = undefined;
                av_container.maskcontainer.part1 = undefined;
                av_container.maskcontainer.part2 = undefined;
                av_container.maskcontainer.part3 = undefined;
                av_container.maskcontainer.part4 = undefined;
            };
            var _local_2:* = (("avatar" + (tribeIndex + 1)) + URLVAR.sex);
            var _local_3:* = getDefinitionByName(((_local_2 + "mask") + (masksettings[0] + 1)));
            av_container.maskcontainer.part0 = av_container.maskcontainer.addChild(new (_local_3)());
            _local_3 = getDefinitionByName(((_local_2 + "eyeL") + (masksettings[1] + 1)));
            av_container.maskcontainer.part1 = av_container.maskcontainer.addChild(new (_local_3)());
            _local_3 = getDefinitionByName(((_local_2 + "eyeR") + (masksettings[1] + 1)));
            av_container.maskcontainer.part2 = av_container.maskcontainer.addChild(new (_local_3)());
            _local_3 = getDefinitionByName(((_local_2 + "nose") + (masksettings[2] + 1)));
            av_container.maskcontainer.part3 = av_container.maskcontainer.addChild(new (_local_3)());
            _local_3 = getDefinitionByName(((_local_2 + "mouth") + (masksettings[3] + 1)));
            av_container.maskcontainer.part4 = av_container.maskcontainer.addChild(new (_local_3)());
            stopanim(av_container.maskcontainer.part0);
            stopanim(av_container.maskcontainer.part1);
            stopanim(av_container.maskcontainer.part2);
            stopanim(av_container.maskcontainer.part3);
            stopanim(av_container.maskcontainer.part4);
            if (!_arg_1)
            {
                av_container.scaleX = 2.3;
                av_container.scaleY = 2.3;
                av_container.x = 195;
                av_container.y = 48;
            }
            else
            {
                av_container.scaleX = 1;
                av_container.scaleY = 1;
                av_container.x = 285;
                av_container.y = 198;
            };
            var _local_4:* = new ColorTransform();
            var _local_5:* = transformArr[0].split(",");
            av_container.maskcontainer.part0.transform.colorTransform = new ColorTransform(1, 1, 1, 1, Number(_local_5[0]), Number(_local_5[1]), Number(_local_5[2]), 1);
            av_container.maskcontainer.part1.transform.colorTransform = gettransform(transformArr[1]);
            av_container.maskcontainer.part2.transform.colorTransform = gettransform(transformArr[1]);
            av_container.maskcontainer.part3.transform.colorTransform = gettransform(transformArr[2]);
            av_container.maskcontainer.part4.transform.colorTransform = gettransform(transformArr[3]);
        }

        public function settabs():*
        {
            var _local_4:*;
            var _local_1:* = 0;
            while (_local_1 < 4)
            {
                if (selectedTab == _local_1)
                {
                    thisref[("tab" + _local_1)].gotoAndStop(1);
                }
                else
                {
                    thisref[("tab" + _local_1)].gotoAndStop(2);
                    thisref[("tab" + _local_1)].buttonMode = true;
                    thisref[("tab" + _local_1)].addEventListener(MouseEvent.CLICK, tablistener);
                    thisref[("tab" + _local_1)].addEventListener(MouseEvent.MOUSE_OVER, tablistener);
                    thisref[("tab" + _local_1)].addEventListener(MouseEvent.MOUSE_OUT, tablistener);
                    thisref[("tab" + _local_1)].tabIndex = (_local_1 + 1);
                };
                _local_1++;
            };
            if (XMLDATA)
            {
                header.subtitle.text.text = XMLDATA.sections.subs[selectedTab];
                setFormat(header.subtitle.text);
            };
            colourbin.gotoAndStop((((tribeIndex * 4) + 1) + selectedTab));
            var _local_2:* = (("avatar" + (tribeIndex + 1)) + URLVAR.sex);
            var _local_3:* = new DropShadowFilter(2, 90, 0, 1, 5, 5, 0.2, 1, false, false, false);
            _local_1 = 0;
            while (_local_1 < 3)
            {
                if (selectors[("bt" + _local_1)].icon)
                {
                    selectors[("bt" + _local_1)].holder.removeChild(selectors[("bt" + _local_1)].icon);
                };
                if (selectors[("bt" + _local_1)].icon2)
                {
                    selectors[("bt" + _local_1)].holder.removeChild(selectors[("bt" + _local_1)].icon2);
                };
                selectors[("bt" + _local_1)].icon2 = undefined;
                selectors[("bt" + _local_1)].icon = undefined;
                switch (selectedTab)
                {
                    case 0:
                        maskinfotxt.visible = true;
                        setFormat(maskinfotxt);
                        langObj.setTextJustify(maskinfotxt, tribeData[tribeIndex][3]);
                        selectors.visible = false;
                        if (checkClassExist(((_local_2 + "mask") + (_local_1 + 1))))
                        {
                            _local_4 = getDefinitionByName(((_local_2 + "mask") + (_local_1 + 1)));
                            selectors[("bt" + _local_1)].icon = selectors[("bt" + _local_1)].holder.addChild(new (_local_4)());
                            selectors[("bt" + _local_1)].icon.scaleX = 1;
                            selectors[("bt" + _local_1)].icon.scaleY = 1;
                            selectors[("bt" + _local_1)].icon.x = avatarLoc[0];
                            selectors[("bt" + _local_1)].icon.y = avatarLoc[1];
                        };
                        break;
                    case 1:
                        maskinfotxt.visible = false;
                        selectors.visible = true;
                        if (checkClassExist(((_local_2 + "eyeL") + (_local_1 + 1))))
                        {
                            _local_4 = getDefinitionByName(((_local_2 + "eyeL") + (_local_1 + 1)));
                            selectors[("bt" + _local_1)].icon = selectors[("bt" + _local_1)].holder.addChild(new (_local_4)());
                            _local_4 = getDefinitionByName(((_local_2 + "eyeR") + (_local_1 + 1)));
                            selectors[("bt" + _local_1)].icon2 = selectors[("bt" + _local_1)].holder.addChild(new (_local_4)());
                            selectors[("bt" + _local_1)].icon.x = avatarLoc[0];
                            selectors[("bt" + _local_1)].icon.y = avatarLoc[1];
                            selectors[("bt" + _local_1)].icon2.x = avatarLoc[0];
                            selectors[("bt" + _local_1)].icon2.y = avatarLoc[1];
                        };
                        break;
                    case 2:
                        maskinfotxt.visible = false;
                        selectors.visible = true;
                        if (checkClassExist(((_local_2 + "nose") + (_local_1 + 1))))
                        {
                            _local_4 = getDefinitionByName(((_local_2 + "nose") + (_local_1 + 1)));
                            selectors[("bt" + _local_1)].icon = selectors[("bt" + _local_1)].holder.addChild(new (_local_4)());
                            selectors[("bt" + _local_1)].icon.x = avatarLoc[0];
                            selectors[("bt" + _local_1)].icon.y = avatarLoc[1];
                        };
                        break;
                    case 3:
                        maskinfotxt.visible = false;
                        selectors.visible = true;
                        if (checkClassExist(((_local_2 + "mouth") + (_local_1 + 1))))
                        {
                            _local_4 = getDefinitionByName(((_local_2 + "mouth") + (_local_1 + 1)));
                            selectors[("bt" + _local_1)].icon = selectors[("bt" + _local_1)].holder.addChild(new (_local_4)());
                            selectors[("bt" + _local_1)].icon.x = avatarLoc[0];
                            selectors[("bt" + _local_1)].icon.y = (avatarLoc[1] - 25);
                        };
                        break;
                };
                if (selectors[("bt" + _local_1)].icon)
                {
                    stopanim(selectors[("bt" + _local_1)].icon);
                    selectors[("bt" + _local_1)].icon.filters = [_local_3];
                };
                if (selectors[("bt" + _local_1)].icon2)
                {
                    stopanim(selectors[("bt" + _local_1)].icon2);
                    selectors[("bt" + _local_1)].icon2.filters = [_local_3];
                };
                _local_1++;
            };
        }

        private function selectColour(_arg_1:MouseEvent):*
        {
            var _local_2:* = _arg_1.target.transform.colorTransform;
            transformArr[selectedTab] = ((((_local_2.redOffset + ",") + _local_2.greenOffset) + ",") + _local_2.blueOffset);
            renderCharacter();
        }

        private function selectPart(_arg_1:MouseEvent):*
        {
            if (_arg_1.target.icon)
            {
                masksettings[selectedTab] = Number(_arg_1.target.name.substr(2, 1));
                renderCharacter();
            };
        }

        private function randomizeAppearance(_arg_1:MouseEvent):*
        {
            var _local_2:* = 0;
            while (_local_2 < 4)
            {
                if (_local_2 == 0)
                {
                    transformArr[0] = colorIndexes[(_local_2 + (tribeIndex * 4))][Math.floor((Math.random() * colorIndexes[_local_2].length))];
                }
                else
                {
                    transformArr[_local_2] = colorIndexes[(_local_2 + (tribeIndex * 4))][Math.floor((Math.random() * colorIndexes[_local_2].length))];
                    masksettings[_local_2] = Math.floor((Math.random() * 3));
                };
                _local_2++;
            };
            renderCharacter();
        }

        internal function setText(_arg_1:*, _arg_2:*):*
        {
            _arg_1 = (_arg_1 + " ");
            var _local_3:* = 0;
            while (_local_3 < (_arg_1.length + 1))
            {
                if ((((_arg_1.charCodeAt(_local_3) == 32) && ((_arg_1.charCodeAt((_local_3 - 1)) < 1456) || (_arg_1.charCodeAt((_local_3 - 1)) > 1524))) && ((_arg_1.charCodeAt((_local_3 - 2)) > 1455) || (_arg_1.charCodeAt((_local_3 - 2)) < 1525))))
                {
                    _arg_1 = ((((_arg_1.substr(1, _local_3) + String.fromCharCode(8207)) + "") + String.fromCharCode(8207)) + _arg_1.substr((_local_3 + 2), (_arg_1.length - _local_3)));
                    _local_3 = (_local_3 + 2);
                };
                _local_3++;
            };
            _arg_2.htmlText = (("<P Align='right' Font='Arial(Hebrew)'>" + _arg_1) + "</p>");
        }

        public function doprepare(_arg_1:Event):*
        {
            preparepage();
        }

        public function preparepage():*
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
            var _local_10:*;
            updateProgress();
            switch (thisref.currentFrame)
            {
                case 1:
                    if (XMLDATA)
                    {
                        title_m1.text.text = XMLDATA.terms.sex.term[0];
                        title_m2.text.text = XMLDATA.terms.sex.term[0];
                        title_f1.text.text = XMLDATA.terms.sex.term[1];
                        title_f2.text.text = XMLDATA.terms.sex.term[1];
                        if (thisref.stage.getChildAt(0).custID == 1)
                        {
                            langObj.setTextJustify(note0.text, notes.altnote[0]);
                            _local_5 = btn_boy_1.x;
                            _local_6 = title_m1.x;
                            btn_boy_1.x = btn_girl_1.x;
                            title_m1.x = title_f1.x;
                            btn_girl_1.x = _local_5;
                            title_f1.x = _local_6;
                            _local_5 = btn_boy_2.x;
                            _local_6 = title_m2.x;
                            btn_boy_2.x = btn_girl_2.x;
                            title_m2.x = title_f2.x;
                            btn_girl_2.x = _local_5;
                            title_f2.x = _local_6;
                        }
                        else
                        {
                            langObj.setTextJustify(note0.text, notes.note[0]);
                        };
                        langObj.setTextJustify(note1.text, notes.note[1]);
                        langObj.setTextJustify(tribe_text1, tribeData[0][1]);
                        langObj.setTextJustify(tribe_text2, tribeData[1][1]);
                        tribe_title1.gotoAndStop(("lang" + selectedLanguage));
                        tribe_title2.gotoAndStop(("lang" + selectedLanguage));
                        prev.visible = false;
                        btn_girl_1.addEventListener(MouseEvent.CLICK, setsex);
                        btn_boy_1.addEventListener(MouseEvent.CLICK, setsex);
                        btn_girl_2.addEventListener(MouseEvent.CLICK, setsex);
                        btn_boy_2.addEventListener(MouseEvent.CLICK, setsex);
                        btn_boy_1.tabIndex = 1;
                        btn_boy_2.tabIndex = 3;
                        btn_girl_1.tabIndex = 2;
                        btn_girl_2.tabIndex = 4;
                        updateTribeSelector();
                        if (URLVAR.sex)
                        {
                            next.visible = true;
                        }
                        else
                        {
                            next.visible = false;
                        };
                    }
                    else
                    {
                        next.visible = false;
                        prev.visible = false;
                    };
                    return;
                case 2:
                    prev.visible = false;
                    next.visible = false;
                    _local_2 = getDefinitionByName("mc_progress");
                    preloaderGfx = addChild(new (_local_2)());
                    preloaderGfx.x = (thisref.stage.stageWidth / 2);
                    preloaderGfx.y = (thisref.stage.stageHeight / 2);
                    preloaderGfx.percentagetxt.text = "0%";
                    _local_3 = new LoaderContext();
                    _local_3.applicationDomain = ApplicationDomain.currentDomain;
                    _local_4 = new Loader();
                    _local_4.contentLoaderInfo.addEventListener(Event.INIT, loadingInitListener);
                    _local_4.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorListener);
                    _local_4.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, loadingSectionListener);
                    if (standalone)
                    {
                        _local_4.load(new URLRequest((("../Avatar" + (tribeIndex + 1)) + ".swf")), _local_3);
                    }
                    else
                    {
                        _local_4.load(new URLRequest((((thisref.stage.getChildAt(0).baseURL + "avatar") + (tribeIndex + 1)) + ".swf")), _local_3);
                    };
                    return;
                case 3:
                    if (preloaderGfx)
                    {
                        removeChild(preloaderGfx);
                    };
                    title_username.text.htmlText = XMLDATA.terms.general.term[0];
                    langObj.setTextJustify(note0.text, notes.note[2], {
                        "htmlText":true,
                        "forceAlign":"center"
                    });
                    langObj.setTextJustify(note1.text, notes.note[3], {
                        "htmlText":true,
                        "forceAlign":"center"
                    });
                    langObj.setTextJustify(note2.text, notes.note[4], {
                        "htmlText":true,
                        "forceAlign":"center"
                    });
                    _local_1 = 0;
                    while (_local_1 < 4)
                    {
                        thisref[("key" + _local_1)].text.text = XMLDATA.keys.key[_local_1];
                        _local_1++;
                    };
                    tribe_title.gotoAndStop(((("tb_title" + tribeIndex) + "_l") + selectedLanguage));
                    tribeicon.gotoAndStop((selectedLanguage + 1));
                    setFormat(title_username.text, {"forcealign":"right"});
                    setFormat(username);
                    username.restrict = "0-9 A-Z a-z ؀-ۿ";
                    bt_randomize.setText(XMLDATA.terms.general.term[2]);
                    preloaderGfx = undefined;
                    responsetxt.text = "";
                    _local_1 = 0;
                    while (_local_1 < 4)
                    {
                        thisref[("tab" + _local_1)].icon.gotoAndStop((_local_1 + 1));
                        _local_1++;
                    };
                    settabs();
                    bt_randomize.tabIndex = 5;
                    username.tabIndex = 6;
                    colourbin.buttonMode = true;
                    colourbin.addEventListener(MouseEvent.CLICK, selectColour);
                    selectors.addEventListener(MouseEvent.CLICK, selectPart);
                    bt_randomize.addEventListener(MouseEvent.CLICK, randomizeAppearance);
                    renderCharacter();
                    if (URLVAR.username)
                    {
                        username.text = URLVAR.username;
                    };
                    if (username.text.length > 2)
                    {
                        next.visible = true;
                    }
                    else
                    {
                        next.visible = false;
                    };
                    username.addEventListener(KeyboardEvent.KEY_UP, usernamechk);
                    prev.visible = true;
                    return;
                case 4:
                    langObj.setTextJustify(note0.text, notes.note[5], {
                        "htmlText":true,
                        "forceAlign":"center"
                    });
                    renderCharacter(true);
                    bgd_location.gotoAndStop((tribeIndex + 1));
                    if (avatarSpeechIndex >= avatarSpeech.length)
                    {
                        bubbletxt.text = "";
                        gotoAndStop(5);
                        bubbletxt.visible = false;
                        balloon.visible = false;
                    }
                    else
                    {
                        _local_7 = repText(String(avatarSpeech[avatarSpeechIndex]), URLVAR.username);
                        langObj.setTextJustify(bubbletxt, _local_7, {"forceAlign":"center"});
                    };
                    prev.visible = true;
                    responsetxt.text = "";
                    return;
                case 5:
                    title_firstname.text.text = XMLDATA.terms.general.term[3];
                    title_lastname.text.text = XMLDATA.terms.general.term[4];
                    if (stageRef.langObj.getLangDir() == 1)
                    {
                        _local_8 = firstname.x;
                        firstname.x = lastname.x;
                        lastname.x = _local_8;
                    };
                    setFormat(title_firstname.text);
                    setFormat(title_lastname.text);
                    setFormat(firstname);
                    setFormat(lastname);
                    firstname.tabIndex = 1;
                    lastname.tabIndex = 2;
                    next.tabIndex = 3;
                    if (URLVAR.firstname)
                    {
                        firstname.text = URLVAR.firstname;
                    };
                    if (URLVAR.lastname)
                    {
                        lastname.text = URLVAR.lastname;
                    };
                    return;
                case 6:
                    langObj.setTextJustify(sectionHeading1, notes.note[6]);
                    langObj.setTextJustify(note1.text, notes.note[7], {"htmlText":true});
                    title_password.text.text = XMLDATA.terms.general.term[5];
                    title_renterpwd.text.text = XMLDATA.terms.general.term[6];
                    if (URLVAR.password)
                    {
                        password.text = URLVAR.password;
                    };
                    if (passwordRM)
                    {
                        password2.text = passwordRM;
                    };
                    password.displayAsPassword = true;
                    password2.displayAsPassword = true;
                    password.tabIndex = 1;
                    password2.tabIndex = 2;
                    next.tabIndex = 3;
                    setFormat(sectionHeading, {"forceAlign":"center"});
                    setFormat(title_password.text);
                    setFormat(title_renterpwd.text);
                    setFormat(password);
                    setFormat(password2);
                    return;
                case 7:
                    langObj.setTextJustify(note1.text, notes.note[8], {"htmlText":true});
                    langObj.setTextJustify(sectionHeading1, notes.note[6], {"htmlText":true});
                    title_email.text.text = XMLDATA.terms.general.term[7];
                    title_email_confirm.text.text = XMLDATA.terms.general.term[12];
                    if (URLVAR.email)
                    {
                        email.text = URLVAR.email;
                        email_confirm.text = URLVAR.email;
                    };
                    setFormat(email);
                    setFormat(email_confirm);
                    setFormat(sectionHeading, {"forceAlign":"center"});
                    email.tabIndex = 1;
                    email_confirm.tabIndex = 2;
                    return;
                case 8:
                    if (stageRef.langObj.getLangDir() == 1)
                    {
                        _local_9 = title_day.x;
                        _local_8 = birth_date.x;
                        title_day.x = (title_year.x - 18);
                        birth_date.x = birth_year.x;
                        title_year.x = (_local_9 - (title_year.width - title_day.width));
                        birth_year.x = ((_local_8 - (birth_year.width - birth_date.width)) + 12);
                    };
                    title_birthdate.text.text = XMLDATA.terms.general.term[8];
                    title_day.text = XMLDATA.terms.general.term[9];
                    title_month.text = XMLDATA.terms.general.term[10];
                    title_year.text = XMLDATA.terms.general.term[11];
                    _local_1 = 1;
                    while (_local_1 < 32)
                    {
                        birthdayDP.addItem({
                            "label":_local_1,
                            "value":_local_1
                        });
                        _local_1++;
                    };
                    _local_1 = 0;
                    while (_local_1 < months.length)
                    {
                        birthmonthDP.addItem({
                            "label":months[_local_1],
                            "value":(_local_1 + 1)
                        });
                        _local_1++;
                    };
                    _local_1 = 1950;
                    while (_local_1 < 2010)
                    {
                        birthyearDP.addItem({
                            "label":String(_local_1),
                            "value":_local_1
                        });
                        _local_1++;
                    };
                    birth_date.dataProvider = birthdayDP;
                    birth_month.dataProvider = birthmonthDP;
                    birth_year.dataProvider = birthyearDP;
                    birth_date.tabIndex = 1;
                    birth_month.tabIndex = 2;
                    birth_year.tabIndex = 3;
                    next.tabIndex = 4;
                    if (URLVAR.birthdate)
                    {
                        _local_10 = URLVAR.birthdate.split("/");
                        birth_year.selectedIndex = getIndexFromLabel(birth_year, _local_10[0]);
                        birth_month.selectedIndex = (Number(_local_10[1]) - 1);
                        birth_date.selectedIndex = (Number(_local_10[2]) - 1);
                    };
                    if (Number(XMLDATA.termsEnabled) == 1)
                    {
                        termslink.addEventListener(MouseEvent.CLICK, showterms);
                        termslink.setText(XMLDATA.terms.general.term[13]);
                        langObj.setTextJustify(title_terms, XMLDATA.terms.general.term[14], {"htmlText":true});
                        if (stageRef.langObj.getLangDir() == 1)
                        {
                            checkb.x = ((title_terms.x + title_terms.width) + checkb.width);
                        };
                        if (confirmedTerms)
                        {
                            checkb.toggle();
                        };
                    }
                    else
                    {
                        termslink.visible = false;
                        checkb.visible = false;
                        title_terms.visible = false;
                    };
                    return;
                case 9:
                    bubbletxt.visible = true;
                    balloon.visible = true;
                    langObj.setTextJustify(bubbletxt, avatarSpeechFinal[0], {"forceAlign":"center"});
                    return;
            };
        }

        private function getIndexFromLabel(_arg_1:*, _arg_2:*):*
        {
            var _local_3:* = 0;
            while (_local_3 < _arg_1.length)
            {
                if (_arg_1.getItemAt(_local_3).label == _arg_2)
                {
                    return (_local_3);
                };
                _local_3++;
            };
        }

        private function usernamechk(_arg_1:KeyboardEvent):*
        {
            usernameApproved = false;
            if (username.text.length > 1)
            {
                next.visible = true;
            }
            else
            {
                next.visible = false;
            };
        }

        public function doregister():*
        {
            var _local_3:*;
            var _local_1:* = [];
            var _local_2:* = 0;
            while (_local_2 < transformArr.length)
            {
                _local_1.push(transformArr[_local_2].toString());
                _local_2++;
            };
            URLVAR.mask = masksettings.toString();
            URLVAR.maskcl = _local_1.join("|");
            URLVAR.lang_id = thisref.stage.getChildAt(0).langObj.selectedLang;
            if (standalone)
            {
                _local_3 = new URLRequest("192.168.0.5/cocolani/php/register.php");
            }
            else
            {
                _local_3 = new URLRequest((thisref.stage.getChildAt(0).DBURL + "register.php"));
            };
            URLOADER = new URLLoader(_local_3);
            URLOADER.addEventListener(Event.COMPLETE, loadedResult);
            URLOADER.addEventListener(IOErrorEvent.IO_ERROR, errorloading);
            URLOADER.addEventListener(SecurityErrorEvent.SECURITY_ERROR, errorsecurityloading);
            if (debug)
            {
                URLOADER.dataFormat = URLLoaderDataFormat.TEXT;
            }
            else
            {
                URLOADER.dataFormat = URLLoaderDataFormat.VARIABLES;
            };
            _local_3.method = "POST";
            _local_3.data = URLVAR;
            URLOADER.load(_local_3);
        }

        private function loadedResult(_arg_1:Event):*
        {
            if (_arg_1.target.data.response == "true")
            {
                responsetxt.text = "Success!";
                thisref.stage.getChildAt(0).showmsg(XMLDATA.notes.note[9]);
                thisref.stage.getChildAt(0).removepopup("registration");
            }
            else
            {
                if (_arg_1.target.data.errorhide)
                {
                    thisref.stage.getChildAt(0).showmsg(_arg_1.target.data.errorhide);
                    thisref.stage.getChildAt(0).removepopup("registration");
                }
                else
                {
                    if (_arg_1.target.data.error)
                    {
                        responsetxt.text = _arg_1.target.data.error;
                        thisref.stage.getChildAt(0).showmsg(_arg_1.target.data.error);
                        next.visible = true;
                        prev.visible = true;
                        langObj.setTextJustify(bubbletxt, avatarSpeechFinal[2], {"forceAlign":"center"});
                    };
                };
            };
        }

        private function errorsecurityloading(_arg_1:SecurityErrorEvent):*
        {
            responsetxt.text = XMLDATA.errors.error[0];
            next.visible = true;
            prev.visible = true;
            langObj.setTextJustify(bubbletxt, avatarSpeechFinal[2], {"forceAlign":"center"});
        }

        private function errorloading(_arg_1:IOErrorEvent):*
        {
            if (thisref.currentFrame > 4)
            {
                responsetxt.text = XMLDATA.errors.error[1];
                langObj.setTextJustify(bubbletxt, avatarSpeechFinal[2], {"forceAlign":"center"});
            }
            else
            {
                responsetxt.text = XMLDATA.errors.error[0];
            };
            next.visible = true;
            prev.visible = true;
        }

        public function testalphabet(_arg_1:*, _arg_2:*):*
        {
            var _local_3:RegExp = /\W/;
            if (_local_3.test(_arg_1))
            {
                return (repText(String(XMLDATA.errors.error[2]), _arg_2));
            };
            return ("");
        }

        public function checkminchar(_arg_1:*, _arg_2:*, _arg_3:*):*
        {
            if (_arg_1.length < _arg_2)
            {
                return (repText(String(XMLDATA.errors.error[3]), _arg_3));
            };
            return ("");
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

        public function repText(_arg_1:*, _arg_2:*=null, _arg_3:Array=null):*
        {
            var _local_5:*;
            var _local_4:* = _arg_1;
            if (_local_4.indexOf("%rep1%") >= 0)
            {
                _local_4 = ((_local_4.substr(0, _local_4.indexOf("%rep1%")) + _arg_2) + _local_4.substr((_local_4.indexOf("%rep1%") + 6), _local_4.length));
            };
            if (_arg_3)
            {
                for (_local_5 in _arg_3)
                {
                    _local_4 = ((_local_4.substr(0, _local_4.indexOf((("%rep" + (_local_5 + 2)) + "%"))) + _arg_3[_local_5]) + _local_4.substr((_local_4.indexOf((("%rep" + (_local_5 + 2)) + "%")) + 6), _local_4.length));
                };
            };
            return (_local_4);
        }

        internal function __setProp_birth_date_Scene1_Tabs_7():*
        {
            var _local_1:DataProvider;
            var _local_2:SimpleCollectionItem;
            var _local_3:Array;
            var _local_4:Object;
            var _local_5:int;
            var _local_6:*;
            if (((__setPropDict[birth_date] == undefined) || (!(int(__setPropDict[birth_date]) == 8))))
            {
                __setPropDict[birth_date] = 8;
                try
                {
                    birth_date["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                _local_1 = new DataProvider();
                _local_3 = [{
                    "label":"label0",
                    "data":""
                }, {
                    "label":"label1",
                    "data":""
                }];
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
                birth_date.dataProvider = _local_1;
                birth_date.editable = false;
                birth_date.enabled = true;
                birth_date.prompt = "";
                birth_date.restrict = "";
                birth_date.rowCount = 5;
                birth_date.visible = true;
                try
                {
                    birth_date["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function frame1():*
        {
            preparepage();
        }

        internal function frame2():*
        {
            preparepage();
        }

        internal function frame3():*
        {
            preparepage();
        }

        internal function frame4():*
        {
            preparepage();
        }

        internal function frame5():*
        {
            preparepage();
        }

        internal function frame6():*
        {
            preparepage();
        }

        internal function frame7():*
        {
            preparepage();
        }

        internal function frame8():*
        {
            __setProp_birth_date_Scene1_Tabs_7();
            preparepage();
        }

        internal function frame9():*
        {
            preparepage();
        }


    }
}//package com.cocolani.panels

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
//fl.controls.RadioButton

package fl.controls
{
    import fl.managers.IFocusManagerGroup;
    import flash.events.MouseEvent;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;
    import fl.managers.IFocusManager;
    import flash.display.Shape;
    import flash.display.Graphics;
    import flash.display.DisplayObject;
    import flash.events.Event;

    public class RadioButton extends LabelButton implements IFocusManagerGroup 
    {

        private static var defaultStyles:Object = {
            "icon":null,
            "upIcon":"RadioButton_upIcon",
            "downIcon":"RadioButton_downIcon",
            "overIcon":"RadioButton_overIcon",
            "disabledIcon":"RadioButton_disabledIcon",
            "selectedDisabledIcon":"RadioButton_selectedDisabledIcon",
            "selectedUpIcon":"RadioButton_selectedUpIcon",
            "selectedDownIcon":"RadioButton_selectedDownIcon",
            "selectedOverIcon":"RadioButton_selectedOverIcon",
            "focusRectSkin":null,
            "focusRectPadding":null,
            "textFormat":null,
            "disabledTextFormat":null,
            "embedFonts":null,
            "textPadding":5
        };
        public static var createAccessibilityImplementation:Function;

        protected var _value:Object;
        protected var defaultGroupName:String = "RadioButtonGroup";
        protected var _group:RadioButtonGroup;

        public function RadioButton()
        {
            mode = "border";
            groupName = defaultGroupName;
        }

        public static function getStyleDefinition():Object
        {
            return (defaultStyles);
        }


        override public function drawFocus(_arg_1:Boolean):void
        {
            var _local_2:Number;
            super.drawFocus(_arg_1);
            if (_arg_1)
            {
                _local_2 = Number(getStyleValue("focusRectPadding"));
                uiFocusRect.x = (background.x - _local_2);
                uiFocusRect.y = (background.y - _local_2);
                uiFocusRect.width = (background.width + (_local_2 * 2));
                uiFocusRect.height = (background.height + (_local_2 * 2));
            };
        }

        private function setThis():void
        {
            var _local_1:RadioButtonGroup;
            _local_1 = _group;
            if (_local_1 != null)
            {
                if (_local_1.selection != this)
                {
                    _local_1.selection = this;
                };
            }
            else
            {
                super.selected = true;
            };
        }

        override public function get autoRepeat():Boolean
        {
            return (false);
        }

        override public function set autoRepeat(_arg_1:Boolean):void
        {
        }

        protected function handleClick(_arg_1:MouseEvent):void
        {
            if (_group == null)
            {
                return;
            };
            _group.dispatchEvent(new MouseEvent(MouseEvent.CLICK, true));
        }

        override protected function keyDownHandler(_arg_1:KeyboardEvent):void
        {
            switch (_arg_1.keyCode)
            {
                case Keyboard.DOWN:
                    setNext((!(_arg_1.ctrlKey)));
                    _arg_1.stopPropagation();
                    return;
                case Keyboard.UP:
                    setPrev((!(_arg_1.ctrlKey)));
                    _arg_1.stopPropagation();
                    return;
                case Keyboard.LEFT:
                    setPrev((!(_arg_1.ctrlKey)));
                    _arg_1.stopPropagation();
                    return;
                case Keyboard.RIGHT:
                    setNext((!(_arg_1.ctrlKey)));
                    _arg_1.stopPropagation();
                    return;
                case Keyboard.SPACE:
                    setThis();
                    _toggle = false;
                default:
                    super.keyDownHandler(_arg_1);
            };
        }

        private function setNext(_arg_1:Boolean=true):void
        {
            var _local_2:RadioButtonGroup;
            var _local_3:IFocusManager;
            var _local_4:int;
            var _local_5:Number;
            var _local_6:int;
            var _local_7:*;
            _local_2 = _group;
            if (_local_2 == null)
            {
                return;
            };
            _local_3 = focusManager;
            if (_local_3)
            {
                _local_3.showFocusIndicator = true;
            };
            _local_4 = _local_2.getRadioButtonIndex(this);
            _local_5 = _local_2.numRadioButtons;
            _local_6 = _local_4;
            if (_local_4 != -1)
            {
                do 
                {
                    _local_6 = ((++_local_6 > (_local_2.numRadioButtons - 1)) ? 0 : _local_6);
                    _local_7 = _local_2.getRadioButtonAt(_local_6);
                    if (((_local_7) && (_local_7.enabled)))
                    {
                        if (_arg_1)
                        {
                            _local_2.selection = _local_7;
                        };
                        _local_7.setFocus();
                        return;
                    };
                    if (((_arg_1) && (!(_local_2.getRadioButtonAt(_local_6) == _local_2.selection))))
                    {
                        _local_2.selection = this;
                    };
                    this.drawFocus(true);
                } while (_local_6 != _local_4);
            };
        }

        public function get group():RadioButtonGroup
        {
            return (_group);
        }

        override protected function keyUpHandler(_arg_1:KeyboardEvent):void
        {
            super.keyUpHandler(_arg_1);
            if (((_arg_1.keyCode == Keyboard.SPACE) && (!(_toggle))))
            {
                _toggle = true;
            };
        }

        override public function get selected():Boolean
        {
            return (super.selected);
        }

        override public function set toggle(_arg_1:Boolean):void
        {
            throw (new Error("Warning: You cannot change a RadioButtons toggle."));
        }

        public function set value(_arg_1:Object):void
        {
            _value = _arg_1;
        }

        public function set group(_arg_1:RadioButtonGroup):void
        {
            groupName = _arg_1.name;
        }

        override public function set selected(_arg_1:Boolean):void
        {
            if (((_arg_1 == false) || (selected)))
            {
                return;
            };
            if (_group != null)
            {
                _group.selection = this;
            }
            else
            {
                super.selected = _arg_1;
            };
        }

        override protected function draw():void
        {
            super.draw();
        }

        override public function get toggle():Boolean
        {
            return (true);
        }

        override protected function configUI():void
        {
            var _local_1:Shape;
            var _local_2:Graphics;
            super.configUI();
            super.toggle = true;
            _local_1 = new Shape();
            _local_2 = _local_1.graphics;
            _local_2.beginFill(0, 0);
            _local_2.drawRect(0, 0, 100, 100);
            _local_2.endFill();
            background = (_local_1 as DisplayObject);
            addChildAt(background, 0);
            addEventListener(MouseEvent.CLICK, handleClick, false, 0, true);
        }

        public function set groupName(_arg_1:String):void
        {
            if (_group != null)
            {
                _group.removeRadioButton(this);
                _group.removeEventListener(Event.CHANGE, handleChange);
            };
            _group = ((_arg_1 == null) ? null : RadioButtonGroup.getGroup(_arg_1));
            if (_group != null)
            {
                _group.addRadioButton(this);
                _group.addEventListener(Event.CHANGE, handleChange, false, 0, true);
            };
        }

        public function get value():Object
        {
            return (_value);
        }

        override protected function drawLayout():void
        {
            var _local_1:Number;
            super.drawLayout();
            _local_1 = Number(getStyleValue("textPadding"));
            switch (_labelPlacement)
            {
                case ButtonLabelPlacement.RIGHT:
                    icon.x = _local_1;
                    textField.x = (icon.x + (icon.width + _local_1));
                    background.width = ((textField.x + textField.width) + _local_1);
                    background.height = (Math.max(textField.height, icon.height) + (_local_1 * 2));
                    break;
                case ButtonLabelPlacement.LEFT:
                    icon.x = ((width - icon.width) - _local_1);
                    textField.x = (((width - icon.width) - (_local_1 * 2)) - textField.width);
                    background.width = ((textField.width + icon.width) + (_local_1 * 3));
                    background.height = (Math.max(textField.height, icon.height) + (_local_1 * 2));
                    break;
                case ButtonLabelPlacement.TOP:
                case ButtonLabelPlacement.BOTTOM:
                    background.width = (Math.max(textField.width, icon.width) + (_local_1 * 2));
                    background.height = ((textField.height + icon.height) + (_local_1 * 3));
                    break;
            };
            background.x = Math.min((icon.x - _local_1), (textField.x - _local_1));
            background.y = Math.min((icon.y - _local_1), (textField.y - _local_1));
        }

        override protected function drawBackground():void
        {
        }

        override protected function initializeAccessibility():void
        {
            if (RadioButton.createAccessibilityImplementation != null)
            {
                RadioButton.createAccessibilityImplementation(this);
            };
        }

        public function get groupName():String
        {
            return ((_group == null) ? null : _group.name);
        }

        private function setPrev(_arg_1:Boolean=true):void
        {
            var _local_2:RadioButtonGroup;
            var _local_3:IFocusManager;
            var _local_4:int;
            var _local_5:int;
            var _local_6:*;
            _local_2 = _group;
            if (_local_2 == null)
            {
                return;
            };
            _local_3 = focusManager;
            if (_local_3)
            {
                _local_3.showFocusIndicator = true;
            };
            _local_4 = _local_2.getRadioButtonIndex(this);
            _local_5 = _local_4;
            if (_local_4 != -1)
            {
                do 
                {
                    _local_5 = ((--_local_5 == -1) ? (_local_2.numRadioButtons - 1) : _local_5);
                    _local_6 = _local_2.getRadioButtonAt(_local_5);
                    if (((_local_6) && (_local_6.enabled)))
                    {
                        if (_arg_1)
                        {
                            _local_2.selection = _local_6;
                        };
                        _local_6.setFocus();
                        return;
                    };
                    if (((_arg_1) && (!(_local_2.getRadioButtonAt(_local_5) == _local_2.selection))))
                    {
                        _local_2.selection = this;
                    };
                    this.drawFocus(true);
                } while (_local_5 != _local_4);
            };
        }

        protected function handleChange(_arg_1:Event):void
        {
            super.selected = (_group.selection == this);
            dispatchEvent(new Event(Event.CHANGE, true));
        }


    }
}//package fl.controls

//------------------------------------------------------------
//fl.controls.RadioButtonGroup

package fl.controls
{
    import flash.events.EventDispatcher;
    import flash.events.Event;

    public class RadioButtonGroup extends EventDispatcher 
    {

        private static var groups:Object;
        private static var groupCount:uint = 0;

        protected var _selection:RadioButton;
        protected var radioButtons:Array;
        protected var _name:String;

        public function RadioButtonGroup(_arg_1:String)
        {
            _name = _arg_1;
            radioButtons = [];
            registerGroup(this);
        }

        public static function getGroup(_arg_1:String):RadioButtonGroup
        {
            var _local_2:RadioButtonGroup;
            if (groups == null)
            {
                groups = {};
            };
            _local_2 = (groups[_arg_1] as RadioButtonGroup);
            if (_local_2 == null)
            {
                _local_2 = new RadioButtonGroup(_arg_1);
                if ((++groupCount % 20) == 0)
                {
                    cleanUpGroups();
                };
            };
            return (_local_2);
        }

        private static function registerGroup(_arg_1:RadioButtonGroup):void
        {
            if (groups == null)
            {
                groups = {};
            };
            groups[_arg_1.name] = _arg_1;
        }

        private static function cleanUpGroups():void
        {
            var _local_1:String;
            var _local_2:RadioButtonGroup;
            for (_local_1 in groups)
            {
                _local_2 = (groups[_local_1] as RadioButtonGroup);
                if (_local_2.radioButtons.length == 0)
                {
                    delete groups[_local_1];
                };
            };
        }


        public function getRadioButtonIndex(_arg_1:RadioButton):int
        {
            var _local_2:int;
            var _local_3:RadioButton;
            _local_2 = 0;
            while (_local_2 < radioButtons.length)
            {
                _local_3 = (radioButtons[_local_2] as RadioButton);
                if (_local_3 == _arg_1)
                {
                    return (_local_2);
                };
                _local_2++;
            };
            return (-1);
        }

        public function get numRadioButtons():int
        {
            return (radioButtons.length);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get selection():RadioButton
        {
            return (_selection);
        }

        public function set selection(_arg_1:RadioButton):void
        {
            if ((((_selection == _arg_1) || (_arg_1 == null)) || (getRadioButtonIndex(_arg_1) == -1)))
            {
                return;
            };
            _selection = _arg_1;
            dispatchEvent(new Event(Event.CHANGE, true));
        }

        public function set selectedData(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:RadioButton;
            _local_2 = 0;
            while (_local_2 < radioButtons.length)
            {
                _local_3 = (radioButtons[_local_2] as RadioButton);
                if (_local_3.value == _arg_1)
                {
                    selection = _local_3;
                    return;
                };
                _local_2++;
            };
        }

        public function removeRadioButton(_arg_1:RadioButton):void
        {
            var _local_2:int;
            _local_2 = getRadioButtonIndex(_arg_1);
            if (_local_2 != -1)
            {
                radioButtons.splice(_local_2, 1);
            };
            if (_selection == _arg_1)
            {
                _selection = null;
            };
        }

        public function addRadioButton(_arg_1:RadioButton):void
        {
            if (_arg_1.groupName != name)
            {
                _arg_1.groupName = name;
                return;
            };
            radioButtons.push(_arg_1);
            if (_arg_1.selected)
            {
                selection = _arg_1;
            };
        }

        public function getRadioButtonAt(_arg_1:int):RadioButton
        {
            return (RadioButton(radioButtons[_arg_1]));
        }

        public function get selectedData():Object
        {
            var _local_1:RadioButton;
            _local_1 = _selection;
            return ((_local_1 == null) ? null : _local_1.value);
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
//registration_fla.Cross_Out_104

package registration_fla
{
    import flash.display.MovieClip;

    public dynamic class Cross_Out_104 extends MovieClip 
    {

        public function Cross_Out_104()
        {
            addFrameScript(5, frame6);
        }

        internal function frame6():*
        {
            stop();
        }


    }
}//package registration_fla

//------------------------------------------------------------
//registration_fla.Icon_Colour_Face_Animate_44

package registration_fla
{
    import flash.display.MovieClip;

    public dynamic class Icon_Colour_Face_Animate_44 extends MovieClip 
    {

        public function Icon_Colour_Face_Animate_44()
        {
            addFrameScript(19, frame20);
        }

        internal function frame20():*
        {
            stop();
        }


    }
}//package registration_fla

//------------------------------------------------------------
//registration_fla.Icon_Eye_Animate_46

package registration_fla
{
    import flash.display.MovieClip;

    public dynamic class Icon_Eye_Animate_46 extends MovieClip 
    {

        public function Icon_Eye_Animate_46()
        {
            addFrameScript(19, frame20);
        }

        internal function frame20():*
        {
            stop();
        }


    }
}//package registration_fla

//------------------------------------------------------------
//registration_fla.Icon_Go_l0_22

package registration_fla
{
    import flash.display.MovieClip;

    public dynamic class Icon_Go_l0_22 extends MovieClip 
    {

        public function Icon_Go_l0_22()
        {
            addFrameScript(12, frame13, 24, frame25);
        }

        internal function frame13():*
        {
            gotoAndPlay("lang0");
        }

        internal function frame25():*
        {
            gotoAndPlay("lang1");
        }


    }
}//package registration_fla

//------------------------------------------------------------
//registration_fla.Icon_Mouth_Animate_50

package registration_fla
{
    import flash.display.MovieClip;

    public dynamic class Icon_Mouth_Animate_50 extends MovieClip 
    {

        public function Icon_Mouth_Animate_50()
        {
            addFrameScript(19, frame20);
        }

        internal function frame20():*
        {
            stop();
        }


    }
}//package registration_fla

//------------------------------------------------------------
//registration_fla.Icon_Nose_Animate_48

package registration_fla
{
    import flash.display.MovieClip;

    public dynamic class Icon_Nose_Animate_48 extends MovieClip 
    {

        public function Icon_Nose_Animate_48()
        {
            addFrameScript(19, frame20);
        }

        internal function frame20():*
        {
            stop();
        }


    }
}//package registration_fla

//------------------------------------------------------------
//registration_fla.Reg_Location_Smaill_70

package registration_fla
{
    import flash.display.MovieClip;

    public dynamic class Reg_Location_Smaill_70 extends MovieClip 
    {

        public function Reg_Location_Smaill_70()
        {
            addFrameScript(0, frame1, 1, frame2);
        }

        internal function frame1():*
        {
            stop();
        }

        internal function frame2():*
        {
            stop();
        }


    }
}//package registration_fla

//------------------------------------------------------------
//bt_arrow

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_arrow extends simplebutton 
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
//Bt_Randomize

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class Bt_Randomize extends simplebutton 
    {

        public function Bt_Randomize()
        {
            addFrameScript(0, frame1, 1, frame2);
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
//bt_registerme

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class bt_registerme extends simplebutton 
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
//Mask_Female_tribe1

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class Mask_Female_tribe1 extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//Mask_Female_tribe2

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class Mask_Female_tribe2 extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//Mask_Male_tribe1

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class Mask_Male_tribe1 extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//Mask_Male_tribe2

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class Mask_Male_tribe2 extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//mc_colourbin

package 
{
    import flash.display.MovieClip;

    public dynamic class mc_colourbin extends MovieClip 
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
//mc_sexselector

package 
{
    import flash.display.MovieClip;

    public dynamic class mc_sexselector extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//mc_togglebt

package 
{
    import com.cocolani.common.checkbox;

    public dynamic class mc_togglebt extends checkbox 
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
//RadioButton_disabledIcon

package 
{
    import flash.display.MovieClip;

    public dynamic class RadioButton_disabledIcon extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//RadioButton_downIcon

package 
{
    import flash.display.MovieClip;

    public dynamic class RadioButton_downIcon extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//RadioButton_overIcon

package 
{
    import flash.display.MovieClip;

    public dynamic class RadioButton_overIcon extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//RadioButton_selectedDisabledIcon

package 
{
    import flash.display.MovieClip;

    public dynamic class RadioButton_selectedDisabledIcon extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//RadioButton_selectedDownIcon

package 
{
    import flash.display.MovieClip;

    public dynamic class RadioButton_selectedDownIcon extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//RadioButton_selectedOverIcon

package 
{
    import flash.display.MovieClip;

    public dynamic class RadioButton_selectedOverIcon extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//RadioButton_selectedUpIcon

package 
{
    import flash.display.MovieClip;

    public dynamic class RadioButton_selectedUpIcon extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//RadioButton_upIcon

package 
{
    import flash.display.MovieClip;

    public dynamic class RadioButton_upIcon extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//reg_fadein

package 
{
    import flash.display.MovieClip;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.utils.*;
    import flash.net.*;
    import flash.system.*;
    import flash.geom.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.ui.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.errors.*;
    import flash.media.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.xml.*;

    public dynamic class reg_fadein extends MovieClip 
    {

        public var thisref:*;

        public function reg_fadein()
        {
            addFrameScript(0, frame1, 7, frame8, 36, frame37, 66, frame67);
        }

        internal function frame1():*
        {
            thisref = this;
        }

        internal function frame8():*
        {
            thisref.myparent.fadeInContainerFin();
        }

        internal function frame37():*
        {
            thisref.myparent.fadeInContainerFin();
        }

        internal function frame67():*
        {
            thisref.myparent.fadeInContainerFin();
        }


    }
}//package 

//------------------------------------------------------------
//registration_next

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class registration_next extends simplebutton 
    {


    }
}//package 

//------------------------------------------------------------
//registration_previous

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class registration_previous extends simplebutton 
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
//terms_container

package 
{
    import com.cocolani.common.simplebutton;

    public dynamic class terms_container extends simplebutton 
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

//------------------------------------------------------------
//tribe1_icon

package 
{
    import flash.display.MovieClip;

    public dynamic class tribe1_icon extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//tribe2_icon

package 
{
    import flash.display.MovieClip;

    public dynamic class tribe2_icon extends MovieClip 
    {


    }
}//package 

//------------------------------------------------------------
//tribe3_icon

package 
{
    import flash.display.MovieClip;

    public dynamic class tribe3_icon extends MovieClip 
    {


    }
}//package 

