package

{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class Level_3 extends Sprite
	{
		private var _bg:Background = new Background();
		private var _bg1:Background = new Background();
		private var _ShipSelect:ShipSelect;
		private var _MPShipSelect:MPShipSelect;
		private var _Player:Player = new Player;
		private var _BackgroundArray:Array = new Array(Background, Background, Background);
		private var _TileCounter:int;
		
		//Intro op Tile 1
		[Embed(source="../Assets/Game/Miscelaneous/Level_3.png")]
		private var _CurtainUp:Class;
		private var _Curtain1:Bitmap;
		[Embed(source="../Assets/Game/Miscelaneous/Onderkant_gate.png")]
		private var _CurtainDown:Class;
		private var _Curtain2:Bitmap;
		[Embed(source = "../Assets/Menu's/CutsceneCurtain.png")]
		private var _CurtainFade:Class;
		private var _Curtain3:Bitmap;
		
		public function Level_3() 
		{
			//trace("background array is this long:"_BackgroundArray.length);
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_Curtain1 = new _CurtainUp();
			_Curtain2 = new _CurtainDown();
			_Curtain3 = new _CurtainFade();
			
			Tile1(e);
		}
		
		private function loop(e:Event):void
		{
			//hangar doors
			_Curtain1.y -= 3;
			_Curtain2.y += 3;
			_Curtain3.alpha -= 0.004;
			
			//background movement
			
			if (_TileCounter <= 4)
			{
				_bg.x -= 5;
				_bg1.x -= 5;
				if (_bg.x <= -1280)
				{
					_bg.x = 1280;
					_TileCounter++;
					trace("tile " + _TileCounter);
				}
				if (_bg1.x <= -1280)
				{
					_bg1.x = 1280;
					_TileCounter++;
					trace("tile " + _TileCounter);
				}
			}else if (_TileCounter > 2)
			{
				_bg.y -= 5;
				_bg1.y -= 5;
				if (_bg.y <= 0)
				{
					_bg.y = 1440;
					_TileCounter++;
					trace("tile " + _TileCounter);
				}
				if (_bg1.y <= 0)
				{
					_bg1.y - 1440;
					_TileCounter++;
					trace("tile " + _TileCounter);
				}
			}
		}
		
		private function Tile1(e:Event):void
		{
			addChild(_bg);
			addChild(_bg1);
			_bg1.x = 1280;
			addChild(_Player);
			addChild(_Curtain1);
			addChild(_Curtain2);
			addChild(_Curtain3);
			_Curtain1.y = 50;
			_Curtain2.y = stage.stageHeight / 2 + 50;
			_Player.scaleX = 0.5;
			_Player.scaleY = 0.5;
			_Player.x = stage.stageWidth / 5;
			_Player.y = stage.stageHeight / 2;
			addEventListener(Event.ENTER_FRAME, loop);
		}	
	}
}