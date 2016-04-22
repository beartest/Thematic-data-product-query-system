package head
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.containers.Canvas;
	import mx.core.UIComponent;
	
	public class Cloud extends Canvas{	
		private var rad:Number = 160;    //radius
		private var d:Number = 300;
		private var sa:Number;
		private var ca:Number;
		private var sb:Number;
		private var cb:Number;
		private var originx:Number;
		private var originy:Number;
		private var speed:Number = 1;
		private var lasta:Number = 1;
		private var lastb:Number = 1;
		private var tLen:int = 0;
		private var tArr:Array = [];
		private var ui:UIComponent = new UIComponent();
		private var active:Boolean = false;
		private var distr:Boolean = true;
		[Bindable]
		public var howElliptical:Number = 1;
		
		public function Cloud(){
			
		}
		
		/**
		 * 入口函数
		 * 数据和程序的初始化
		 * */
		public function dataFunc(res:XML):void{
			var tagw:Number = this.width*0.7;
			var tagh:Number = this.height*0.8;
			sinCos(0, 0);
			addChild(ui);
			resizeHolder();
			var lar:Number = 0;
			var sma:Number = 9999;    //smallest
			for each(var tag:Object in res.tag){
				lar = Math.max(lar, tag.meuPeso);
				sma = Math.min(sma, tag.meuPeso);
				var perc:Number = (sma == lar) ? 1 : (tag.meuPeso - sma) / (lar - sma);
				var t:Tag = new Tag(tag, tag.color, tag.hicolor);
				ui.addChild(t);
				ui.x = (tagw - ui.width) * 0.5;
				ui.y = (tagh - ui.height) * 0.5;
				tArr.push(t);
			}
			tLen = tArr.length;
			positionAll();
			this.addEventListener(Event.ENTER_FRAME, updateTags);
			parent.addEventListener(MouseEvent.ROLL_OUT, mouseExitHandler);
			parent.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			this.addEventListener(Event.RESIZE, resizeHandler);
		}
		
		private function updateTags(e:Event):void{
			var a:Number;
			var b:Number;
			if(active){
				a = (-Math.min(Math.max(ui.mouseY, -250), 250) / 150) * speed;
				b = (Math.min( Math.max(ui.mouseX, -250), 250) /150) * speed;
			}else{
				a = lasta * 0.98;
				b = lastb * 0.98;
			}
			lasta = a;
			lastb = b;
			if(Math.abs(a) > 0.01 || Math.abs(b) > 0.01){
				sinCos(a, b);
				for(var j:int = 0; j < tLen; j++){
					var x1:Number = tArr[j].cx;
					var y1:Number = tArr[j].cy * ca + tArr[j].cz * (-sa);
					var z1:Number = tArr[j].cy * sa + tArr[j].cz * ca;
					var x2:Number = x1 * cb + z1 * sb;
					var y2:Number = y1;
					var z2:Number = x1 * (-sb) + z1 * cb;
					var x3:Number = x2;
					var y3:Number = y2;
					var z3:Number = z2;
					tArr[j].cx = x3;
					tArr[j].cy = y3;
					tArr[j].cz = z3;
					var pe:Number = d / (d + z3);
					tArr[j].x = (howElliptical * x3 * pe) - (howElliptical * 2);
					tArr[j].y = y3 * pe;
					tArr[j].scaleX = tArr[j].scaleY = pe;
					tArr[j].alpha = pe * 0.5;
				}
				depthSort();
			}
		}
		
		private function depthSort():void{
			tArr.sortOn("cz", Array.DESCENDING | Array.NUMERIC);
			var current:int = 0;
			for(var i:int = 0; i < tLen; i++){
				ui.setChildIndex(tArr[i], i);
				if(tArr[i].active){
					current = i;
				}
			}
			ui.setChildIndex(tArr[current], tArr.length - 1);
		}
		
		private function positionAll():void{		
			var phi:Number = 0;
			var theta:Number = 0;
			tArr.sort(function():Number{return Math.random() < 0.5 ? 1 : -1;});
			for(var i:int = 1; i < tLen + 1; i++){
				if(distr){
					phi = Math.acos(-1 + (2 * i - 1) / tLen);
					theta = Math.sqrt(tLen * Math.PI) * phi;
				}else{
					phi = Math.random() * (Math.PI);
					theta = Math.random() * (2 * Math.PI);
				}
				tArr[i - 1].cx = rad * Math.cos(theta) * Math.sin(phi);
				tArr[i - 1].cy = rad * Math.sin(theta) * Math.sin(phi);
				tArr[i - 1].cz = rad * Math.cos(phi);
			}
		}
		
		private function mouseExitHandler(e:Event):void{
			active = false;
		}
		
		private function mouseMoveHandler(e:MouseEvent):void{
			active = true;
		}
		
		private function resizeHandler(e:Event):void{
			resizeHolder();
		}
		
		private function resizeHolder():void{
			ui.x = (this.width - ui.width) * 0.5;
			ui.y = (this.height - ui.height) * 0.5;
			if(width > height){
				ui.scaleX = ui.scaleY = height / 500;
			}else{
				ui.scaleX = ui.scaleY = width / 500;
			}
		}
		
		private function sinCos(a:Number, b:Number):void{
			sa = Math.sin(a * Math.PI / 180);
			ca = Math.cos(a * Math.PI / 180);
			sb = Math.sin(b * Math.PI / 180);
			cb = Math.cos(b * Math.PI / 180);
		}
	}
}