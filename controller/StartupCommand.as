/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package controller {
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediators.ApplicationMediator;
	import view.mediators.BerlinMediator;
	import view.mediators.GlobeMediator;
	import view.mediators.IstanbulMediator;
	import view.mediators.MapMediator;
	import view.mediators.NewYorkMediator;
	import view.mediators.PlaneMediator;
	import view.components.Map;
	
	public class StartupCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			var app:Intro = notification.getBody() as Intro;
			
			facade.registerMediator(new ApplicationMediator(app));
			facade.registerMediator(new MapMediator(app.map));
			facade.registerMediator(new GlobeMediator(app.globe));
			facade.registerMediator(new NewYorkMediator(app.newYork));
			facade.registerMediator(new IstanbulMediator(app.istanbul));
			facade.registerMediator(new BerlinMediator(app.berlin));
			facade.registerMediator(new PlaneMediator(app.plane));
		}
		
	}
}