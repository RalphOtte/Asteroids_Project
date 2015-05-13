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
	public class Level_1 extends Sprite
	{
		//variables
		private var _Background:Background = new Background;
		private var _ShipSelect:ShipSelect;
		private var _MPShipSelect:MPShipSelect;
		
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
			
			Tile1(e);
		}
		
		private function loop(e:Event):void 
		{
			//Tile 1
			_Curtain3.alpha -= 0.02;
			
			//Tile 2 
		}
		
		private function Tile1(e:Event):void
		{
			addChild(_Background);
		//	addChild(_Curtain1);
		//	addChild(_Curtain2);
			addChild(_Curtain3);
			addEventListener(Event.ENTER_FRAME, loop);
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