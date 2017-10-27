package;
import coconut.data.Model;
import tink.core.Promise;

import tink.pure.List;

/**
 * ...
 * @author duke
 */
class NumPicMatchModel implements Model
{

	@:editable var min:UInt;
	
	@:editable var max:UInt;
	
	@:observable var rand:UInt = @byDefault Math.floor(Math.random() * (max - min + 1) + min);
	@:observable var char:String = @byDefault String.fromCharCode(Math.floor(Math.random() * 256));
	
	/*@:constant private var picService:String->Promise<Pics>;
	@:editable var albumId:String = @byDefault "heart";
	@:loaded var pics:Pics = picService(albumId);*/
	
	@:transition function random()
	{
		return {
			rand: RandomHelper.int( min, max ),
			char: String.fromCharCode(RandomHelper.int(1,255)) };
	}
	
}