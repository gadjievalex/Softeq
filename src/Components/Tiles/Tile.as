package Components.Tiles
{
	import core.Game;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import Settings.GameSettings;
	import UI.Button;
	/**
	 * ...
	 * @author GadjievAlex
	 */
	public class Tile extends MovieClip
	{
		private var isSet:uint;
		
		private var endPic:EndTile = new EndTile();
		
		private var buttonTile:Button = new Button(0, 0, GameSettings.TileWidth, GameSettings.TileHeight, 0, 0x000000);
		
		private var tileO:TileO = new TileO();
		private var tileX:TileX = new TileX();
		
		public function Tile():void
		{
			
		}
		
		public function Init():void
		{
			IsSet(3);
			tileO.visible = false;
			tileX.visible = false;
			endPic.visible = false;
			
			AddVisuals();
			
			AddListeners();
		}
		
		public function Deinit():void
		{
			Removelisteners();
		}
			
		private function AddVisuals():void 
		{
			addChild(tileO);
			addChild(tileX);
			addChild(endPic);
			addChild(buttonTile);
		}
		
		private function AddListeners():void 
		{
			this.buttonMode = true;
			buttonTile.addEventListener(MouseEvent.MOUSE_OVER, ShowGraphic);
			buttonTile.addEventListener(MouseEvent.MOUSE_OUT, HideGraphic);
			buttonTile.addEventListener(MouseEvent.CLICK, ChoseGraphic);
		}
		
		public function Removelisteners():void 
		{
			this.buttonMode = false;
			buttonTile.removeEventListener(MouseEvent.MOUSE_OVER, ShowGraphic);
			buttonTile.removeEventListener(MouseEvent.MOUSE_OUT, HideGraphic);
			buttonTile.removeEventListener(MouseEvent.CLICK, ChoseGraphic);
		}
		
		private function ChoseGraphic(e:MouseEvent):void 
		{
			Removelisteners();
			if (Game(this.parent).turn & 1)
			{
				IsSet(0);
			}
			else
			{
				IsSet(1);
			}
			dispatchEvent(new Event("TILE_CLICKED", true));
		}
		
		private function HideGraphic(e:MouseEvent):void 
		{
			tileO.visible = false;
			tileX.visible = false;
		}
		
		private function ShowGraphic(e:MouseEvent):void 
		{
			if (Game(this.parent).turn & 1)
			{
				tileO.visible = true;
			}
			else
			{
				tileX.visible = true;
			}
		}

		private function IsSet(value:uint):void
		{
			this.isSet = value;
		}
		
		public function GetSet():uint
		{
			return this.isSet;
		}
		
		public function ShowEnd():void
		{
			endPic.visible = true;
		}
	}
}