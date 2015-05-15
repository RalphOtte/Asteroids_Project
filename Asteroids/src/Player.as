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
		private var _GM:GameManager = new GameManager;
		
		private var _SelectedSkin:int = 1;
		
		private var _WButtonIsDown = false;
		private var _AButtonIsDown = false;
		private var _SButtonIsDown = false;
		private var _DButtonIsDown = false;
		
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
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ADDED_TO_STAGE, Skin);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			_RedShip = new _Ship1(); 
			_BlueShip = new _Ship2();
			_GreenShip = new _Ship3();
			addEventListener(Event.ADDED_TO_STAGE, CheckSkin);
		}
		
		private function Skin(e:Event):void // _GM.SELECTEDSHIP WORDT OP 1 GEZET DOOR IETS	(Zo te zien iets fout bij waar de Whatship uitgevoerd wordt. (ShipSelect op lijn 236)
		{
			_SelectedSkin = _GM._SelectedShip;
		}
		
		private function CheckSkin(e:Event):void 
		{
			
			if (_SelectedSkin == 1)
			{
				trace("Skin 1 (PLAYER)");
				addChild(_RedShip);
			}
			else if (_SelectedSkin == 2)
			{
				trace("Skin 2 (PLAYER)");
				addChild(_BlueShip);
			}
			else if (_SelectedSkin == 3)
			{
				trace("Skin 3 (PLAYER)");
				addChild(_GreenShip);
			}
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