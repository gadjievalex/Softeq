package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import UI.Interface.TTT;
	
	/**
	 * ...
	 * @author GadjievAlex
	 */
	public class Main extends Sprite 
	{
		private var game:TTT;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			game = new TTT();
			
			addChild(game);
		}
		
	}
	
}