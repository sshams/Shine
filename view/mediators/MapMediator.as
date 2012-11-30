/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.mediators {
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.Map;
	
	public class MapMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "MapMediator";
		
		public function MapMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
			map.addEventListener(Map.SHOW_GLOBE, map_showGlobeHandler);
		}
		
		override public function listNotificationInterests():Array {
			return [
				ApplicationFacade.NEXT_CITY,
				ApplicationFacade.ISTANBUL,
				ApplicationFacade.BERLIN,
				ApplicationFacade.HIDE_NEW_YORK_STAR,
				ApplicationFacade.HIDE_ISTANBUL_STAR,
				ApplicationFacade.HIDE_BERLIN_STAR
			];
		}
		
		override public function handleNotification(notification:INotification):void {
			switch(notification.getName()){
				case ApplicationFacade.NEXT_CITY:
					map.nextCity();
					break;
				case ApplicationFacade.ISTANBUL:
					map.istanbul();
					break;
				case ApplicationFacade.BERLIN:
					map.berlin();
					break;
				case ApplicationFacade.HIDE_NEW_YORK_STAR:
					map.hideNewYorkStar();
					break;
				case ApplicationFacade.HIDE_ISTANBUL_STAR:
					map.hideIstanbulStar();
					break;
				case ApplicationFacade.HIDE_BERLIN_STAR:
					map.hideBerlinStar();
					break;
			}
		}
		
		private function map_showGlobeHandler(event:Event):void {
			facade.sendNotification(ApplicationFacade.SHOW_GLOBE);
		}
		
		public function get map():Map {
			return viewComponent as Map;
		}
	}
}