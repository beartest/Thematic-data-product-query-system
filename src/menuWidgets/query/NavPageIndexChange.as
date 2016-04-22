package menuWidgets.query
{
	import flash.events.Event;
	
	public class NavPageIndexChange extends Event
	{
		/**
		 * 1代表第一页 
		 */		
		public var pageIndex:int;
		public function NavPageIndexChange(type:String, pageindex:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			pageIndex = pageindex;
		}
	}
}