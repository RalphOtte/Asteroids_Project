package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class WinScreen 
	{
		private var _Win:TextField;
		
		[Embed(source="../Assets/Game/Backgrounds/Space.jpg")]
		private var backgroundImg:Class;
		private var bgImage:Bitmap;
		
		public function WinScreen() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			super();
			bgImage = new backgroundImg();
			addChild(bgImage);
		}
		
		private function init(e:Event):void 
		{
			WinText();
		}
		
		private function WinText():void 
		{
			_Win = new TextField();
			_Win.textColor = 0xFFFFFF;	 // Wit
			_Win.width = stage.stagewidth / 2;				 // Dit is de "available" aantal pixels waarop de text wordt laten zien
			_Win.height = stage.stageheight / 2;
			_Win.scaleX = 3;			 	
			_Win.scaleY = 3;
			_Win.text = "YOU WIN.";
			addChild(_Win);
		}
	}
}