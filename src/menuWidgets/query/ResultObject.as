package menuWidgets.query
{
	//查询结果类 
	public class ResultObject
	{
		import mx.collections.ArrayCollection;

		public function ResultObject()
		{
		}
	
		//本次API访问状态，如果成功返回0，如果失败返回其他数字。
		public var status:int = 0;
			
		//对API访问状态值的英文说明，如果成功返回"ok"，并返回结果字段，如果失败返回错误说明。
		public var message:String = "";

		//{name(poi名称) location{lat(纬度值) lng(经度值)} address(poi地址信息) telephone uid(poi的唯一标示)}
		public var results:ArrayCollection = null;

		public var total:int = 0;

	}
}