import std.stdio;
import derelict.sdl2.sdl;

const int SCREEN_WIDTH = 160;
const int SCREEN_HEIGHT = 144;

void main()
{
	DerelictSDL2.load();
	
	// The window we'll be rendering to.
	SDL_Window* window = null;
	
	// The surface contained by the window
	SDL_Surface* screenSurface = null;
	
	// Initialize SDL
	if( SDL_Init( SDL_INIT_VIDEO ) < 0 )
	{
		// Write error message out to console if SDL Initialization fails
		writef( "SDL could not initialize! SDL_Error: %s\n", SDL_GetError() );
	}
	else
	{
		// Create the window
		window = SDL_CreateWindow( "dboy", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 
									SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN );
		if( window == null )
		{
			writef( "Window could not be created! SDL_Error: %s\n", SDL_GetError() );
		}
		else
		{
			// Get window surface
			screenSurface = SDL_GetWindowSurface( window );
			
			// Fill the surface with white
			SDL_FillRect( screenSurface, null, SDL_MapRGB( screenSurface.format, 0xFF, 0xFF, 0xFF ) );
			
			// Update the surface
			SDL_UpdateWindowSurface( window );
			
			// Wait two seconds
			SDL_Delay( 2000 );
		}
	}
	
	// Destroy window to free memory
	SDL_DestroyWindow( window );
	
	// Kill SDL
	SDL_Quit();
}
