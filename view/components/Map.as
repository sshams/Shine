/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.components {
	import com.greensock.TweenMax;
	import com.greensock.easing.Elastic;
	import com.greensock.easing.Linear;
	import com.greensock.easing.Quad;
	import com.greensock.plugins.BlurFilterPlugin;
	import com.greensock.plugins.TweenPlugin;
	import com.muizz.IAnimatable;
	import com.muizz.TweenClips;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Map extends MovieClip implements IAnimatable {
		
		private var plane:MovieClip;
		private var map:MovieClip;
		private var mapMini:MovieClip;
		
		private var newYorkStar:MovieClip;
		private var istanbulStar:MovieClip;
		private var berlinStar:MovieClip;
		
		private var header:MovieClip;
		private var clips:Vector.<MovieClip>;
		
		private var city:int = 0;
		
		public static const SHOW_GLOBE:String = "showGlobe";
		
		public function Map() {
			TweenPlugin.activate([BlurFilterPlugin]);
			
			plane = this.getChildByName("_plane") as MovieClip;
			map = this.getChildByName("_map") as MovieClip;
			mapMini = this.getChildByName("_mapMini") as MovieClip;
			
			newYorkStar = mapMini.getChildByName("_newYorkStar") as MovieClip;
			istanbulStar = mapMini.getChildByName("_istanbulStar") as MovieClip;
			berlinStar = mapMini.getChildByName("_berlinStar") as MovieClip;
			
			istanbulStar.alpha = berlinStar.alpha = 0;
			
			mapMini.alpha = 0;
			
			header = this.getChildByName("_header") as MovieClip;
			
			clips = new Vector.<MovieClip>();
			
			for(var i:int=0; i<6; i++){
				clips.push(this.getChildByName("clip" + i));
			}
		}
		
		public function animateIn():void { //header, map and plane animation
			TweenMax.from(header, .5, {y:String(10)});
			TweenMax.from(map, .5, {alpha:0});
			TweenClips.from(clips, .9, {width:0, height:0, alpha:0, ease:Elastic.easeOut}, null, 1);
			
			TweenMax.to(plane, 2.5, {x: -244, y:220, delay:1, ease:Linear.easeIn, onComplete:plane_onCompleteHandler});
			
			TweenMax.to(this, .5, {onComplete:showGlobe, delay:1.5});
		}
		
		public function animateIn_completeHandler():void {
			
		}
		
		public function animateOut():void {
		}
		
		public function animateOut_completeHandler():void {
		}
		
		public function reset():void {
			city = 0;
		}
		
		private function plane_onCompleteHandler():void { //show globe on plane completion
			
			if(city == 0){
				newYork();
				city++;
			}

		}
		
		public function showGlobe():void {
			hideIcons();
			dispatchEvent(new Event(SHOW_GLOBE));
		}
		
		public function nextCity():void {
			switch(city){
				case 1:
					city++;
					break;
				case 2:
					city++;
					break;
			}
		}
		
		public function hideIcons():void {
			TweenMax.to(map, 1.5, {x: 128, y:134, width:780, height:377, alpha:0, blurFilter:{blurX:10, blurY:10}, delay:1});
			
			for(var i:int=0; i<clips.length; i++){
				TweenMax.to(clips[i], .5, {alpha:0, delay:1});
			}
		}
		
		public function newYork():void { //to show new york area
			TweenMax.from(mapMini, 2.5, {width:1100, height:444.15, delay:.2})
			TweenMax.to(mapMini, 2.5, {alpha: 1, delay:.2});
		}
		
		public function istanbul():void {
			TweenMax.to(mapMini, 2.5, {x:-515, y:-10});
		}
		
		public function berlin():void {
			TweenMax.to(mapMini, 2.5, {x:-541, y:74});
		}
		
		public function hideNewYorkStar():void {
			TweenMax.to(newYorkStar, .5, {alpha:0});
			TweenMax.to(istanbulStar, .5, {alpha:1, delay:6});
		}
		
		public function hideIstanbulStar():void {
			TweenMax.to(istanbulStar, .5, {alpha:0});
			TweenMax.to(berlinStar, .5, {alpha:1, delay:5.5});
		}
		
		public function hideBerlinStar():void {
			TweenMax.to(berlinStar, .5, {alpha:0});
		}
		
	}
}