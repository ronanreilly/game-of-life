﻿package mmp.gol{	/*		Ronan Reilly, DL131,		3rd Year Computing in Multimedia Programming,		Multimedia Programming II,		CA 1, Conways Game of Life,		November 2011			*/		/*		CLASS DESCRIPTION BELOW:			This class will be used to create a world object. It has several methods for 		creating a grid or 2-D array of tiles (grid or world), reseting all of the tiles in		a world/grid object to dead, randomising the status of a grid/world's tiles, counting the 		neighbours that are alive for each tile, and a method that checks each tiles		neighbours status and applys the rules of conways game of life. The las method		will be used to load predefined hard coded presets from the Presets class 		into the 2-d array.			*/	import flash.display.MovieClip;	public class World extends MovieClip	{		private var _tiles:Array;// tiles array, contain tiles		private var _segments:int = 40;// stores max array rows		public var generation:int; // stores the current generation		public var neighboursAliveCount:int; 		public function World()		{			//trace('World class is up and running!!!');			// calling make world method to populate tiles			makeWorld();			//checkTileStatus();			//setTileStatus();		}				/*			The makeWorld method uses two for loops to populate a 			2-D array full of tiles. This will be called from the 			constructor in the main class.		*/		private function makeWorld()		{			//trace('The make world method from the World class has been called.');						// This while statement removes any grids that have been added to the 			// stage before this method is called to ensure that there			// is no build up of grids on the stage.			while (numChildren > 0)			{				removeChildAt(0);			}			// initialising an array to store arrays in.			_tiles = new Array();			for (var i:int = 0; i < _segments; i++)			{	// Stores a row of tiles for one column.				_tiles[i] = new Array();								for (var j:int = 0; j < _segments; j++)				{   					// a reference to a tile object.					var tile:Tile = new Tile();					// Positions the tiles so that they 					// do not get placed on top of each other 					// on the stage.					tile.x = (i * tile.width) + 10;					tile.y = (j * tile.height) + 10;					// Tiles are added to the 2-D array.					_tiles[i][j] = addChild(tile);					// This line performs some math and random functions to randomly set the					// status of each tile in the 2-D array.					_tiles[i][j].status = Math.round(Math.random() * 1);				}			}		}				/*			The resetWorld method uses two for loops to populate a 			2-D array full of tiles and set their status to dead.			This will be called from a button in the main class.		*/		public function resetWorld()		{			//trace('The reset world method from the World class has been called.');						// This while statement removes any grids that have been added to the 			// stage before this method is called to ensure that there			// is no build up of grids on the stage.			while (numChildren > 0)			{				removeChildAt(0);			}			// initialising an array to store tiles in.			_tiles = new Array();			for (var i:int = 0; i < _segments; i++)			{				// Stores a row of tiles for one column.				_tiles[i] = new Array();								for (var j:int = 0; j < _segments; j++)				{					// a reference to a tile object.					var tile:Tile = new Tile();					// Positions the tiles so that they 					// do not get placed on top of each other 					// on the stage.					tile.x = (i * tile.width) + 10;					tile.y = (j * tile.height) + 10;					// Tiles are added to the 2-D array.					_tiles[i][j] = addChild(tile);					// Status for all tiles are set to dead.					_tiles[i][j].status = 0;				}			}			// The generations are set to 0 when this method is called. 			generation = 0;		}						/*			The create random world method uses two for loops to populate a 			2-D array full of tiles and randomise their status'.			This will be called from a button in the main class.		*/		public function createRandomWorld()		{			//trace('The create Random world method from the World class has been called.');						// The generations are set to 0 when this method is called.			generation = 0;			// This while statement removes any grids that have been added to the 			// stage before this method is called to ensure that there			// is no build up of grids on the stage.			while (numChildren > 0)			{				removeChildAt(0);			}			// initialising an array to store tiles in.			_tiles = new Array();			for (var i:int = 0; i < _segments; i++)			{								_tiles[i] = new Array();				for (var j:int = 0; j < _segments; j++)				{					// a reference to a tile object.					var tile:Tile = new Tile();					// Positions the tiles so that they 					// do not get placed on top of each other 					// on the stage.					tile.x = (i * tile.width) + 10;					tile.y = (j * tile.height) + 10;					// Tiles are added to the 2-D array.					_tiles[i][j] = addChild(tile);					// This line performs some math and random functions to randomly set the					// status of each tile in the 2-D array.					_tiles[i][j].status = Math.round(Math.random() * 1);				}							}					}		 		/*			This countNeighboursAlive function performs a check on the four corner tiles,			the edge or border rows of tiles and the tiles inside the borders of the edge rows			(middle of the grid). It will return the number of alive neighbours for a tile given its x 			and y co-ordinates in the grid/2-d array and storing its number of alive neighbours into the			variable temp before returning it at the end of the method.					*/		public function countNeighboursAlive(x:int, y:int):int		{				//trace('The count neighbours alive method has been called world method from the World class has been called.');								var temp:int=0; // store the tiles to be checked at each check. 				var max:int= _segments -1; // this is the length of a column or row in the 2-D array.								 // Checks the top left corner tile.				if (x==0 && y==0)				{    					temp =						_tiles[x+1][y].status +//East Tile						_tiles[x+1][y+1].status +//SoutEast Tile						_tiles[x][y+1].status;//South Tile				 }				 // Checks the top right corner tile.				else if (x==max && y==0)				{					temp =						_tiles[x-1][y].status +//West Tile						_tiles[x-1][y+1].status +  //SoutWest Tile						_tiles[x][y+1].status;//South Tile								}				// Checks the bottom right corner tile.				else if (x==max && y==max)				{					temp = 						_tiles[x][y-1].status +//North Tile						_tiles[x-1][y-1].status +//NorthWest Tile						_tiles[x-1][y].status;//West Tile				}				// Checks the bottom left corner tile.				else if (x==0 && y==max)				{					temp =						_tiles[x][y-1].status +//North Tile						_tiles[x+1][y-1].status +//NorthEast Tile						_tiles[x+1][y].status;//East Tile				}				// Checks the top border of edge tiles.				else if (y==0)				{					temp =						_tiles[x-1][y].status +//West Tile						_tiles[x-1][y+1].status +  //SoutWest Tile						_tiles[x][y+1].status +//South Tile						_tiles[x+1][y+1].status +//SoutEast Tile						_tiles[x+1][y].status;//East Tile				}				// Checks the right border edge of tiles.				else if (x==max)				{					temp =						_tiles[x][y-1].status +//North Tile						_tiles[x-1][y-1].status +//NorthWest Tile						_tiles[x-1][y].status +//West Tile						_tiles[x-1][y+1].status +  //SoutWest Tile						_tiles[x][y+1].status;//South Tile				}				// Checks the left border edge of tiles.				else if (x==0)				{					temp =										_tiles[x][y-1].status +//North Tile						_tiles[x+1][y-1].status +//NorthEast Tile						_tiles[x+1][y].status +//East Tile						_tiles[x+1][y+1].status +//SoutEast Tile						_tiles[x][y+1].status;//South Tile				}								// Checks the bottom border edge of tiles.				else if (y==max)				{					temp = 						_tiles[x-1][y].status +//West Tile						_tiles[x-1][y-1].status +//NorthWest Tile						_tiles[x][y-1].status +//North Tile						_tiles[x+1][y-1].status +//NorthEast Tile						_tiles[x+1][y].status;//East Tile				}						else				{					temp = 						_tiles[x][y-1].status +//North Tile						_tiles[x][y+1].status +//South Tile						_tiles[x+1][y].status +//East Tile						_tiles[x-1][y].status +//West Tile						_tiles[x-1][y-1].status +//NorthWest Tile						_tiles[x+1][y-1].status +//NorthEast Tile						_tiles[x+1][y+1].status +//SoutEast Tile						_tiles[x-1][y+1].status;  //SoutWest Tile				}				return temp;			}				/*						This startAutomation function performs a check on the four corner tiles,			the edge or border rows of tiles and the tiles inside the borders of the edge rows			(middle of the grid). This check is performed inside a nested for loop to ensure that			every tile in the 2-d array is checked. Once the check on tiles has been carried out 			there are some small if statements that apply the game of life's rules depeneding			on the status of the tile being checked. A for loop is then used at the end of the method to 			change the status of each tile accordingly in the 2-d array. 		*/		public function startAutomation():void		{			//trace('The start automation method from the World class has been called.');			var temp:int=0;			var max:int= _segments -1; // store the tiles to be checked at each check.			var x:int; // used in the outer loop			var y:int;  // used in the imnner loop			var tile:Tile; // a tile variable to store a refernce to a tile						for (x=0; x < _segments; x++)			{				for(y = 0; y < _segments; y++ )				{					// setting a refernece to a tileto the tiles in 					//the array _tiles @ x and y position					tile = _tiles[x][y];								// Checks the top left corner tile.					if (x==0 && y==0)					{    						temp =							_tiles[x+1][y].status +//East Tile							_tiles[x+1][y+1].status +//SoutEast Tile							_tiles[x][y+1].status;//South Tile					 }					 // Checks the top right corner tile.					else if (x==max && y==0)					{						temp =							_tiles[x-1][y].status +//West Tile							_tiles[x-1][y+1].status +  //SoutWest Tile							_tiles[x][y+1].status;//South Tile									}					// Checks the bottom right corner tile.					else if (x==max && y==max)					{						temp = 							_tiles[x][y-1].status +//North Tile							_tiles[x-1][y-1].status +//NorthWest Tile							_tiles[x-1][y].status;//West Tile					}					// Checks the bottom left corner tile.					else if (x==0 && y==max)					{						temp =							_tiles[x][y-1].status +//North Tile							_tiles[x+1][y-1].status +//NorthEast Tile							_tiles[x+1][y].status;//East Tile					}					// Checks the top border of edge tiles.					else if (y==0)					{						temp =							_tiles[x-1][y].status +//West Tile							_tiles[x-1][y+1].status +  //SoutWest Tile							_tiles[x][y+1].status +//South Tile							_tiles[x+1][y+1].status +//SoutEast Tile							_tiles[x+1][y].status;//East Tile					}					// Checks the right border edge of tiles.					else if (x==max)					{						temp =							_tiles[x][y-1].status +//North Tile							_tiles[x-1][y-1].status +//NorthWest Tile							_tiles[x-1][y].status +//West Tile							_tiles[x-1][y+1].status +  //SoutWest Tile							_tiles[x][y+1].status;//South Tile					}					// Checks the left border edge of tiles.					else if (x==0)					{						temp =											_tiles[x][y-1].status +//North Tile							_tiles[x+1][y-1].status +//NorthEast Tile							_tiles[x+1][y].status +//East Tile							_tiles[x+1][y+1].status +//SoutEast Tile							_tiles[x][y+1].status;//South Tile					}									// Checks the bottom border edge of tiles.					else if (y==max)					{						temp = 							_tiles[x-1][y].status +//West Tile							_tiles[x-1][y-1].status +//NorthWest Tile							_tiles[x][y-1].status +//North Tile							_tiles[x+1][y-1].status +//NorthEast Tile							_tiles[x+1][y].status;//East Tile					}							// Checks all the middle tiles.					else					{						temp = 							_tiles[x][y-1].status +//North Tile							_tiles[x][y+1].status +//South Tile							_tiles[x+1][y].status +//East Tile							_tiles[x-1][y].status +//West Tile							_tiles[x-1][y-1].status +//NorthWest Tile							_tiles[x+1][y-1].status +//NorthEast Tile							_tiles[x+1][y+1].status +//SoutEast Tile							_tiles[x-1][y+1].status;  //SoutWest Tile					}										// Checks the first rule of the game of life					// tile will die by lonliness.					if (tile.status==1 && temp < 2)					{						tile.nextStatus = 0;					}					// Checks the second rule of the game of life					// tile will die by overcrowding.					else if(tile.status==1 && temp > 3)					{						tile.nextStatus=0;					}					// Checks the third rule of the game of life					// tile will live on to next generation.					else if (tile.status==1 && temp == 2 || temp ==3)					{						tile.nextStatus=1;					}					// Checks the fourth rule of the game of life					// tile will live on to next generation.					else if (tile.status==0 && temp ==3)					{						tile.nextStatus=1;					}					else					{						tile.nextStatus=0;					}															_tiles[x][y].nextStatus=tile.nextStatus; // status here should be next,														 // problem with method is here???									} // end inner loop			} // end outer loop							// This loop is used to set the status of each tile in the 2-d array 			// according to the new next status.			for (x=0; x < _segments; x++)				{					for(y = 0; y < _segments; y++ )					{						_tiles[x][y].status=_tiles[x][y].nextStatus;					}				}			generation++;		}				/*			The load my presets method uses two for loops to populate a 			2-D array full of tiles, this will be called from the main class			when the user hits a preset selection button.		*/		public function loadMyPresets(presetContainer:Array):void		{			//trace('The load my presets method from the World class has been called.');						var i:int = generation = 0;			for (var x:int = 0; x < _segments; x++) 			{				for (var y:int = 0; y < _segments; y++) 				{					var tile:Tile = _tiles[x][y];					tile.status = presetContainer[i];					i++;				}				}		}				/*private function checkTileStatus():void		{			for(var i:int=0; i < _segments; i++)			{				for (var j:int=0; j < _segments; j++)				{					trace ("Tiles" + i + j + "Status" +  _tiles[[i][j]].status);				}			}		}		private function setTileStatus():void		{			for (var i:int=0; i < _segments; i++)			{				for (var j:int=0; j < _segments; j++)				{					_tiles[i][j].status = Math.round(Math.random() * 1);				}			}		}  */				//public function get generation():int { return generation }		//public function get temp():int { return temp; }	}}