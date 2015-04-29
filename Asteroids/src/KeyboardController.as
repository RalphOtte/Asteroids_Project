package  
{
	import flash.events.Event;
	import flash.events.FocusEvent;
	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class KeyboardController 
	{
		
		public function KeyboardController() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);	
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
		}
	}
}