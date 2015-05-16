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
		public var _SelectedShipP2:int = 1;	
		
		public function GameManager() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function P1_1():void
		{
			trace("1 (GAMEMANAGER)");
			_SelectedShip = 1;
		}
		
		public function P1_2():void
		{
			trace("2 (GAMEMANAGER)");
			_SelectedShip = 2;
		}
		
		public function P1_3():void
		{
			trace("3 (GAMEMANAGER)");
			_SelectedShip = 3;
		}
		
		public function P2_1():void
		{
			_SelectedShipP2 = 1;
		}
		
		public function P2_2():void
		{
			_SelectedShipP2 = 2;
		}
		
		public function P2_3():void
		{
			_SelectedShipP2 = 3;
		}
	}
}