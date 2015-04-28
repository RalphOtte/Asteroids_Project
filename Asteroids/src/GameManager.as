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
		private var _1Player:Player; 
		
		public function GameManager() 
		{
			// Functie voor Score/Recordtijd
			// Functie voor de finish + new record ja/nee
			trace("GM wordt geinstantieerd (GameManager class, GameManager function)");								
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			trace(addEventListener(Event.ADDED_TO_STAGE, init) + " (GameManager class, GameManager function)" + " (Info: INIT Trace)");		
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			trace("GM INIT wordt weggehaald (GameManager class, init function)");						
			//Check welke mode hij moet starten(Oneplayer, Twoplayer, Options of Credits(Met behulp van dispatchEvents)
			trace("GM 1 Player added (GameManager class, init function)");
			_1Player = new Player;
			addChild(_1Player);
		}	
	}
}