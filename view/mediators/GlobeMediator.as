/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.mediators {
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.Globe;
	
	public class GlobeMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "GlobeMediator";
		
		public function GlobeMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
			globe.addEventListener(Globe.PLAY_PLANE_GUIDED, globe_playPlaneGuidedHandler);
		}
		
		private function globe_playPlaneGuidedHandler(event:Event):void {
			facade.sendNotification(ApplicationFacade.PLAY_PLANE_GUIDED);
		}
		
		override public function listNotificationInterests():Array {
			return [
				ApplicationFacade.ISTANBUL,
				ApplicationFacade.BERLIN
			];
		}
		
		override public function handleNotification(notification:INotification):void {
			switch(notification.getName()){
				case ApplicationFacade.ISTANBUL:
					globe.istanbul();
					break;
				case ApplicationFacade.BERLIN:
					globe.berlin();
					break;
			}
		}
		
		public function get globe():Globe {
			return viewComponent as Globe;
		}
	}
}