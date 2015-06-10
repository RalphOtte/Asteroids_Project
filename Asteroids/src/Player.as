package
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.events.KeyboardEvent;
	import flash.utils.Timer;
	
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
		public var _BulletAmount:int = 0;
		
		private var _WButtonIsDown:Boolean = false;
		private var _AButtonIsDown:Boolean = false;
		private var _SButtonIsDown:Boolean = false;
		private var _DButtonIsDown:Boolean = false;
		public var _ShiftButtonIsDown:Boolean = false;
		
		private var _canShoot:Boolean = true;
		private var shootTimer:Timer = new Timer(1000);
		
		//player health
		private var _HealthBlock1:Health = new Health;
		private var _HealthBlock2:Health = new Health;
		private var _HealthBlock3:Health = new Health;
		public var _HealthVisible:int;
		public var _HealthCounter:int = 3;
		public var _InvincibleFrame:Boolean;
		
		
		
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
			shootTimer.addEventListener(TimerEvent.TIMER, shootListener);
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
		}
		
		private function shootListener(e:TimerEvent):void 
		{
			_canShoot = true;
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
				if (_HealthCounter  == 3)
				{
					addChild(_HealthBlock1);
					addChild(_HealthBlock2);
					addChild(_HealthBlock3);
				}
				
				_HealthBlock1.x = this.x -350;
				_HealthBlock1.y = this.y -330;
				_HealthBlock1.rotation = 90;
				
				_HealthBlock2.x = this.x -350;
				_HealthBlock2.y = this.y -370;
				_HealthBlock2.rotation = 90;
				
				_HealthBlock3.x = this.x -350;
				_HealthBlock3.y = this.y -410;
				_HealthBlock3.rotation = 90;
				
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
			
			trace("Invincible is " + _InvincibleFrame);
			trace("Health is " + _HealthCounter);
			
			//Health Regulation
			if (_HealthCounter == 3)
			{
				if (_HealthVisible >= 45)
				{
					//if healthtimer is higher than 45 health is invisible
					_HealthBlock1.visible = false;
					_HealthBlock2.visible = false;
					_HealthBlock3.visible = false;
					//trace(_HealthVisible + " 30 and up");
				}
				if (_HealthVisible < 45)
				{
					_HealthBlock1.visible = true;
					_HealthBlock2.visible = true;
					_HealthBlock3.visible = true;
					//trace(_HealthVisible + " below 30");
					_HealthVisible++;
				}
			}
			if (_HealthCounter == 2)
			{
				if(this.contains(_HealthBlock3))removeChild(_HealthBlock3);
				
				if (_HealthVisible >= 45)
				{
					//if healthtimer is higher than 45 health is invisible
					_HealthBlock1.visible = false;
					_HealthBlock2.visible = false;
					_InvincibleFrame = false;
					//trace(_HealthVisible + " 30 and up");
				}
				if (_HealthVisible < 45)
				{
					_HealthBlock1.visible = true;
					_HealthBlock2.visible = true;
					_InvincibleFrame = true;
					//trace(_HealthVisible + " below 30");
					_HealthVisible++;
				}
			}
			if (_HealthCounter == 1)
			{
				if(this.contains(_HealthBlock2))removeChild(_HealthBlock2);
				if (_HealthVisible >= 45)
				{
					//if healthtimer is higher than 45 health is visible
					_HealthBlock1.visible = false;
					_InvincibleFrame = false;
					//trace(_HealthVisible + " 30 and up");
				}
				if (_HealthVisible < 45)
				{
					_HealthBlock1.visible = true;
					_InvincibleFrame = true;
					//trace(_HealthVisible + " below 30");
					_HealthVisible++;
				}
			}
			//upon first collision remove _HealthBlock3
			
			//upon second collision remove _HealthBlock2
			
			//upon third Collision remove _HealthBlock1 and pick winner.l
			
			
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
				trace("Shift is pressed");
				ShootShit();
			}
		}
		
		private function ShootShit():void 
		{
			if (_canShoot == true)
			{
				_GM.Skiet();
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