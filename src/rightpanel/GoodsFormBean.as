package rightpanel
{
	public class GoodsFormBean
	{
		private var _vanType:String;//车辆类型
		private var _provinceCOC:String;//始发地1
		private var _cityCOC:String;//始发地2
		private var _countryCOC:String;//始发地3
		private var _provinceDDU:String;//目的地1
		private var _cityDDU:String;//目的地2
		private var _countryDDU:String;//目的地3

		public function GoodsFormBean()
		{
		}

		public function get vanType():String
		{
			return _vanType;
		}

		public function set vanType(value:String):void
		{
			_vanType = value;
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


	}
}