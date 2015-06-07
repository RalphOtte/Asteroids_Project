package
{
	
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	
	public class Bullet extends Sprite
	{
		
		[Embed(source="../Assets/Game/Miscelaneous/laser_red.png")]
		private var LSR:Class;
		private var _LaserRed:Bitmap;
	//	[Embed(source="../Assets/Game/Miscelaneous/laser_blue.png")]
	//	private var LSB:Class;
	//	private var _LaserBlue:Bitmap;

		public function Bullet() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			this.addEventListener(Event.ENTER_FRAME, posCheck);
			_LaserRed = new LSR();
		//	_LaserBlue = new LSB();
			
			//addChild(_LaserRed);
			//addChild(_LaserBlue);
		}
		
		private function posCheck(e:Event):void 
		{
		//	trace(this.x + " X");
		//	trace(this.y + " Y");
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			spawnSkin();
		}
		
		private function spawnSkin():void
		{
			addChild(_LaserRed);
		}
	}
}
