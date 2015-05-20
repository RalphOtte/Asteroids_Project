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
	public class Options extends Sprite
	{
		private var _Selection:int = 1;
		
		private var _WIsDown:Boolean = false;
		private var _SIsDown:Boolean = false;
		private var _SpacebarButton:Boolean = false;
		private var _SoundToggle:Boolean = true;
		private var _SFXToggle:Boolean = true;
		
		// ART VOOR OVERIGE DINGEN/BUTTONS
		[Embed(source = "../Assets/Menu's/menu_options_astroids.png")]
		private var _OptBack:Class;
		private var _OptionsBack:Bitmap;
		[Embed(source = "../Assets/Menu's/Pointer2.png")]
		private var _SelectionPoint:Class;
		private var _SelectionPointer:Bitmap;
		[Embed(source = "../Assets/Menu's/BackButton.png")]
		private var _Back:Class;
		private var _BackButton:Bitmap;
		// PLACE HOLDER VOOR CHECKBOX ART
		[Embed(source="../Assets/Menu's/Pointer.png")]
		private var _Check:Class;
		private var _CheckBox:Bitmap;
		[Embed(source="../Assets/Menu's/Pointer.png")]
		private var _Check2:Class;
		private var _CheckBox2:Bitmap;
		
		// ART VOOR SOUND & SFX & Controls "Borden"
		
		[Embed(source = "../Assets/Menu's/Sound.png")]
		private var _Sound:Class;
		private var _SoundArt:Bitmap;
		// EMBED VOOR SFX(NU IS ER EEN 2e SOUND ALS PLACEHOLDER)
		[Embed(source="../Assets/Menu's/Sound.png")]
		private var _SFX:Class;
		private var _SoundEffects:Bitmap;
		[Embed(source = "../Assets/Menu's/ControlSettings.png")]
		private var _CTRLSettings:Class;
		private var _ControlSettings:Bitmap;
		
		// ART VOOR CONTROLS
		
		[Embed(source = "../Assets/Menu's/ControlSettings.png")]
		private var Controls:Class;
		private var ControlSettings:Bitmap;
		// Placeholders voor controls
		[Embed(source="../Assets/Menu's/control_settings.png")]
		private var _CTRLS1:Class;
		private var _Controls1:Bitmap;
		
		public function Options() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			super();
		}
		public function reSpawn(e):void
		{
			this.init(e);
			_Selection = 0;
			_WIsDown = false;
			_SIsDown = false;
			_SpacebarButton= false;
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, loop);
			
			 stage.addEventListener(KeyboardEvent.KEY_DOWN, checkButtonDown);
			 stage.addEventListener(KeyboardEvent.KEY_UP, checkButtonUp);
			
			_OptionsBack = new _OptBack();
			addChild(_OptionsBack);
			
			_SelectionPointer = new _SelectionPoint();
			addChild(_SelectionPointer);
			_SelectionPointer.x = stage.stageWidth / 2 - 550;
			_SelectionPointer.y = 200;
			
			
			_BackButton = new _Back();
			addChild(_BackButton);
			_BackButton.x = stage.stageWidth / 2 - 500;
			_BackButton.y = 600;
			
			_ControlSettings = new _CTRLSettings();
			addChild(_ControlSettings);
			_ControlSettings.x = stage.stageWidth / 2 + 120;
			_ControlSettings.y = 150;
			
			_Controls1 = new _CTRLS1();
			addChild(_Controls1);
			_Controls1.x = stage.stageWidth / 2 + 120;
			_Controls1.y = 250;
			
			_SoundArt = new _Sound();
			addChild(_SoundArt);
			_SoundArt.x = stage.stageWidth / 2 - 500;
			_SoundArt.y = 200;
				
			_SoundEffects = new _SFX();
			addChild(_SoundEffects);
			_SoundEffects.x = stage.stageWidth / 2 - 500;
			_SoundEffects.y = 400;
				
			_CheckBox = new _Check();
			addChild(_CheckBox);
			_CheckBox.x = stage.stageWidth / 2 - 150;
			_CheckBox.y = 200;
				
			_CheckBox2 = new _Check();
			addChild(_CheckBox2);
			_CheckBox2.x = stage.stageWidth / 2 - 150;
			_CheckBox2.y = 400;
		}
		
		private function checkButtonUp(e:KeyboardEvent):void
		{
			trace("checkbuttonUp (OPTIONS)");
			if (e.keyCode == 87)
			{
				_WIsDown = false;
			}
			if (e.keyCode == 83)
			{
				_SIsDown = false;
			}
			if (e.keyCode == 32)
			{
				_SpacebarButton = false;
			}
		}
		
		private function checkButtonDown(e:KeyboardEvent):void
		{
			trace("checkbuttonDown (OPTIONS)");
			if (e.keyCode == 87)
			{
				_WIsDown = true;
			}
			if (e.keyCode == 83)
			{
				_SIsDown = true;
			}
			if (e.keyCode == 32)
			{
				_SpacebarButton = true;
			}
		}
		public function loop(e:Event):void 
		{
			if (_Selection == 1)
			{
				_SelectionPointer.x = stage.stageWidth / 2 - 550;
				_SelectionPointer.y = 200;
			}
			if (_Selection == 2)
			{
				_SelectionPointer.x = stage.stageWidth / 2 - 550;
				_SelectionPointer.y = 400;
			}
			if (_Selection == 3)
			{
				_SelectionPointer.x = stage.stageWidth / 2 - 550;
				_SelectionPointer.y = 600;
			}
			
			if (_WIsDown == true)
			{
				if (_Selection >= 3)
				{
					_Selection--;
				}
				else if (_Selection <= 1)
				{
					_Selection = 3;
				}
				else if (_Selection <= 2 || 2)
				{
					_Selection--;
				}
			}
			
			if (_SIsDown == true)
			{
				if (_Selection <= 3)
				{
					_Selection++;
				}
				else if (_Selection >= 3)
				{
					_Selection = 1;
				}
			}
			if (_SpacebarButton == true)
			{
				if (_Selection == 1)
				{
					// ToggleSound
				}
				if (_Selection == 2)
				{
					//Toggle SFX
				}
				if (_Selection == 3 || 4)
				{
					_Selection = 0;
					removeChild(_SelectionPointer);
					removeEventListener(Event.ENTER_FRAME, loop);
					dispatchEvent(new Event("SpawnMenu"));
					dispatchEvent(new Event("RemoveOptions"));
				}
			}
		}
	}
}