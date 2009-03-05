/*
  PureMVC Flex StateMachine 1.1 Demo - LoginFSMDemo
  Copyright (c) 2009 Greg Jastrab <greg@smartlogicsolutions.com>
  Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.demos.flex.loginfsm.controller {
	
	import org.puremvc.as3.demos.flex.loginfsm.LoginFSMFacade;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.puremvc.as3.utilities.statemachine.FSMInjector;
	
	/**
	 * InjectFSM command.
	 *
	 * @langversion ActionScript 3.0
	 * @author Greg Jastrab &lt;greg&#64;smartlogicsolutions.com&gt;
	 * @date 03/05/2009
	 * @version 1.0
	 */
	public class InjectFSMCommand extends SimpleCommand {
	   
		override public function execute(note:INotification):void {
			var fsm:XML =
				<fsm initial={LoginFSMFacade.STATE_LOGIN}>
					<state name={LoginFSMFacade.STATE_LOGIN} entering={LoginFSMFacade.ENTER_LOGIN}>
						<transition action={LoginFSMFacade.ACTION_LOGIN} target={LoginFSMFacade.STATE_LOGGING_IN} />
					</state>
					<state name={LoginFSMFacade.STATE_LOGGING_IN}
						   entering={LoginFSMFacade.ENTER_LOGGING_IN}
						   changed={LoginFSMFacade.CHANGED_LOGGING_IN}>
						<transition action={LoginFSMFacade.ACTION_LOGGED_IN} target={LoginFSMFacade.STATE_LOGGED_IN} />
					</state>
					<state name={LoginFSMFacade.STATE_LOGGED_IN}
						   entering={LoginFSMFacade.ENTER_LOGGED_IN}
						   exiting={LoginFSMFacade.EXIT_LOGGED_IN}>
						<transition action={LoginFSMFacade.ACTION_LOGOUT} target={LoginFSMFacade.STATE_LOGIN} />
					</state>
				</fsm>;
			
			var injector:FSMInjector = new FSMInjector(fsm);
			injector.inject();
		}
		
	}
	
}
