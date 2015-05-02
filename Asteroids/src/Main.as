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
		private var _ShipSelect:ShipSelect;							//DIT IS VOOR TESTING ONLY
		private var _Option:Options;
		
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
			_GM = new GameManager();
			addChild(_GM);
			startMenu();
			//_ShipSelect.OnePlayerShipSelect(); //DEZE FUNCTIE IS VOOR TESTING ONLY
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function startMenu():void
		{			

			_menu = new Menu();
			addChild(_menu);
			_ShipSelect = new ShipSelect();
			_Option = new Options();
			
			_menu.addEventListener("RemoveMenu" , RemoveMenu);
			_menu.addEventListener("SpawnShipSelect" , SpawnShipSelect);
			_menu.addEventListener("SpawnOptions" , SpawnOptions);
			_Option.addEventListener("SpawnMenu", SpawnMenu);
			_Option.addEventListener("RemoveOptions", RemoveOptions);
		}
		private function RemoveMenu(e:Event):void
		{
			removeChild(_menu);
			trace("Menu got removed (MAIN)");
		}
		private function SpawnShipSelect(e:Event):void
		{
			addChild(_ShipSelect);
			trace("Ship select added(MAIN)");
		}
		private function SpawnOptions(e:Event):void
		{
			addChild(_Option);
		}
		private function SpawnMenu(e:Event):void
		{
			addChild(_menu);
		}
		private function RemoveOptions(e:Event):void
		{
			removeChild(_Option);
		}
	}
}
