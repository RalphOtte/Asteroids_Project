package  
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class GameManager extends Sprite
	{
		public var _Singleplayer:Boolean = false;
		public var _Multiplayer:Boolean = false;
		
		public var _SelectedShip:int = 1;
		public var _SelectedShipP1:int = 1;
		public var _SelectedShipP2:int = 1;	
		
		public function GameManager() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
	}
}