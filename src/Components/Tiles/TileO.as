package Components.Tiles
{
	import flash.display.CapsStyle;
	import flash.display.Shape;
	import flash.display.Sprite;
	import Settings.GameSettings;
	/**
	 * ...
	 * @author GadjievAlex
	 */
	public class TileO extends Sprite
	{
		public function TileO() 
		{
			this.graphics.clear();
			this.graphics.beginFill(0x00D500);
			this.graphics.drawRect(0, 0, GameSettings.TileWidth, GameSettings.TileHeight);
			this.graphics.endFill();
			this.graphics.beginFill(0x00D500);
			this.graphics.lineStyle(GameSettings.TileLineWidth, 0, 1, false, null, CapsStyle.SQUARE );
			this.graphics.drawCircle( GameSettings.TileWidth >> 1, GameSettings.TileHeight >> 1, GameSettings.TileWidth >> 1);
			this.graphics.endFill();
		}
	}
}