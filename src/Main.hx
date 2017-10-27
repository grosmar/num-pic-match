package;

import js.Browser;
import tink.http.Client.JsSecureClient;
import tink.url.Host;
import coconut.Ui.hxx;
import tink.http.Request;
import tink.web.proxy.Remote;


/**
 * ...
 * @author duke
 */
class Main 
{
	/*static var api = connect();
	
	static function connect()
	{
		var client = new JsSecureClient();
		return new Remote<API>(client, { 
		  host: new tink.url.Host("www.googleapis.com")
		});
	}*/
	
	static function main() 
	{

		//api.getImage("heart").handle( function( o ) { trace( o ); } );
		
		var savedMin:Int = 0;
		var savedMax:Int = 5;
		
		try
		{
			var ls = Browser.getLocalStorage();
			savedMin = ls.getItem("min") != null ? Std.parseInt(ls.getItem("min")) : savedMin;
			savedMax = ls.getItem("max") != null ? Std.parseInt(ls.getItem("max")) : savedMax;
		}
		
		var model = new NumPicMatchModel({min:savedMin, max:savedMax/*, picService:api.getImage*/});
		
		var root = hxx('<NumPicMatchView model={model} />');
		Browser.document.body.appendChild( root.toElement() );
		
		Browser.window.onunload = function ()
		{
			Browser.getLocalStorage().setItem("min", Std.string(model.min));
			Browser.getLocalStorage().setItem("max", Std.string(model.max));
		}
		
		
		//https://www.googleapis.com/customsearch/v1?key=AIzaSyCpvey7DTytLfh3DXciBVgsOfN8d7rMJCI&cx=015237518444056158239:ylplfaewwwq&searchType=image&imgType=clipart&imgColorType=gray&q=heart
	}
	
}
