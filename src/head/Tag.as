package head
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.system.IME;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import mx.controls.Alert;
	import mx.managers.SystemManager;
	
	import rightpanel.GoodsFormBean;
	import rightpanel.rightpanel;
	
	public class Tag extends Sprite{
		private var sp:Sprite = new Sprite();
		private var _cx:Number;
		private var _cy:Number;
		private var _cz:Number;
		private var _color:Number;
		private var _hicolor:Number;
		private var _active:Boolean;
		private var tf:TextField = new TextField();
		
		public var myFont:Class;
		
		/**
		 * 每一个云标签对象设置
		 * @param node 每一个云标签对象
		 * @param c1 每一个云标签的文本颜色
		 * @param c2 每一个云标签的鼠标移动上去的文本颜色
		 * */
		public function Tag(node:Object, c1:Number, c2:Number){
			_color = c1;
			_hicolor = c2;
			_active = false;
			tf.autoSize = TextFieldAutoSize.LEFT;
			tf.selectable = false;
			var tft:TextFormat = new TextFormat();
			tft.font = "myFont";
			tft.bold = true;
			tft.color = c1;
			tft.size = ((10 * node.size) / 50);
			tf.defaultTextFormat = tft;
			tf.embedFonts = false;    //不使用嵌入字体
			tf.text = node.name;
			addChild(tf);
			tf.x = -this.width * 0.5;
			tf.y = -this.height * 0.5;
			sp.graphics.beginFill(0xBCD4F2, 0.5);    //每个云标签的背景颜色和背景透明度
			sp.graphics.lineStyle(1, 0xBCD4F2);    //每个云标签的边框宽度和边框颜色
			sp.graphics.drawRect(0, 0, tf.textWidth + 20, tf.textHeight + 5);
			sp.graphics.endFill();
			addChildAt(sp, 0);
			sp.x = -(tf.textWidth * 0.5) - 10;
			sp.y = -(tf.textHeight * 0.5) - 2;
			sp.visible = false;
			this.mouseChildren = false;
			this.buttonMode = true;
			this.useHandCursor = true;
			this.addEventListener(MouseEvent.MOUSE_OUT, outHandler);
			this.addEventListener(MouseEvent.MOUSE_OVER, overHandler);
			this.addEventListener(MouseEvent.MOUSE_UP, function (e:MouseEvent):void{upHandler(e, node);});
		}
		
		private function overHandler(e:MouseEvent):void{
			sp.visible = true;
			tf.textColor = _hicolor;
			_active = true;
		}
		
		private function outHandler(e:MouseEvent):void{
			sp.visible = false;
			tf.textColor = _color;
			_active = false;
		}
		
		private function upHandler(e:MouseEvent, node:Object):void{	
			var mypanel:rightpanel=((this.root as SystemManager).getChildAt(0) as ColdChain).myrightpanel;
			mypanel.myResult.myTabBar.selectedIndex=2;
			mypanel.myResult.child3.additemByCloud(node.name);
			mypanel.myTabBar.selectedIndex=1;
		}
		
		public function set cx(n:Number):void{
			_cx = n;
		}
		
		public function get cx():Number{
			return _cx;
		}
		
		public function set cy(n:Number):void{
			_cy = n;
		}
		
		public function get cy():Number{
			return _cy;
		}
		
		public function set cz(n:Number):void{
			_cz = n;
		}
		
		public function get cz():Number{
			return _cz;
		}
		
		public function get active():Boolean{
			return _active;
		}
		
	}
}