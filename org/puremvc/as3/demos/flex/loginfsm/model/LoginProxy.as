/*
  PureMVC Flex StateMachine 1.1 Demo - LoginFSMDemo
  Copyright (c) 2009 Greg Jastrab <greg@smartlogicsolutions.com>
  Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.demos.flex.loginfsm.model {
	
	import flash.utils.setTimeout;
	
	import org.puremvc.as3.demos.flex.loginfsm.LoginFSMFacade;
	import org.puremvc.as3.patterns.proxy.Proxy;
	import org.puremvc.as3.utilities.statemachine.StateMachine;
	
	/**
	 * Login proxy.
	 *
	 * @langversion ActionScript 3.0
	 * @author Greg Jastrab &lt;greg&#64;smartlogicsolutions.com&gt;
	 * @date 03/05/2009
	 * @version 1.0
	 */
	public class LoginProxy extends Proxy {
	   
		/* --- Variables --- */
		
		public static const NAME:String = "LoginProxy";
		
		protected var currentUser:String;
		
		/* === Variables === */
		
		/* --- Constructor --- */
		
		/**
		 * Constructor.
		 */
		public function LoginProxy() {
			super(NAME);
			currentUser = "";
		}
		
		/* === Constructor === */
		
		/* --- Functions --- */
		
		/**
		 * Method to do perform login.
		 * 
		 * @param username username
		 * @param password password
		 */
		public function performLogin(username:String, password:String):void {
			// delay to simulate RPC service
			setTimeout(function():void {
				currentUser = username;
				sendNotification(StateMachine.ACTION, currentUser, LoginFSMFacade.ACTION_LOGGED_IN);
			}, 3000);
		}
		
		/* === Functions === */
		
		/* --- Public Accessors --- */
		
		public function get isLoggedIn():Boolean { return currentUser != ""; }
		
		/* === Public Accessors === */
		
	}
	
}
