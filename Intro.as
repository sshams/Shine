/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package {
	import flash.display.MovieClip;
	
	import view.components.Berlin;
	import view.components.Globe;
	import view.components.Istanbul;
	import view.components.Map;
	import view.components.NewYork;
	import view.components.Plane;
	
	public class Intro extends MovieClip {
		
		public var map:Map;
		public var globe:Globe;
		public var newYork:NewYork;
		public var istanbul:Istanbul;
		public var berlin:Berlin;
		public var plane:Plane;
		
		private var city:int = 0;
		
		private var globeHolder:MovieClip;
		private var cities:MovieClip;
		private var bottom:MovieClip;
		private var hwHolder:MovieClip;
		private var header:MovieClip;
		
		public function Intro() {	
			map = new Map();
			globe = new Globe();
			newYork = new NewYork();
			istanbul = new Istanbul();
			berlin = new Berlin();
			plane = new Plane();
			
			bottom = new MovieClip();
			globeHolder = new MovieClip();
			cities = new MovieClip();
			hwHolder = new MovieClip();
			header = new MovieClip();
			
			addChild(bottom);
			addChild(globeHolder);
			addChild(hwHolder);
			addChild(cities);
			addChild(header);
			
			newYork.x = istanbul.x = berlin.x = 492;
			newYork.y = istanbul.y = berlin.y = 875;
			
			ApplicationFacade.getInstance().startup(this);
			
			//addMap();
		}
		
		public function addMap():void {
			bottom.addChild(map);
			map.animateIn();
		}
		
		public function removeMap():void {
			bottom.removeChild(map);
			map.reset();
		}
		
		public function addGlobe():void {
			globeHolder.addChild(globe);
			globeHolder.addChild(plane);
			hwHolder.addChild(new view.components.HealthWarning());
			globe.animateIn();
			plane.animateIn();
		}
		
		public function removeGlobe():void {
			globeHolder.removeChild(globe);
			globeHolder.removeChild(plane);
			globe.reset();
			plane.reset();
		}
	
		public function addNewYork():void {
			cities.addChild(newYork);
			newYork.animateIn();
		}
		
		public function removeNewYork():void {
			cities.removeChild(newYork);
			newYork.reset();
		}
		
		public function addIstanbul():void {
			cities.addChild(istanbul);
			istanbul.animateIn();
		}
		
		public function removeIstanbul():void {
			cities.removeChild(istanbul);
			istanbul.reset();
		}
		
		public function addBerlin():void {
			cities.addChild(berlin);
			berlin.animateIn();
		}
		
		public function removeBerlin():void {
			cities.removeChild(berlin);
			berlin.reset();
		}
		
		public function nextCity():void {
			switch(city){
				case 0:
					addNewYork();
					city++;
					break;
				case 1:
					removeNewYork();
					addIstanbul();
					city++;
					break;
				case 2:
					removeIstanbul();
					addBerlin();
					city = 0;
					break;
			}
		}
		
	}
}