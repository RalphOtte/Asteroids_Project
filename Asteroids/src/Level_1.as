package

{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
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
		private var _GM:GameManager = new GameManager;
		private var _asteroid:Asteroid = new Asteroid;
		private var _enemy:Enemy = new Enemy;
		
		//Alle Timers
		private var _1SecTimer:Timer = new Timer(1000);
		
		//Alle IntroTextBools
		private var _Text1:Boolean = false;
		private var _Text2:Boolean = false;
		private var _Intro:Boolean = false;
		
		//Alle text
		private var _IntroText1:TextField;
		private var _IntroText2:TextField;
		
		private var cx:Number = _Player.x - _enemy.x;
		private var cy:Number = _Player.y - _enemy.y;
		
		private var Radians:Number = Math.atan2(cy, cx);
		private var Degrees:Number = Radians * 180 / Math.PI;
		
		
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
			stage.addEventListener(Event.ENTER_FRAME, enemyLookAtPlayer);
			_Curtain1 = new _CurtainUp();
			_Curtain2 = new _CurtainDown();
			_Curtain3 = new _CurtainFade();
			_RedShip = new _Ship1(); 
			_BlueShip = new _Ship2();
			_GreenShip = new _Ship3();
			Tile1();
		}
		
		private function enemyLookAtPlayer(e:Event):void
		{
			_enemy.rotation = Degrees;
		}
		
		private function loop1(e:Event):void 
		{	
			//Tile 1
			_Curtain1.y -= 3;		
			_Curtain2.y += 3;
			_Curtain3.alpha -= 0.004;
			
			/*
			if ((_Curtain1.y = -720) && (_Curtain2.y = 1440))
			{
				removeChild(_Curtain1);
				removeChild(_Curtain2);
				removeChild(_Curtain3);
			}
			*/
			
			//Player
			if (_Player.x == stage.stageWidth / 2)
			{
				_Intro = true;
			}
			else(_Player.x += 5)
			
			if (_asteroid.hitTestObject(_Player))
			{
				trace("derp");
			}
			else (_asteroid.x -= 5)
			
			
			//Tile 2(misschien in aparte loop voor iedere tile) 
		}
		
		private function Tile1():void
		{
			addChild(_Background);
			//trace(_GM._SelectedShip + " BEFORE (LEVEL_1)");
			addChild(_Player);
			//trace(_GM._SelectedShip + " AFTER (LEVEL_1)");
			addChild(_Curtain1);	// Up
			addChild(_Curtain2);	// Down
			addChild(_Curtain3);	// Fade
			_Curtain1.y = 50;
			_Curtain2.y = stage.stageHeight / 2 + 50;
			_Player.scaleX = 0.5;
			_Player.scaleY = 0.5;
			_Player.rotation = 90;
			_Player.x = -250;
			_Player.y = stage.stageHeight / 2;
		//	addChild(_asteroid);
		//	_asteroid.scaleX = 0.5;
		//	_asteroid.scaleY = 0.5;
		//	_asteroid.x = stage.stageWidth;
		//	_asteroid.y = stage.stageHeight / 2;
		//	addChild(_enemy);
		//	_enemy.scaleX = 1;
		//	_enemy.scaleY = 1;
			_asteroid.x = stage.stageWidth;
			_asteroid.y = (stage.stageHeight / 4) * 3
			
			addEventListener(Event.ENTER_FRAME, loop1);
		}
	}
}