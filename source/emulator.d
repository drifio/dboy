module dboy.emulator;

import std.stdio;
import std.file;

/*
 * Emulator class
 *	TODO: Comment
 */
final class Emulator
{
	private ubyte[0x200000] cartridgeMemory; // Max size of a GB rom is 0x200000 bytes

	// Constructor
	this()
	{
	}
	
	// Destructor
	~ this()
	{
	}

	/*
	 * LoadRom(string RomName)
	 *	TODO: Comment
	 */
	bool LoadRom(string romName)
	{
		//Check if file exists
		if( !exists(romName) )
		{
			writeln("File "~romName~" not found.");
			return false;
		}
		else
		{
			writeln("File "~romName~" found -- attempting to load.");
			return true;
		}
	}
}
