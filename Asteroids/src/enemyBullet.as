package
{
	
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	
	public class enemyBullet extends Sprite
	{
		
		[Embed(source="../Assets/Game/Miscelaneous/laser_green.png")]
		private var LSG:Class;
		private var _LaserGreen:Bitmap;

		public function enemyBullet() 
		{
			_LaserGreen = new LSG();
			addChild(_LaserGreen);
		}
	}
}
