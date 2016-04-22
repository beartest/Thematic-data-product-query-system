package menuWidgets.query
{
	import mx.controls.Alert;

	public class BaiduServices
	{
		public function BaiduServices()
		{
		}
		
		import flash.events.Event;
		import flash.events.HTTPStatusEvent;
		import flash.events.IEventDispatcher;
		import flash.events.IOErrorEvent;
		import flash.events.ProgressEvent;
		import flash.events.SecurityErrorEvent;
		import flash.net.URLLoader;
		import flash.net.URLRequest;
		import flash.net.URLRequestMethod;
		import flash.net.URLVariables;
		
		import mx.events.FlexEvent;
		
		public var urlLoader:URLLoader;
		private var request:URLRequest;
		[Bindable]
		private var resultStr:String;
		public static var AK:String = "D723b2adadcc1381a3556cef5e989549";
		/**
		 * 
		 * @param requestURL
		 * @param completefunction
		 * 
		 */		
		public function gotoConn(requestURL:String,completefunction:Function):void
		{
			urlLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, completefunction);
			request= new URLRequest(requestURL);
			request.method = URLRequestMethod.POST;//设置请求的类型
			try {
				urlLoader.load(request);//开始发送请求
			} catch (error:Error) {
				Alert.show(error.toString(),"信息查询错误");
			}
		}
		
		
		private function configureListeners(dispatcher:IEventDispatcher):void 
		{  
			//加载完成事件;  
			dispatcher.addEventListener(Event.COMPLETE, loaderHandler);  
			//开始访问事件;  
			dispatcher.addEventListener(Event.OPEN, loaderHandler);  
			//加载进度事件;  
			dispatcher.addEventListener(ProgressEvent.PROGRESS, loaderHandler);  
			//跨域访问安全策略事件;  
			dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, loaderHandler);  
			//Http状态事件;  
			dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, loaderHandler);  
			//访问出错事件;  
			dispatcher.addEventListener(IOErrorEvent.IO_ERROR, loaderHandler); 
		} 
		private function loaderHandler(event:*):void 
		{ 
			switch(event.type) { 
				case Event.COMPLETE: 
					trace("成功: ");
					resultStr=urlLoader.data;//请求成功，并取得返回值
					break; 
				case Event.OPEN: 
					trace("open: " + event); 
					break; 
				case ProgressEvent.PROGRESS: 
					trace("progress: " + event); 
					break; 
				case SecurityErrorEvent.SECURITY_ERROR: 
					trace("securityError: " + event); 
					break; 
				case HTTPStatusEvent.HTTP_STATUS: 
					trace("httpStatus: " + event); 
					break; 
				case IOErrorEvent.IO_ERROR: 
					trace("ioError: " + event); 
					break; 
				
			} 
		}
	}
}