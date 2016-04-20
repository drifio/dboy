module dboy.gameboy;

import derelict.sdl2.sdl;
import std.stdio;
import dboy.emulator;

static const int SCREEN_WIDTH = 160;
static const int SCREEN_HEIGHT = 144;

/*
 * Gameboy class
 *	TODO: Comment
 */
final class Gameboy
{
	private static SDL_Window* window; // The window we'll be rendering to
	private static SDL_Surface* screenSurface; // The surface contained by the window
	private static Emulator emulator;	
	private static string romName;

	// Constructors
	static this()
	{
		DerelictSDL2.load();
	}

	this(string RomName)
	{
		this.emulator = new Emulator();
		this.romName = RomName;
	}
	
	// Destructor
	~ this()
	{
		if( window != null )
		{
			SDL_DestroyWindow( window );
		}
		SDL_Quit();
	}

	/*
	 * Initialise()
	 *	TODO: Comment
	 */	
	bool Initialise()
	{
		return CreateSDLWindow();
	}

	/*
	 * CreateSDLWindow()
	 *	TODO: Comment
	 */
	bool CreateSDLWindow()
	{
		if( SDL_Init( SDL_INIT_EVERYTHING ) < 0 )
		{
			writef( "SDL could not initialise! SDL_Error: %s\n", SDL_GetError() );
			return false;
		}
		else
		{
			//Create window
			this.window = SDL_CreateWindow( "dboy", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN );
			if( window == null )
			{
				writef( "Window could not be created! SDL_Error: %s\n", SDL_GetError() );
				return false;
			}
			else
			{
				//Get window surface
				this.screenSurface = SDL_GetWindowSurface( this.window );
			}
		}
		return true;
	}
	
	/*
	 * Render()
	 *	TODO: Comment
	 */
	void Render()
	{
		//TODO: Implement
		//pixels = emulator.getScreenData;
		//drawToWindow(pixels);
	}

	/*
	 * BeginEmulation()
	 *	TODO: Comment
	 */
	void BeginEmulation()
	{
		this.emulator.LoadRom(this.romName);
	}
}
