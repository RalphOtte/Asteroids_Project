package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class ShipSelect extends Sprite
	{
		private var _Menu:Menu;
		
		
		[Embed(source="../Assets/Game/PlayerShips/Schip_rood.png")]
		private var _PlayerShipRed:Class;
		private var _Ship1:Bitmap;
		[Embed(source="../Assets/Game/PlayerShips/Schip_blauw.png")]
		private var _PlayerShipBlue:Class;
		private var _Ship2:Bitmap;
		[Embed(source="../Assets/Game/PlayerShips/Schip_groen.png")]
		private var _PlayershipGreen:Class;
		private var _Ship3:Bitmap;
		[Embed(source="../Assets/Menu's/menu_astroids.png")]
		private var _Back:Class;
		private var _BG:Bitmap;
		// Single button is nu de previous button
		[Embed(source="../Assets/Menu's/Pijl_next.png")]
		private var _Previous:Class;
		private var _Prev:Bitmap;
		// Singlebutton is nu de 2e previous button
		[Embed(source="../Assets/Menu's/Pijl_next.png")]
		private var _Previous2:Class;
		private var _Prev2:Bitmap;
		// Multibutton is nu de next button
		[Embed(source="../Assets/Menu's/Pijl_next.png")]
		private var _NextShip:Class;
		private var _Next:Bitmap;
		// Multibutton is nu de 2e next button
		[Embed(source="../Assets/Menu's/Pijl_next.png")]
		private var _NextShip2:Class;
		private var _Next2:Bitmap;	
		// Options button is nu de Confirm button
		[Embed(source="../Assets/Menu's/SelectButton.png")]
		private var _ConfirmChoice:Class;
		private var _Confirm:Bitmap;
		// Options button is nu de 2e Confirm button
		[Embed(source="../Assets/Menu's/SelectButton.png")]
		private var _ConfirmChoice2:Class;
		private var _Confirm2:Bitmap;
		// Exit button is nu de Back button
		[Embed(source="../Assets/Menu's/BackButton.png")]
		private var _ExitSelect:Class;
		private var _Exit:Bitmap;
		
		private var _selection:int = 1;			//Dit is de Singleplayer selection integer
		private var _OneSelection:int = 1;		//Dit is de Multiplayer Player 1 selection integer
		private var _TwoSelection:int = 1;		//Dit is de Multiplayer Player 2 selection integer
		
		public function ShipSelect() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);	
		}
		
		private function init(e:Event):void 
		{
			if (_Menu._OnePlayer == true)
			{
				OnePlayerShipSelect();
				
				_BG = new _Back();
				addChild(_BG);
				_Prev = new _Previous();
				addChild(_Prev);
				_Next = new _NextShip();
				addChild(_Next);
				_Confirm = new _ConfirmChoice();
				addChild(_Confirm);
				_Exit = new _ExitSelect();
				addChild(_Exit);
				
				_Prev.x = 400;
				_Prev.y = stage.stageHeight / 2; 	// TUSSEN DE 700 PX die hier tussen staat komt een plaatje van een schip(degene die gekozen is, afhankelijk van de _selection integer
				_Next.x = 700;
				_Next.y = stage.stageHeight / 2;
				_Confirm.x = 550;	//Deze moet op het midden onder het schip komen
				_Confirm.x = stage.stageHeight / 2 + 100;
				_Exit.x = 550; // Deze moet onder Confirm Button komen
				_Exit.y = stage.stageHeight / 2 + 170;
			
			}
			else if (_Menu._TwoPlayer == true)
			{
				TwoPlayerShipSelect();
			
			/*	_BG = new _Back();
				addChild(_BG);
				_Prev = new _Previous();
				addChild(_Prev);
				_Prev.scaleX = -1;		// Scale inverted
				_Next = new _NextShip();
				addChild(_Next);
				_Confirm = new _ConfirmChoice();
				addChild(_Confirm);
				_Exit = new _ExitSelect();
				addChild(_Exit);
				
				//Player 2 Buttons
				_Prev2 - new _Previous2();
				addChild(_Prev2);
				_Next2 = new _NextShip2();
				addChild(_Next2);
				_Confirm2 = new ConfirmChoice();
				addChild(Confirm2);
				
				
				_Prev.x = 400;
				_Prev.y = stage.stageHeight / 2; 	// TUSSEN DE 700 PX die hier tussen staat komt een plaatje van een schip(degene die gekozen is, afhankelijk van de _selection integer
				_Next.x = 700;
				_Next.y = stage.stageHeight / 2;
				_Confirm.x = 550;	//Deze moet op het midden onder het schip komen
				_Confirm.x = stage.stageHeight / 2 + 100;
				_Exit.x = 550; // Deze moet onder Confirm Button komen
				_Exit.y = stage.stageHeight / 2 + 170;
				*/
			}
			removeEventListener(Event.ADDED_TO_STAGE, init);			
		}
		
		public function OnePlayerShipSelect():void
		{
			trace("One Player Ship Select  (SHIPSELECT)");
			
			
			if (_selection == 1)
			{
				removeChild(_Ship2);
				removeChild(_Ship3);
				addChild(_Ship1);
			}
			if (_selection == 2)
			{
				removeChild(_Ship1);
				removeChild(_Ship3);
				addChild(_Ship2);
			}
			if (_selection == 3)
			{
				removeChild(_Ship2);
				removeChild(_Ship1);
				addChild(_Ship3);
			}
			if (_selection == 4)
			{
				_selection = 1;
			}
			
		}
		public function TwoPlayerShipSelect():void
		{
			trace("Two Player Ship Select  (SHIPSELECT)");
		/*
			
			if (_Oneselection == 1)
			{
				removeChild(_Ship2);
				removeChild(_Ship3);
				addChild(_Ship1);
			}
			if (_Oneselection == 2)
			{
				removeChild(_Ship1);
				removeChild(_Ship3);
				addChild(_Ship2);
			}
			if (_Oneselection == 3)
			{
				removeChild(_Ship2);
				removeChild(_Ship1);
				addChild(_Ship3);
			}
			if (_Oneselection == 4)
			{
				_Oneselection = 1;
			}
			if (_Twoselection == 1)
			{
				removeChild(_Ship2);
				removeChild(_Ship3);
				addChild(_Ship1);
			}
			if (_Twoselection == 2)
			{
				removeChild(_Ship1);
				removeChild(_Ship3);
				addChild(_Ship2);
			}
			if (_Twoselection == 3)
			{
				removeChild(_Ship2);
				removeChild(_Ship1);
				addChild(_Ship3);
			}
			if (_Twoselection == 4)
			{
				_Twoselection = 1;
			}
			*/
		}
	}
}