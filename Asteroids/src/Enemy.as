package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	
	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class Enemy extends Sprite
	{
		
		[Embed(source = "../Assets/Game/Enemies/Enemy_Yellow.png")]
		private var _enemyShip:Class;
		private var _eShip:Bitmap;
		
		public function Enemy() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_eShip = new _enemyShip; 
			addChild(_eShip);
		}
	}
}