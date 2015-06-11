package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	
	/**
	 * ...
	 * @author Ralph Otte
	 */
	public class Enemy extends Sprite
	{
		private var _Player1:Player = new Player;
		//private var _Player2:Player2 = new Player2;
		private var _bullet:Bullet = new Bullet;
		private var _enemyBullet:enemyBullet = new enemyBullet;
		
		public var _enemyHealth:int = 10;
		
		[Embed(source = "../Assets/Game/Enemies/Enemy_Yellow.png")]
		private var _enemyShip:Class;
		private var _eShip:Bitmap;
		
		public function Enemy() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			_eShip = new _enemyShip; 
			addChild(_eShip);
			_eShip.x = this.x / 2;
			_eShip.y = this.y / 2;
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, checkForPlayer);
			addEventListener(Event.ENTER_FRAME, bulletFly);
		}
		
		public function removeMe():void 
		{
			removeChild(_enemyBullet);
		}
		
		private function checkForPlayer(e:Event):void 
		{
			if (_Player1.x <= this.x - 800)
			{
				trace("Shooty");
				Shoot();
			}
			/*
			if (_Player2.x <= this.x - 400)
			{
				Shoot();
			}*/
		}
		
		private function Shoot():void 
		{
			addChild(_enemyBullet);
			_enemyBullet.x = this.x / 10 - 50;
			_enemyBullet.y = this.y / 4;
			_enemyBullet.rotation = 90;
		}
		
		private function bulletFly(e:Event):void 
		{
			if (this.contains(_enemyBullet))
			{
				_enemyBullet.scaleX = 3;
				_enemyBullet.scaleY = 3;
				_enemyBullet.x -= 25;
			}
		}
	}
}