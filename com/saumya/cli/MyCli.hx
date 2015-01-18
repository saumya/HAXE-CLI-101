
package com.saumya.cli;

import sys.FileSystem;

class MyCli 
{
	private var lineString:String;
	public function new()
	{
		this.lineString = '=================================================';
	}
	public function runMyCommand():Void
	{
		this.askForCommand();
	}
	private function runCommand(instruction:String, ?argument:Array<String> = null):Void
	{
		var result:Int = Sys.command(instruction,argument);
		// Check for result
		if(result==0){
			this.printPretty('SUCCESS in running the command.');
		}else{
			this.printPretty('FAIL in running the command.');
		}
		// more
		this.askForCommand();
	}
	private function askForCommand():Void
	{
		this.printPretty('Run System Command');
		// Print some info
		Sys.println("To know HAXE version, type HAXE");
		Sys.println("To know all HAXE libs installed, type HAXELIBS");
		Sys.println("To know NodeJS version, type NODE");
		Sys.println("To know npm version, type NPM");
		Sys.println("To know Git version, type GIT");
		Sys.println("To create a new folder, type FOLDER");
	    Sys.println("To exit, type BYE");
	    //
		var name:String = null;
		var stdin = Sys.stdin();
		while (true)
		{
		    Sys.print("Saumya CLI: ");
		    name = stdin.readLine();
		    break;
		}
		// check for command
		if(name==''){
	      	this.printPretty('No Command to run!');
	      	this.askForCommand();
	    }else if(name=='HAXE'){
	    	Sys.print("HAXE version is ");
	    	this.runCommand('haxe -version');
	    }else if(name=='HAXELIBS'){
	    	this.runCommand('haxelib list');
	    }else if(name=='NODE'){
	    	Sys.print("NodeJS version is ");
	    	this.runCommand('node -v');
	    }else if(name=='NPM'){
	    	Sys.print("NPM version is ");
	    	this.runCommand('npm -v');
	    }else if(name=='GIT'){
	    	//Sys.print("Git version is ");
	    	this.runCommand('git --version');
	    }else if(name=='FOLDER'){
	    	this.askForFolderNameToCreate();
	    }else if(name=='BYE'){
			this.exit();
	    }else{
	    	this.runCommand(name);
	    }
	}

	private function askForFolderNameToCreate():Void
	{
		this.printPretty('Create Folder');
		// Print some info
		Sys.println("To create a folder, type a name");
	    Sys.println("To run a system command, type 1");
	    Sys.println("To exit, type BYE");
		//
		var name:String = null;
		var stdin = Sys.stdin();
		while (true)
		{
		    Sys.print(">>> ");
		    name = stdin.readLine();
		    break;
		}
		// Check for user input
		if(name==''){
	      	this.printPretty('Opps, empty name provided! Please provide a name.');
	      	this.askForFolderNameToCreate();
	    }else if(name=='1'){
	    	this.askForCommand();
		}else if(name=='BYE'){
			this.exit();
		}else{
			//creates folder
			FileSystem.createDirectory(name);
			Sys.println(name + " folder is created.");
			this.askForFolderNameToCreate();	
		}
	}
	//Utility function
	private function exit():Void
	{
		this.printPretty('Good bye.');
		return;
	}
	private function printLine():Void
	{
		Sys.println(this.lineString);
	}
	private function printPretty(info:String):Void
	{
		this.printLine();
		Sys.println(info);
		this.printLine();
		// Print the current time
		Sys.println(Date.now().toString());
	}

}