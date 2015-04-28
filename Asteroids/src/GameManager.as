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
			trace("init EventListener wordt toegevoegd (GameManager class, GameManager function)" + " (Before adding init EventListener)");							
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			trace("init EventListener is toegevoegd (GameManager class, GameManager function)" + " (After adding init EventListener, Verification)");	
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			trace("GM INIT wordt weggehaald (GameManager class, init function)" + " (After removing init EventListener, Verification)");						
			//Check welke mode hij moet starten(Oneplayer, Twoplayer, Options of Credits(Met behulp van dispatchEvents)
			trace("GM 1 Player added (GameManager class, init function)" + " (Before adding Player)");
			_1Player = new Player;
			addChild(_1Player);
			trace("GM 1 Player added (GameManager class, init function)" + " (After adding Player, Verification)");
		}	
	}
}