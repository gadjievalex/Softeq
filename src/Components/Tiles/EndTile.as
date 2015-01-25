package  Components.Tiles
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import Settings.GameSettings;
	/**
	 * ...
	 * @author GadjievAlex
	 */
	public class EndTile extends Sprite
	{
		public function EndTile() 
		{
			this.graphics.beginFill(0x408080, 0.8);
			this.graphics.drawRect(0, 0, GameSettings.TileWidth, GameSettings.TileHeight);
			this.graphics.endFill();
		}
		
	}

}