package progressbar 
{ 
	import flash.display.*;
	import flash.events.*;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BlurFilter;
	import flash.geom.Matrix;
	import flash.net.*;
	import flash.system.Capabilities;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.*;
	
	import mx.events.*;
	import mx.preloaders.*;
	
	public class MyDownloadProgressBar extends Sprite implements IPreloaderDisplay 
	{        
		[Embed(source="images/progressbar/palinuridae.png", mimeType="application/octet-stream")] 
		public var _loadingLogo:Class; 
		
		private var dpbImageControl:Loader; 
		private var _barSprite:Sprite; 
		private var progressText:TextField;        
		private var ProgressBarSpritIsAdded:Boolean = false; 
		
		public function MyDownloadProgressBar() {   
			super();                            
		} 
		
		// Specify the event listeners. 
		public function set preloader(preloader:Sprite):void { 
			//Listen for 正在下载 
			preloader.addEventListener(ProgressEvent.PROGRESS, handleProgress); 
			//Listen for 下载完成 
			preloader.addEventListener(Event.COMPLETE, handleComplete); 
			//Listen for 正在初始化 
			preloader.addEventListener(FlexEvent.INIT_PROGRESS, handleInitProgress); 
			//Listen for 初始化完成 
			preloader.addEventListener(FlexEvent.INIT_COMPLETE, handleInitComplete); 
		} 
		
		// Initialize the Loader control in the override 
		// of IPreloaderDisplay.initialize(). 
		public function initialize():void { 
			//添加logo图 
			dpbImageControl = new Loader();       
			dpbImageControl.contentLoaderInfo.addEventListener(Event.COMPLETE, loader_completeHandler); 
			dpbImageControl.loadBytes(new _loadingLogo() as ByteArray);  
		} 
		
		
		// After the SWF file loads, set the size of the Loader control. 
		private function loader_completeHandler(event:Event):void 
		{         
			
			dpbImageControl.width = 100; 
			dpbImageControl.height= 100; 
			dpbImageControl.x = this.stage.stageWidth/2 - 165; 
			dpbImageControl.y = this.stage.stageHeight/2 - dpbImageControl.height ; 
			addChild(dpbImageControl); 
		}   
		
		// 
		private function addProgressBarSprit():void{ 
			
			//绘制进度条背景 
			var _Sprite2:Sprite = new Sprite(); 
			
			_Sprite2.graphics.lineStyle(2, 0xff5500); 
			_Sprite2.graphics.beginFill(0xFFFFFF); 
			_Sprite2.graphics.drawRect((this.stage.stageWidth/2 - 112), (this.stage.stageHeight/2 - 6), 204, 12);   
			_Sprite2.graphics.endFill();
			addChild(_Sprite2); 
			
			//------------------------------------------------- 
			
			//加载进度条Sprite 
			_barSprite = new Sprite(); 
			
			_barSprite.x = this.stage.stageWidth/2 - 109; 
			_barSprite.y = this.stage.stageHeight/2 - 3; 
			addChild(_barSprite); 
			
			//------------------------------------------------- 
			
			//加载进度条文字 
			progressText = new TextField(); 
			
			progressText.textColor = 0xff5500; 
			progressText.width = 116; 
			progressText.height = 26; 
			progressText.x = this.stage.stageWidth/2 + 127 - progressText.width; 
			progressText.y = this.stage.stageHeight/2 - 10 - progressText.height; 
			addChild(progressText); 
		} 
		
		//刷新进度条 
		private function drawProgressBar(bytesLoaded:Number, bytesTotal:Number):void 
		{   
			if (_barSprite != null && progressText != null){ 
				var g:Graphics = _barSprite.graphics;   
				
				g.lineStyle(); 
				g.beginFill(0xff5500); 
				g.drawRect(0,0,199*(bytesLoaded/bytesTotal),7); 
				g.endFill(); 
			} 
		} 
		
		//正在下载的进度 
		private function handleProgress(event:ProgressEvent):void { 
			//第一次处理时绘制进度条Sprit 
			if (ProgressBarSpritIsAdded == false){ 
				ProgressBarSpritIsAdded = true; 
				addProgressBarSprit(); 
			} 
			
			if (progressText != null){ 
				progressText.text =  "进度："+event.bytesLoaded/event.bytesTotal*100+"%"; 
				var format1:TextFormat=new TextFormat("MICROSOFT YAHEI");
				format1.size=16;
				format1.bold=true;
				progressText.setTextFormat(format1,0,progressText.text.length);
			}         
			drawProgressBar(event.bytesLoaded, event.bytesTotal); 
		} 
		
		private function handleComplete(event:Event):void { 
			if (progressText != null){ 
				progressText.text = "加载完成"; 
				var format:TextFormat=new TextFormat("MICROSOFT YAHEI");
				format.size=16;
				format.bold=true;
				progressText.setTextFormat(format,0,progressText.text.length);
			} 
			drawProgressBar(1,1);        
		} 
		
		private function handleInitProgress(event:Event):void { 
			if (progressText != null){ 
				progressText.text = "正在初始化..."; 
				var format:TextFormat=new TextFormat("MICROSOFT YAHEI");
				format.size=16;
				format.bold=true;
				progressText.setTextFormat(format,0,progressText.text.length);
			} 
			drawProgressBar(1,1); 
		} 
		
		private function handleInitComplete(event:Event):void { 
			if (progressText != null){ 
				progressText.text = "初始化完成."; 
				var format:TextFormat=new TextFormat("MICROSOFT YAHEI");
				format.size=16;
				format.bold=true;
				progressText.setTextFormat(format,0,progressText.text.length);
			} 
			drawProgressBar(1,1);         
			
			//0.03秒后抛出完成事件 
			var timer:Timer = new Timer(300,1); 
			timer.addEventListener(TimerEvent.TIMER, dispatchComplete); 
			timer.start();      
		} 
		
		private function dispatchComplete(event:TimerEvent):void { 
			dispatchEvent(new Event(Event.COMPLETE)); 
		} 
		
		
		// Implement IPreloaderDisplay interface 
		
		public function get backgroundColor():uint { 
			return 0; 
		} 
		
		public function set backgroundColor(value:uint):void { 
		} 
		
		public function get backgroundAlpha():Number { 
			return 0; 
		} 
		
		public function set backgroundAlpha(value:Number):void { 
		} 
		
		public function get backgroundImage():Object { 
			return undefined; 
		} 
		
		public function set backgroundImage(value:Object):void { 
		} 
		
		public function get backgroundSize():String { 
			return ""; 
		} 
		
		public function set backgroundSize(value:String):void { 
		} 
		
		public function get stageWidth():Number { 
			return 500; 
		} 
		
		public function set stageWidth(value:Number):void { 
		} 
		
		public function get stageHeight():Number { 
			return 375; 
		} 
		
		public function set stageHeight(value:Number):void { 
		} 
	} 
	
} 