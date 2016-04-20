import dboy.gameboy;
import std.stdio;

void main()
{
	auto gb = new Gameboy();	
	if( gb.Initialise() == true )
	{
		gb.BeginEmulation();
	}
}
