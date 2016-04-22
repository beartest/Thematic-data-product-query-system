//带边框的label，在drawWidget中显示量算后的数据
package menuWidgets.draw
{
	import mx.controls.Label;
	
	//自定义样式
	[Style(name="borderColor",type="unit",format="Color",inherit="no")]
	[Style(name="borderWidth",type="Number",format="Length",inherit="no")]  
	[Style(name="borderAlpha",type="Number",format="Length",inherit="no")] 
	public class LabelBorder extends Label
	{
		public function LabelBorder() 
		{
			super();
		}
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth,unscaledHeight);
			graphics.clear();
			graphics.lineStyle(getStyle('borderWidth'),getStyle('borderColor'), getStyle('borderAlpha'), false);
			var x:Number = -(getStyle('borderWidth') / 2);
			var y:Number = -(getStyle('borderWidth') / 2);
			var width:Number = unscaledWidth + getStyle('borderWidth');
			var height:Number = unscaledHeight + getStyle('borderWidth');
			graphics.drawRect(x, y, width, height);
		}
	}
}