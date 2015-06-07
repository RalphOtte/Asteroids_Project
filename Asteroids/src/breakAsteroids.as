package  
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class breakAsteroids extends Sprite
	{
		private var _rotate:int = 0;
		private var _asteroidType:int = 1;
		
		[Embed(source="../Assets/Game/Obstacles/Asteroide_3.png")] // big piece
		private var _astr:Class;
		private var _asteroid:Bitmap;
		[Embed(source="../Assets/Game/Obstacles/Asteroide_1.png")] // breakpiece small
		private var _astr2:Class;
		private var _asteroid2:Bitmap;
		[Embed(source="../Assets/Game/Obstacles/Asteroide_2.png")] // breakpiece medium
		private var _astr3:Class;
		private var _asteroid3:Bitmap;
		
		
		public function breakAsteroids() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ADDED_TO_STAGE, rotating);
			addEventListener(Event.ENTER_FRAME, loop);
			loop(e);
		}
		
		private function rotating(e:Event):void
		{
			if ((_rotate == 0) || (_rotate <= 0))
			{
				
				_rotate = Math.random() * 8;
				trace(_rotate + " Asteroid rotation");
				if ((_rotate == 0) || (_rotate <= 0))
				{
					_rotate = Math.random() * 8;
					trace(_rotate + " Asteroid rotation");
				}
			}
		}
		
		private function loop(e:Event):void 
		{
			this.rotation += _rotate;
		}
	}
}