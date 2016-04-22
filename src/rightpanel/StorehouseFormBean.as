package rightpanel
{
	public class StorehouseFormBean
	{
		private var _province:String;
		private var _city:String;
		private var _country:String;
		private var _minlat:Number;
		private var _maxlat:Number;
		private var _minlon:Number;
		private var _maxlon:Number;
		private var _area:String;
		private var _minarea:Number;
		private var _maxarea:Number;
		private var _type:String;
		private var _temptype:String;
		private var _isLatLonType:Boolean;
		
		public function StorehouseFormBean()
		{
		}
		
		public function get province():String
		{
			return _province;
		}
		
		public function set province(value:String):void
		{
			_province = value;
		}
		
		public function get city():String
		{
			return _city;
		}
		
		public function set city(value:String):void
		{
			_city = value;
		}
		
		public function get country():String
		{
			return _country;
		}
		
		public function set country(value:String):void
		{
			_country = value;
		}
		
		public function get minlat():Number
		{
			return _minlat;
		}
		
		public function set minlat(value:Number):void
		{
			_minlat = value;
		}
		
		public function get maxlat():Number
		{
			return _maxlat;
		}
		
		public function set maxlat(value:Number):void
		{
			_maxlat = value;
		}
		
		public function get minlon():Number
		{
			return _minlon;
		}
		
		public function set minlon(value:Number):void
		{
			_minlon = value;
		}
		
		public function get maxlon():Number
		{
			return _maxlon;
		}
		
		public function set maxlon(value:Number):void
		{
			_maxlon = value;
		}
		
		public function get area():String
		{
			return _area;
		}
		
		public function set area(value:String):void
		{
			_area = value;
			if(_area!="不限"&&_area!=">10000 平方米")
			{
				var arr:Array=_area.split("-");
				_minarea=arr[0];
				var str:String=arr[1].toString()
				_maxarea=Number(str.substr(0,str.length-4));
			}
		}
		
		public function get type():String
		{
			return _type;
		}
		
		public function set type(value:String):void
		{
			_type = value;
		}
		
		public function get temptype():String
		{
			return _temptype;
		}
		
		public function set temptype(value:String):void
		{
			_temptype = value;
		}
		
		public function get isLatLonType():Boolean
		{
			return _isLatLonType;
		}
		
		public function set isLatLonType(value:Boolean):void
		{
			_isLatLonType = value;
		}
		
		public function get minarea():Number
		{
			return _minarea;
		}
		
		public function set minarea(value:Number):void
		{
			_minarea = value;
		}
		
		public function get maxarea():Number
		{
			return _maxarea;
		}
		
		public function set maxarea(value:Number):void
		{
			_maxarea = value;
		}
		
		
	}
}