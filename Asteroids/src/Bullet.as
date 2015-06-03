package
{
	
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	
	public class Bullet extends Sprite
	{
		
		[Embed(source="../Assets/Game/Miscelaneous/laser_red.png")]
		public var LSR:Class;
		public var _LaserRed:Bitmap;
		[Embed(source="../Assets/Game/Miscelaneous/laser_green.png")]
		public var LSG:Class;
		public var _LaserGreen:Bitmap;
		[Embed(source="../Assets/Game/Miscelaneous/laser_blue.png")]
		public var LSB:Class;
		public var _LaserBlue:Bitmap;

		public function Bullet() {
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			this.addEventListener(Event.ENTER_FRAME, bulletForward);
		}
		
		private function init()
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function bulletForward(e):void
		{
			this.x += 5;
		}
	}
	
}
