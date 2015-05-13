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
		private var _ShipSelect:ShipSelect;
		[Embed(source="../Assets/Game/PlayerShips/Schip_rood.png")]
		private var _Ship1:Class;
		private var _RedShip:Bitmap;
		[Embed(source = "../Assets/Game/PlayerShips/Schip_blauw.png")]
		private var _Ship2:Class;
		private var _BlueShip:Bitmap;
		[Embed(source="../Assets/Game/PlayerShips/Schip_groen.png")]
		private var _Ship3:Class;
		private var _GreenShip:Bitmap;
		
		public function Player() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void
		{
			_RedShip = new _Ship1(); 
			_BlueShip = new _Ship2();
			_GreenShip = new _Ship3();
		}
		
		public function SpawnShip():void
		{
			if (_ShipSelect._SelectedShip == 1)
			{
				//spawn red ship
				addChild(_RedShip);
				//position ship
				_RedShip.x = stage.stageWidth/8;
				_RedShip.y = stage.stageHeight/2;
			}else if (_ShipSelect._SelectedShip == 2)
			{
				//spawn blue ship
				addChild(_BlueShip);
				//position ship
				_BlueShip.x = stage.stageWidth/8;
				_BlueShip.y = stage.stageHeight/2;
			}else if(_ShipSelect._SelectedShip == 3)
			{
				//spawn green ship
				addChild(_GreenShip);
				//position ship
				_GreenShip.x = stage.stageWidth/8;
				_GreenShip.y = stage.stageHeight/2;
			}
		}
	}
}