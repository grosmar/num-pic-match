package;

import haxe.Resource;
import js.Browser;
import js.Browser;
import tink.http.Client.JsClient;
import tink.url.Host;
import vdom.VDom.*;
import view.*;
import coconut.Ui.hxx;
import tink.http.clients.*;
import tink.http.Request;
using tink.io.Source;


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
		//https://www.googleapis.com/customsearch/v1?key=AIzaSyCpvey7DTytLfh3DXciBVgsOfN8d7rMJCI&cx=015237518444056158239:ylplfaewwwq&searchType=image&imgType=clipart&imgColorType=gray&q=heart
		/*var client = new JsClient();
        client.request(new OutgoingRequest(new OutgoingRequestHeader(GET, new Host('ip.jsontest.com'), []), ''))
            .next(function(res) return res.body.all())
            .handle(function(o) switch o {
                case Success(body): trace(body.toString()); // should trace an html page
                case Failure(e): trace(e);
            });*/
	}
	
}
