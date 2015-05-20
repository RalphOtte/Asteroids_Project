<<<<<<< HEAD
﻿package  
=======
package
>>>>>>> origin/master
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
		[Embed(source="../Assets/Game/Backgrounds/Space.jpg")]
		private var backgroundImg:Class;
		private var bgImage:Bitmap;
		
		public function Background() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			super();
			bgImage = new backgroundImg();
			addChild(bgImage);
		}
		
		private function init(e:Event):void 
		{
			
		}
	}
}