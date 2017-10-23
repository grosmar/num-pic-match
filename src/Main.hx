package;

import haxe.Resource;
import js.Browser;
import js.Browser;
import vdom.VDom.*;
import view.*;
import coconut.Ui.hxx;


/**
 * ...
 * @author duke
 */
class Main 
{
	
	static function main() 
	{
		var s = Resource.getString("wordlist");
		
		var savedFilter:String = "";
		var savedFixChar:String = "";
		var savedMin:UInt = 3;
		var savedMax:UInt = 5;
		 
		
		try
		{
			var ls = Browser.getLocalStorage();
			savedMin = ls.getItem("min") != null ? Std.parseInt(ls.getItem("min")) : savedMin;
			savedMax = ls.getItem("max") != null ? Std.parseInt(ls.getItem("max")) : savedMax;
		}
		
		var model = new NumPicMatchModel({min:savedMin, max:savedMax});
		
		var root = hxx('<NumPicMatchView model={model} />');
		Browser.document.body.appendChild( root.toElement() );
		
		Browser.window.onunload = function ()
		{
			Browser.getLocalStorage().setItem("min", Std.string(model.min));
			Browser.getLocalStorage().setItem("max", Std.string(model.max));
		}
	}
	
}