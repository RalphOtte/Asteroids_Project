package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.system.System;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * ...
	 * @author Ralph Otte
	 */
	
	public class Main extends Sprite 
	{
		private var _menu:Menu;										//Menu Class wordt aangeroepen
		private var _GM:GameManager;
	//	private var _ShipSelect:ShipSelect;							//DIT IS VOOR TESTING ONLY
		private var _WButtonIsDown:Boolean = false;					//Boolean die kijkt of de "W" knop ingedrukt is
		private var _AButtonIsDown:Boolean = false;					//Boolean die kijkt of de "A" knop ingedrukt is
		private var _SButtonIsDown:Boolean = false;					//Boolean die kijkt of de "S" knop ingedrukt is	
		private var _DButtonIsDown:Boolean = false;					//Boolean die kijkt of de "D" knop ingedrukt is
		
		
		public function Main():void 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			startMenu();
			//_ShipSelect.OnePlayerShipSelect(); //DEZE FUNCTIE IS VOOR TESTING ONLY
		}
		
		private function startMenu():void
		{			

			_menu = new Menu();
			addChild(_menu);
			_menu.addEventListener("DeleteMenu" , removeMenu);
		}
		function removeMenu(e:Event):void
		{
			removeChild(_menu);
			trace("Menu got removed (MAIN)");
		}
	}
}
