/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.components {
	import com.greensock.TweenMax;
	import com.greensock.easing.Elastic;
	import com.greensock.easing.Sine;
	import com.muizz.IAnimatable;
	import com.muizz.TweenClips;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	public class Berlin extends MovieClip implements IAnimatable {
		
		public static const HIDE_BERLIN_STAR:String = "hideBerlinStar";
		
		private var clips0:Vector.<MovieClip>;
		private var clips1:Vector.<MovieClip>;
		
		private var duration:Number = .25;
		private var delay:Number = .2;
		private var pause:Number = 5;
		
		public function Berlin() {
			clips0 = new Vector.<MovieClip>();
			clips1 = new Vector.<MovieClip>();
			
			for(var i:int=0; i<5; i++){
				clips0.push(this.getChildByName("clip0_" + i));
			}
			
			for(var j:int=0; j<4; j++){
				clips1.push(this.getChildByName("clip1_" + j));
			}
		}
		
		public function animateIn():void {
			for(var i:int=0; i<clips0.length; i++){
				
				TweenMax.from(clips0[i], duration, {rotation:75, alpha:0, ease:Sine.easeOut, delay:i*delay});
				
				var normal:MovieClip = clips0[i].getChildByName("_normal") as MovieClip;
				var blur:MovieClip = clips0[i].getChildByName("_blur") as MovieClip;
				
				TweenMax.to(blur, duration, {alpha:0, delay:duration + i * .2});
				
				TweenMax.from(normal, duration, {alpha:0, delay:duration + i * .18});
			}
			
			TweenClips.from(clips1, 1, {y:String(-20), alpha:0, ease:Elastic.easeOut}, animateIn_completeHandler, 1);
			
			dispatchEvent(new Event(HIDE_BERLIN_STAR));
		}
		
		public function animateIn_completeHandler():void {
			TweenMax.to(this, pause, {onComplete:animateOut});
		}
		
		public function animateOut():void {
			navigateToURL(new URLRequest("game.aspx"), "_self");
		}
		
		public function animateOut_completeHandler():void {
		}
		
		public function reset():void {
		}
		
	}
}