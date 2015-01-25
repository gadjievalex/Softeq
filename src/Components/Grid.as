package Components
{
	import flash.display.Sprite;
	import Settings.GameSettings;
	/**
	 * ...
	 * @author GadjievAlex
	 */
	public class Grid extends Sprite
	{		
		public function Grid()
		{
			this.graphics.lineStyle(GameSettings.TileLineWidth, 0x787878);

			for (var col:Number = 0; col < GameSettings.ColCount + 1; col++)
			{
				for (var row:Number = 0; row < GameSettings.RowCount + 1; row++)
				{
					this.graphics.moveTo(col * GameSettings.TileWidth, 0);
					this.graphics.lineTo(col * GameSettings.TileWidth, GameSettings.TileHeight * row);
					this.graphics.moveTo(0, row * GameSettings.TileHeight);
					this.graphics.lineTo(GameSettings.TileHeight * GameSettings.ColCount, row * GameSettings.TileHeight);
				}
			}
		}
	}
}