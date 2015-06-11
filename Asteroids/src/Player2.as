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
	 * @author Jochem
	 */
	public class Player2 extends Sprite
	{
		private var _bullet:Bullet = new Bullet();
		private var _RedBullets:Array = new Array;
		private var _GM:GameManager = new GameManager();
		
		public var _SelectedSkin:int = 1;
		public var PlayerSpeed:int = 0;
		public var _BulletAmount:int = 0;
		
		private var _UpButtonIsDown:Boolean = false;
		private var _LeftButtonIsDown:Boolean = false;
		private var _DownButtonIsDown:Boolean = false;
		private var _RightButtonIsDown:Boolean = false;
		public var _SpaceButtonIsDown:Boolean = false;
		
		private var _canShoot:Boolean = true;
		private var shootTimer:Timer = new Timer(1000);
		
		//player health
		private var _HealthBlock1:Health = new Health;
		private var _HealthBlock2:Health = new Health;
		private var _HealthBlock3:Health = new Health;
		public var _HealthVisibleP2:int;
		public var _HealthCounterP2:int = 3;
		public var _InvincibleFrameP2:Boolean;
		
		[Embed(source = "../Assets/Game/PlayerShips/Schip_blauw.png")]
		private var _Ship2:Class;
		private var _BlueShip:Bitmap;
		
		public function Player2() 
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
				addChild(_BlueShip);
				if (_HealthCounterP2  == 3)
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
			}
		}
		
		private function loop(e:Event):void
		{
			
			trace("Invincible is " + _InvincibleFrameP2);
			trace("Health is " + _HealthCounterP2);
			
			//Health Regulation
			if (_HealthCounterP2 == 3)
			{
				if (_HealthVisibleP2>= 45)
				{
					//if healthtimer is higher than 45 health is invisible
					_HealthBlock1.visible = false;
					_HealthBlock2.visible = false;
					_HealthBlock3.visible = false;
					//trace(_HealthVisible + " 30 and up");
				}
				if (_HealthVisibleP2 < 45)
				{
					_HealthBlock1.visible = true;
					_HealthBlock2.visible = true;
					_HealthBlock3.visible = true;
					//trace(_HealthVisible + " below 30");
					_HealthVisibleP2++;
				}
			}
			if (_HealthCounterP2 == 2)
			{
				if(this.contains(_HealthBlock3))removeChild(_HealthBlock3);
				
				if (_HealthVisibleP2 >= 45)
				{
					//if healthtimer is higher than 45 health is invisible
					_HealthBlock1.visible = false;
					_HealthBlock2.visible = false;
					_InvincibleFrameP2 = false;
					//trace(_HealthVisible + " 30 and up");
				}
				if (_HealthVisibleP2 < 45)
				{
					_HealthBlock1.visible = true;
					_HealthBlock2.visible = true;
					_InvincibleFrameP2 = true;
					//trace(_HealthVisible + " below 30");
					_HealthVisibleP2++;
				}
			}
			if (_HealthCounterP2 == 1)
			{
				if(this.contains(_HealthBlock2))removeChild(_HealthBlock2);
				if (_HealthVisibleP2 >= 45)
				{
					//if healthtimer is higher than 45 health is visible
					_HealthBlock1.visible = false;
					_InvincibleFrameP2 = false;
					//trace(_HealthVisible + " 30 and up");
				}
				if (_HealthVisibleP2 < 45)
				{
					_HealthBlock1.visible = true;
					_InvincibleFrameP2 = true;
					//trace(_HealthVisible + " below 30");
					_HealthVisibleP2++;
				}
			}
			//upon first collision remove _HealthBlock3
			
			//upon second collision remove _HealthBlock2
			
			//upon third Collision remove _HealthBlock1 and pick winner.l
			
			
			//var radian:Number = this.rotation
			
			if (_UpButtonIsDown == true)
			{
				this.y -= 10;
			}
			
			if (_LeftButtonIsDown == true)
			{
				this.x -= 10;
			}
			
			if (_DownButtonIsDown == true)
			{
				this.y += 10;
			}
			
			if (_RightButtonIsDown == true)
			{
				this.x += 15;
			}
			
			if (_SpaceButtonIsDown == true)
			{
			}
		}
		
		//Player2 Movement
		private function keyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == 38)
			{
				_UpButtonIsDown = true;
			}
			if (e.keyCode == 37)
			{
				_LeftButtonIsDown = true;
			}
			if (e.keyCode == 40)
			{
				_DownButtonIsDown = true;
			}
			if (e.keyCode == 39)
			{
				_RightButtonIsDown = true;
			}
			if (e.keyCode == 32)
			{
				_SpaceButtonIsDown = true;
			}
		}
		
		private function keyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == 38)
			{
				_UpButtonIsDown = false;
			}
			if (e.keyCode == 37)
			{
				_LeftButtonIsDown = false;
			}
			if (e.keyCode == 40)
			{
				_DownButtonIsDown = false;
			}
			if (e.keyCode == 39)
			{
				_RightButtonIsDown = false;
			}
			if (e.keyCode == 32)
			{
				_SpaceButtonIsDown = false;
			}
		}
	}
}