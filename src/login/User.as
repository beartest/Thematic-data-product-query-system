package login
{
	public class User
	{
		
		[Bindable]
		private var _username:String;
		public function set username(value:String):void
		{
			_username=value;
		}
		public function get username():String
		{
			return _username;
		}
		
		[Bindable]
		private var _password:String;
		public function set password(value:String):void
		{
			_password=value;
		}
		public function get password():String
		{
			return _password;
		}
		
		[Bindable]
		private var _email:String;
		public function set email(value:String):void
		{
			_email=value;
		}
		public function get email():String
		{
			return _email;
		}
				
		public function User(node:Object)
		{
			username=node.username;
			password=node.password;
			email=node.email;
		}
	}
}