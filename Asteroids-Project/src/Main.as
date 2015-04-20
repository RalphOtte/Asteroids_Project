package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			startScreen();
		}
		private function startScreen():void //START MENU
		{
					
				stage.addEventListener(KeyboardEvent.KEY_UP, startGame);

		}
		private function startGame(e:KeyboardEvent):void //STARTGAME
		{
			stage.removeEventListener(KeyboardEvent.KEY_UP, startGame);
		}
	}
	
}