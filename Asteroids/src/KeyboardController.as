package 
{
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.display.Sprite;

	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class KeyboardController extends Sprite
	{
		private var _WButtonIsDown = false;
		private var _AButtonIsDown = false;
		private var _SButtonIsDown = false;
		private var _DButtonIsDown = false;
		
		public function KeyboardController() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}
		
		private function keyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == 87)
			{
				_WButtonIsDown = true;
			}
			if (e.keyCode == 65)
			{
				_AButtonIsDown = true;
			}
			if (e.keyCode == 83)
			{
				_SButtonIsDown = true;
			}
			if (e.keyCode == 68)
			{
				_DButtonIsDown = true;
			}
			//-----------------------------//
			if (_WButtonIsDown == true)
			{
				trace("ik werk als W");
			}
			if (_AButtonIsDown == true)
			{
				trace("ik werk als A");
			}
			if (_SButtonIsDown == true)
			{
				trace("ik werk als S");
			}
			if (_DButtonIsDown == true)
			{
				trace("ik werk als D");
			}
		}
		
		private function keyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == 87)
			{
				_WButtonIsDown = false;
				trace("ik werk niet meer voor W");
			}
			if (e.keyCode == 65)
			{
				_AButtonIsDown = false;
				trace("ik werk niet meer voor A");
			}
			if (e.keyCode == 83)
			{
				_SButtonIsDown = false;
				trace("ik werk niet meer voor S");
			}
			if (e.keyCode == 68)
			{
				_DButtonIsDown = false;
				trace("ik werk niet meer voor D");
			}
		}		
	}
}