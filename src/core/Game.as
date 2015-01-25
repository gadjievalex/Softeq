package core
{
	import Components.Grid;
	import Components.Tiles.Tile;
	import flash.display.MovieClip;
	import flash.events.Event;
	import Settings.GameSettings;
	/**
	 * ...
	 * @author GadjievAlex
	 */
	public class Game extends MovieClip
	{
		public var turn:uint;
		private var numPlayers:uint;
		private var leftTurns:uint = 10;
		private var grid:Grid = new Grid();
		private var tiles:Vector.<Tile> = new Vector.<Tile>();
		private var gameEnded:Boolean = false;
		private var WinnerName:String = "";
		
		public function Game(num:Number):void
		{
			numPlayers = num;
			turn = 0;
			AddVisual();
			AddListeners();
			nextTurn();
		}
		
		private function AddListeners():void 
		{
			for each(var tile:Tile in tiles)
			{
				tile.addEventListener("TILE_CLICKED", nextTurn);
			}
		}
		
		private function nextTurn(e:Event=null):void 
		{
			if (!CheckWin())
			{
				leftTurns--;
				if (leftTurns > 0)
				{
					turn += 1;
				}
				else
				{
					EndGame(null, false, false);
				}
			}
		}
		
		private function CheckWin():Boolean
		{
			var win:Boolean = false;
			for each(var winComb:Array in GameSettings.WIN_CONFIGURATIONS)
			{
				var xWin:Boolean = true;
				var oWin:Boolean = true;
				
				for each(var tile:int in winComb)
				{
					xWin = (xWin && tiles[tile].GetSet() == 1);
					oWin = (oWin && tiles[tile].GetSet() == 0);
				}
				if (xWin || oWin)
				{
					EndGame(winComb, xWin, oWin)
					win = true;
					break;
				}
				else
				{
					win = false;
				}
			}
			return win;
		}
		
		private function AddVisual():void 
		{
			for (var col:Number = 0; col < GameSettings.ColCount; col++)
			{
				for (var row:Number = 0; row < GameSettings.RowCount; row++)
				{
					var tile:Tile = new Tile();
					tile.Init();
					tile.x = col * GameSettings.TileWidth;
					tile.y = row * GameSettings.TileHeight;
					addChild(tile);
					tiles.push(tile);
				}
			}
			addChild(grid);
		}
		
		private function EndGame(WinComb:Array = null, xWin:Boolean = false, oWin:Boolean=false):void
		{
			for each(var tile:Tile in tiles)
			{
				tile.Removelisteners();
				
				if (WinComb != null)
				{
					for each(var j:int in WinComb)
					{
						if (tiles.indexOf(tile) == j)
						{
							tile.ShowEnd();
						}
					}
				}
			}
			if (xWin)
			{
				WinnerName = "Player A";
			}
			else if (oWin)
			{
				WinnerName = "Player B"
			}
			else
			{
				WinnerName = "FRIENDSHIP WIN!!! :-)";
			}
			gameEnded = true;
		}
		
		public function IsGameEnded():Boolean
		{
			return gameEnded;
		}
		
		public function GetWinnerName():String
		{
			return WinnerName;
		}
	}
}