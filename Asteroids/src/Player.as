package  
{
	
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class Player extends Sprite
	{
		[Embed(source = "../Assets/Game/PlayerShips/placeholder.png")]
		private var placeHolder:Class;
		private var pHolder:Bitmap;
		
		public function Player() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void
		{
			pHolder = new placeHolder;
			addChild(pHolder);
			this.x = stage.stageWidth / 2 ;
			this.y = 720 / 2;
		}
	}

}