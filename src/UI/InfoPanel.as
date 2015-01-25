package UI 
{
	import flash.display.DisplayObjectContainer;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	/**
	 * ...
	 * @author GadjievAlex
	 */
	public class InfoPanel extends TextField
	{		
		private var format:TextFormat;
		
		public function InfoPanel(value:String, width:uint, height:uint, xpos:int, ypos:int, parent:DisplayObjectContainer = null)
		{
			format = new TextFormat();
			format.size = 20;
			format.align = TextFormatAlign.CENTER;
			this.defaultTextFormat = format;
			if(parent != null)
			{
				parent.addChild(this);
				x = xpos;
				y = ypos;
			}
			this.text = value;
			trace(this.text);
			this.height = height;
			this.width = width;
			
			cacheAsBitmap = true;
			
			selectable = false;
			
			type = TextFieldType.DYNAMIC;
			
			border = true;
			borderColor = 0x0080C0;
			
			
		}
	}
}