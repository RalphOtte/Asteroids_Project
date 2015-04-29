package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jochem
	 */
	public class Background extends Sprite 
	{
		[Embed(source="../Assets/Game/Backgrounds/placeholderBG.png")]
		private var backgroundImg:Class;
		private var bgImage:Bitmap;
		private var scrollSpeed:Number;
		
		public function Background() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			super();
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			bgImage = new backgroundImg();
			addChild(bgImage);
			addEventListener(Event.ADDED_TO_STAGE, scrollBG);
		}
		private function scrollBG(e:Event):void
		{
			scrollSpeed = 10;
			this.x -= scrollSpeed;
			trace(this.x);
		}	
	}
}