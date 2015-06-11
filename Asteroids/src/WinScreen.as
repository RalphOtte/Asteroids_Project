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
	public class GameOverScreen 
	{
		private var _GameOver:TextField;
		
		[Embed(source="../Assets/Game/Backgrounds/Space.jpg")]
		private var backgroundImg:Class;
		private var bgImage:Bitmap;
		
		public function GameOverScreen() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			super();
			bgImage = new backgroundImg();
			addChild(bgImage);
		}
		
		private function init(e:Event):void 
		{
			GameOverText();
		}
		
		private function GameOverText():void 
		{
			_GameOver = new TextField();
			_GameOver.textColor = 0xFFFFFF;	 // Wit
			_GameOver.width = stage.stagewidth / 2;				 // Dit is de "available" aantal pixels waarop de text wordt laten zien
			_GameOver.height = stage.stageheight / 2;
			_GameOver.scaleX = 3;			 	
			_GameOver.scaleY = 3;
			_GameOver.text = "YOU WIN.";
			addChild(_GameOver);
		}
	}
}