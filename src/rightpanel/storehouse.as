package rightpanel
{
	import mx.collections.ArrayCollection;

	public class storehouse
	{
		private var _name:String;//仓库名称
		private var _id:String;//仓库编号
		private var _province:String;//地　　区1
		private var _city:String;//地　　区2
		private var _country:String;//地　　区3
		private var _address:String;//地　　区4
		private var _tempType:String;//库温类型
		private var _type:String;//仓库类型
		private var _manage:String;//仓库管理
		private var _area:String;//可用仓库面积
		private var _volume:String;//可用仓库容量
		private var _price:String;//价　　格
		private var _contactor:String;//联系　人
		private var _phone:String;//手机号码
		private var _date:String;//发布日期
		private var _picture:String;
		private var _ispicture:Boolean;//是否有图片
		private var _time:String;//发布时间
		private var _lat:Number;//经度
		private var _lon:Number;//纬度
		
		public function storehouse()
		{
			
		}		
		
		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		public function get id():String
		{
			return _id;
		}

		public function set id(value:String):void
		{
			_id = value;
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

		public function get address():String
		{
			return _address;
		}

		public function set address(value:String):void
		{
			_address = value;
		}

		public function get tempType():String
		{
			return _tempType;
		}

		public function set tempType(value:String):void
		{
			_tempType = value;
		}

		public function get type():String
		{
			return _type;
		}

		public function set type(value:String):void
		{
			_type = value;
		}

		public function get manage():String
		{
			return _manage;
		}

		public function set manage(value:String):void
		{
			_manage = value;
		}

		public function get area():String
		{
			return _area;
		}

		public function set area(value:String):void
		{
			_area = value;
		}

		public function get volume():String
		{
			return _volume;
		}

		public function set volume(value:String):void
		{
			_volume = value;
		}

		public function get price():String
		{
			return _price;
		}

		public function set price(value:String):void
		{
			_price = value;
		}

		public function get contactor():String
		{
			return _contactor;
		}

		public function set contactor(value:String):void
		{
			_contactor = value;
		}

		public function get phone():String
		{
			return _phone;
		}

		public function set phone(value:String):void
		{
			_phone = value;
		}

		public function get date():String
		{
			return _date;
		}

		public function set date(value:String):void
		{
			_date = value;
		}

		public function get picture():String
		{
			return _picture;
		}

		public function set picture(value:String):void
		{
			_picture=value;
			if(_picture=="0")
				_ispicture = false;
			else if(_picture=="1")
				_ispicture=true;
		}

		public function get time():String
		{
			return _time;
		}

		public function set time(value:String):void
		{
			_time = value;
		}

		public function get lat():Number
		{
			return _lat;
		}

		public function set lat(value:Number):void
		{
			_lat = value;
		}

		public function get lon():Number
		{
			return _lon;
		}

		public function set lon(value:Number):void
		{
			_lon = value;
		}

		public function get ispicture():Boolean
		{
			return _ispicture;
		}

		public function set ispicture(value:Boolean):void
		{
			_ispicture = value;
		}


	}
}