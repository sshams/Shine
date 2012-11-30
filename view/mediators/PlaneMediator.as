/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.mediators {
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.Plane;
	
	public class PlaneMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "PlaneMediator";
		
		public function PlaneMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
			plane.addEventListener(Plane.PLAY_PLANE_GUIDED_COMPLETE, playPlaneGuided_completeHandler);
		}
		
		private function playPlaneGuided_completeHandler(event:Event):void {
			facade.sendNotification(ApplicationFacade.NEXT_CITY);
		}
		
		override public function listNotificationInterests():Array {
			return [
				ApplicationFacade.PLAY_PLANE_GUIDED,
			];
		}
		
		override public function handleNotification(notification:INotification):void {
			switch(notification.getName()){
				case ApplicationFacade.PLAY_PLANE_GUIDED:
					plane.playPlaneGuided();
					break;
			}
		}
		
		public function get plane():Plane {
			return viewComponent as Plane;
		}
	}
}