package;
/**
 * @author ...
 */

@:produces('application/json')
@:pure
interface API 
{
	
	@:get('/customsearch/v1?key=AIzaSyCpvey7DTytLfh3DXciBVgsOfN8d7rMJCI&cx=015237518444056158239:ylplfaewwwq&searchType=image&imgType=clipart&imgColorType=gray&q=$img') function getImage(img:String):Pics;
	
}