package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class Level_3 extends Sprite
	{
		
		private var _bg:Background = new Background();
		private var _tileCount:int;
		
		public function Level_3() 
		{
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			addChild(_bg);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);	
			trace("level_3 is now spawned");
		}	
	}
}