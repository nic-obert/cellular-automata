
final int NORMAL_FRAMERATE = 20;
final int INPUT_FRAMERATE = 120;

final int WIDTH = 800;
final int HEIGHT = 600;

final int INCREMENT = 10;

final int X_CELLS = WIDTH/INCREMENT; // 80
final int Y_CELLS = HEIGHT/INCREMENT; // 60

byte[][] matrix = new byte[X_CELLS][Y_CELLS];
byte[][] oldMatrix = new byte[X_CELLS][Y_CELLS];

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


void draw()
{
  if (drawMode)
  {
    getInputDrawing();
  }
  else
  {
  
    for (int x = 0; x != X_CELLS; x++)
    {
      for (int y = 0; y != Y_CELLS; y++)
      {
        updateMatrix(x, y);
        
        //println(matrix[x][y] * 50);
        
        fill(oldMatrix[x][y] * 50);
        rect(x * INCREMENT, y * INCREMENT, INCREMENT, INCREMENT);
        
        oldMatrix[x][y] = matrix[x][y];
        
      }
    }
    
  }
}


void updateMatrix(int x, int y)
{    
  float nearCount = -8;
  
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
         if (oldMatrix[x][y] > 4 && oldMatrix[w][h] < 5)
         {
           matrix[w][y] ++;
         }
       }
     }
  }
  

  if (nearCount >= 15 && oldMatrix[x][y] < 5)
  {
    matrix[x][y] ++;
  }
  else if (nearCount <= 10 && oldMatrix[x][y] > 0)
  {
    matrix[x][y] --;
  }
  
}
