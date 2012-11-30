/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.mediators {
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.Istanbul;
	
	public class IstanbulMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "IstanbulMediator";
		
		public function IstanbulMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
			istanbul.addEventListener(Istanbul.PLAY_PLANE, istanbul_playPlaneHandler);
			istanbul.addEventListener(Istanbul.HIDE_ISTANBUL_STAR, istanbul_hideIstanbulStarHandler);
			istanbul.addEventListener(Istanbul.NEXT, istanbul_nextHandler);
		}
		
		private function istanbul_playPlaneHandler(event:Event):void {
			facade.sendNotification(ApplicationFacade.PLAY_PLANE_GUIDED);
		}
		
		private function istanbul_hideIstanbulStarHandler(event:Event):void {
			facade.sendNotification(ApplicationFacade.HIDE_ISTANBUL_STAR);
		}
		
		private function istanbul_nextHandler(event:Event):void {
			facade.sendNotification(ApplicationFacade.BERLIN);
		}
		
		public function get istanbul():Istanbul {
			return viewComponent as Istanbul;
		}
	}
}