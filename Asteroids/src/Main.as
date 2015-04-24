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
		private var _1ButtonIsDown:Boolean = false;					//Boolean die kijkt of de "1" knop ingedrukt is
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
		}
		
		private function checkButtonUp(e:KeyboardEvent):void // MAIN MENU FUNCTION
		{
			if (e.keyCode == 49)
			{
				_1ButtonIsDown = false;
			}
		}
		public function checkButtonDown(e:KeyboardEvent):void // MAIN MENU FUNCTION
		{
			if (e.keyCode == 49)
			{
				_1ButtonIsDown = true;
				
			}
			if (_1ButtonIsDown == true)
			{
				_removeMenuTimer.addEventListener(TimerEvent.TIMER, TEST); //Timer voor instantiatie van OnePlayer
				_removeMenuTimer.start();
				
			}
			function TEST(e:Event):void
			{
				removeChild(_menu);
			}
		}	
	}
}