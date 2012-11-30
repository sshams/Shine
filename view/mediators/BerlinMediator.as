/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.mediators {
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.Berlin;
	
	public class BerlinMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "BerlinMediator";
		
		public function BerlinMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
			berlin.addEventListener(Berlin.HIDE_BERLIN_STAR, berlin_hideBerlinStarHandler);
		}
		
		private function berlin_hideBerlinStarHandler(event:Event):void {
			facade.sendNotification(ApplicationFacade.HIDE_BERLIN_STAR);
		}
		
		public function get berlin():Berlin {
			return viewComponent as Berlin;
		}
		
	}
}