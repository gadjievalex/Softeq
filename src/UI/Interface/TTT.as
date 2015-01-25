package UI.Interface
{
	import core.Game;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import Settings.GameSettings;
	import UI.Button;
	import UI.InfoPanel;
	/**
	 * ...
	 * @author GadjievAlex
	 */
	public class TTT extends MovieClip
	{
		private var startButton:Button;
		
		private var infpBox:InfoPanel;
		
		private var game:Game;
		
		private const SPACER:uint = 10;
		
		private var btnLabel:InfoPanel;
		
		public function TTT() 
		{
			startButton = new Button(0, 0, GameSettings.GridWidth, 50, 1, 0xFF8000, StartGame);
			infpBox = new InfoPanel("Game Info", GameSettings.GridWidth, 25, 0, 0, this); 
			btnLabel = new InfoPanel("Start new Game", GameSettings.GridWidth, 50, 0, 0, this);
			MakeGame();
			
			Configured();
			
			AddObjects();
			
			AddListeners();
		}
		
		private function MakeGame():void 
		{
			game = new Game(2);
			addChild(game);
			infpBox.text = "New Game";
		}

		private function StartGame(e:MouseEvent=null):void 
		{
			if (game != null)
			{
				game.removeEventListener("TILE_CLICKED", updateInfo);
				removeChild(game);
				game = null;
			}
			MakeGame();
			AddListeners();
			Configured();
		}
		
		private function AddListeners():void 
		{
			game.addEventListener("TILE_CLICKED", updateInfo);
		}
		
		private function AddObjects():void 
		{
			addChild(infpBox);
			addChild(startButton);
			startButton.addChild(btnLabel);
		}
		
		private function updateInfo(e:Event):void 
		{
			if (!game.IsGameEnded())
			{
				var player:String = "";
			
				if (game.turn % 2 == 0)
				{
					player = "A";
				}
				else
				{
					player = "B";
				}
				infpBox.text = " Rount " + game.turn.toString() + " Player " + player;
			}
			else
			{
				infpBox.text = " WINNER " + game.GetWinnerName();
			}
		}
		
		private function Configured():void 
		{
			game.x = infpBox.x;
			game.y = infpBox.y + infpBox.height + SPACER;
			startButton.x = game.x;
			startButton.y = game.y + GameSettings.GridHeight + SPACER;
		}
		
	}

}