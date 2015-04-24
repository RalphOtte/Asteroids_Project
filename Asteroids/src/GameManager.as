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
			trace("GM wordt geinstantieerd (GameManager Class GameManager function)");						//DIT WORDT WEL GETRACED
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			trace("GM INIT wordt weggehaald (GameManager Class init function)");						//DIT WORDT NIET GETRACED
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// Check welke mode hij moet starten(Oneplayer, Twoplayer, Options of Credits(Misschien met behulp van een variable binnen de MENU class?)
			trace("GM 1 Player added (GameManager Class init function)");
			_1Player = new Player;
			addChild(_1Player);
		}	
	}
}