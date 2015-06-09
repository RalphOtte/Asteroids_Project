package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Jochem
	 */
	public class Health extends Sprite
	{
		[Embed(source="../Assets/Game/Miscelaneous/HealthBlock.png")]
		private var _Health:Class;
		private var _HealthBlock:Bitmap;
		
		public function Health() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			_HealthBlock = new _Health();
			addChild(_HealthBlock);
		}
		
		private function init(e:Event):void 
		{
			
		}
		
	}

}