import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class main extends PApplet {


final int NORMAL_FRAMERATE = 30;
final int INPUT_FRAMERATE = 120;

final int WIDTH = 800;
final int HEIGHT = 600;

final int INCREMENT = 10;

final int X_CELLS = WIDTH/INCREMENT; // 80
final int Y_CELLS = HEIGHT/INCREMENT; // 60

float[][] matrix = new float[X_CELLS][Y_CELLS];
float[][] oldMatrix = new float[X_CELLS][Y_CELLS];

boolean drawMode = false;


public void setup()
{
  
  
  stroke(50,0,100);
  
  frameRate(NORMAL_FRAMERATE);

}


public void keyPressed()
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


public void getInputDrawing()
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


public void draw()
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


public void updateMatrix(int x, int y)
{    
  float nearCount = -1;
  
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
         if (
           oldMatrix[x][y] > 4
           && matrix[w][h] < 1
         )
         {
           matrix[w][y] += 0.2f;
         }
       }
     }
  }
  

  if (nearCount >= 25 && matrix[x][y] < 5)
  {
    matrix[x][y] ++;
  }
  else if (nearCount <= 24 && matrix[x][y] > 0)
  {
    matrix[x][y] --;
  }
  
}
  public void settings() {  size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "main" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
