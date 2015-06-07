package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	
	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class BreakAsteroidPiece extends Sprite
	{
		private var _rotate:int = 0;
		private var _asteroidType:int = 1;
		private var randomizeAsteroid:int = 0;
		
		[Embed(source="../Assets/Game/Obstacles/Asteroide_1.png")]
		private var _astr:Class;
		private var _asteroid:Bitmap;
		[Embed(source="../Assets/Game/Obstacles/Asteroide_2.png")]
		private var _astr2:Class;
		private var _asteroid2:Bitmap;
		
		public function BreakAsteroidPiece() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ADDED_TO_STAGE, rotating);
			addEventListener(Event.ADDED_TO_STAGE, randomizeAsteroids);
			addEventListener(Event.ENTER_FRAME, loop);
			loop(e);
			randomizeAsteroids(e);
		}
		
		private function rotating(e:Event):void
		{
			if ((_rotate == 0) || (_rotate <= 0))
			{
				
				_rotate = Math.random() * 12;
				trace(_rotate + " Asteroid rotation");
				if ((_rotate == 0) || (_rotate <= 0))
				{
					_rotate = Math.random() * 12;
					trace(_rotate + " Asteroid rotation");
				}
			}
		}
		
		private function loop(e:Event):void 
		{
			this.rotation += _rotate;
		}
		
		private function randomizeAsteroids(e:Event):void
		{
			randomizeAsteroid = (Math.random() * 10); // Genereer number met 1 decimaal
			trace(randomizeAsteroid);
			if (randomizeAsteroid >= 0 && randomizeAsteroid <= 5)
			{
				_asteroid = new _astr();
				addChild(_asteroid);
				_asteroid.x -= (262 / 2);
				_asteroid.y -= (152 / 2);
			}
			else if (randomizeAsteroid >= 5 && randomizeAsteroid <= 10)
			{
				_asteroid = new _astr2();
				addChild(_asteroid);
				_asteroid.x -= (202 / 2);
				_asteroid.y -= (166 / 2);
			}
		}
	}
}