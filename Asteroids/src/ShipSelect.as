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
		private var _Main:Main;
		
		private var _selection:int = 1;			//Dit is de Singleplayer selection integer
		private var _OneSelection:int = 1;		//Dit is de Multiplayer Player 1 selection integer
		private var _TwoSelection:int = 1;		//Dit is de Multiplayer Player 2 selection integer
		
		[Embed(source="../Assets/Game/PlayerShips/Schip_rood.png")]
		private var _PlayerShipRed:Class;
		private var _Ship1:Bitmap;
		[Embed(source="../Assets/Game/PlayerShips/Schip_blauw.png")]
		private var _PlayerShipBlue:Class;
		private var _Ship2:Bitmap;
		[Embed(source="../Assets/Game/PlayerShips/Schip_groen.png")]
		private var _PlayershipGreen:Class;
		private var _Ship3:Bitmap;
		[Embed(source="../Assets/Menu's/menu_options_astroids.png")]
		private var _BackGround:Class;
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
		[Embed(source="../Assets/Menu's/BackButton.png")]
		private var _BackSelect:Class;
		private var _Back:Bitmap;
		
		
		public function ShipSelect() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);	
		}
		
		private function init(e:Event):void 
		{
			trace("Adding loops (SHIPSELECT)");
		//	addEventListener(Event.ENTER_FRAME, loop);
			addEventListener(Event.ENTER_FRAME, loop2);
			removeEventListener(Event.ADDED_TO_STAGE, init);			
		}
		
		private function loop(e:Event):void 		//SINGLEPLAYER SELECTION LOOP
		{
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
		private function loop2(e:Event):void 		//MULTIPLAYER SELECTION LOOP
		{
		/*	if (_Oneselection == 1)
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
			}*/
		}
		
		public function OnePlayerShipSelect():void
		{
			_BG = new _BackGround();
			addChild(_BG);
			_Prev = new _Previous();
			addChild(_Prev);
			_Next = new _NextShip();
			addChild(_Next);
			_Confirm = new _ConfirmChoice();
			addChild(_Confirm);
			_Back = new _BackSelect();
			addChild(_Back);
			
			_Prev.x = 370;
			_Prev.y = stage.stageHeight / 2 - 50; 	// TUSSEN DE 700 PX die hier tussen staat komt een plaatje van een schip(degene die gekozen is, afhankelijk van de _selection integer
			_Next.x = 830;
			_Next.y = stage.stageHeight / 2 - 50;
			_Confirm.x = stage.stageWidth /2 - 110;	//Deze moet op het midden onder het schip komen
			_Confirm.y = stage.stageHeight / 2 + 70;
			_Back.x = stage.stageWidth / 2 - 50; // Deze moet onder Confirm Button komen
			_Back.y = stage.stageHeight / 2 + 120;
			
		}
		public function TwoPlayerShipSelect():void
		{
			trace("Two Player Ship Select  (SHIPSELECT)");
			
			_BG = new _BackGround();
			addChild(_BG);
			_Prev = new _Previous();
			addChild(_Prev);
			_Prev.scaleX = -1;		// Scale inverted
			_Next = new _NextShip();
			addChild(_Next);
			_Confirm = new _ConfirmChoice();
			addChild(_Confirm);
			_Back = new _BackSelect();
			addChild(_Back);
			
			//Player 2 Buttons
			_Prev2 = new _Previous2();
			addChild(_Prev2);
			_Next2 = new _NextShip2();
			addChild(_Next2);
			_Confirm2 = new _ConfirmChoice2();
			addChild(_Confirm2);
			
			_Prev.x = 400;
			_Prev.y = stage.stageHeight / 2; 	// TUSSEN DE 700 PX die hier tussen staat komt een plaatje van een schip(degene die gekozen is, afhankelijk van de _selection integer
			_Next.x = 700;
			_Next.y = stage.stageHeight / 2;
			_Confirm.x = 550;	//Deze moet op het midden onder het schip komen
			_Confirm.x = stage.stageHeight / 2 + 100;
			_Back.x = 550; // Deze moet onder Confirm Button komen
			_Back.y = stage.stageHeight / 2 + 170;			
		}
	}
}