/*
  PureMVC Flex StateMachine 1.1 Demo - LoginFSMDemo
  Copyright (c) 2009 Greg Jastrab <greg@smartlogicsolutions.com>
  Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.demos.flex.loginfsm.view {
	
	import org.puremvc.as3.demos.flex.loginfsm.LoginFSMFacade;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	/**
	 * LoginFSM mediator.
	 *
	 * @langversion ActionScript 3.0
	 * @author Greg Jastrab &lt;greg&#64;smartlogicsolutions.com&gt;
	 * @date 03/05/2009
	 * @version 1.0
	 */
	public class LoginFSMMediator extends Mediator {
	   
		/* --- Variables --- */
		
		public static const NAME:String = "LoginFSMMediator";
		
		/* === Variables === */
		
		/* --- Constructor --- */
		
		/**
		 * Constructor.
		 *
		 * @param viewComponent view component for mediator
		 */
		public function LoginFSMMediator(viewComponent:Object) {
			super(NAME, viewComponent);
			
			facade.registerMediator( new LoginPanelMediator(app.loginPnl) );
		}
		
		/* === Constructor === */
		
		/* --- Functions --- */
		
		override public function handleNotification(note:INotification):void {
		}

		override public function listNotificationInterests():Array {
			return [
			];
		}
		
		/* === Functions === */
		
		/* --- Public Accessors --- */
		
		public function get app():LoginFSMDemo { return viewComponent as LoginFSMDemo; }
		
		/* === Public Accessors === */
		
	}
	
}
