package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jochem
	 */
	public class MP extends Sprite
	{
		//variables
		private var _Background:Background = new Background;
		private var _ShipSelect:ShipSelect;
		private var _MPShipSelect:MPShipSelect;
		private var _Player:Player = new Player;
		private var _Player2:Player = new Player;
		private var _GM:GameManager = new GameManager;
		private var _asteroid:Asteroid = new Asteroid; 
		private var _asteroid2:Asteroid = new Asteroid;
		private var _breakAsteroid:breakAsteroids = new breakAsteroids;
		private var _BreakAsteroidPiece:BreakAsteroidPiece = new BreakAsteroidPiece;
		private var _enemy:Enemy = new Enemy;
		private var _bullet1:Bullet = new Bullet();
		private var _bullet2:Bullet = new Bullet();
		private var _bullet3:Bullet = new Bullet();
		private var _finishSpawner:int;
		private var _finish:Finish = new Finish;
		
		//Alle Timers
		private var _1SecTimer:Timer = new Timer(1000);
		private var _SpawnRate:Timer = new Timer(1000);
		
		//Arrays
		private var _Player1Bullets:Array = new Array;
		private var _Player2Bullets:Array = new Array;
		
		//Alle IntroTextBools
		private var _Text1:Boolean = false;
		private var _Text2:Boolean = false;
		
		//Alle text
		private var _IntroText1:TextField;
		private var _IntroText2:TextField;
		
		//background generation & Borders
		private var _TileCounter:int;
		private var _bg:Background = new Background();
		private var _bg1:Background = new Background();
		private var _Scrollspeed:int;
		
		private var HBorder:HighBorder = new HighBorder();
		private var HBorder2:HighBorder = new HighBorder();
		private var LBorder:LowBorder = new LowBorder();
		private var LBorder2:LowBorder = new LowBorder();
		
		//Intro op Tile 1
		[Embed(source="../Assets/Game/Miscelaneous/Tutorial.png")]
		private var _CurtainUp:Class;
		private var _Curtain1:Bitmap;
		[Embed(source="../Assets/Game/Miscelaneous/Onderkant_gate.png")]
		private var _CurtainDown:Class;
		private var _Curtain2:Bitmap;
		[Embed(source = "../Assets/Menu's/CutsceneCurtain.png")]
		private var _CurtainFade:Class;
		private var _Curtain3:Bitmap;
		
		//Schepen
		[Embed(source="../Assets/Game/PlayerShips/Schip_rood.png")]
		private var _Ship1:Class;
		private var _RedShip:Bitmap;
		[Embed(source = "../Assets/Game/PlayerShips/Schip_blauw.png")]
		private var _Ship2:Class;
		private var _BlueShip:Bitmap;
		[Embed(source="../Assets/Game/PlayerShips/Schip_groen.png")]
		private var _Ship3:Class;
		private var _GreenShip:Bitmap;
		
		public function MP() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, collisionCheck);
			_SpawnRate.addEventListener(TimerEvent.TIMER, SpawnAsteroids);
			_Curtain1 = new _CurtainUp();
			_Curtain2 = new _CurtainDown();
			_Curtain3 = new _CurtainFade();
			_RedShip = new _Ship1(); 
			_BlueShip = new _Ship2();
			_GreenShip = new _Ship3();
			Tile1(e);
		}
		
		private function collisionCheck(e:Event):void 
		{
			//Hittest for all asteroids
			
			if (_asteroid.hitTestObject(_Player))
			{
				if (_Player._InvincibleFrame == false)
				{
					//trace("Hit an Asteroid");
					_Player._HealthVisible = 0;
					_Player._HealthCounter--;
				}
				if (_Player._InvincibleFrame == true)
				{
					trace("Player invincible");
				}
			}
			else (_asteroid.x -= _Scrollspeed/1.5)
			/*
			if (_breakAsteroid.hitTestObject(_Player))
			{
				trace("Hit a Breakable Asteroid");
			}
			else (_breakAsteroid.x -= 5)
			*/
			
			//Hittest + movement for enemy
			
			if (_enemy.hitTestObject(_Player))
			{
				if (_Player._InvincibleFrame == false)
				{
					trace("Hit an enemy");
					_Player._HealthVisible = 0;
					_Player._HealthCounter--;
				}
				
				if (_Player._InvincibleFrame == true)
				{
					trace("Player invincible");
				}
			}
			else (_enemy.x -= 5)
			
			//Hittest + bulletmovement
			if (_bullet1.hitTestObject(_breakAsteroid))
			{
				trace("Bullet hit a breakable asteroid!");
				removeChild(_bullet1);
			}
			else(_bullet1.x += 5)
			
			if (_bullet1.hitTestObject(_asteroid))
			{
				removeChild(_bullet1);
			}
			else(_bullet1.x += 5)
			
				//Hittest + bulletmovement
			if (_bullet2.hitTestObject(_breakAsteroid))
			{
				trace("Bullet hit a breakable asteroid!");
				removeChild(_bullet2);
			}
			else(_bullet2.x += 5)
			
			if (_bullet2.hitTestObject(_asteroid))
			{
				removeChild(_bullet2);
			}
			else(_bullet2.x += 5)
			
				//Hittest + bulletmovement
			if (_bullet3.hitTestObject(_breakAsteroid))
			{
				trace("Bullet hit a breakable asteroid!");
				removeChild(_bullet3);
			}
			else(_bullet3.x += 5)
			
			if (_bullet3.hitTestObject(_asteroid))
			{
				removeChild(_bullet3);
			}
			else(_bullet3.x += 5)
			
			//Hittest for all borders
			
			if (HBorder.hitTestObject(_Player))
			{
				if (_Player._InvincibleFrame == false)
				{
					trace("Hit High border");
					_Player._HealthVisible = 0;
					_Player._HealthCounter--;
				}
				if (_Player._InvincibleFrame == true)
				{
					trace("Player invincible");
				}
			}
			if (HBorder2.hitTestObject(_Player))
			{
				if (_Player._InvincibleFrame == false)
				{
					trace("Hit High border");	
					_Player._HealthVisible = 0;
					_Player._HealthCounter--;
				}
				
				if (_Player._InvincibleFrame == true)
				{
					trace("Player invincible");
				}
			}
			if (LBorder.hitTestObject(_Player))
			{
				if (_Player._InvincibleFrame == false)
				{
					trace("Hit Low border");
					_Player._HealthVisible = 0;
					_Player._HealthCounter--;
				}
				
				if (_Player._InvincibleFrame == true)
				{
					trace("Player invincible");
				}
			}
			if (LBorder2.hitTestObject(_Player))
			{
				if (_Player._InvincibleFrame == false)
				{
					trace("Hit Low border");
					_Player._HealthVisible = 0;
					_Player._HealthCounter--;
				}
				
				if (_Player._InvincibleFrame == true)
				{
					trace("Player invincible");
				}
			}
			
			//hittest for finish
			if (_finish.hitTestObject(_Player))
			{
				trace("player 1 Crossed finish");
			}
			if (_finish.hitTestObject(_Player2))
			{
				trace("player 2 crossed finish");
			}
			
		}
		
		private function addBullets():void
		{
		
		}
		
		private function loop1(e:Event):void 
		{
			
			//Bullet movement
			if (_bullet1.stage)
			{
				_bullet1.scaleX = 1
				_bullet1.scaleY = 1
				_bullet1.rotation = 90;
				_bullet1.x += 5;
			}
			//Bullet movement
			if (_bullet2.stage)
			{
				_bullet2.scaleX = 1
				_bullet2.scaleY = 1
				_bullet2.rotation = 90;
				_bullet2.x += 5;
			}
			//Bullet movement
			if (_bullet3.stage)
			{
				_bullet3.scaleX = 1
				_bullet3.scaleY = 1
				_bullet3.rotation = 90;
				_bullet3.x += 5;
			}
			
 			//Players can't exit the screen
 			if (_Player.x <= 30)
 			{
 				_Player.x = 30;
 			}
			if (_Player.x >= 1240)
			{
				_Player.x = 1240;
			}
 			if (_Player.y <= 150)
 			{
 				_Player.y = 150;
 			}
 			if (_Player.y >= 570)
 			{
 				_Player.y = 570;
 			}
 			
 			//Player 2
 			/*if (_Player2.x <= 30)
 			{
 				_Player2.x = 30;
			}
			if (_Player2.x >= 1240)
			{
				_Player2.x = 1240;
			}
			if (_Player2.y <= 150)
			{
				_Player2.y = 150;
			}
			if (_Player2.y >= 570)
			{
				_Player2.y = 570;
 			}*/
			
			//asteroids respawner and spawnrate
			
			
			//scrollspeed
			_Scrollspeed = _Player.x / 15;
			
			//Tile 1
			_Curtain1.y -= 3;		
			_Curtain2.y += 3;
			_Curtain3.alpha -= 0.004;
			
			//background looper
			_bg.x -= _Scrollspeed / 2;
			_bg1.x -= _Scrollspeed / 2;
			
			//low border
			LBorder.x -= _Scrollspeed;
			LBorder.y = 605;
			LBorder2.x -= _Scrollspeed;
			LBorder2.y = 605;
			
			//high border
			HBorder.x -= _Scrollspeed;
			HBorder.y = 0;
			HBorder2.x -= _Scrollspeed;
			HBorder2.y = 0;
			
			
			if (LBorder.x <= -1280)
			{
				trace("Border reset");
				LBorder.x += 2560;
			}
			if (LBorder2.x <= -1280)
			{
				LBorder2.x += 2560;
			}
			
			if (HBorder.x <= -1280)
			{
				trace("Border reset");
				HBorder.x += 2560;
			}
			if (HBorder2.x <= -1280)
			{
				HBorder2.x += 2560;
			}
			
			if (_bg.x <= -1280)
			{
				trace("background reset");
				_bg.x += 2560;
				_finishSpawner++;
				trace(_finishSpawner)
			}
			if (_bg1.x <= -1280)
			{
				trace("background reset");
				_bg1.x += 2560;
				_finishSpawner++;
				trace(_finishSpawner)
			}	
			
			
			if (_finishSpawner == 5)
			{
				_finishSpawner++;
				addChild(_finish);
			}
			if (_finishSpawner >= 5)
			{
				trace(_finish.x)
				_finish.x -= _Scrollspeed;
				trace("added finish")
			}
		}
		
	}

}