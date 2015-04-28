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
		private var _placeHolderPlayer:Class;
		private var _pHolderPlayer:Bitmap;
		
		public function Player() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void
		{
			_pHolderPlayer = new _placeHolderPlayer;
			addChild(_pHolderPlayer);
		}
	}
}