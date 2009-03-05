/*
  PureMVC Flex StateMachine 1.1 Demo - LoginFSMDemo
  Copyright (c) 2009 Greg Jastrab <greg@smartlogicsolutions.com>
  Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.demos.flex.loginfsm.view {
	
	import org.puremvc.as3.demos.flex.loginfsm.LoginFSMFacade;
	import org.puremvc.as3.demos.flex.loginfsm.view.components.LoginPanel;
	import org.puremvc.as3.demos.flex.loginfsm.view.events.LoginEvent;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import org.puremvc.as3.utilities.statemachine.StateMachine;
	
	/**
	 * LoginPanel mediator.
	 *
	 * @langversion ActionScript 3.0
	 * @author Greg Jastrab &lt;greg&#64;smartlogicsolutions.com&gt;
	 * @date 03/05/2009
	 * @version 1.0
	 */
	public class LoginPanelMediator extends Mediator {
	   
		/* --- Variables --- */
		
		public static const NAME:String = "LoginPanelMediator";
		
		/* === Variables === */
		
		/* --- Constructor --- */
		
		/**
		 * Constructor.
		 *
		 * @param viewComponent view component for mediator
		 */
		public function LoginPanelMediator(viewComponent:Object) {
			super(NAME, viewComponent);
			
			view.addEventListener(LoginEvent.LOGIN, onLogin);
			view.addEventListener(LoginEvent.LOGOUT,
				function(evt:LoginEvent):void {
					sendNotification(StateMachine.ACTION, null, LoginFSMFacade.ACTION_LOGOUT);
				});
		}
		
		/* === Constructor === */
		
		/* --- Functions --- */
		
		override public function handleNotification(note:INotification):void {
			switch( note.getName() ) {
				case LoginFSMFacade.ENTER_LOGIN:
					view.username.text = view.password.text = "";
					toggleFields();
					break;
					
				case LoginFSMFacade.ENTER_LOGGING_IN:
					toggleFields(false);
					break;
				
				case LoginFSMFacade.ENTER_LOGGED_IN:
				case LoginFSMFacade.EXIT_LOGGED_IN:
					var isLoggedIn:Boolean = note.getName() == LoginFSMFacade.ENTER_LOGGED_IN;
					view.currentState = isLoggedIn ? LoginFSMFacade.STATE_LOGGED_IN : null;
					if(isLoggedIn)
						view.user = note.getBody() as String;
					break;
			}
		}

		override public function listNotificationInterests():Array {
			return [
				LoginFSMFacade.ENTER_LOGIN,
				LoginFSMFacade.ENTER_LOGGING_IN,
				LoginFSMFacade.ENTER_LOGGED_IN,
				LoginFSMFacade.EXIT_LOGGED_IN
			];
		}
		
		private function toggleFields(isEnabled:Boolean=true):void {
			view.username.enabled = view.password.enabled = view.loginBtn.enabled = isEnabled;
			view.loginBtn.label = isEnabled ? "Login" : "Logging In...";
		}
		
		/* === Functions === */
		
		/* --- Event Handlers --- */
		
		private function onLogin(evt:LoginEvent):void {
			trace("[LoginPanelMediator::onLogin]");
			sendNotification(StateMachine.ACTION, evt, LoginFSMFacade.ACTION_LOGIN);
		}
		
		/* === Event Handlers === */
		
		/* --- Public Accessors --- */
		
		public function get view():LoginPanel { return viewComponent as LoginPanel; }
		
		/* === Public Accessors === */
		
	}
	
}
