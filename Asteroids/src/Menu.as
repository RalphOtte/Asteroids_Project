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
		private var _1P:Player;
		private var gameStartTimer:Timer = new Timer (500, 1);
		private var MenuMusic:Sound; // MENU MUSIC
		
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
				
			 MenuMusic = new Sound(new URLRequest("../Assets/Music/MUZIEK")); //MUziek voor menu
			 MenuMusic.play(0, 999);
		
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
				gameStartTimer.addEventListener(TimerEvent.TIMER, tick1); //Timer voor instantiatie van OnePlayer
				gameStartTimer.start();
			}
			if (e.keyCode == 50) // Keycode 2
			{
				gameStartTimer.addEventListener(TimerEvent.TIMER, tick2); //Timer voor instantiatie van TwoPlayer
				gameStartTimer.start();
			}
			if (e.keyCode == 51) // Keycode 3
			{
				gameStartTimer.addEventListener(TimerEvent.TIMER, tick3); //Timer voor instantiatie van Options
				gameStartTimer.start();
			}
			if (e.keyCode == 52) // Keycode 4
			{
				gameStartTimer.addEventListener(TimerEvent.TIMER, tick4); //Timer voor instantiatie van Credits
				gameStartTimer.start();
			}
			if (e.keyCode == 53) // Keycode 5
			{
				System.exit(0); //SLUIT HET PROGRAMMA
			}
		}
		function tick1(e:Event):void  //Functie die aangeroepen wordt als tick1(TIMER) aangeroepen wordt.
		{
			OnePlayer();
		}
		function tick2(e:Event):void  //Functie die aangeroepen wordt als tick2(TIMER) aangeroepen wordt.
		{
			TwoPlayer();
		}
		function tick3(e:Event):void  //Functie die aangeroepen wordt als tick3(TIMER) aangeroepen wordt.
		{
			Options();
		}
		function tick4(e:Event):void  //Functie die aangeroepen wordt als tick4(TIMER) aangeroepen wordt.
		{
			Credits();
		}
		public function OnePlayer():void
		{
			trace("Oneplayer wordt aangeroepen");
			// StartGame();
			_1P = new Player; // DIT WORDT VERVANGEN DOOR FUNCTIES UIT DE GAMEMANAGER CLASS(Die wordt aangeroepen ,
			addChild(_1P);	  // Daarin wordt een integer hieruit opgehaald met welke selectie is gemaakt in het menu.
			//	_1P.x = stage.stageWidth / 2;
			//	_1P.y = stage.stageHeight / 2; //De X & Y zijn weggecomment vanwege: Error #1009: "Cannot access a property or method of a null object reference."
		}
		public function TwoPlayer():void
		{
			// StartGame
		}
		private function Options():void //Options voor SFX & Music etc.
		{
			
		}
		private function Credits():void ///BUTTON ERBIJ MAKEN ZODAT DE CREDITS SNELLER GAAN SCROLLEN
		{
			
		}	
	}
}