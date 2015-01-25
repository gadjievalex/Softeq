package  UI
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import Settings.GameSettings;
	/**
	 * ...
	 * @author GadjievAlex
	 */
	public class Button extends Sprite
	{
		
		public function Button(x:int =0, y:int=0, width:int=0, height:int=0, alphaValue:Number = 0, colorValue:uint=0x000000, defaultHandler:Function = null) 
		{
			this.graphics.beginFill(colorValue, alphaValue);
			this.graphics.drawRect(x, y, width, height);
			this.graphics.endFill();
			
			if(defaultHandler != null)
			{
				addEventListener(MouseEvent.CLICK, defaultHandler);
			}
		}
	}
}