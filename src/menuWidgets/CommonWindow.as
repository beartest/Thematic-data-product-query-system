package menuWidgets
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import spark.components.Button;
	import spark.components.Label;
	import spark.components.Panel;
	import spark.components.ToggleButton;
	
	public class CommonWindow extends Panel
	{
		[SkinPart("false")]
		public var subtitleDisplay:Label;
		public var subtitle:String;
		[SkinPart("false")]
		public var closeButton:Button;
		
		private var _isclose:Boolean = true;
		public function get isclose():Boolean
		{
			return _isclose;
		}
		public function set isclose(value:Boolean):void
		{
			_isclose = value;
			if(value)
			{
				PopUpManager.removePopUp(this);
			}
			else
			{
				PopUpManager.addPopUp(this,Sprite(FlexGlobals.topLevelApplication),false);
			}
		}
		
		private var _controlButton:ToggleButton;
		public function get controlButton():ToggleButton
		{
			return _controlButton;
		}
		public function set controlButton(value:ToggleButton):void
		{
			_controlButton = value;
		}
		
		/**
		 * 窗体构造函数
		 * @param tb 关联窗体按钮
		 * 
		 */		
		public function CommonWindow(tb:ToggleButton = null)
		{
			_controlButton = tb;
			super();
		}
		
		override protected function partAdded(partName:String, instance:Object):void {
			super.partAdded(partName, instance);
			if(instance == subtitleDisplay)  
			{
				subtitleDisplay.text = subtitle;
			}
			
			if(instance == closeButton) 
			{
				Button(instance).addEventListener(MouseEvent.CLICK, closeWin);
			}
		}
		
		override protected function partRemoved(partName:String, instance:Object):void {
			super.partRemoved(partName, instance);
			
			if(instance == closeButton) 
			{
				Button(instance).removeEventListener(MouseEvent.CLICK, closeWin);
			}
			
		}
		
		protected function closeWin(event:MouseEvent):void 
		{
			if(this.isPopUp)
			{
				isclose = true;
				if(_controlButton)
				{
					_controlButton.selected = false;
				}
			}
		}
	}
}