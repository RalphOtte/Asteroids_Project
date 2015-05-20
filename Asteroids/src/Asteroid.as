package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	
	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class Asteroid extends Sprite
	{
		
		[Embed(source = "../Assets/Game/Obstacles/astroide.png")]
		private var _Astr:Class;
		private var _Asteroid:Bitmap;
		
		public function Asteroid() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(_Asteroid);
			
		}
		
	}

}