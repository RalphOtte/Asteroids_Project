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
		private var _menu:Menu;	
		private var _GM:GameManager;
		private var _ShipSelect:ShipSelect;
		private var _MPShipSelect:MPShipSelect;
		private var _Option:Options;
		private var _LevelSelect:LevelSelect;
		private var _Level1:Level_1;
		private var _Level2:Level_2;
		private var _Level3:Level_3;
		private var _Credits:Credits;	
		
		public function Main():void 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			_GM = new GameManager();
			addChild(_GM);
			startMenu();
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function startMenu():void
		{			

			_menu = new Menu();
			addChild(_menu);
			_ShipSelect = new ShipSelect();
			_MPShipSelect = new MPShipSelect();
			_Option = new Options();
			_LevelSelect = new LevelSelect();
			_Level1 = new Level_1();
			_Level2 = new Level_2();
			_Level3 = new Level_3();
			_Credits = new Credits();
		
			/*
			 * ADDITIONELE INFO
			 * 
			 * Alle classes hebben een spawn en een remove functie/dispatch
			 * Hierdoor kan elk(e) class/object elkander aanroepen.
			 * 
			 * De reSpawn funcies zijn bedoeld om alle variabelen weer goed te zetten zoals die horen(Die blijven natuurlijk "oud" staan in het geheugen, ook nadat de class weggehaald is.
			 * Al deze EventListeners zijn die functies die aangeroepen kunnen worden, maar alleen vanuit bepaalde classes/objecten.
			 * Deze zijn aangeduid met bijvoorbeeld _menu of _MPShipSelect
			 * De .(punt) die ertussen staat verbind de class met de EventListener, betekenende dat de main alleen voor een dispatch luistert vanuit die class(uiteraard kan er ook een global zijn)
			 * 
			 * */
			_menu.addEventListener("RemoveMenu" , RemoveMenu);
			_menu.addEventListener("SpawnShipSelect1" , SpawnShipSelect1);
			_menu.addEventListener("SpawnShipSelect2" , SpawnShipSelect2);
			_menu.addEventListener("SpawnOptions" , SpawnOptions);
			_menu.addEventListener("SpawnCredits", SpawnCredits);
			_Option.addEventListener("SpawnMenu", SpawnMenu);
			_Option.addEventListener("RemoveOptions", RemoveOptions);
			_ShipSelect.addEventListener("SpawnMenu", SpawnMenu);
			_ShipSelect.addEventListener("SpawnLevelSelect", SpawnLevelSelect);
			_ShipSelect.addEventListener("RemoveShipSelect", RemoveShipSelect1);
			_ShipSelect.addEventListener("SingleMode", SingleMode);
			_ShipSelect.addEventListener("Skin_1", Skin_1);
			_ShipSelect.addEventListener("Skin_1", Skin_2);
			_ShipSelect.addEventListener("Skin_1", Skin_3);
			_MPShipSelect.addEventListener("RemoveShipSelect2", RemoveShipSelect2);
			_MPShipSelect.addEventListener("SpawnLevelSelect", SpawnLevelSelect);
			_MPShipSelect.addEventListener("SpawnMenu", SpawnMenu);
			_MPShipSelect.addEventListener("MultiMode", Multimode);
			_LevelSelect.addEventListener("RemoveLevelSelect", RemoveLevelSelect);
			_LevelSelect.addEventListener("SpawnLevel_1", SpawnLevel_1);
			_LevelSelect.addEventListener("SpawnLevel_2", SpawnLevel_2);
			_LevelSelect.addEventListener("SpawnLevel_3", SpawnLevel_3);
			_LevelSelect.addEventListener("SpawnLevelSelect", SpawnShipSelect1);
			_LevelSelect.addEventListener("SpawnMPLevelSelect", SpawnShipSelect2);
		}
		
		private function SingleMode(e:Event):void 
		{
			_GM._Singleplayer = true;
		}
		
		private function Multimode(e:Event):void 
		{
			_GM._Multiplayer = true;
		}
		
		private function SpawnCredits(e:Event):void 
		{
		// 	addChild(_Credits);
		//	_Credits.reSpawn(e)
		}
		
		private function SpawnLevel_1(e:Event):void 
		{
			addChild(_Level1);
		//	_Level1.reSpawn(e); (moet nog gemaakt worden)
		}
		
		private function SpawnLevel_2(e:Event):void 
		{
		//	addChild(_Level2);
		//	_Level2.reSpawn(e); (moet nog gemaakt worden)
		}
		
		private function SpawnLevel_3(e:Event):void 
		{
			addChild(_Level3);
		//	_Level3.reSpawn(e); (moet nog gemaakt worden)
		}
		
		private function SpawnLevelSelect(e:Event):void 
		{
			addChild(_LevelSelect);
			_LevelSelect.reSpawn(e);
			_LevelSelect.AllLevelSelect();
		}
		
		// RESPAWN FUNCTIONS
		private function SpawnShipSelect1(e:Event):void
		{
			addChild(_ShipSelect);
			_ShipSelect.reSpawn(e);
			_ShipSelect.OnePlayerShipSelect();
		}
		
		private function SpawnShipSelect2(e:Event):void
		{
			addChild(_MPShipSelect);
			_MPShipSelect.reSpawn(e);
			_MPShipSelect.TwoPlayerShipSelect();
		}
		
		private function SpawnOptions(e:Event):void
		{
			addChild(_Option);
			_Option.reSpawn(e);		// DIT IS DE RESPAWN FUNCTIE BINNEN OPTIONS, DEZE ZORGT ERVOOR DAT ALLE VARIABLES WEER GOED GAAN STAAN EN DAT DE POINTER TERUGKOMT
		}
		
		private function SpawnMenu(e:Event):void
		{
			addChild(_menu);
			_menu.reSpawn(e);		// DIT IS DE RESPAWN FUNCTIE BINNEN MENU, DEZE ZORGT ERVOOR DAT ALLE VARIABLES WEER GOED GAAN STAAN EN DAT DE POINTER TERUGKOMT
		}
		
		private function Skin_1(e:Event):void 
		{
			_GM._SelectedShip = 1;
		}
		private function Skin_2(e:Event):void 
		{
			_GM._SelectedShip = 2;
		}
		private function Skin_3(e:Event):void 
		{
			_GM._SelectedShip = 3;
		}
		
		// REMOVE FUNCTIONS
		private function RemoveMenu(e:Event):void
		{
			removeChild(_menu);
		}
		private function RemoveOptions(e:Event):void
		{
			removeChild(_Option);
		}
		private function RemoveShipSelect1(e:Event):void 
		{
			removeChild(_ShipSelect);
		}
		private function RemoveShipSelect2(e:Event):void 
		{
			removeChild(_MPShipSelect);
		}
		
		private function RemoveLevelSelect(e:Event):void 
		{
			removeChild(_LevelSelect);
		}
	}
}
