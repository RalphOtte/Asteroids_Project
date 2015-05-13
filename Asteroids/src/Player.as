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
		private var _Main:Main;
		[Embed(source="../Assets/Game/PlayerShips/Schip_rood.png")]
		private var _Ship1:Class;
		private var _RedShip:Bitmap;
		[Embed(source = "../Assets/Game/PlayerShips/Schip_blauw.png")]
		private var _Ship2:Class;
		private var _BlueShip:Bitmap;
		[Embed(source="../Assets/Game/PlayerShips/Schip_groen.png")]
		private var _Ship3:Class;
		private var _GreenShip:Bitmap;
		
		private var _WButtonIsDown = false;
		private var _AButtonIsDown = false;
		private var _SButtonIsDown = false;
		private var _DButtonIsDown = false;
		
		public function Player() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			_RedShip = new _Ship1(); 
			_BlueShip = new _Ship2();
			_GreenShip = new _Ship3();
		}
		
		public function SpawnShip():void
		{
			if (_Main._SelectedShip == 1)
			{
				//Spawn Red Ship
				addChild(_RedShip);
				//position ship
				_RedShip.x = stage.stageWidth/8;
				_RedShip.y = stage.stageHeight/2;
			}
			
			if (_Main._SelectedShip == 2)
			{
				//spawn blue ship
				addChild(_BlueShip);
				//position ship
				_BlueShip.x = stage.stageWidth/8;
				_BlueShip.y = stage.stageHeight/2;
			}
			
			if(_Main._SelectedShip == 3)
			{
				//spawn green ship
				addChild(_GreenShip);
				//position ship
				_GreenShip.x = stage.stageWidth/8;
				_GreenShip.y = stage.stageHeight/2;
			}
		}
		public function KeyboardController() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
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