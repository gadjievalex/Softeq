package Settings 
{
	/**
	 * Game Tile prop like Width Height a. o. 
	 * @author GadjievAlex
	 */
	public class GameSettings 
	{
		//Tile prop
		public static const TileLineWidth:uint=10
		public static const TileWidth:uint = 100;
		public static const TileHeight:uint = 100;
		//Grid prop 
		public static const GridWidth:uint = 300;
		public static const GridHeight:uint = 300;
		//Row and Col count
		public static const RowCount:uint = 3;
		public static const ColCount:uint = 3;
		//WIN_CONFIGURATIONS
		public static const WIN_CONFIGURATIONS:Array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]];
	}

}