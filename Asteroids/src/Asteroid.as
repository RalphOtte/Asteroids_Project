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
		
		[Embed(source = "../Assets/Game/Obstacles/astroide.png")]
		private var _astr:Class;
		private var _asteroid:Bitmap;
		
		public function Asteroid() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ADDED_TO_STAGE, rotating);
			_asteroid = new _astr();
			addChild(_asteroid);
			_asteroid.x -= 280 / 2;
			_asteroid.y -= 208 / 2;
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