package  src{
	
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	
	public class Bullet extends Sprite{
		
		[Embed(source="../Assets/Game/PlayerShips/Bullets/bullet.png")]
		public var bullet:Class;
		public var _bullet:Bitmap;

		public function Bullet() {
			// constructor code
			//this.addEventListener(Event.ADDED_TO_STAGE, init);
			this.addEventListener(Event.ENTER_FRAME, bulletForward);
		}
		
		/*private function init()
		{
			this.removeEventListener(new Event.ADDED_TO_STAGE, init);
			
		}*/
		
		private function bulletForward(e):void
		{
			this.x += 5;
		}
	}
	
}
