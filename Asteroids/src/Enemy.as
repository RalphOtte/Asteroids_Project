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
		
		[Embed(source = "../Assets/Game/Enemies/Enemy_Yellow.png")]
		private var _enemyShip:Class;
		private var _eShip:Bitmap;
		
		public function Enemy() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			_eShip = new _enemyShip; 
			addChild(_eShip);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, checkForPlayer);
			
		}
		
		private function checkForPlayer(e:Event):void 
		{
			if ((_Player1.y >= this.y + 50) || (_Player1.y <= this.y - 50) && (_Player1.x <= this.x - 400))
			{
				Shoot();
			}
			//if ((_Player2.y >= this.y + 50) || (_Player2.y <= this.y - 50) && (_Player2.x <= this.x - 400))
			//{
				//Shoot();
			//}
		}
		
		private function Shoot():void 
		{
			addChild(_bullet);
			_bullet.x = this.x / 2;
			_bullet.y = this.y / 2;
			bulletFly();
		}
		
		private function bulletFly():void 
		{
			_bullet.x -= 5;
		}
	}
}