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
		private var _enemy:Enemy = new Enemy;
		private var _bullet:Bullet = new Bullet();
		private var _SpawnRate:int;
		private var _Asteroids:Array = new Array;
		private var _finishSpawner:int;
		private var _finish:Finish = new Finish;
		
		//Alle Timers
		private var _1SecTimer:Timer = new Timer(1000);
		
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
		
		
		/*
		 * Denk dat het het beste is om te kijken als een volgende tile geactiveerd wordt dat er dan een switch of dergelijke wordt omgezet
		 * En dan de volgende loop aan te roepen tegelijk met de nieuwe tile, en dan de oude dingen weg te halen.
		 * 
		 * IDEE: Kunnen asteroides de volgende tiles binnenvliegen als hun koers die richting op is?
		 * 
		 * */
		public function Level_1() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, collisionCheck);
			addEventListener(Event.ENTER_FRAME, spawnRates);
			_Curtain1 = new _CurtainUp();
			_Curtain2 = new _CurtainDown();
			_Curtain3 = new _CurtainFade();
			_RedShip = new _Ship1(); 
			_BlueShip = new _Ship2();
			_GreenShip = new _Ship3();
			Tile1(e);
		}
		
		private function spawnRates(e:Event):void 
		{
			//Asteroid spawn
			
			//Enemy spawn
		}
		
		private function collisionCheck(e:Event):void 
		{
			//Hittest for all asteroids
			if (_asteroid.hitTestObject(_Player))
			{
				trace("Hit an Asteroid");
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
				trace("Hit an enemy");
			}
			else (_enemy.x -= 5)
			
			//Hittest + bulletmovement
			if (_bullet.hitTestObject(_breakAsteroid))
			{
				trace("Bullet hit a breakable asteroid!");
				removeChild(_bullet);
			}
			else(_bullet.x += 5)
			
			if (_bullet.hitTestObject(_asteroid))
			{
				removeChild(_bullet);
			}
			else(_bullet.x += 5)
			
			//Hittest for all borders
			if (HBorder.hitTestObject(_Player))
			{
				trace("Hit High border");	
			}
			if (HBorder2.hitTestObject(_Player))
			{
				trace("Hit High border");	
			}
			if (LBorder.hitTestObject(_Player))
			{
				trace("Hit Low border");	
			}
			if (LBorder2.hitTestObject(_Player))
			{
				trace("Hit Low border");	
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
			if (_bullet.stage)
			{
				_bullet.scaleX = 3
				_bullet.scaleY = 3
				_bullet.x += 5;
				trace(_bullet.x);
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
			SpawnAsteroids();
			
			
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
		
		
		private function SpawnAsteroids():void 
		{
			if (_asteroid.x <= 10)
			{
				//trace("asteroid removed");
			}
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
			
			addChild(_asteroid);	
			_asteroid.scaleX = 0.5;
			_asteroid.scaleY = 0.5;
			_asteroid.x = stage.stageWidth;
			_asteroid.y = 120 + Math.floor(Math.random() * 480);
			
			//addChild(_asteroid2);
			_asteroid2.scaleX = 0.5;
			_asteroid2.scaleY = 0.5;
			_asteroid2.x = stage.stageWidth;
			_asteroid2.y = 120 + Math.floor(Math.random() * 500);
			
			
		//	_asteroid.x = stage.stageWidth;
		//	_asteroid.y = (stage.stageHeight / 4) * 3
		
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