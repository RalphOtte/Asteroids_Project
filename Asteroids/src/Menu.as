package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.events.FocusEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.system.System;

	/**
	 * ...
	 * @author Ralph Otte
	 */
	
	 public class Menu extends Sprite
	{
		private var _MenuMusic:Sound; 		// MENU MUSIC(muziek nog in de game zetten)
		
		[Embed(source="../Assets/MainMenu/menu_astroids.png")]
		private var _MenuBackground:Class;							  
		private var _MenuBack:Bitmap;
		[Embed(source = "../Assets/MainMenu/SinglePlayerButton.png")]
		private var _SinglePlayButton:Class;
		private var _SingleButton:Bitmap;
		[Embed(source = "../Assets/MainMenu/MultiplayerButton.png")]
		private var _MultiPlayButton:Class;
		private var _MultiButton:Bitmap;
		[Embed(source = "../Assets/MainMenu/OptionsButton.png")]
		private var _OptionsButton:Class;
		private var _Options:Bitmap;
		[Embed(source = "../Assets/MainMenu/QuitButton.png")]
		private var _CreditsButton:Class;
		private var _Credits:Bitmap;
				
		public function Menu() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event):void
		{
			 removeEventListener(Event.ADDED_TO_STAGE, init);
			 
			// _MenuMusic = new Sound(new URLRequest("../Assets/Music/MUZIEK")); //Muziek voor menu COMMENT WEGHALEN ALS DE FILE ER WEL IS
			// _MenuMusic.play(0, 999);
		
			 _MenuBack = new _MenuBackground;
			 addChild(_MenuBack);
			 
			 _SingleButton = new _SinglePlayButton;
			 addChild(_SingleButton);
			_SingleButton.x = stage.stageWidth / 2 - 100;
			_SingleButton.y = stage.stageHeight / 2 - 100;
			
			 _MultiButton = new _MultiPlayButton;
			 addChild(_MultiButton);
			 _MultiButton.x = stage.stageWidth / 2 - 100;
			 _MultiButton.y = stage.stageHeight / 2 - 30;
			
			 _Options = new _OptionsButton;
			 addChild(_Options); 
			 _Options.x = stage.stageWidth / 2 - 100;
			 _Options.y = stage.stageHeight / 2 + 40;
			 
			  _Credits = new _CreditsButton;
			 addChild(_Credits);
			 _Credits.x = stage.stageWidth / 2 - 40;
			 _Credits.y = stage.stageHeight / 2 + 110;
		}
	}
}