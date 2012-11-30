/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package {
	import controller.StartupCommand;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class ApplicationFacade extends Facade implements IFacade {
		
		public static const STARTUP:String = "startup";
		public static const SHOW_GLOBE:String = "showGlobe";
		public static const PLAY_PLANE_GUIDED:String = "playPlaneGuided";
		public static const NEXT_CITY:String = "nextCity";
		
		public static const NEW_YORK:String = "newYork";
		public static const ISTANBUL:String = "istanbul";
		public static const BERLIN:String = "berlin";
		
		public static const HIDE_NEW_YORK_STAR:String = "hideNewYorkStar";
		public static const HIDE_ISTANBUL_STAR:String = "hideIstanbulStar";
		public static const HIDE_BERLIN_STAR:String = "hideBerlinStar";
		
		public static function getInstance():ApplicationFacade {
			if(instance == null){
				instance = new ApplicationFacade();
			}
			
			return instance as ApplicationFacade;
		}
		
		override protected function initializeController():void {
			super.initializeController();
			registerCommand(ApplicationFacade.STARTUP, StartupCommand);
		}
		
		public function startup(app:Intro):void {
			sendNotification(ApplicationFacade.STARTUP, app);
		}
		
	}
}