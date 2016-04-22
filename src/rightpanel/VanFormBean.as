package rightpanel
{
	public class VanFormBean
	{
		private var _provinceCOC:String;	//起始地1
		private var _cityCOC:String;	//起始地2
		private var _countryCOC:String;	//起始地3
		private var _provinceDDU:String;	//目的地1
		private var _cityDDU:String;	//目的地2
		private var _countryDDU:String;	//目的地3
		private var _type:String;	//车型
		private var _tempType:String;	//车辆温别
		private var _weight:String;	//最大载重
		private var _maxweight:Number;
		private var _minweight:Number;
		private var _volume:String;	//载货立方数
		private var _maxvolume:Number;
		private var _minvolume:Number;
		
		public function VanFormBean()
		{
		}

		public function get provinceCOC():String
		{
			return _provinceCOC;
		}

		public function set provinceCOC(value:String):void
		{
			_provinceCOC = value;
		}

		public function get cityCOC():String
		{
			return _cityCOC;
		}

		public function set cityCOC(value:String):void
		{
			_cityCOC = value;
		}

		public function get countryCOC():String
		{
			return _countryCOC;
		}

		public function set countryCOC(value:String):void
		{
			_countryCOC = value;
		}

		public function get provinceDDU():String
		{
			return _provinceDDU;
		}

		public function set provinceDDU(value:String):void
		{
			_provinceDDU = value;
		}

		public function get cityDDU():String
		{
			return _cityDDU;
		}

		public function set cityDDU(value:String):void
		{
			_cityDDU = value;
		}

		public function get countryDDU():String
		{
			return _countryDDU;
		}

		public function set countryDDU(value:String):void
		{
			_countryDDU = value;
		}

		public function get type():String
		{
			return _type;
		}

		public function set type(value:String):void
		{
			_type = value;
		}

		public function get tempType():String
		{
			return _tempType;
		}

		public function set tempType(value:String):void
		{
			_tempType = value;
		}

		public function get weight():String
		{
			return _weight;
		}

		public function set weight(value:String):void
		{
			_weight = value;
			if(_weight!="不限"&&_weight!=">30 吨")
			{
				var arr:Array=_weight.split("-");
				_minweight=arr[0];
				var str:String=arr[1].toString()
				_maxweight=Number(str.substr(0,str.length-2));
			}
		}

		public function get volume():String
		{
			return _volume;
		}

		public function set volume(value:String):void
		{
			_volume = value;
			if(_volume!="不限"&&_volume!=">60 立方米")
			{
				var arr:Array=_volume.split("-");
				_minvolume=arr[0];
				var str:String=arr[1].toString()
				_maxvolume=Number(str.substr(0,str.length-4));
			}
		}

		public function get maxweight():Number
		{
			return _maxweight;
		}

		public function set maxweight(value:Number):void
		{
			_maxweight = value;
		}

		public function get minweight():Number
		{
			return _minweight;
		}

		public function set minweight(value:Number):void
		{
			_minweight = value;
		}

		public function get maxvolume():Number
		{
			return _maxvolume;
		}

		public function set maxvolume(value:Number):void
		{
			_maxvolume = value;
		}

		public function get minvolume():Number
		{
			return _minvolume;
		}

		public function set minvolume(value:Number):void
		{
			_minvolume = value;
		}


	}
}