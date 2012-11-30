/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.mediators {
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.NewYork;
	
	public class NewYorkMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "NewYorkMediator";
		
		public function NewYorkMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
			newYork.addEventListener(NewYork.PLAY_PLANE, newYork_playPlaneHandler);
			newYork.addEventListener(NewYork.HIDE_NEW_YORK_STAR, newYork_hideNewYorkStarHandler);
			newYork.addEventListener(NewYork.NEXT, newYork_nextHandler);
		}
		
		private function newYork_playPlaneHandler(event:Event):void {
			facade.sendNotification(ApplicationFacade.PLAY_PLANE_GUIDED);
		}

		private function newYork_hideNewYorkStarHandler(event:Event):void {
			facade.sendNotification(ApplicationFacade.HIDE_NEW_YORK_STAR);
		}
		
		private function newYork_nextHandler(event:Event):void {
			facade.sendNotification(ApplicationFacade.ISTANBUL);
		}
		
		public function get newYork():NewYork {
			return viewComponent as NewYork;
		}
		
	}
}