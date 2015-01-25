package Components.Tiles
{
	import flash.display.CapsStyle;
	import flash.display.Sprite;
	import Settings.GameSettings;
	/**
	 * ...
	 * @author GadjievAlex
	 */
	public class TileX extends Sprite
	{
		
		public function TileX() 
		{
			this.graphics.clear();
			this.graphics.beginFill(0x004080);
			this.graphics.drawRect(0, 0, GameSettings.TileWidth, GameSettings.TileHeight);
			this.graphics.endFill();
			this.graphics.lineStyle(GameSettings.TileLineWidth, 0, 1, false, null, CapsStyle.SQUARE );
			this.graphics.moveTo( 0, 0 );
			this.graphics.lineTo( GameSettings.TileWidth, GameSettings.TileHeight);
			this.graphics.moveTo( GameSettings.TileWidth, 0);
			this.graphics.lineTo( 10, GameSettings.TileWidth);
		}
		
	}

}