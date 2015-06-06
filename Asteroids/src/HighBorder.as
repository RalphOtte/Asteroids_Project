package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jochem
	 */
	public class HighBorder  extends Sprite
	{
		
		[Embed(source="../Assets/Game/Backgrounds/NorthBorder3.png")]
		private var HighBorderImg:Class;
		private var HBI:Bitmap;
		public function HighBorder() 
		{
			HBI = new HighBorderImg();
			addChild(HBI);
		}
		
	}

}