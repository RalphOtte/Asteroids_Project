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
		private var _bullet:Bullet = new Bullet();
		private var _RedBullets:Array = new Array;
		private var _GM:GameManager = new GameManager();
		
		public var _SelectedSkin:int = 1;
		public var PlayerSpeed:int = 0;
		
		private var _WButtonIsDown:Boolean = false;
		private var _AButtonIsDown:Boolean = false;
		private var _SButtonIsDown:Boolean = false;
		private var _DButtonIsDown:Boolean = false;
		public var _ShiftButtonIsDown:Boolean = false;
		
		
		
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
			addEventListener(Event.ENTER_FRAME, loop);
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ADDED_TO_STAGE, Skin);
			addEventListener(Event.ADDED_TO_STAGE, CheckSkin);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			_RedShip = new _Ship1(); 
			
			_RedShip.x -= (185 / 2);
			_RedShip.y -= (142 / 2);
			
			_BlueShip = new _Ship2();
			
			_BlueShip.x -= (187 / 2);
			_BlueShip.y -= (131 / 2);
			
			//_GreenShip = new _Ship3();
			//_GreenShip.x -= (164 / 2);
			//_GreenShip.y -= (146 / 2);
			
			//_RedBullets = new Array;
		}
		
		private function Skin(e:Event):void // _GM.SELECTEDSHIP WORDT OP 1 GEZET DOOR IETS	(Zo te zien iets fout bij waar de Whatship uitgevoerd wordt. (ShipSelect op lijn 236)
		{
			trace(_SelectedSkin + "DERP");
		//	_SelectedSkin = _GM._SelectedShip;
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
		
		private function loop(e:Event):void
		{
			//var radian:Number = this.rotation
			
			if (_WButtonIsDown == true)
			{
				this.y -= 10;
			}
			
			if (_AButtonIsDown == true)
			{
				this.x -= 10;
			}
			
			if (_SButtonIsDown == true)
			{
				this.y += 10;
			}
			
			if (_DButtonIsDown == true)
			{
				this.x += 15;
			}
			
			if (_ShiftButtonIsDown == true)
			{
				addChild(_bullet);
				//trace ("Bullet spawned (WEAPON)");
				ShootBullet();
			}
			//Bullet movement
			if (_bullet.stage)
			{
				
				_bullet.scaleX = 3
				_bullet.scaleY = 3
				_bullet.x += 5;
				trace(_bullet.x);
			}
			
		}
		
		private function ShootBullet():void 
		{
			//addChild(_bullet);
			dispatchEvent(new Event("SHOOT_BULLET"));
			trace("Bullet added to stage");
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
			if (e.keyCode == 16)
			{
				_ShiftButtonIsDown = true;
			}
		}
		
		
		
		private function keyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == 87)
			{
				_WButtonIsDown = false;
			}
			if (e.keyCode == 65)
			{
				_AButtonIsDown = false;
			}
			if (e.keyCode == 83)
			{
				_SButtonIsDown = false;
			}
			if (e.keyCode == 68)
			{
				_DButtonIsDown = false;
			}
			if (e.keyCode == 16)
			{
				_ShiftButtonIsDown = false;
			}
		}
	}
}