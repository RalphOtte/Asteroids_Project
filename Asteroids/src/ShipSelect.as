package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.events.FocusEvent;
	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class ShipSelect 
	{
		
		public function ShipSelect() 
		{
			//this.addEventListener(Event.ADDED_TO_STAGE, init);	
		}
		
		private function init(e:Event):void 
		{
			//removeEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		public function OnePlayerShipSelect():void
		{
			trace("One Player Ship Select  (SHIPSELECT)");
		}
		public function TwoPlayerShipSelect():void
		{
			trace("Two Player Ship Select  (SHIPSELECT)");
		}
	}
}