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
		private var _1ButtonIsDown:Boolean = false;					//Boolean die kijkt of de "1" knop ingedrukt is
		private var _2ButtonIsDown:Boolean = false;					//Boolean die kijkt of de "2" knop ingedrukt is
		private var _3ButtonIsDown:Boolean = false;					//Boolean die kijkt of de "3" knop ingedrukt is	
		private var _4ButtonIsDown:Boolean = false;					//Boolean die kijkt of de "4" knop ingedrukt is
		private var _removeMenuTimer:Timer = new Timer (1000, 1);	// 1 seconde timer(1000)
		
		
		public function Main():void 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			startMenu();
		}
		
		private function startMenu():void //MAIN MENU instantiatie
		{			

			_menu = new Menu();
			addChild(_menu);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, checkButtonDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, checkButtonUp);
			_menu.addEventListener("OPChoice" , OnePlayerChosen); 	
			_menu.addEventListener("TPChoice" , TwoPlayerChosen);
			_menu.addEventListener("OptChoice" , OptionsChosen);
			_menu.addEventListener("CredChoice" , CreditsChosen);
		}
		
		private function checkButtonUp(e:KeyboardEvent):void // MAIN MENU FUNCTION
		{
			if (e.keyCode == 49)
			{
				_1ButtonIsDown = false;
			}
			if (e.keyCode == 50)
			{
				_2ButtonIsDown = false;
			}
			if (e.keyCode == 51)
			{
				_3ButtonIsDown = false;
			}
			if (e.keyCode == 52)
			{
				_4ButtonIsDown = false;
			}
		}
		public function checkButtonDown(e:KeyboardEvent):void // MAIN MENU FUNCTION
		{
			if (e.keyCode == 49)
			{
				_1ButtonIsDown = true;
				
			}
			if (e.keyCode == 50)
			{
				_2ButtonIsDown = true;
			}
			if (e.keyCode == 51)
			{
				_3ButtonIsDown = true;
			}
			if (e.keyCode == 52)
			{
				_4ButtonIsDown = true;
			}
			
			//---------------------------------------ALLE TIMERS VOOR BUTTONISDOWN BOOLEANS----------------------------------------------------------
			if (_1ButtonIsDown == true)
			{
				_removeMenuTimer.addEventListener(TimerEvent.TIMER, RemoveMenu); //Timer voor instantiatie van OnePlayer
				_removeMenuTimer.start();
				
			}
			if (_2ButtonIsDown == true)
			{
				_removeMenuTimer.addEventListener(TimerEvent.TIMER, RemoveMenu); //Timer voor instantiatie van TwoPlayer
				_removeMenuTimer.start();
				
			}
			if (_3ButtonIsDown == true)
			{
				_removeMenuTimer.addEventListener(TimerEvent.TIMER, RemoveMenu); //Timer voor instantiatie van Options
				_removeMenuTimer.start();
				
			}
			if (_4ButtonIsDown == true)
			{
				_removeMenuTimer.addEventListener(TimerEvent.TIMER, RemoveMenu); //Timer voor instantiatie van Credits
				_removeMenuTimer.start();
				
			}
			function RemoveMenu(e:Event):void
			{
				removeChild(_menu);
			}
		}
		private function OnePlayerChosen(e:Event):void
		{
		// Hier GM aanroepen + dispatchevent met "OnePlayer", de GM pakt deze weer op en voert de functie uit die DispatchEvent "OnePlayer aanroept.
			trace("Spawning GM" + " (Main class, OnePlayerChosen function)");
			_GM = new GameManager();
			addChild(_GM);
			trace("GM Spawned" + " (Main class, OnePlayerChosen function)");
		}
		private function TwoPlayerChosen(e:Event):void
		{
			// Hier GM aanroepen + dispatchevent met "TwoPlayer", de GM pakt deze weer op en voert de functie uit die DispatchEvent "TwoPlayer" aanroept.	
		}
		private function OptionsChosen(e:Event):void
		{
			// Hier GM aanroepen + dispatchevent met "Options", de GM pakt deze weer op en voert de functie uit die DispatchEvent "Options" aanroept.
		}
		private function CreditsChosen(e:Event):void
		{
			// Hier GM aanroepen + dispatchevent met "Credits", de GM pakt deze weer op en voert de functie uit die DispatchEvent "Credits" aanroept.
		}
		//VOLGENDE FUNCTIE
	}
}