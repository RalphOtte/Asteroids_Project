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
	public class MPShipSelect extends Sprite
	{
		private var _Main:Main;
		
		private var _NavigationInstruction:TextField;
		private var _NavigationInstruction2:TextField;
		
		private var _OneSelection:int = 1;		//Dit is de Multiplayer Player 1 selection integer(Menu navigatie)
		private var _TwoSelection:int = 1;		//Dit is de Multiplayer Player 2 selection integer(Menu navigatie)
		private var _ShipSelectionMP1:int = 1;	//Dit is de integer die reguleert welk ship geselecteerd is voor player 1.(Ship navigatie)
		private var _ShipSelectionMP2:int = 1;	//Dit is de integer die reguleert welk ship geselecteerd is voor player 2.(Ship navigatie)
		private var _SelectedShipP1:int = 0;	//Dit is de integer die reguleert welk ship voor P1 naar het level "meegenomen" wordt.(Zodra deze verandert, de pointer weghalen zodat player 1 niks meer kan veranderen)
		private var _SelectedShipP2:int = 0;	//Dit is de integer die reguleert welk ship voor P2 naar het level "meegenomen" wordt.(Zodra deze verandert, de pointer weghalen zodat player 2 niks meer kan veranderen)
		
		private var _P1Chosen:Boolean = false;
		private var _P2Chosen:Boolean = false;
		private var _P1Exit:Boolean = false;
		private var _P2Exit:Boolean = false;
		
		private var _WIsDown:Boolean = false;
		private var _SIsDown:Boolean = false;
		private var _SpaceIsDown:Boolean = false;
		
		private var _UpIsDown:Boolean = false;
		private var _DownIsDown:Boolean = false;
		private var _EnterIsDown:Boolean = false;
		
		public var _Multiplayer:Boolean = false;
		
		// Singleplayer & Multiplayer P1 Ship set
		[Embed(source="../Assets/Game/PlayerShips/Schip_rood.png")]
		private var _Ship1:Class;
		private var _PlayerShipRed:Bitmap;
		[Embed(source="../Assets/Game/PlayerShips/Schip_blauw.png")]
		private var _Ship2:Class;
		private var _PlayerShipBlue:Bitmap;
		[Embed(source="../Assets/Game/PlayerShips/Schip_groen.png")]
		private var _Ship3:Class;
		private var _PlayerShipGreen:Bitmap;
		// Multiplayer player 2 shipset
		[Embed(source="../Assets/Game/PlayerShips/Schip_rood.png")]
		private var _Ship4:Class;
		private var _PlayerShipRed2:Bitmap;
		[Embed(source="../Assets/Game/PlayerShips/Schip_blauw.png")]
		private var _Ship5:Class;
		private var _PlayerShipBlue2:Bitmap;
		[Embed(source="../Assets/Game/PlayerShips/Schip_groen.png")]
		private var _Ship6:Class;
		private var _PlayerShipGreen2:Bitmap;
		//Background
		[Embed(source="../Assets/Menu's/menu_options_astroids.png")]
		private var _BackGround:Class;
		private var _BG:Bitmap;
		//Alle pointers
		[Embed(source = "../Assets/Menu's/Pointer.png")]			// Multiplayer P1 Pointer
		private var _Pointer2:Class;
		private var _PointerArt2:Bitmap;
		[Embed(source = "../Assets/Menu's/Pointer.png")]			// Multiplayer P2 Pointer
		private var _Pointer3:Class;
		private var _PointerArt3:Bitmap;
		//Alle buttons
		[Embed(source="../Assets/Menu's/Pijl_next.png")]
		private var _Previous:Class;								// Het nulpunt van deze art is aan de rechterkant om dat het een omgedraaide Nextbutton is.
		private var _Prev:Bitmap;
		[Embed(source="../Assets/Menu's/Pijl_next.png")]
		private var _Previous2:Class;
		private var _Prev2:Bitmap;
		[Embed(source="../Assets/Menu's/Pijl_next.png")]
		private var _NextShip:Class;
		private var _Next:Bitmap;
		[Embed(source="../Assets/Menu's/Pijl_next.png")]
		private var _NextShip2:Class;
		private var _Next2:Bitmap;	
		[Embed(source="../Assets/Menu's/SelectButton.png")]
		private var _ConfirmChoice:Class;
		private var _Confirm:Bitmap;
		[Embed(source="../Assets/Menu's/SelectButton.png")]
		private var _ConfirmChoice2:Class;
		private var _Confirm2:Bitmap;
		[Embed(source="../Assets/Menu's/BackButton.png")]
		private var _BackSelect:Class;
		private var _Back:Bitmap;	
		[Embed(source = "../Assets/Menu's/P1HasSelected.png")]
		private var _P1HasSelected:Class;
		private var _P1Selected:Bitmap;
		[Embed(source = "../Assets/Menu's/P2HasSelected.png")]
		private var _P2HasSelected:Class;
		private var _P2Selected:Bitmap;
		
		
		public function MPShipSelect() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);	
		}
		
		private function init(e:Event):void 
		{
			addEventListener(Event.ENTER_FRAME, loop2);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, checkButtonDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, checkButtonUp);
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, MultiMode);
		}
		
		private function MultiMode(e:Event):void 
		{
			dispatchEvent(new Event("MultiMode"));
		}
		
		public function reSpawn(e):void
		{
			this.init(e);
			_ShipSelectionMP1 = 1;
			_ShipSelectionMP2 = 1;
			_SelectedShipP1 = 0;
			_SelectedShipP2 = 0;
			_OneSelection = 1;
			_TwoSelection = 1;
			_P1Chosen = false;
			_P2Chosen = false;
			_P1Exit = false;
			_P2Exit = false;
		}
		
		private function checkButtonUp(e:KeyboardEvent):void 
		{
			trace("checkbuttonUp (SHIPSELECT)");
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
			if (e.keyCode == 38)
			{
				_UpIsDown = false;
			}
			if (e.keyCode == 40)
			{
				_DownIsDown = false;
			}
			if (e.keyCode == 13)
			{
				_EnterIsDown = false;
			}
		}
		
		private function checkButtonDown(e:KeyboardEvent):void 
		{
			trace("checkbuttonDown (SHIPSELECT)");
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
			if (e.keyCode == 38)
			{
				_UpIsDown = true;
			}
			if (e.keyCode == 40)
			{
				_DownIsDown = true;
			}
			if (e.keyCode == 13)
			{
				_EnterIsDown = true;
			}
		}
		
		// ALLE MULTIPLAYER DINGEN
		public function TwoPlayerShipSelect():void
		{
			_BG = new _BackGround();
			addChild(_BG);
		
			//Player 1 art
			_Prev = new _Previous();
			addChild(_Prev);
			_Prev.scaleX = -1;			// Scale inverted
			_Next = new _NextShip();
			addChild(_Next);
			_Confirm = new _ConfirmChoice();
			addChild(_Confirm);
			_Back = new _BackSelect();
			addChild(_Back);
			
			//Player 2 art
			_Prev2 = new _Previous2();
			addChild(_Prev2);
			_Prev2.scaleX = -1;
			_Next2 = new _NextShip2();
			addChild(_Next2);
			_Confirm2 = new _ConfirmChoice2();
			addChild(_Confirm2);
			_PointerArt2 = new _Pointer2;
			addChild(_PointerArt2);
			_PointerArt3 = new _Pointer3;
			addChild(_PointerArt3);
			
			//Player 1 ships
			_PlayerShipRed = new _Ship1();
			addChild(_PlayerShipRed);
			_PlayerShipBlue = new _Ship2();
			addChild(_PlayerShipBlue);
			_PlayerShipGreen = new _Ship3();
			addChild(_PlayerShipGreen);
	
			//player 2 ships
			_PlayerShipRed2 = new _Ship4();
			addChild(_PlayerShipRed2);
			_PlayerShipBlue2 = new _Ship5();
			addChild(_PlayerShipBlue2);
			_PlayerShipGreen2 = new _Ship6();
			addChild(_PlayerShipGreen2);
			
			_P1Selected = new _P1HasSelected();
			_P2Selected = new _P2HasSelected();
			
			//Player 1 instructions
			_NavigationInstruction = new TextField();
			_NavigationInstruction.textColor = 0xFFFFFF;	 // Wit
			_NavigationInstruction.width = 540;				 // Dit is de "available" aantal pixels waarop de text wordt laten zien
			_NavigationInstruction.height = 20;
			_NavigationInstruction.scaleX = 1.5;			 	
			_NavigationInstruction.scaleY = 1.5;
			_NavigationInstruction.x = 650;
			_NavigationInstruction.y = 0;
			_NavigationInstruction.text = "For player 1: Use W/S to navigate, use SPACE to confirm selection.";
			addChild(_NavigationInstruction);
			
			//Player 2  instructions
			_NavigationInstruction2 = new TextField();
			_NavigationInstruction2.textColor = 0xFFFFFF;	 		// Wit
			_NavigationInstruction2.width = 540;				 	// Dit is de "available" aantal pixels waarop de text wordt laten zien
			_NavigationInstruction2.height = 20;
			_NavigationInstruction2.scaleX = 1.5;			 	
			_NavigationInstruction2.scaleY = 1.5;
			_NavigationInstruction2.x = 650;
			_NavigationInstruction2.y = 20;
			_NavigationInstruction2.text = "For player 2: Use Up/Down Arrow to navigate, Use ENTER to confirm Selection";
			addChild(_NavigationInstruction2);
			
			
			//Player 1 buttons art
			_Prev.x = 200;
			_Prev.y = stage.stageHeight / 2 - 50;
			_Next.x = 530;
			_Next.y = stage.stageHeight / 2 - 50;
			_Confirm.x = 250;
			_Confirm.y = stage.stageHeight / 2 + 70;
			//Player 2 buttons art
			_Prev2.x = 750;
			_Prev2.y = stage.stageHeight / 2 - 50;
			_Next2.x = 1080;
			_Next2.y = stage.stageHeight / 2 - 50;
			_Confirm2.x = 800;
			_Confirm2.y = stage.stageHeight / 2 + 70;	
			
			// Global back button art
			_Back.x = 600;
			_Back.y = stage.stageHeight / 2 + 120;
			
			//Player 1 Ship set location
			_PlayerShipRed.x = 270;
			_PlayerShipRed.y = stage.stageHeight / 2 - 120;
			_PlayerShipBlue.x = -150;
			_PlayerShipBlue.y = -150;
			_PlayerShipGreen.x = -150;
			_PlayerShipGreen.y = -150;
			//Player 2 Ship set location
			_PlayerShipRed2.x = 830;
			_PlayerShipRed2.y = stage.stageHeight / 2 - 120;
			_PlayerShipBlue2.x = -150;
			_PlayerShipBlue2.y = -150;
			_PlayerShipGreen2.x = -150;
			_PlayerShipGreen2.y = -150;
			
			// Pointer(s) art
			_PointerArt2.x = 100;
			_PointerArt2.y = stage.stageHeight /2 -40;
			_PointerArt3.x = 650;
			_PointerArt3.y = stage.stageHeight / 2 -40;
			_PointerArt3.scaleX = -1;
			
		}
		
		// ALLE 2 PLAYER DINGEN
		private function loop2(e:Event):void 		//MULTIPLAYER SELECTION LOOP
		{
			
			//Player 1
			if (_OneSelection == 1)
			{
				_PointerArt2.x = 110;
				_PointerArt2.y = stage.stageHeight / 2 - 40;
				CheckShips1();
			}
			if (_OneSelection == 2)
			{
				_PointerArt2.x = 600 ;
				_PointerArt2.y = stage.stageHeight / 2 - 40;
				CheckShips1();
			}
			if (_OneSelection == 3)
			{
				_PointerArt2.x = 200;
				_PointerArt2.y = stage.stageHeight / 2 + 75;
			}
			if (_OneSelection == 4)
			{
				_PointerArt2.x = 550;
				_PointerArt2.y = stage.stageHeight / 2 + 130;
			}
			
			if (_WIsDown == true)
			{
				if (_OneSelection >= 4)
				{
					_OneSelection--;
				}
				else if (_OneSelection <= 1)
				{
					_OneSelection = 4;
				}
				else if (_OneSelection <= 3 || 3)
				{
					_OneSelection--;
				}
			}
			
			if (_SIsDown == true)
			{
				if (_OneSelection <= 4)
				{
					_OneSelection++;
				}
				else if (_OneSelection >= 4)
				{
					_OneSelection = 1;
				}
			}
			
			if (_SpaceIsDown == true)
			{
				if (_OneSelection == 1)	// PREVIOUS BUTTON
				{
					if (_ShipSelectionMP1 <= 0)
					{
						_ShipSelectionMP1 = 3;
					}
					else 
					{
						_ShipSelectionMP1--;
					}
				}
				if (_OneSelection == 2)	// NEXT BUTTON
				{
					if (_ShipSelectionMP1 >= 4)
					{
						_ShipSelectionMP1 = 1;
					}
					else 
					{
						_ShipSelectionMP1++;
					}
				}
				if (_OneSelection == 3)	// CONFIRM BUTTON
				{
					WhatShip1();
					addChild(_P1Selected);
					_P1Selected.x = 250;
					_P1Selected.y = stage.stageHeight /2 + 120;
				}
				if (_OneSelection >= 4)	// BACK BUTTON(Back to Menu)
				{
					_P1Exit = true;
				}
			}
			
			//PLAYER 2
			if (_TwoSelection == 1)
			{
				_PointerArt3.x = 675;
				_PointerArt3.y = stage.stageHeight / 2 - 40;
				CheckShips2();
			}
			if (_TwoSelection == 2)
			{
				_PointerArt3.x = 1170;
				_PointerArt3.y = stage.stageHeight / 2 - 40;
				CheckShips2();
			}
			if (_TwoSelection == 3)
			{
				_PointerArt3.x = 1065;
				_PointerArt3.y = stage.stageHeight / 2 + 75;
			}
			if (_TwoSelection == 4)
			{
				_PointerArt3.x = 745;
				_PointerArt3.y = stage.stageHeight / 2 + 130;
			}
			
			if (_UpIsDown == true)
			{
				if (_TwoSelection >= 4)
				{
					_TwoSelection--;
				}
				else if (_TwoSelection <= 1)
				{
					_TwoSelection = 4;
				}
				else if (_TwoSelection <= 3 || 3)
				{
					_TwoSelection--;
				}
			}
			
			if (_DownIsDown == true)
			{
				if (_TwoSelection <= 4)
				{
					_TwoSelection++;
				}
				else if (_TwoSelection >= 4)
				{
					_TwoSelection = 1;
				}
			}
			if (_EnterIsDown == true)
			{
				if (_TwoSelection == 1)	// PREVIOUS BUTTON
				{
					if (_ShipSelectionMP2 <= 0)
					{
						_ShipSelectionMP2 = 3;
					}
					else
					{
						_ShipSelectionMP2--;
					}
				}
				if (_TwoSelection == 2)	// NEXT BUTTON
				{
					if (_ShipSelectionMP2 >= 4)
					{
						_ShipSelectionMP2 = 1;
					}
					else
					{
						_ShipSelectionMP2++;
					}
				}
				if (_TwoSelection == 3)	// CONFIRM BUTTON
				{
					WhatShip2();
					addChild(_P2Selected);
					_P2Selected.x = 800;
					_P2Selected.y = stage.stageHeight / 2 + 120;
				}
				if (_TwoSelection >= 4)	// BACK BUTTON(Back to Menu)
				{
					_P2Exit = true;
				}
			}
				
			if ( _P1Chosen == true && _P2Chosen == true)
			{
				_Multiplayer = true;
				dispatchEvent(new Event("SpawnLevelSelect"));
				removeChild(_PointerArt2);
				removeChild(_PointerArt3);
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, checkButtonDown);
				stage.removeEventListener(KeyboardEvent.KEY_UP, checkButtonUp);
				removeEventListener(Event.ENTER_FRAME, loop2);
				dispatchEvent(new Event("RemoveShipSelect2"));
			}
			if (_P1Exit && _P2Exit == true)
			{
				dispatchEvent(new Event("SpawnMenu"));
				removeChild(_PointerArt2);
				removeChild(_PointerArt3);
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, checkButtonDown);
				stage.removeEventListener(KeyboardEvent.KEY_UP, checkButtonUp);
				removeEventListener(Event.ENTER_FRAME, loop2);
				dispatchEvent(new Event("RemoveShipSelect2"));
			}
			
		}
		private function CheckShips1():void
		{
			if (_ShipSelectionMP1 == 1)		// RED
			{
				if (_PlayerShipBlue)
				{
					_PlayerShipBlue.x = -150;
					_PlayerShipBlue.y = -150;
					_PlayerShipRed.x = 270;
					_PlayerShipRed.y = stage.stageHeight / 2 - 120;
				}
				if (_PlayerShipGreen)
				{
					_PlayerShipGreen.x = -150;
					_PlayerShipGreen.y = -150;
					_PlayerShipRed.x = 270;
					_PlayerShipRed.y = stage.stageHeight / 2 - 120;
				}
			}
			
			if (_ShipSelectionMP1 == 2)		// BLUE
			{
				if (_PlayerShipRed)
				{
					_PlayerShipRed.x = -150;
					_PlayerShipRed.y = -150;
					_PlayerShipBlue.x = 270;
					_PlayerShipBlue.y = stage.stageHeight / 2 - 120;
				}
				if (_PlayerShipGreen)
				{
					_PlayerShipGreen.x = -150;
					_PlayerShipGreen.y = -150;
					_PlayerShipBlue.x = 270;
					_PlayerShipBlue.y = stage.stageHeight / 2 -120;
				}
			}
			if (_ShipSelectionMP1 == 3)		// GREEN
			{
				if (_PlayerShipBlue)
				{
					_PlayerShipBlue.x = -150;
					_PlayerShipBlue.y = -150;
					_PlayerShipGreen.x = 270;
					_PlayerShipGreen.y = stage.stageHeight / 2 -120;
				}
				if (_PlayerShipRed)
				{
					_PlayerShipRed.x = -150;
					_PlayerShipRed.y = -150;
					_PlayerShipGreen.x = 270;
					_PlayerShipGreen.y = stage.stageHeight / 2 -120;
				}
			}
		}
		private function CheckShips2():void
		{
			if (_ShipSelectionMP2 == 1)		// RED
			{
				if (_PlayerShipBlue2)
				{
					_PlayerShipBlue2.x = -150;
					_PlayerShipBlue2.y = -150;
					_PlayerShipRed2.x = 830;
					_PlayerShipRed2.y = stage.stageHeight / 2 - 120;
				}
				if (_PlayerShipGreen2)
				{
					_PlayerShipGreen2.x = -150;
					_PlayerShipGreen2.y = -150;
					_PlayerShipRed2.x = 830;
					_PlayerShipRed2.y = stage.stageHeight / 2 - 120;
				}
			}
			
			if (_ShipSelectionMP2 == 2)		// BLUE
			{
				if (_PlayerShipRed2)
				{
					_PlayerShipRed2.x = -150;
					_PlayerShipRed2.y = -150;
					_PlayerShipBlue2.x = 830;
					_PlayerShipBlue2.y = stage.stageHeight / 2 - 120;
				}
				if (_PlayerShipGreen2)
				{
					_PlayerShipGreen2.x = -150;
					_PlayerShipGreen2.y = -150;
					_PlayerShipBlue2.x = 830;
					_PlayerShipBlue2.y = stage.stageHeight / 2 -120;
				}
			}
			if (_ShipSelectionMP2 == 3)		// GREEN
			{
				if (_PlayerShipBlue2)
				{
					_PlayerShipBlue2.x = -150;
					_PlayerShipBlue2.y = -150;
					_PlayerShipGreen2.x = 830;
					_PlayerShipGreen2.y = stage.stageHeight / 2 -120;
				}
				if (_PlayerShipRed2)
				{
					_PlayerShipRed2.x = -150;
					_PlayerShipRed2.y = -150;
					_PlayerShipGreen2.x = 830;
					_PlayerShipGreen2.y = stage.stageHeight / 2 -120;
				}
			}
		}
		private function WhatShip1():void
		{
			if (_PlayerShipRed.x == 270)
			{
				_SelectedShipP1 = 1;
				_P1Chosen = true;
			}
			if (_PlayerShipBlue.x == 270)
			{
				_SelectedShipP1 = 2;
				_P1Chosen = true;
			}
			if (_PlayerShipGreen.x == 270)
			{
				_SelectedShipP1 = 3;
				_P1Chosen = true;
			}
		}
		private function WhatShip2():void
		{
			if (_PlayerShipRed2.x == 830)
			{
				_SelectedShipP2 = 1;
				_P2Chosen = true;
			}
			if (_PlayerShipBlue.x == 830)
			{
				_SelectedShipP2 = 2;
				_P2Chosen = true;
			}
			if (_PlayerShipGreen.x == 830)
			{
				_SelectedShipP2 = 3;
				_P2Chosen = true;
			}
		}
	}
}