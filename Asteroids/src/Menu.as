package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.system.System;

	/**
	 * ...
	 * @author Ralph Otte
	 */
	
	 public class Menu extends Sprite
	{
		private var _1Player:Player; 			// Player Class wordt aangeroepen.
		private var _modeSelectTimer:Timer = new Timer (1100, 1); // Algemene timer van een halve seconde. (Kan ook op andere plaatsen aangeroepen worden zonder problemen dat hij wat anders aanroept)
		private var _MenuMusic:Sound; 		// MENU MUSIC(muziek nog in de game zetten)
		private var _GM:GameManager;		// GameManager Class wordt aangeroepen.
		
		[Embed(source = "../Assets/MainMenu/Asteroids.png")] //AL DEZE PNG's ZIJN VOOR DE MENU ITEMS, DIE WORDEN BINNENKORT VERVANGEN DOOR DE ART VAN ARTIST
		private var mainMenuTitle:Class;
		private var mMenuTitle:Bitmap;
		[Embed(source="../Assets/MainMenu/NewButton.png")]
		private var newButtonArt:Class;
		private var nButtonArt:Bitmap;
		[Embed(source = "../Assets/MainMenu/LoadButton.png")]
		private var loadButtonArt:Class;
		private var lButtonArt:Bitmap;
		[Embed(source = "../Assets/MainMenu/OptionsButton.png")]
		private var optionsButtonArt:Class;
		private var oButtonArt:Bitmap;
		[Embed(source = "../Assets/MainMenu/CreditsButton.png")]
		private var creditsButtonArt:Class;
		private var cButtonArt:Bitmap;
		[Embed(source = "../Assets/MainMenu/ExitButton.png")]
		private var exitButtonArt:Class;
		private var eButtonArt:Bitmap;
		[Embed(source = "../Assets/MainMenu/1.png")]
		private var point1Art:Class;
		private var p1Art:Bitmap;
		[Embed(source = "../Assets/MainMenu/2.png")]
		private var point2Art:Class;
		private var p2Art:Bitmap;
		[Embed(source = "../Assets/MainMenu/3.png")]
		private var point3Art:Class;
		private var p3Art:Bitmap;
		[Embed(source = "../Assets/MainMenu/4.png")]
		private var point4Art:Class;
		private var p4Art:Bitmap;
		[Embed(source = "../Assets/MainMenu/5.png")]
		private var point5Art:Class;
		private var p5Art:Bitmap;
		
		
		public function Menu() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
		
		removeEventListener(Event.ADDED_TO_STAGE, init);
				
			 _MenuMusic = new Sound(new URLRequest("../Assets/Music/MUZIEK")); //Muziek voor menu
			 _MenuMusic.play(0, 999);
		
			 mMenuTitle = new mainMenuTitle; //Title Art
			 addChild(mMenuTitle);
			 
			 nButtonArt = new newButtonArt; // One Player Button Art
			 addChild(nButtonArt); 
			 nButtonArt.x = stage.stageWidth / 2 - 40;
			 nButtonArt.y = 300;
			 
			 lButtonArt = new loadButtonArt; // Two Player Button Art
			 addChild(lButtonArt);
			 lButtonArt.x = stage.stageWidth / 2 - 45;
			 lButtonArt.y = 350; 
			 
			 oButtonArt = new optionsButtonArt; // Options Button Art
			 addChild(oButtonArt);
			 oButtonArt.x = stage.stageWidth / 2 - 60;
			 oButtonArt.y = 400;
			
			cButtonArt = new creditsButtonArt; // Credits Button Art
			 addChild(cButtonArt);
			 cButtonArt.x = stage.stageWidth / 2 - 50;
			 cButtonArt.y = 450;
			 
			 eButtonArt = new exitButtonArt; // Exit Game Button Art
			 addChild(eButtonArt);
			 eButtonArt.x = stage.stageWidth / 2 - 80;
			 eButtonArt.y = 500;
			 
			 stage.addEventListener(KeyboardEvent.KEY_UP, mainSelect); //Listener voor de 1,2,3,4,5 nummerselectie
			 p1Art = new point1Art;
			 addChild(p1Art);				//	Art voor de 1.
			 p1Art.x = stage.stageWidth / 3 - 20;
			 p1Art.y = 300;
			 
			p2Art = new point2Art;			//	Art voor de 2.
			 addChild(p2Art);
			 p2Art.x = stage.stageWidth / 3 - 20;
			 p2Art.y = 350;
			
			p3Art = new point3Art;			//	Art voor de 3.
			 addChild(p3Art);
			 p3Art.x = stage.stageWidth / 3 - 20;
			 p3Art.y = 400;
			 
			 p4Art = new point4Art;			//	Art voor de 4.
			 addChild(p4Art);
			 p4Art.x = stage.stageWidth / 3 - 20;
			 p4Art.y = 450;
			 
			 p5Art = new point5Art;			//	Art voor de 5.
			 addChild(p5Art);
			 p5Art.x = stage.stageWidth / 3 - 20;
			 p5Art.y = 500;
	}
		private function mainSelect(e:KeyboardEvent):void //Draait tegelijk met StartMenu(Doordat het alleen EventListener toevoegt, en niet weghaalt)
		{
			if (e.keyCode == 49) // Keycode 1
			{
				_modeSelectTimer.addEventListener(TimerEvent.TIMER, OnePlayerChosen); //Timer voor instantiatie van OnePlayer
				_modeSelectTimer.start();
			}
			if (e.keyCode == 50) // Keycode 2
			{
				_modeSelectTimer.addEventListener(TimerEvent.TIMER, TwoPlayerChosen); //Timer voor instantiatie van TwoPlayer
				_modeSelectTimer.start();
			}
			if (e.keyCode == 51) // Keycode 3
			{
				_modeSelectTimer.addEventListener(TimerEvent.TIMER, OptionsChosen); //Timer voor instantiatie van Options
				_modeSelectTimer.start();
			}
			if (e.keyCode == 52) // Keycode 4
			{
				_modeSelectTimer.addEventListener(TimerEvent.TIMER, CreditsChosen); //Timer voor instantiatie van Credits
				_modeSelectTimer.start();
			}
			if (e.keyCode == 53) // Keycode 5
			{
				System.exit(0); //SLUIT HET PROGRAMMA
			}
		}
		function OnePlayerChosen(e:Event):void  //Functie die aangeroepen wordt als OnePlayerChosen(TIMER) aangeroepen wordt.
		{
			OnePlayer();
		}
		function TwoPlayerChosen(e:Event):void  //Functie die aangeroepen wordt als TwoPlayerChosen(TIMER) aangeroepen wordt.
		{
			TwoPlayer();
		}
		function OptionsChosen(e:Event):void  //Functie die aangeroepen wordt als OptionsChosen(TIMER) aangeroepen wordt.
		{
			Options();
		}
		function CreditsChosen(e:Event):void  //Functie die aangeroepen wordt als CreditsChosen(TIMER) aangeroepen wordt.
		{
			Credits();
		}
		public function OnePlayer():void
		{
			trace("GameManager Class wordt aangeroepen (Menu OnePlayer function)");
			_GM = new GameManager();	//Spawned de GM
			addChild(_GM);
			
			_1Player = new Player;	//Spawned de player
			addChild(_1Player);
			trace(_1Player.x + " X (Menu OnePlayer function)"); // trace X = 0		(WAAROM?)
			trace(_1Player.y + " Y (Menu OnePlayer function)"); // trace Y = 0		(WAAROM?)
			_1Player.x = 400;
			_1Player.y = 600;
			trace(_1Player.x + " X (Menu OnePlayer function)"); // trace X = 400
			trace(_1Player.y + " Y (Menu OnePlayer function)"); // trace Y = 600; (MAAR HIJ LAAT NIKS ZIEN)
		}
		public function TwoPlayer():void
		{
			
		}
		private function Options():void //Options voor SFX & Music etc.(EN CONTROLS OFC)
		{
			
		}
		private function Credits():void ///BUTTON ERBIJ MAKEN ZODAT DE CREDITS SNELLER GAAN SCROLLEN
		{
			
		}	
	}
}