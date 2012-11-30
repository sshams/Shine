/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.mediators {
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class ApplicationMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "ApplicationMediator";
		
		public function ApplicationMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
		}
		
		override public function listNotificationInterests():Array {
			return [
				ApplicationFacade.SHOW_GLOBE,
				ApplicationFacade.NEXT_CITY,
			];
		}
		
		override public function handleNotification(notification:INotification):void {
			switch(notification.getName()){
				case ApplicationFacade.SHOW_GLOBE:
					intro.addGlobe();
					break;
				case ApplicationFacade.NEXT_CITY:
					intro.nextCity();
					break;
			}
		}
		
		public function get intro():Intro {
			return viewComponent as Intro;
		}
	}
}