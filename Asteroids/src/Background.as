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
		[Embed(source="../Assets/Game/Backgrounds/Space.jpg")]
		private var backgroundImg:Class;
		private var bgImage:Bitmap;
		public var _scrollSpeed:int = 8;
		private var _Player:Player;
		private var _lvl1:Level_1;
		public var _IntroOver:Boolean = false;
		
		
		public function Background() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			this.addEventListener(Event.ENTER_FRAME, scrollLoop);
			super();
			bgImage = new backgroundImg();
			addChild(bgImage);
			//scrollspeed formula
			
			//if ship pos is half of stage
				//increase scrollspeed
			//if ship pos is right edge of stage
				//decrease scrollspeed
		}
		
		private function scrollLoop(e:Event):void 
		{
 		//	_scrollSpeed = _Player.PlayerSpeed;
		}
		
		private function init(e:Event):void 
		{
			
		}
	}
}