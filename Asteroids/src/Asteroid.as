package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	
	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class Asteroid extends Sprite
	{
		private var _rotate:int = 0;
		private var _asteroidType:int = 1;
		private var randomizeAsteroid:int = 0;
		
		[Embed(source = "../Assets/Game/Obstacles/astroide.png")]
		private var _astr:Class;
		private var _asteroid:Bitmap;
		[Embed(source="../Assets/Game/Obstacles/asteroid_1.png")]
		private var _astr2:Class;
		private var _asteroid2:Bitmap;
		[Embed(source="../Assets/Game/Obstacles/asteroid_2.png")]
		private var _astr3:Class;
		private var _asteroid3:Bitmap;
		[Embed(source="../Assets/Game/Obstacles/asteroid_3.png")]
		private var _astr4:Class;
		private var _asteroid4:Bitmap;
		[Embed(source="../Assets/Game/Obstacles/asteroid_4.png")]
		private var _astr5:Class;
		private var _asteroid5:Bitmap;
		
		public function Asteroid() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ADDED_TO_STAGE, rotating);
			addEventListener(Event.ADDED_TO_STAGE, randomizeAsteroids);
			loop(e);
			randomizeAsteroids(e);
			_asteroid.x -= 280 / 2;
			_asteroid.y -= 208 / 2;
			addEventListener(Event.ENTER_FRAME, loop);
			
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
		
		private function randomizeAsteroids(e:Event):void
		{
			randomizeAsteroid = Math.random() * 10;
			if (randomizeAsteroid >= 0 && randomizeAsteroid <= 2)
			{
				_asteroid = new _astr();
				addChild(_asteroid);
				_asteroid.x -= (280 / 2);
				_asteroid.y -= (208 / 2);
			}
			if (randomizeAsteroid >= 2 && randomizeAsteroid <= 4)
			{
				_asteroid = new _astr2();
				addChild(_asteroid);
				_asteroid.x -= (150 / 2);
				_asteroid.y -= (160 / 2);
			}
			if (randomizeAsteroid >= 4 && randomizeAsteroid <= 6)
			{
				_asteroid = new _astr3();
				addChild(_asteroid);
				_asteroid.x -= (238 / 2);
				_asteroid.y -= (162 / 2);
			}
			if (randomizeAsteroid >= 6 && randomizeAsteroid <= 8)
			{
				_asteroid = new _astr4();
				addChild(_asteroid);
				_asteroid.x -= (154 / 2);
				_asteroid.y -= (152 / 2);
			}
			if (randomizeAsteroid >= 8 && randomizeAsteroid <= 10)
			{
				_asteroid = new _astr5();
				addChild(_asteroid);
				_asteroid.x -= (174 / 2);
				_asteroid.y -= (112 / 2);
			}
		}
	}

}