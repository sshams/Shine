/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.components {
	import com.greensock.TweenMax;
	import com.muizz.IAnimatable;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Globe extends MovieClip implements IAnimatable {
		
		private var world:MovieClip;
		private var worldBlur:MovieClip;
		
		private var newYorkTitle:MovieClip;
		private var istanbulTitle:MovieClip;
		private var berlinTitle:MovieClip;
		
		public static const PLAY_PLANE_GUIDED:String = "playPlaneGuided";
		public static const MAP_NEW_YORK:String = "mapNewYork";
		
		public function Globe() {
			worldBlur = this.getChildByName("_worldBlur") as MovieClip;
			world = this.getChildByName("_world") as MovieClip;
			
			newYorkTitle = this.getChildByName("_new_york") as MovieClip;
			istanbulTitle = this.getChildByName("_istanbul") as MovieClip;
			berlinTitle = this.getChildByName("_berlin") as MovieClip;
			
			newYorkTitle.alpha = istanbulTitle.alpha = berlinTitle.alpha = 0;
		}
		
		public function animateIn():void {
			TweenMax.from(world, 1.5, {y:String(415)}); //move up
			TweenMax.from(worldBlur, 1.5, {y:String(415), onComplete:worldBlur_completeHandler});
			
			TweenMax.to(this, 1.2, {onComplete:playPlaneGuided}); //play plane
			
			toNewYork();
		}
		
		public function animateIn_completeHandler():void {
		}
		
		public function animateOut():void {
		}
		
		public function animateOut_completeHandler():void {
		}
		
		public function reset():void {
		}
		
		private function playPlaneGuided():void {
			dispatchEvent(new Event(PLAY_PLANE_GUIDED));
		}
		
		private function worldBlur_completeHandler():void {
		}
		
		public function toNewYork():void { //hide blur version
			var angle:int = -120;
			TweenMax.from(world, 4, {rotation:angle}); 
			TweenMax.from(worldBlur, 4, {rotation:angle});
			
			TweenMax.to(worldBlur, .5, {alpha: 0, delay: 3.3});
			TweenMax.to(newYorkTitle, .5, {alpha: 1, delay:3.5});
			
			mapNewYork();
		}
		
		private function mapNewYork():void {
			dispatchEvent(new Event(MAP_NEW_YORK));
		}
		
		public function istanbul():void {
			var angle:int = 115;
			TweenMax.to(world, 4, {rotation:angle}); //rotation
			TweenMax.to(worldBlur, 4, {rotation:angle});
			
			TweenMax.to(worldBlur, .5, {alpha: 0, delay: 2.5});
			
			
			TweenMax.to(newYorkTitle, .3, {alpha: 0});
			TweenMax.to(istanbulTitle, .5, {alpha: 1, delay:3.5});
		}
		
		public function berlin():void {
			var angle:int = 250;
			TweenMax.to(world, 4, {rotation:angle}); //rotation
			TweenMax.to(worldBlur, 4, {rotation:angle});
			
			TweenMax.to(worldBlur, .5, {alpha: 0, delay: 2.5});
			
			TweenMax.to(istanbulTitle, .3, {alpha: 0});
			TweenMax.to(berlinTitle, .5, {alpha: 1, delay:3.5});
		}
	}
}