package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;

	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class Border extends Sprite
	{
		//embed
		//private var _border:Class;
		//private var _brdr:Bitmap;
		
		public function Border() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE , init)
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
	}

}