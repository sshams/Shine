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
	
	public class Istanbul extends MovieClip implements IAnimatable {
		
		public static const PLAY_PLANE:String = "playPlane";
		public static const HIDE_ISTANBUL_STAR:String = "hideIstanbulStar";
		public static const NEXT:String = "next";
		
		private var clips0:Vector.<MovieClip>;
		private var clips1:Vector.<MovieClip>;
		
		private var duration:Number = .25;
		private var delay:Number = .2;
		private var pause:Number = 2.5;
		
		public function Istanbul() {
			clips0 = new Vector.<MovieClip>();
			clips1 = new Vector.<MovieClip>();
			
			for(var i:int=0; i<4; i++){
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
			dispatchEvent(new Event(HIDE_ISTANBUL_STAR));
		}
		
		public function animateIn_completeHandler():void {
			TweenMax.to(this, pause, {onComplete:animateOut});
		}
		
		public function animateOut():void {
			TweenClips.to(clips1, duration/2, {y:String(20), alpha:0, ease:Elastic.easeIn}, animateOut_completeHandler);
		}
		
		public function animateOut_completeHandler():void {
			for(var i:int=clips0.length-1; i>=0; i--){
				var onComplete:Function = (i == 0) ? next : null;
				TweenMax.to(clips0[i], duration * 2, {rotation:-75, alpha:0, ease:Sine.easeOut, delay:(clips0.length - i) * .15, onStart:resetClip, onStartParams:[clips0[i]], onComplete:onComplete});
			}
		}
		
		public function reset():void {
			for(var i:int=0; i<clips0.length; i++){
				clips0[i].x = clips0[i].y = 0;
			}
			
			for(var j:int=0; j<4; j++){
				clips1[j].x = clips1[j].y = 0;
			}
		}
		
		private function resetClip(clip:MovieClip):void{
			var blur:MovieClip = clip.getChildByName("_blur") as MovieClip;
			blur.alpha = 1;
		}
		
		private function playPlane():void {
			dispatchEvent(new Event(PLAY_PLANE));
		}
		
		private function next():void {
			dispatchEvent(new Event(NEXT));
			TweenMax.to(this, 1, {onComplete:playPlane});
		}
	}
}