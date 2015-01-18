
package com.saumya.cli;

import com.saumya.cli.MyCli;

class PrintInfo 
{

	public function new(){
		this.print();
	}
	//prints some output to the console
	private function print():Void
	{
		Sys.println("saumya CLI 0.0.1");
		Sys.println("");
		this.getUserInfo();
	}
	// Prompts the User to fill in the data
	private function getUserInfo():Void
	{
		var name:String = null;
		var stdin = Sys.stdin();
		while (true)
		{
		    Sys.println("Please enter your name...");
		    Sys.print(">>> ");
		    name = stdin.readLine();
		    break;
		}
		//trace("Your name is " + name);
		Sys.println("Your name is " + name);
		// Launch my CLI
		var myCLI:MyCli = new MyCli();
		myCLI.runMyCommand();
	}

}