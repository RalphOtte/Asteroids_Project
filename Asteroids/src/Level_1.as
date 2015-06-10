package
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class Level_1 extends Sprite
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
		private var _BreakAsteroidPiece2:BreakAsteroidPiece = new BreakAsteroidPiece;
		private var _enemy:Enemy = new Enemy;
		private var _bullet1:Bullet = new Bullet();
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
		public var _Intro:Boolean = false;
		
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
		
		// Stoplicht
		//[Embed(source="../Assets/Game/Miscelaneous/Stoplicht.swf")]  //, symbol="scene1ID"
		//private var _Stoplicht:Class;
		//private var _StopLicht:MovieClip = new _StopLicht();
		[Embed(source="../Assets/Game/Miscelaneous/Stoplicht.swf")]  //, symbol="scene1ID"
		private var _Stoplicht:Class;
		//private var _Stoplicht:MovieClip = new _Stoplicht();
		
		public function Level_1() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, collisionCheck);
			addEventListener(Event.ENTER_FRAME, addBullets1);
			addEventListener(Event.ENTER_FRAME, breakPieceMovement);
			_SpawnRate.addEventListener(TimerEvent.TIMER, SpawnAsteroids);
			_Curtain1 = new _CurtainUp();
			_Curtain2 = new _CurtainDown();
			_Curtain3 = new _CurtainFade();
			_RedShip = new _Ship1(); 
			_BlueShip = new _Ship2();
			_GreenShip = new _Ship3();
			Tile1(e);
		}
		
		private function breakPieceMovement(e:Event):void 
		{
			if (this.contains(_BreakAsteroidPiece))
			{
				_BreakAsteroidPiece.x += 5;
				_BreakAsteroidPiece.y += 10;
			}
			if (this.contains(_BreakAsteroidPiece2))
			{
				_BreakAsteroidPiece2.x -= 5;
				_BreakAsteroidPiece2.y -= 10;
			}
		}
		
		private function collisionCheck(e:Event):void 
		{
			//Hittest for all asteroids
			if (this.contains(_bullet1))
			{
				if (_bullet1.x >= 1280)
				{
					removeChild(_bullet1);
				}
			}
			
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
			
			if (_breakAsteroid.hitTestObject(_Player))
			{
				trace("Hit a Breakable Asteroid");
			}
			else (_breakAsteroid.x -= _Scrollspeed / 1.5)
			
			//Healthpool
			if (_breakAsteroid.hitTestObject(_bullet1))
			{
				_breakAsteroid._AsteroidsHealth -= 5;
			}
			
			if (_breakAsteroid._AsteroidsHealth == 0)
			{
				spawnBreakPieces();
			}
			
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
				_bullet1.x = 0;
				_bullet1.y = 0;
				removeChild(_bullet1);
			}
			else(_bullet1.x += 5)
			
			if (_bullet1.hitTestObject(_asteroid))
			{
				trace("Bullet hit an indestructible asteroid");
				_bullet1.x = 0;
				_bullet1.y = 0;
				removeChild(_bullet1);
			}
			else(_bullet1.x += 5)
			
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
		
		private function addBullets1(e:Event):void 
		{
			if (_Player._ShiftButtonIsDown == true)
			{
				if (!this.contains(_bullet1))
				{
					addChild(_bullet1);
					_bullet1.x = _Player.x;
					_bullet1.y = _Player.y;
				}
				else{}
			}
		}
		
		public function spawnBreakPieces():void
		{
				this.addChild(_BreakAsteroidPiece);
				this.addChild(_BreakAsteroidPiece2);
				_BreakAsteroidPiece.x = _breakAsteroid.x;
				_BreakAsteroidPiece.y = _breakAsteroid.y;
				_BreakAsteroidPiece2.x = _breakAsteroid.x;
				_BreakAsteroidPiece2.y = _breakAsteroid.y;
				//breakPieceMovement(e);
				if (this.contains(_breakAsteroid))
				{
					removeChild(_breakAsteroid);
				}
		}
		
		private function SpawnAsteroids():void 
		{
			if (_asteroid.x <= -20)
			{
				_asteroid.x += 1400;
			}
			
			addChild(_asteroid);
			_asteroid.scaleX = 0.5;
			_asteroid.scaleY = 0.5;
			_asteroid.x = stage.stageWidth;
			_asteroid.y = 120 + Math.floor(Math.random() * 480);
		}
		
		private function Tile1(e:Event):void
		{
			addChild(_bg);
			addChild(_bg1);
			
			_bg1.y = 0;
			_bg1.x = 1280;
			
			_finish.x = 1350;
			
			//borders
			addChild(HBorder);
			addChild(HBorder2);
			HBorder2.x = 1280;
			addChild(LBorder);
			addChild(LBorder2);
			LBorder2.x = 1280;
			
			addChild(_Player);
			
			//addChild(_Curtain1);	// Up
			//addChild(_Curtain2);	// Down
			//addChild(_Curtain3);	// Fade
			
			_Curtain1.y = 50;
			_Curtain2.y = stage.stageHeight / 2 + 50;
			_Player.scaleX = 0.5;
			_Player.scaleY = 0.5;
			_Player.rotation = 90;
			_Player.x = 250;
			_Player.y = stage.stageHeight / 2;
			
			
			
		//	SpawnAsteroids();
			
			
			//addChild(_asteroid);	
			_asteroid.scaleX = 0.5;
			_asteroid.scaleY = 0.5;
			_asteroid.x = stage.stageWidth;
			_asteroid.y = 120 + Math.floor(Math.random() * 480);
			
			
			//addChild(_asteroid2);
			_asteroid2.scaleX = 0.5;
			_asteroid2.scaleY = 0.5;
			_asteroid2.x = stage.stageWidth;
			_asteroid2.y = 120 + Math.floor(Math.random() * 500);
		
			addChild(_breakAsteroid);
			_breakAsteroid.scaleX = 1;
			_breakAsteroid.scaleY = 1;
			_breakAsteroid.x = stage.stageWidth;
			_breakAsteroid.y = stage.stageHeight / 2;
			
			
		//	addChild(_enemy);
			_enemy.scaleX = 0.5;
			_enemy.scaleY = 0.5;
			_enemy.x = stage.stageWidth;
			_enemy.y = stage.stageHeight / 2;
			
			addEventListener(Event.ENTER_FRAME, loop1);
		}
	}
}