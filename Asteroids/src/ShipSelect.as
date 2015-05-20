<<<<<<< HEAD
﻿package  
=======
package
>>>>>>> origin/master
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
	public class ShipSelect extends Sprite
	{
		private var _Main:Main;
		private var _GM:GameManager = new GameManager;
		
		private var _NavigationInstruction:TextField;
		
		private var _Selection:int = 1;			//Dit is de Singleplayer selection integer(Menu navigatie)
		private var _ShipSelection:int = 1;		//Dit is de integer die reguleert welk ship geselecteerd is.(Ship navigatie)
		
		private var _WIsDown:Boolean = false;
		private var _SIsDown:Boolean = false;
		private var _SpaceIsDown:Boolean = false;
		
		public var _Singleplayer:Boolean = false;
		
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
		//Background
		[Embed(source="../Assets/Menu's/menu_options_astroids.png")]
		private var _BackGround:Class;
		private var _BG:Bitmap;
		//Alle pointers (Singleplayer & Multiplayer P1/P2)
		[Embed(source = "../Assets/Menu's/Pointer.png")]			// Singleplayer Pointer
		private var _Pointer:Class;
		private var _PointerArt:Bitmap;
		//Alle buttons
		[Embed(source="../Assets/Menu's/Pijl_next.png")]
		private var _Previous:Class;								// Het nulpunt van deze art is aan de rechterkant om dat het een omgedraaide Nextbutton is.
		private var _Prev:Bitmap;
		[Embed(source="../Assets/Menu's/Pijl_next.png")]
		private var _NextShip:Class;
		private var _Next:Bitmap;
		[Embed(source="../Assets/Menu's/SelectButton.png")]
		private var _ConfirmChoice:Class;
		private var _Confirm:Bitmap;
		[Embed(source="../Assets/Menu's/BackButton.png")]
		private var _BackSelect:Class;
		private var _Back:Bitmap;	
		
		public function ShipSelect() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, checkButtonDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, checkButtonUp);
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ADDED_TO_STAGE, SingleMode);
		}
		
		private function SingleMode(e:Event):void 
		{
			dispatchEvent(new Event("SingleMode"));
		}
		
		public function reSpawn(e):void
		{
			this.init(e);
			_Selection = 1;
			_ShipSelection = 1;
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
		
		public function OnePlayerShipSelect():void
		{
			_BG = new _BackGround();
			addChild(_BG);
			_Prev = new _Previous();
			addChild(_Prev);
			_Prev.scaleX = -1;
			_Next = new _NextShip();
			addChild(_Next);
			_Confirm = new _ConfirmChoice();
			addChild(_Confirm);
			_Back = new _BackSelect();
			addChild(_Back);
			_PointerArt = new _Pointer;
			addChild(_PointerArt);
			_PlayerShipRed = new _Ship1();
			addChild(_PlayerShipRed);
			_PlayerShipBlue = new _Ship2();
			addChild(_PlayerShipBlue);
			_PlayerShipGreen = new _Ship3();
			addChild(_PlayerShipGreen);
			
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
			_PlayerShipRed.x = stage.stageWidth / 2 - 90;
			_PlayerShipRed.y = stage.stageHeight / 2 - 120;
			_PlayerShipBlue.x = -150;
			_PlayerShipBlue.y = -150;
			_PlayerShipGreen.x = -150;
			_PlayerShipGreen.y = -150;
			
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
				CheckShips();
			}
			if (_Selection == 2)
			{
				_PointerArt.x = 950 ;
				_PointerArt.y = stage.stageHeight / 2 - 40;
				CheckShips();
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
					_ShipSelection--;
				}
				if (_Selection == 2)	// NEXT BUTTON
				{
					_ShipSelection++;
				}
				if (_Selection == 3)	// CONFIRM BUTTON
				{
					// Confirm current Ship & continue to Levelselect
					trace(_GM._SelectedShip + " GM BEFORE (SHIPSELECT)");		// Traced 1
					_Singleplayer = true;
					WhatShip();
					trace(_GM._SelectedShip + " GM AFTER (SHIPSELECT)");			// Traced gekozen, na deze wordt hij weer op 1 gezet. Het weghalen van deze class heeft geen invloed. Iets in ShipSelect?
					removeChild(_PointerArt);
					stage.removeEventListener(KeyboardEvent.KEY_DOWN, checkButtonDown);
					stage.removeEventListener(KeyboardEvent.KEY_UP, checkButtonUp);
					removeEventListener(Event.ENTER_FRAME, loop);
					dispatchEvent(new Event("SpawnLevelSelect"));
					dispatchEvent(new Event("RemoveShipSelect"));
				}
				if (_Selection == 4)	// BACK BUTTON(Back to Menu)
				{
					_Selection = 1;
					_ShipSelection = 0;
					removeChild(_PointerArt);
					removeEventListener(Event.ENTER_FRAME, loop);
					dispatchEvent(new Event("RemoveShipSelect"));
					dispatchEvent(new Event("SpawnMenu"));
				}
			}
		}
		
		private function CheckShips():void
		{
			if (_ShipSelection == 1)		// RED
			{
				if (_PlayerShipBlue)
				{
					_PlayerShipBlue.x = -150;
					_PlayerShipBlue.y = -150;
					_PlayerShipRed.x = stage.stageWidth / 2 -90;
					_PlayerShipRed.y = stage.stageHeight / 2 - 120;
				}
				if (_PlayerShipGreen)
				{
					_PlayerShipGreen.x = -150;
					_PlayerShipGreen.y = -150;
					_PlayerShipRed.x = stage.stageWidth / 2 -90;
					_PlayerShipRed.y = stage.stageHeight / 2 - 120;
				}
			}
			
			if (_ShipSelection == 2)		// BLUE
			{
				if (_PlayerShipRed)
				{
					_PlayerShipRed.x = -150;
					_PlayerShipRed.y = -150;
					_PlayerShipBlue.x = stage.stageWidth / 2 -90;
					_PlayerShipBlue.y = stage.stageHeight / 2 - 120;
				}
				if (_PlayerShipGreen)
				{
					_PlayerShipGreen.x = -150;
					_PlayerShipGreen.y = -150;
					_PlayerShipBlue.x = stage.stageWidth / 2 - 90;
					_PlayerShipBlue.y = stage.stageHeight / 2 -120;
				}
			}
			if (_ShipSelection == 3)		// GREEN
			{
				if (_PlayerShipBlue)
				{
					_PlayerShipBlue.x = -150;
					_PlayerShipBlue.y = -150;
					_PlayerShipGreen.x = stage.stageWidth / 2 - 90;
					_PlayerShipGreen.y = stage.stageHeight / 2 -120;
				}
				if (_PlayerShipRed)
				{
					_PlayerShipRed.x = -150;
					_PlayerShipRed.y = -150;
					_PlayerShipGreen.x = stage.stageWidth / 2 - 90;
					_PlayerShipGreen.y = stage.stageHeight / 2 -120;
				}
			}
			if (_ShipSelection >= 4)
			{
				_ShipSelection = 1;
			}
			if (_ShipSelection <= 0)
			{
				_ShipSelection = 3;
			}
		}
		private function WhatShip():void
		{
			if (_ShipSelection == 1)
			{
				_GM.P1_1();
				dispatchEvent(new Event("Skin_1"));
				trace(_GM._SelectedShip + " GM 1 (SHIPSELECT)");
			}
			else if (_ShipSelection == 2)
			{
				_GM.P1_2();
				dispatchEvent(new Event("Skin_2"));
				trace(_GM._SelectedShip + " GM 2 (SHIPSELECT)");
			}
			else if (_ShipSelection == 3)
			{
				_GM.P1_3();
				dispatchEvent(new Event("Skin_3"));
				trace(_GM._SelectedShip + " GM 3 (SHIPSELECT)");
			}
		}
	}
}