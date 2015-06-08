package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Jochem
	 */
	public class Finish extends Sprite
	{
		
		[Embed(source = "../Assets/Game/Miscelaneous/Finish.png")]
		private var _finishImg:Class;
		private var _finish:Bitmap;
		
		public function Finish() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init)
			_finish = new _finishImg();
			addChild(_finish);
		}
		
		private function init(e:Event):void 
		{
			
		}
		
	}

}