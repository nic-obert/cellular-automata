
final byte NORMAL_FRAMERATE = 30;
final byte INPUT_FRAMERATE = 120;

final int WIDTH = 800;
final int HEIGHT = 600;

final byte INCREMENT = 5;

final int X_CELLS = WIDTH/INCREMENT;
final int Y_CELLS = HEIGHT/INCREMENT;

int[][] matrix = new int[X_CELLS][Y_CELLS];
int[][] oldMatrix = new int[X_CELLS][Y_CELLS];

boolean drawMode = false;


void setup()
{
    size(800, 600);
    
    stroke(50,0,100);
    
    frameRate(NORMAL_FRAMERATE);
}


void keyPressed()
{
    // d as for draw
    if (key == 'd')
    {
		drawMode = !drawMode;
		
		if (drawMode)
		{
			frameRate(INPUT_FRAMERATE);
			println("Draw mode activated");
		}
		else
		{
			frameRate(NORMAL_FRAMERATE);
			println("Draw mode deactivated");
		}
					
		delay(300);
    }
    else if (key == 'c') // clear
    {
        println("Clear canvas");
        matrix = new int[X_CELLS][Y_CELLS];
        oldMatrix = new int[X_CELLS][Y_CELLS];
        
        update();
    }
}


void getInputDrawing()
{
    if (mousePressed)
    {
        int x = mouseX / INCREMENT;
        int y = mouseY / INCREMENT;
        
        if (
            x > -1 && x < X_CELLS
            && y > -1 && y < Y_CELLS
            && matrix[x][y] < 5
            )
        {
            matrix[x][y] ++;
            oldMatrix[x][y] ++;
            
            fill(matrix[x][y] * 50);
            rect(x * INCREMENT, y * INCREMENT, INCREMENT, INCREMENT);
        }
    }
}


void update()
{
    for (int x = 0; x != X_CELLS; x++)
	{
		for (int y = 0; y != Y_CELLS; y++)
		{
			updateMatrix(x, y);
			
			fill(oldMatrix[x][y] * 50);
			rect(x * INCREMENT, y * INCREMENT, INCREMENT, INCREMENT);
			
			oldMatrix[x][y] = matrix[x][y];
		}
	}
}


void draw()
{
    if (drawMode)
    {
        getInputDrawing();
    }
    else
    {
        update();
    }
}


void updateMatrix(int x, int y)
{        
    int nearCount = oldMatrix[x][y] * -1;
    
    for (int w = x-1; w != x+2; w++)
    {
		for (int h = y-1; h != y+2; h++)
		{
			if (
				w > -1 && h > -1 
				&& w < X_CELLS && h < Y_CELLS
				)
			{
				nearCount += oldMatrix[w][h];
			}
		}
    }
    

	rule5(nearCount, x, y);
    
}

