package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.system.System;

	
	/**
	 * ...
	 * @author Ralph Otte
	 */
	
	public class Main extends Sprite 
	{
		public var Me:Menu;
		private var _1IsDown:Boolean = false;
		
		
		public function Main():void 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			startMenu();
			
		}
		
		private function startMenu():void //MAIN MENU
		{			

			Me = new Menu();
			addChild(Me);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, checkButtonDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, checkButtonUp);
			
			
		}
		
		private function checkButtonUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == 49)
			{
				_1IsDown = false;
			}
		}
		public function checkButtonDown(e:KeyboardEvent):void
		{
			if (e.keyCode == 49)
			{
				_1IsDown = true;
				
			}
			if (_1IsDown == true)
			{
				removeChild(Me);
			}
		}
		

	}
	
}