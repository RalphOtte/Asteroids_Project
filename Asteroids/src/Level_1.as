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
		private var _GM:GameManager = new GameManager;;
		
		//variables
		private var _Background:Background = new Background;
		private var _ShipSelect:ShipSelect;
		private var _MPShipSelect:MPShipSelect;
		private var _Player:Player = new Player;
		
		//Alle Timers
		private var _1SecTimer:Timer = new Timer(1000);
		
		//Alle IntroTextBools
		private var _Text1:Boolean = false;
		private var _Text2:Boolean = false;
		
		//Alle text
		private var _IntroText1:TextField;
		private var _IntroText2:TextField;
		
		
		//Intro op Tile 1
		[Embed(source = "../Assets/Menu's/CutsceneCurtain.png")]
		private var _CurtainUp:Class;
		private var _Curtain1:Bitmap;
		[Embed(source = "../Assets/Menu's/CutsceneCurtain.png")]
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
			_Curtain1 = new _CurtainUp();
			_Curtain2 = new _CurtainDown();
			_Curtain3 = new _CurtainFade();
			_RedShip = new _Ship1(); 
			_BlueShip = new _Ship2();
			_GreenShip = new _Ship3();
			Tile1(e);
		}
		
		private function loop1(e:Event):void 
		{	
			//Tile 1
			_Curtain1.y += 8;
			_Curtain2.y -= 8;
			_Curtain3.alpha -= 0.004;
			
			//Player
			if (_Player.x == stage.stageWidth / 2)
			{
				//Start Intro
				_IntroText1 = new TextField();
				_IntroText1.textColor = 0xFFFFFF;	 // Wit
				_IntroText1.width = 370;				 // Dit is de "available" aantal pixels waarop de text wordt laten zien
				_IntroText1.height = 20;
				_IntroText1.scaleX = 2;			 	
				_IntroText1.scaleY = 2;
				_IntroText1.x = 400;
				_IntroText1.y = 50;
				_IntroText1.text = "Good morning, pilot.";
				addChild(_IntroText1);
				_Text1 = true;
				_1SecTimer.addEventListener(TimerEvent.TIMER, Intro);
				_1SecTimer.start();
				
				/*
				 * Wat de text hierboven doet is hij laat de text zien, zet de boolean dat text 1 geweest is op true, en start een timer. 
				 * Dan na die timer start hij de Intro functie, en die kijkt welke boolean aan staat(_text1 etc.)
				 * Als text 1 true is, start hij text 2 enzovoort naar de 3e etc.
				 * */
				
			}
			else(_Player.x += 5)
			
			
			//Tile 2(misschien in aparte loop voor iedere tile) 
		}
		
		private function Intro(e):void
		{
			if (_Text1 == true)
			{
				//_IntroText1.text = "";		//Werkt niet
				//_IntroText1.y = -200;			//Werkt niet
				//_IntroText1.parent.removeChild(_IntroText1);
				_IntroText2 = new TextField();
				_IntroText2.textColor = 0xFFFFFF;	 // Wit
				_IntroText2.width = 370;				 // Dit is de "available" aantal pixels waarop de text wordt laten zien
				_IntroText2.height = 20;
				_IntroText2.scaleX = 2;			 	
				_IntroText2.scaleY = 2;
				_IntroText2.x = 400;
				_IntroText2.y = 50;
				_IntroText2.text = "Text 2";
				addChild(_IntroText2);
				_1SecTimer.addEventListener(TimerEvent.TIMER, Intro);
				_1SecTimer.start()
				_Text1 = false;
				_Text2 = true;
				trace("Start text 3");
			}
			else if (_Text2 == true)
			{
				//Start text 3
				trace("TEXT 3");
				_Text2 = false;
				//_Text3 = true;
			}
		}
		
		private function Tile1(e:Event):void
		{
			addChild(_Background);
			//trace(_GM._SelectedShip + " BEFORE (LEVEL_1)");
			addChild(_Player);
			//trace(_GM._SelectedShip + " AFTER (LEVEL_1)");
			addChild(_Curtain1);
			addChild(_Curtain2);
			addChild(_Curtain3);
			_Player.scaleX = 0.5;
			_Player.scaleY = 0.5;
			_Player.rotation = 90;
			_Player.x = -250;
			_Player.y = stage.stageHeight / 2;
			addEventListener(Event.ENTER_FRAME, loop1);
		}
		
		private function Tile2(e:Event):void
		{
			
			
		}
		private function Tile3(e:Event):void
		{
			
			
		}
		private function Tile4(e:Event):void
		{
			
			
		}
		private function Tile5(e:Event):void
		{
			
			
		}
		private function Tile6(e:Event):void
		{
			
			
		}
		private function Tile7(e:Event):void
		{
			
			
		}
		private function Tile8(e:Event):void
		{
			
			
		}
		private function Tile9(e:Event):void
		{
			
			
		}
		private function Tile10(e:Event):void
		{
			
			
		}
		private function Tile11(e:Event):void
		{
			
		}
		private function Tile12(e:Event):void
		{
			
			
		}	
	}
}