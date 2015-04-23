package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.system.System;

	
	/**
	 * ...
	 * @author Ralph Otte
	 */
	
	public class Main extends Sprite 
	{
		private var Me:Menu;
		
		
		
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
			
		}
		
		private function NewGame(e:KeyboardEvent):void
		{
			// SELECT SAVE SLOT
			// StartGame
		}
		private function LoadGame(e:KeyboardEvent):void
		{
			// SELECT SAVE SLOT
			// StartGame
		}
		private function Options(e:KeyboardEvent):void
		{
			
		}
		private function Credits(e:KeyboardEvent):void
		{
			
		}	
		
	}
	
}