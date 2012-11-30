/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.components {
	import com.muizz.IAnimatable;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Plane extends MovieClip implements IAnimatable {
		
		private var planeGuided:MovieClip;
		
		public static const PLAY_PLANE_GUIDED_COMPLETE:String = "playPlaneGuidedComplete";
		
		public function Plane() {
			planeGuided = this.getChildByName("_planeGuided") as MovieClip;
		}
		
		public function animateIn():void {
		}
		
		public function animateIn_completeHandler():void {
		}
		
		public function animateOut():void {
		}
		
		public function animateOut_completeHandler():void {
		}
		
		public function reset():void {
		}
		
		public function playPlaneGuided():void {
			planeGuided.play();
		}
		
		public function playPlaneGuided_completeHandler():void {
			dispatchEvent(new Event(PLAY_PLANE_GUIDED_COMPLETE));
		}
	}
}