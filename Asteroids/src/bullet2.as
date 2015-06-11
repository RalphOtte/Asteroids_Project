package
{
	
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	
	public class bullet2 extends Sprite
	{
		
		[Embed(source="../Assets/Game/Miscelaneous/laser_blue.png")]
		private var LSB:Class;
		private var _LaserBlue:Bitmap;

		public function bullet2() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			_LaserBlue = new LSB();
			addChild(_LaserBlue);
		}
	}
}
