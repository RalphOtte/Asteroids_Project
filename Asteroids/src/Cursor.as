package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.ui.Mouse;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class Cursor extends Sprite
	{
		[Embed(source = "../Assets/Game/cursorPlaceholder.png")]
		private var _cursorArt:Class;
		private var _Cursor:Bitmap;
		private var _menu:Menu;
		
		public function Cursor() 
		{
			Mouse.hide();
			_Cursor = new _cursorArt();
			addChild(_menu);
			_Cursor.x -= _Cursor.width / 2;
			_Cursor.y -= _Cursor.height / 2;
			
			
			
			addEventListener(Event.ENTER_FRAME, loop);
			this.addEventListener(MouseEvent.CLICK, click);
		}
		
		private function click(e:MouseEvent):void 
		{
			//_menu.Click(e:MouseEvent);	
		}
		
		private function loop(e:Event):void 
		{
			this.x = stage.mouseX;
			this.y = stage.mouseY;
		}
	}
}