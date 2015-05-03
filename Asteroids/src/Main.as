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
		
		public var _OnePlayer:Boolean = false;
		public var _TwoPlayer:Boolean = false;
		
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
			_menu.addEventListener("SpawnShipSelect1" , SpawnShipSelect1);
			_menu.addEventListener("SpawnShipSelect2" , SpawnShipSelect2);
			_menu.addEventListener("SpawnOptions" , SpawnOptions);
			_Option.addEventListener("SpawnMenu", SpawnMenu);
			_Option.addEventListener("RemoveOptions", RemoveOptions);
		}
		
		private function SpawnShipSelect1(e:Event):void
		{
			_OnePlayer = true;
			trace("OnePlayer = true (MAIN)");
			addChild(_ShipSelect);
			_ShipSelect.OnePlayerShipSelect();
		}
		
		private function SpawnShipSelect2(e:Event):void
		{
			_TwoPlayer = true;
			trace("TwoPlayer = true (MAIN)");
			addChild(_ShipSelect);
			_ShipSelect.TwoPlayerShipSelect();
		}
		
		private function RemoveMenu(e:Event):void
		{
			removeChild(_menu);
		}
		
		private function SpawnOptions(e:Event):void
		{
			addChild(_Option);
			_Option.reSpawn(e);
		}
		
		private function SpawnMenu(e:Event):void
		{
			addChild(_menu);
			_menu.reSpawn(e);		// DIT IS DE RESPAWN FUNCTIE BINNEN MENU
		}
		
		private function RemoveOptions(e:Event):void
		{
			removeChild(_Option);
		}
	}
}
