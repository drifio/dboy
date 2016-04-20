import dboy.gameboy;
import std.stdio;
import std.getopt;
import core.stdc.stdlib;

static string romName;

void main(string[] args)
{
	ParseArgs(args);

	auto gameboy = new Gameboy(romName);

	if( gameboy.Initialise() == true )
	{
		gameboy.BeginEmulation();
	}
	
	exit(0);
}

/*
 * Help()
 *	TODO: Comment
 */
void Help()
{
	writeln("TODO: Write help");
}

/*
 * ParseArgs(string[] args)
 *	TODO: Comment
 */
void ParseArgs(string[] args)
{
	try
	{
		args.getopt("rom", &romName);
	}
	catch (GetOptException ex)
	{
		writeln(ex.msg);
		Help();
		exit(1);
	}
}
