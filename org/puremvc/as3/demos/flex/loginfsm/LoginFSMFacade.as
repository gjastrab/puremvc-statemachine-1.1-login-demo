/*
  PureMVC Flex StateMachine 1.1 Demo - LoginFSMDemo
  Copyright (c) 2009 Greg Jastrab <greg@smartlogicsolutions.com>
  Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.demos.flex.loginfsm {
	
	import org.puremvc.as3.demos.flex.loginfsm.controller.*;
	import org.puremvc.as3.patterns.facade.Facade;
	
	/**
	 * Application Facade.
	 *
	 * @langversion ActionScript 3.0
	 * @author Greg Jastrab &lt;greg&#64;smartlogicsolutions.com&gt;
	 * @date 03/05/2009
	 * @version 1.0
	 */
	public class LoginFSMFacade extends Facade {
	   
		/* --- Variables --- */
		
		public static const STARTUP:String = "startup";

		public static const LOGIN:String				= "login";
		public static const LOGGING_IN:String			= "loggingIn";
		public static const LOGGED_IN:String			= "loggedIn";
		public static const LOGOUT:String				= "logout";
		
		public static const ACTION_LOGIN:String			= "actions/" + LOGIN;
		public static const ACTION_LOGGED_IN:String		= "actions/" + LOGGED_IN;
		public static const ACTION_LOGOUT:String		= "actions/" + LOGOUT;
		
		public static const STATE_LOGIN:String			= "states/" + LOGIN;
		public static const STATE_LOGGING_IN:String		= "states/" + LOGGING_IN;
		public static const STATE_LOGGED_IN:String		= "states/" + LOGGED_IN;
		
		public static const ENTER_LOGIN:String			= "enter/" + LOGIN;
		public static const ENTER_LOGGING_IN:String 	= "enter/" + LOGGING_IN;
		public static const ENTER_LOGGED_IN:String 		= "enter/" + LOGGED_IN;
		
		public static const EXIT_LOGGED_IN:String 		= "exit/" + LOGGED_IN;
		
		public static const CHANGED_LOGGING_IN:String	= "changed/" + LOGGING_IN;
		public static const CHANGED_LOGGED_IN:String	= "changed/" + LOGGED_IN;
		
		/* === Variables === */
		
		/* --- Functions --- */
		
		public static function getInstance():LoginFSMFacade {
			if(instance == null)
				instance = new LoginFSMFacade();
			return instance as LoginFSMFacade;
		}
		
		/**
		 * Starts up LoginFSMDemo.
		 *
		 * @param app reference to the application
		 */
		public function startup(app:LoginFSMDemo):void {
			sendNotification(STARTUP, app);
		}
		
		override protected function initializeController():void {
			super.initializeController();
			registerCommand(STARTUP, StartupCommand);
			registerCommand(CHANGED_LOGGING_IN, ProcessLoginCommand);
		}
		
		/* === Functions === */
		
	}
	
}
