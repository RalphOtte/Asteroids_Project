package

{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class LevelSelect extends Sprite
	{
		private var _Main:Main;
		private var _ShipSelect:ShipSelect;
		private var _MPShipSelect:MPShipSelect;
		private var _GM:GameManager = new GameManager;
		
		private var _NavigationInstruction:TextField;
		
		private var _Selection:int = 1;	
		private var _LevelSelection:int = 1;
		private var _SelectedLevel:int = 0;		
		
		private var _WIsDown:Boolean = false;
		private var _SIsDown:Boolean = false;
		private var _SpaceIsDown:Boolean = false;
		
		// Levels
		[Embed(source = "../Assets/Menu's/level_1.png")]
		private var _Level_1:Class;
		private var _Level1:Bitmap;
		[Embed(source = "../Assets/Menu's/level_2.png")]
		private var _Level_2:Class;
		private var _Level2:Bitmap;
		[Embed(source = "../Assets/Menu's/level_3.png")]
		private var _Level_3:Class;
		private var _Level3:Bitmap;
		//Background
		[Embed(source="../Assets/Menu's/menu_options_astroids.png")]
		private var _BackGround:Class;
		private var _BG:Bitmap;
		//Alle pointers (Singleplayer & Multiplayer P1/P2)
		[Embed(source = "../Assets/Menu's/Pointer.png")]
		private var _Pointer:Class;
		private var _PointerArt:Bitmap;
		//Alle buttons
		[Embed(source="../Assets/Menu's/Pijl_next.png")]
		private var _Previous:Class;								// Het nulpunt van deze art is aan de rechterkant om dat het een omgedraaide Nextbutton is.
		private var _Prev:Bitmap;
		[Embed(source="../Assets/Menu's/Pijl_next.png")]
		private var _NextLevel:Class;
		private var _Next:Bitmap;
		[Embed(source="../Assets/Menu's/SelectButton.png")]
		private var _ConfirmChoice:Class;
		private var _Confirm:Bitmap;
		[Embed(source="../Assets/Menu's/BackButton.png")]
		private var _BackSelect:Class;
		private var _Back:Bitmap;	
		
		public function LevelSelect() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);	
		}
		
		private function init(e:Event):void 
		{
			addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, checkButtonDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, checkButtonUp);
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function reSpawn(e):void
		{
			this.init(e);
			_Selection = 1;
			_LevelSelection = 1;
			_SelectedLevel = 0;
		}
		
		private function checkButtonUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == 87)
			{
				_WIsDown = false;
			}
			if (e.keyCode == 83)
			{
				_SIsDown = false;
			}
			if (e.keyCode == 32)
			{
				_SpaceIsDown = false;
			}
		}
		
		private function checkButtonDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == 87)
			{
				_WIsDown = true;
			}
			if (e.keyCode == 83)
			{
				_SIsDown = true;
			}
			if (e.keyCode == 32)
			{
				_SpaceIsDown = true;
			}
		}
		
		public function AllLevelSelect():void
		{
			_BG = new _BackGround();
			addChild(_BG);
			_Prev = new _Previous();
			addChild(_Prev);
			_Prev.scaleX = -1;
			_Next = new _NextLevel();
			addChild(_Next);
			_Confirm = new _ConfirmChoice();
			addChild(_Confirm);
			_Back = new _BackSelect();
			addChild(_Back);
			_PointerArt = new _Pointer;
			addChild(_PointerArt);
			_Level1 = new _Level_1();
			addChild(_Level1);
			_Level2 = new _Level_2();
			addChild(_Level2);
			_Level3 = new _Level_3();
			addChild(_Level3);
			
			_NavigationInstruction = new TextField();
			_NavigationInstruction.textColor = 0xFFFFFF;	 // Wit
			_NavigationInstruction.width = 270;				 // Dit is de "available" aantal pixels waarop de text wordt laten zien
			_NavigationInstruction.height = 20;
			_NavigationInstruction.scaleX = 1.5;			 	
			_NavigationInstruction.scaleY = 1.5;
			_NavigationInstruction.x = 850;
			_NavigationInstruction.y = 0;
			_NavigationInstruction.text = "Use W/S to navigate, use SPACE to confirm selection.";
			addChild(_NavigationInstruction);
			
			_Prev.x = 450;
			_Prev.y = stage.stageHeight / 2 - 50; 	// TUSSEN DE 700 PX die hier tussen staat komt een plaatje van een schip(degene die gekozen is, afhankelijk van de _selection integer
			_Next.x = 830;
			_Next.y = stage.stageHeight / 2 - 50;
			_Confirm.x = stage.stageWidth /2 - 110;	//Deze moet op het midden onder het schip komen .x = 290
			_Confirm.y = stage.stageHeight / 2 + 70;
			_Back.x = stage.stageWidth / 2 - 50; // Deze moet onder Confirm Button komen
			_Back.y = stage.stageHeight / 2 + 120;
			
			//Ship art
			_Level1.x = stage.stageWidth / 2 - 90;
			_Level1.y = stage.stageHeight / 2 - 120;
			_Level2.x = -150;
			_Level2.y = -150;
			_Level3.x = -150;
			_Level3.y = -150;
			
			// Pointer(s) art
			_PointerArt.x = 330;						// 100 px links van _Prev
			_PointerArt.y = stage.stageHeight / 2 -40;	// net zo hoog als _Prev
		}
		
		private function loop(e:Event):void 		//SINGLEPLAYER SELECTION LOOP
		{
			if (_Selection == 1)
			{
				_PointerArt.x = 330;							//Zet de pointer op de juiste plaats
				_PointerArt.y = stage.stageHeight / 2 - 40;
				CheckLevels();
			}
			if (_Selection == 2)
			{
				_PointerArt.x = 950 ;
				_PointerArt.y = stage.stageHeight / 2 - 40;
				CheckLevels();
			}
			if (_Selection == 3)
			{
				_PointerArt.x = stage.stageWidth / 2 - 220;
				_PointerArt.y = stage.stageHeight / 2 + 70;
			}
			if (_Selection == 4)
			{
				_PointerArt.x = stage.stageWidth / 2 - 220;
				_PointerArt.y = stage.stageHeight / 2 + 130;
			}
			
			if (_WIsDown == true)
			{
				if (_Selection >= 4)
				{
					_Selection--;
				}
				else if (_Selection <= 1)
				{
					_Selection = 4;
				}
				else if (_Selection <= 3 || 3)
				{
					_Selection--;
				}
			}
			
			if (_SIsDown == true)
			{
				if (_Selection <= 4)
				{
					_Selection++;
				}
				else if (_Selection >= 4)
				{
					_Selection = 1;
				}
			}
			if (_SpaceIsDown == true)
			{
				if (_Selection == 1)	// PREVIOUS BUTTON
				{
					_LevelSelection--;
				}
				if (_Selection == 2)	// NEXT BUTTON
				{
					_LevelSelection++;
				}
				if (_Selection == 3)	// CONFIRM BUTTON
				{
				//	trace(_GM._SelectedShip + " BEFORE (LEVELSELECT)"); //traced 1
					// Confirm current level
					WhatLevel();		// Deze zet _selectedLevel op 1,2 of 3. Deze moet bij de levels weer opgevraagd worden.
				//	trace(_GM._SelectedShip + " AFTER (LEVELSELECT)");	//traced 1
					if (_SelectedLevel == 1)
					{
						removeChild(_PointerArt);
						stage.removeEventListener(KeyboardEvent.KEY_DOWN, checkButtonDown);
						stage.removeEventListener(KeyboardEvent.KEY_UP, checkButtonUp);
						removeEventListener(Event.ENTER_FRAME, loop);
						dispatchEvent(new Event("RemoveLevelSelect"));
						dispatchEvent(new Event("SpawnLevel_1"));
					}
					if (_SelectedLevel == 2)
					{
						removeChild(_PointerArt);
						stage.removeEventListener(KeyboardEvent.KEY_DOWN, checkButtonDown);
						stage.removeEventListener(KeyboardEvent.KEY_UP, checkButtonUp);
						removeEventListener(Event.ENTER_FRAME, loop);
						dispatchEvent(new Event("RemoveLevelSelect"));
						dispatchEvent(new Event("SpawnLevel_2"));
					}
					if (_SelectedLevel == 3)
					{
						removeChild(_PointerArt);
						removeEventListener(Event.ENTER_FRAME, loop);
						dispatchEvent(new Event("RemoveLevelSelect"));
						dispatchEvent(new Event("SpawnLevel_3"));
					}
				}
				if (_Selection == 4)	// BACK BUTTON
				{
					if (_ShipSelect._Singleplayer == true)
					{
						_Selection = 0;
						_LevelSelection = 0;
						removeChild(_PointerArt);
						removeEventListener(Event.ENTER_FRAME, loop);
						dispatchEvent(new Event("RemoveLevelSelect"));
						dispatchEvent(new Event("SpawnLevelSelect"));
					}
					else if (_MPShipSelect._Multiplayer == true)
					{
						_Selection = 0;
						_LevelSelection = 0;
						removeChild(_PointerArt);
						removeEventListener(Event.ENTER_FRAME, loop);
						dispatchEvent(new Event("RemoveLevelSelect"));
						dispatchEvent(new Event("SpawnMPLevelSelect"));
					}
				}
			}
		}
		
		private function CheckLevels():void
		{
			if (_LevelSelection == 1)		// RED
			{
				if (_Level2)
				{
					_Level2.x = -150;
					_Level2.y = -150;
					_Level1.x = stage.stageWidth / 2 -90;
					_Level1.y = stage.stageHeight / 2 - 120;
				}
				if (_Level3)
				{
					_Level3.x = -150;
					_Level3.y = -150;
					_Level1.x = stage.stageWidth / 2 -90;
					_Level1.y = stage.stageHeight / 2 - 120;
				}
			}
			
			if (_LevelSelection == 2)		// BLUE
			{
				if (_Level1)
				{
					_Level1.x = -150;
					_Level1.y = -150;
					_Level2.x = stage.stageWidth / 2 -90;
					_Level2.y = stage.stageHeight / 2 - 120;
				}
				if (_Level3)
				{
					_Level3.x = -150;
					_Level3.y = -150;
					_Level2.x = stage.stageWidth / 2 - 90;
					_Level2.y = stage.stageHeight / 2 -120;
				}
			}
			if (_LevelSelection == 3)		// GREEN
			{
				if (_Level2)
				{
					_Level2.x = -150;
					_Level2.y = -150;
					_Level3.x = stage.stageWidth / 2 - 90;
					_Level3.y = stage.stageHeight / 2 -120;
				}
				if (_Level1)
				{
					_Level1.x = -150;
					_Level1.y = -150;
					_Level3.x = stage.stageWidth / 2 - 90;
					_Level3.y = stage.stageHeight / 2 -120;
				}
			}
			if (_LevelSelection >= 4)
			{
				_LevelSelection = 1;
			}
			if (_LevelSelection <= 0)
			{
				_LevelSelection = 3;
			}
		}
		private function WhatLevel():void
		{
			if (_Level1.x == stage.stageWidth / 2 - 90)
			{
				_SelectedLevel = 1;
			}
			if (_Level2.x == stage.stageWidth / 2 - 90)
			{
				_SelectedLevel = 2;
			}
			if (_Level3.x == stage.stageWidth / 2 - 90)
			{
				_SelectedLevel = 3;
			}
		}	
	}
}