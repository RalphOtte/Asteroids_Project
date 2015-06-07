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
		public var _AsteroidsHealth:int = 10;
		
		[Embed(source="../Assets/Game/Obstacles/Asteroide_3.png")] // big piece
		private var _astr:Class;
		private var _asteroid:Bitmap;
		
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
			spawnSkin();
		}
		private function spawnSkin():void
		{
			_asteroid = new _astr();
			addChild(_asteroid);
			_asteroid.x -= (204 / 2);
			_asteroid.y -= (200 / 2);
		}
		
		private function rotating(e:Event):void
		{
			if ((_rotate == 0) || (_rotate <= 0))
			{
				
				_rotate = Math.random() * 4;
				trace(_rotate + " Asteroid rotation");
				if ((_rotate == 0) || (_rotate <= 0))
				{
					_rotate = Math.random() * 4;
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