package  src
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
		private var _menu:Menu;
		private var _shipSelect:ShipSelect;
		private var _Options:Options;
	//  public var _OnePlayer:Boolean = false;
	//	public var _TwoPlayer:Boolean = false;
		
		public function GameManager() 
		{
			// Functie voor Score/Recordtijd
			// Functie voor de finish + new record ja/nee						
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			_shipSelect = new ShipSelect;
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);					
		}
	}
}