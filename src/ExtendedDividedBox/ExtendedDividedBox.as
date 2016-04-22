package ExtendedDividedBox
{
	import ExtendedDividedBox.ButtonClickEvent;
	
	import flash.display.DisplayObject;
	import flash.display.GradientType;
	import flash.display.SpreadMethod;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.StyleSheet;
	
	import mx.binding.utils.BindingUtils;
	import mx.containers.DividedBox;
	import mx.containers.DividerState;
	import mx.containers.dividedBoxClasses.*;
	import mx.controls.Button;
	import mx.core.FlexGlobals;
	import mx.core.mx_internal;
	import mx.events.DividerEvent;
	import mx.events.FlexEvent;
	import mx.events.ResizeEvent;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.IStyleManager2;
	
	import spark.effects.Resize;
	
	use namespace mx_internal;
	
	[Style(name="barFillColors",type="Array",format="Color",inherit="no")]
	[Style(name="barBorderColor",type="uint",format="Color",inherit="no")]
	[Style(name="barBorderThickness",type="Number",format="Number",inherit="no")]
	[Event(name="buttonClick", type="components.ExtendedDividedBox.ButtonClickEvent")]
	public class ExtendedDividedBox extends DividedBox
	{
		//create the gradient and apply tothe box controle
		private var fillType:String = GradientType.LINEAR;
		private var alphas:Array = [1,1,1];
		private var ratios:Array = [0,128,255];
		private var spreadMethod:String = SpreadMethod.PAD;
		
		private var _resizeContainer:DisplayObject;
		/**
		 * 设置需要自动缩放的容器 
		 * @param value
		 * 
		 */		
		public function set ResizeContainer(value:DisplayObject):void{
			if(value){
				_resizeContainer = value;
				
				_resizeContainer.addEventListener(ResizeEvent.RESIZE,handleSliderParentReSize);
				_resizeContainer.addEventListener(FlexEvent.CREATION_COMPLETE,function(e:FlexEvent):void{
					
					OpenNavToolsContainer.widthTo = (e.target as DisplayObject).width;
					if ((e.target as DisplayObject).width < 5){
						this.ButtonSelected=true;
					}
					else
					{
						this.ButtonSelected=false;
					}
				});
			}
		}
		private function handleSliderParentReSize(event:Event):void{
			
			if (event.currentTarget.width > 5 && this.ButtonSelected != false){
				this.ButtonSelected = false;
				ContainerIsVisable = true;
			}
			else{
				if (event.currentTarget.width < 5){
					this.ButtonSelected=true;
					ContainerIsVisable = false;
					event.currentTarget.width = 0;
				}
			}
		}
		/**
		 *  
		 */		
		[Bindable]
		public var ContainerIsVisable:Boolean = true;
		private function setSubToolsContainerVisible():void{
			if (ContainerIsVisable==true){
				CloseNavToolsContainer.target = _resizeContainer;
				CloseNavToolsContainer.duration = 400;
				CloseNavToolsContainer.widthTo = 0;
				CloseNavToolsContainer.play();
				ContainerIsVisable=false;
			}
			else{
				
				OpenNavToolsContainer.target = _resizeContainer;
				OpenNavToolsContainer.duration = 400;
				OpenNavToolsContainer.play();
				ContainerIsVisable=true;
			}
		}
		//关闭动画
		private var CloseNavToolsContainer:Resize = new Resize();
		//展开动画
		private var OpenNavToolsContainer:Resize = new Resize();
		
		private var mBoxDivider:Array = new Array();
		
		private var _barFillColors:Array;    
		
		private var _barBorderColor:uint;    
		
		//==============================
		// Style set
		[Embed(source="/images/ExtendedDividedBox/Arrow_Down.png")]
		private var Arrow_Down:Class;
		
		[Embed(source="/images/ExtendedDividedBox/Arrow_Up.png")]
		private var Arrow_Up:Class;
		
		[Embed(source="/images/ExtendedDividedBox/Arrow_Close.png")]
		private var Arrow_Close:Class;
		
		[Embed(source="/images/ExtendedDividedBox/Arrow_Open.png")]
		private var Arrow_Open:Class;
		
		[Embed(source="/images/ExtendedDividedBox/NavGrip.png")]
		private var Nav_Grip:Class;
		
		[Embed(source="/images/ExtendedDividedBox/SkinSet001.swf#H_Slider_Button_1")]
		private var H_Slider_Button_1:Class;
		
		[Embed(source="/images/ExtendedDividedBox/SkinSet001.swf#H_Slider_Button_2")]
		private var H_Slider_Button_2:Class;
		
		[Embed(source="/images/ExtendedDividedBox/SkinSet001.swf#V_Slider_Button_1")]
		private var V_Slider_Button_1:Class;
		
		[Embed(source="/images/ExtendedDividedBox/SkinSet001.swf#V_Slider_Button_2")]
		private var V_Slider_Button_2:Class;
		// Style set
		//==============================
		
		private var _ButtonOnIndexs:Array;
		private var _showButton:Boolean=false;
		private var _isOverButton:Boolean;
		public function ExtendedDividedBox()
		{
			super();
			
			cssV();
		}
		
		private function css():void
		{
			this.setStyle("barBorderColor",0xEE9819);
			this.setStyle("barFillColors",[0xFAE38F,0xEE9819]);
			this.setStyle("dividerThickness",10);
			this.setStyle("dividerSkin",Nav_Grip);
		}
		
		private function cssH():void
		{
			this.setStyle("buttonWidth",75);
			this.setStyle("barBorderColor",0xFAE38F);
			this.setStyle("barFillColors",[0x666666,0xFFFFFF]);
			this.setStyle("barBorderThickness",0);
			this.setStyle("dividerThickness",10);
			this.setStyle("downSkin",H_Slider_Button_1);
			this.setStyle("overSkin",H_Slider_Button_2);
			this.setStyle("upSkin",H_Slider_Button_2);
			this.setStyle("selectedDownSkin",H_Slider_Button_1);
			this.setStyle("selectedOverSkin",H_Slider_Button_2);
			this.setStyle("selectedUpSkin",H_Slider_Button_2);
			this.setStyle("dividerSkin",Nav_Grip);
			this.setStyle("cornerRadius",5);
		}
		
		private function cssV():void
		{
			this.setStyle("buttonWidth",75);
			//			this.setStyle("barBorderColor",0xEE9819);
			this.setStyle("barFillColors",[0xBBBBBB,0xFFFFFF,0xEEEEEE]);
			this.setStyle("dividerThickness",10);
			this.setStyle("downSkin",V_Slider_Button_1);
			this.setStyle("overSkin",V_Slider_Button_2);
			this.setStyle("upSkin",V_Slider_Button_2);
			this.setStyle("selectedDownSkin",V_Slider_Button_1);
			this.setStyle("selectedOverSkin",V_Slider_Button_2);
			this.setStyle("selectedUpSkin",V_Slider_Button_2);
			this.setStyle("dividerSkin",Nav_Grip);
			this.setStyle("cornerRadius",5);
		}
		
		public function set ButtonOnIndexs(value:Array):void{
			_ButtonOnIndexs=value
		}
		
		public function get ButtonOnIndexs():Array{
			return _ButtonOnIndexs;    
		}
		
		public function set showButton(value:Boolean):void{
			_showButton=value
		}
		
		public function get showButton():Boolean{
			return _showButton;    
		}
		
		public function set ButtonSelected(value:Boolean):void{
			if (_button){
				_button.selected=value;
			}
		}
		
		public function get ButtonSelected():Boolean{
			if (_button){
				return _button.selected;    
			}
			else{
				return false;
			}
		}
		
		
		/**
		 * don't allow dragging if over a button
		 * */        
		
		override mx_internal function startDividerDrag(divider:BoxDivider,trigger:MouseEvent):void{
			
			//ignore if we are over a button
			if(_showButton && _isOverButton){
				return;            
			}
			
			super.mx_internal::startDividerDrag(divider,trigger);
			
		}
		
		/**
		 * don't show splitter cursor when over a button
		 * */    
		override mx_internal function changeCursor(divider:BoxDivider):void{
			
			//ignore if we are over a button
			if(_showButton && _isOverButton){
				return;            
			}
			
			super.mx_internal::changeCursor(divider);
			
		}
		
		private function verifyButtonIndex(value:int):Boolean{
			
			for(var i:int=0;i < _ButtonOnIndexs.length;i++) {
				if (value == _ButtonOnIndexs[i]){
					return true;
				}
			}
			
			return false;
			
		}        
		
		private var _button:Button;
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void{
			
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			
			if (mBoxDivider.length == 0){
				
				for(var i:int=0;i < numDividers;i++) {
					var divbar:BoxDivider = getDividerAt(i);
					divbar.addEventListener("resize",handleResize);
					mBoxDivider.push(divbar);
					
					//see if the current index is in the array or if the array is 0 then
					//all have buttons this will allow us to have buttons only on selected
					//parts of a multi part splitter
					var _hasbutton:Boolean=true;//default true if no indexs
					if (_ButtonOnIndexs){
						if (_ButtonOnIndexs.length !=0){
							_hasbutton= verifyButtonIndex(i)
						}
					}
					
					if(_showButton && _hasbutton){
						_button = new Button();
						_button.name = "SplitterButton" + i;
						
						//set al styles and skins
						_button.width = getStyle("buttonWidth");
						_button.height= getStyle("dividerThickness");
						_button.toggle =true;
						
						_button.setStyle("cornerRadius",getStyle("cornerRadius"));
						
						_button.setStyle("downSkin",getStyle("downSkin"));
						_button.setStyle("overSkin",getStyle("overSkin"));
						_button.setStyle("upSkin",getStyle("upSkin"));
						
						//由于图标不全，增加旋转
						_button.rotationY = 180;
						_button.move(10,0);
						
						//no divider skin just the button
						divbar.setStyle("dividerSkin",null);
						
						if (direction == "vertical"){
							_button.width = getStyle("buttonWidth");
							_button.height= getStyle("dividerThickness")+1;
							_button.x = (unscaledWidth/2) - (_button.width/2);
							
							_button.setStyle("icon",Arrow_Down);
							_button.setStyle("selectedOverIcon",Arrow_Up);
							_button.setStyle("selectedUpIcon",Arrow_Up);
							_button.setStyle("selectedDownIcon",Arrow_Up);
							
							_button.setStyle("selectedDownSkin",getStyle("selectedDownSkin"));
							_button.setStyle("selectedOverSkin",getStyle("selectedOverSkin"));
							_button.setStyle("selectedUpSkin",getStyle("selectedUpSkin"));
						}
						else{
							_button.height = getStyle("buttonWidth");
							_button.width= getStyle("dividerThickness")+1;
							_button.y = (unscaledHeight/2) - (_button.height/2);
							
							_button.setStyle("icon",Arrow_Close);
							_button.setStyle("selectedOverIcon",Arrow_Open);
							_button.setStyle("selectedUpIcon",Arrow_Open);
							_button.setStyle("selectedDownIcon",Arrow_Open);
							
							_button.setStyle("selectedDownSkin",getStyle("selectedDownSkin"));
							_button.setStyle("selectedOverSkin",getStyle("selectedOverSkin"));
							_button.setStyle("selectedUpSkin",getStyle("selectedUpSkin"));
						}
						
						//add events to change the mouse pointer 
						//and handle the click (open or close children)
						_button.addEventListener(MouseEvent.CLICK, handleClick);
						_button.addEventListener(MouseEvent.MOUSE_OVER, handleOver);
						_button.addEventListener(MouseEvent.MOUSE_OUT, handleOut);
						
						divbar.addChild(_button);
						
					}
					
				}
				
			}
			
			Draw_Gradient_Fill();
			
		}
		
		private function handleResize(event:ResizeEvent):void{
			
			if(!_showButton){return;}
			
			if (event.currentTarget.width != event.oldWidth || event.currentTarget.height != event.oldHeight){
				
				for(var i:int=0;i < numDividers;i++) {
					var divbar:BoxDivider = getDividerAt(i);
					
					var tempButton:Button = Button(divbar.getChildByName("SplitterButton" + i));
					
					if (tempButton){
						if (direction == "vertical"){
							tempButton.x = (unscaledWidth/2) - (tempButton.width/2);
						}
						else{
							tempButton.y = (unscaledHeight/2) - (tempButton.height/2);
						}
						
					}    
					
				}
			}
			
			
		}
		
		//event handlers for the button
		private function handleClick(event:MouseEvent):void{
			
			setSubToolsContainerVisible();
			dispatchEvent(new ButtonClickEvent("buttonClick",event.currentTarget,Boolean(event.currentTarget.selected)));
		}
		
		//trap these event when around the button to make the 
		//extended slider behave as we require
		private function handleOut(event:MouseEvent):void{
			_isOverButton=false;
		}
		private function handleOver(event:MouseEvent):void{
			_isOverButton=true;
		}
		
		override public function styleChanged(styleProp:String):void {
			
			super.styleChanged(styleProp);
			
			// Check to see if style changed. 
			if (styleProp=="barFillColors" || styleProp=="barBorderColor") 
			{
				_barBorderColor=0;
				_barFillColors=null;
				invalidateDisplayList();
				return;
			}
			
			
		}
		
		private function Draw_Gradient_Fill():void{
			
			graphics.clear();
			
			for(var i:int=0;i < mBoxDivider.length;i++) {
				
				if (!_barFillColors){
					_barFillColors = getStyle("barFillColors");
					if (!_barFillColors){
						_barFillColors =[0xFAE38F,0xEE9819]; // if no style default to orange
					}
				}
				
				if (!_barBorderColor){
					_barBorderColor = getStyle("barBorderColor");
					if (!_barBorderColor){
						_barBorderColor =0xEE9819; // if no style default to orange
					}
				}
				
				//graphics.lineStyle(1,_barBorderColor);
				
				var divwidth:Number = mBoxDivider[i].getStyle("dividerThickness");
				
				if (divwidth==0){divwidth=10;}
				
				var matr:Matrix = new Matrix();
				
				if (direction == "vertical"){
					matr.createGradientBox(mBoxDivider[i].width,divwidth,Math.PI/2, mBoxDivider[i].x, mBoxDivider[i].y);
					
					graphics.beginGradientFill(fillType, _barFillColors, alphas, ratios, matr,spreadMethod);
					graphics.drawRect(mBoxDivider[i].x,mBoxDivider[i].y,mBoxDivider[i].width,divwidth);
				}
				else{
					matr.createGradientBox(divwidth,mBoxDivider[i].height ,0, mBoxDivider[i].x, mBoxDivider[i].x+10);
					graphics.beginGradientFill(fillType, _barFillColors, alphas, ratios, matr,spreadMethod);
					graphics.drawRect(mBoxDivider[i].x,mBoxDivider[i].y,divwidth, mBoxDivider[i].height);
				}
				
				
			}            
		}
	}
}