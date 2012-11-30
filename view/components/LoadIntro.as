/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.components {
	import com.muizz.TweenClips;
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	public class LoadIntro extends MovieClip {
		
		private var progress:MovieClip;
		private var percentage:TextField;
		private var startClip:MovieClip;
		
		private var loader:Loader;
		
		public function LoadIntro() {
			progress = this.getChildByName("_progress") as MovieClip;
			startClip = this.getChildByName("_startClip") as MovieClip;
			percentage = progress.getChildByName("_percentage") as TextField;
			
			startClip.addEventListener(MouseEvent.MOUSE_DOWN, startClip_mouseDownHandler);
			startClip.buttonMode = true;
			
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loader_completeHandler);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, loader_progressHandler);
			loader.load(new URLRequest("Intro.swf"));
		}
		
		private function startClip_mouseDownHandler(event:MouseEvent):void {
			addIntro();
		}
		
		private function loader_completeHandler(event:Event):void {
			startClip.alpha = 1;
			progress.alpha = 0;
		}
		
		private function loader_progressHandler(event:ProgressEvent):void {
			var percent:int = event.bytesLoaded/event.bytesTotal * 100;
			percentage.text = percent + "%";
			progress.gotoAndStop(percent);
		}
		
		private function addIntro():void {
			progress.alpha = 0;
			startClip.alpha = 1;
			var intro:MovieClip = MovieClip(loader.contentLoaderInfo.content);
			addChild(intro);
			intro.play();
		}
		
	}
}