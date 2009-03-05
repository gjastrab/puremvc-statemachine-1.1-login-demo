/*
  PureMVC Flex StateMachine 1.1 Demo - LoginFSMDemo
  Copyright (c) 2009 Greg Jastrab <greg@smartlogicsolutions.com>
  Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.demos.flex.loginfsm.view.events {
	
	import flash.events.Event;
	
	/**
	 * Login related event class.
	 *
	 * @langversion ActionScript 3.0
	 * @author Greg Jastrab &lt;greg&#64;smartlogicsolutions.com&gt;
	 * @date 03/05/2009
	 * @version 1.0
	 */
	public class LoginEvent extends Event {
		
		/* --- Variables --- */
		
		public static const LOGIN:String	= "login";
		public static const LOGOUT:String	= "logout";
		
		/**
		 * Username.
		 */
		public var username:String;
		
		/**
		 * Password.
		 */
		public var password:String;
		
		/* === Variables === */
		
		/* --- Constructor --- */
		
		/**
		 * Constructor.
		 * 
		 * @param type type of the event
		 * @param username username to login with
		 * @param password password for the user
		 */
		public function LoginEvent(type:String, username:String="", password:String="") {
			super(type, bubbles, cancelable);
			this.username = username;
			this.password = password;
		}
		
		/* === Constructor === */
		
		/* --- Functions --- */
		
		/** @inheritDoc */
		override public function clone():Event {
			return new LoginEvent(type, username, password);
		}
		
		/**
		 * Stringifies the event.
		 * 
		 * @return string representation of the event.
		 */
		override public function toString():String {
			return formatToString("LoginEvent", "type", "username", "password");
		}
		
		/* === Functions === */
		
	}
	
}