package menuWidgets.query
{
	import com.esri.ags.geometry.Extent;
	import com.esri.ags.geometry.MapPoint;

	public class CoordinateConversion
	{
		public function CoordinateConversion()
		{
		}

		/**
		 * 经纬度转墨卡托
		 * @param lonLat 经纬度点
		 * @return 
		 * 
		 */		
		public static function lonLat2Mercator(lonLat:MapPoint):MapPoint
		{
			var mercator:MapPoint = new MapPoint();
			var x:Number = lonLat.x * 20037508.34 / 180;
			var y:Number = Math.log(Math.tan((90 + lonLat.y) * Math.PI / 360)) / (Math.PI / 180);
			y = y * 20037508.34 / 180;
			mercator.x = x;
			mercator.y = y;
			return mercator;
		}
		
		/**
		 * 墨卡托转经纬度
		 * @param mercator 墨卡托点
		 * @return 
		 * 
		 */
		public static function Mercator2lonLat(mercator:MapPoint):MapPoint
		{
			var lonLat:MapPoint = new MapPoint();
			var x:Number = mercator.x / 20037508.34 * 180;
			var y:Number = mercator.y / 20037508.34 * 180;
			y = 180 / Math.PI * (2 * Math.atan(Math.exp(y * Math.PI / 180)) - Math.PI / 2);
			lonLat.x = x;
			lonLat.y = y;
			return lonLat;
		}
		
		/**
		 * 墨卡托范围转经纬度范围
		 * @param mercator 墨卡托Extent
		 * @return 
		 * 
		 */
		public static function MercatorExt2lonLat(mercator:Extent):Extent
		{
			var minX:Number = mercator.xmin / 20037508.34 * 180;
			var minY:Number = mercator.ymin / 20037508.34 * 180;
			var maxX:Number = mercator.xmax / 20037508.34 * 180;
			var maxY:Number = mercator.ymax / 20037508.34 * 180;
			
			return new Extent(minX,minY,maxX,maxY);
		}
		
		/**
		 * 经纬度范围转墨卡托范围
		 * @param lonLat 墨卡托Extent
		 * @return 
		 * 
		 */
		public static function lonLatExt2Mercator(lonLat:Extent):Extent
		{
			var minX:Number = lonLat.xmin * 20037508.34 / 180;
			var minY:Number = Math.log(Math.tan((90 + lonLat.ymin) * Math.PI / 360)) / (Math.PI / 180);
			minY = minY * 20037508.34 / 180;
			var maxX:Number = lonLat.xmax * 20037508.34 / 180;
			var maxY:Number = Math.log(Math.tan((90 + lonLat.ymax) * Math.PI / 360)) / (Math.PI / 180);
			maxY = maxY * 20037508.34 / 180;
			
			return new Extent(minX,minY,maxX,maxY);
		}
		
		
		public static function Mercator2lonLat_X(mercatorX:Number):Number
		{
			var x:Number=mercatorX/20037508.34 * 180;
			return x;
		}
		
		public static function Mercator2lonLat_Y(mercatorY:Number):Number
		{
			var y:Number=mercatorY/20037508.34 * 180;
			y = 180 / Math.PI * (2 * Math.atan(Math.exp(y * Math.PI / 180)) - Math.PI / 2);
			return y;
		}
	}
}