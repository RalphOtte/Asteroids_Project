package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jochem
	 */
	public class LowBorder extends Sprite
	{
		
		[Embed(source = "../Assets/Game/Backgrounds/SouthBorder3.png")]
		private  var LowBorderImg:Class;
		private var LBI:Bitmap;
		
		public function LowBorder() 
		{
			LBI = new LowBorderImg();
			addChild(LBI);
		}
		
	}

}