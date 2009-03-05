/*
  PureMVC Flex StateMachine 1.1 Demo - LoginFSMDemo
  Copyright (c) 2009 Greg Jastrab <greg@smartlogicsolutions.com>
  Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.demos.flex.loginfsm.controller {

	import org.puremvc.as3.demos.flex.loginfsm.model.*;
	import org.puremvc.as3.demos.flex.loginfsm.view.*;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * PrepareActors command.
	 *
	 * @langversion ActionScript 3.0
	 * @author Greg Jastrab &lt;greg&#64;smartlogicsolutions.com&gt;
	 * @date 03/05/2009
	 * @version 1.0
	 */
	public class PrepareActorsCommand extends SimpleCommand {
	   
		override public function execute(note:INotification):void {
			facade.registerProxy( new LoginProxy() );
            
            facade.registerMediator( new LoginFSMMediator( note.getBody() ) );
		}
		
	}
	
}
