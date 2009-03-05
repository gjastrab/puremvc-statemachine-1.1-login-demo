/*
  PureMVC Flex StateMachine 1.1 Demo - LoginFSMDemo
  Copyright (c) 2009 Greg Jastrab <greg@smartlogicsolutions.com>
  Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.demos.flex.loginfsm.controller {
	
	import org.puremvc.as3.demos.flex.loginfsm.model.LoginProxy;
	import org.puremvc.as3.demos.flex.loginfsm.view.events.LoginEvent;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * ProcessLogin command.
	 *
	 * @langversion ActionScript 3.0
	 * @author Greg Jastrab &lt;greg&#64;smartlogicsolutions.com&gt;
	 * @date 03/05/2009
	 * @version 1.0
	 */
	public class ProcessLoginCommand extends SimpleCommand {
	   
		override public function execute(note:INotification):void {
			trace("[ProcessLoginCommand::execute]");
			var evt:LoginEvent = note.getBody() as LoginEvent;
			trace("\t awesome, have login event here that was triggered by updated state CHANGED notification!\n", evt);
			trace("Also note, it is safe to send a StateMachine.ACTION notification to do another state change here!");
			
			var loginProxy:LoginProxy = facade.retrieveProxy(LoginProxy.NAME) as LoginProxy;
			loginProxy.performLogin(evt.username, evt.password);
		}
		
	}
	
}
