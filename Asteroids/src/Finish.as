package  
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.ByteArray;
	/**
	 * ...
	 * @author Jochem
	 */
	public class Finish extends Sprite
	{	
		[Embed(source="../Assets/Game/Miscelaneous/Finish.swf", mimeType="application/octet-stream")]
		private var _finishImg:Class;
		//private var _finish:Bitmap;
		private var loader:Loader = new Loader();
		
		
		public function Finish() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init)
			loader.loadBytes(new _finishImg as ByteArray);
			addChild(loader);
			loader.unloadAndStop();
			//_finish = new _finishImg();
			//addChild(_finish);
		}
		
		private function init(e:Event):void 
		{
			
		}
		
	}

}