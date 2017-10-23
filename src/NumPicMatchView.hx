package;
import coconut.ui.View;
import js.Browser.*;

/**
 * ...
 * @author duke
 */
class NumPicMatchView extends View<{model:NumPicMatchModel}>
{

	function render() 
	{
		var arr = RandomHelper.shuffle([for (i in (model.min)...model.max+1) i]);
		trace(arr);
		
	
		return @hxx'
		<div style="height:100%">
			<div class="no-print">
				Min: <input id="min" oninput={model.min=Std.parseInt(event.target.value) <= model.max ? Std.parseInt(event.target.value) : model.max} value={Std.string(model.min)} style="width: 50px;" /> 
				Max: <input id="max" oninput={model.max=Std.parseInt(event.target.value) >= model.min ? Std.parseInt(event.target.value) : model.min} value={Std.string(model.max)} style="width: 50px;" />  
				<button onclick={model.random()}>Randomize</button>
			</div>
			<div style="height:100%">
				<div style="float:left; margin: 4px;">
					<div style={"width:" + Math.floor(100/(model.max+2)) +"vw; height: " + Math.floor(100/(model.max+2)) + "vw; border:1px solid black; font-family:webdings; font-size:" + Math.floor((100/(model.max+2))/(model.rand+1)) + "vw; text-align:center;"}>
					<br/>
					<br/>
					<for {i in 0...model.rand}>
						{model.char}
					</for>
					</div>
					<div style={"text-align:center; width:100%; font-size:" + Math.floor(100/(model.max+2)/2) + "vw" }>{model.rand}</div>
				</div>
				<for {i in arr}>
				<div style="float:left; margin: 4px;">
					<div style={"width:" + Math.floor(100/(model.max+2)) +"vw; height: " + Math.floor(100/(model.max+2)) + "vw; border:1px solid black;"}></div>
					<div style={"text-align:center; width:100%; font-size:" + Math.floor(100/(model.max+2)/2) + "vw" }>{i}</div>
				</div>
				</for>
			</div>
			<div style="clear:both"></div>
		</div>
		';
	}
	
}