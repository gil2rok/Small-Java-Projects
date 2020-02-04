public class xyLocations {
  public int x;
  public int y;
  public String toString() {
    return "[" + x + ", " + y + "]";
  }
}

public class drawNumArr {
  public int numVal; //actual num values
  public int xNumLoc; //x location
  public int yNumLoc; //y location
  
  public int getNumVal() {
    return numVal;
  }
}

public class Board {
  //board property variables
  private float xSide = width/9;
  private float ySide = (height*.9)/9;
  private float xStartCenter = xSide/2;
  private float yStartCenter = ySide/2;
  private float xEnd = 9*xSide;
  private float yEnd = 9*ySide;

  //finding the x and y locations of the box the mouse is in
  private boolean clicked = false;

  //creating the matrix array of all the x y coordinates of each box. VERY IMPORTANT!
  private xyLocations[][] boxLocationArr = new xyLocations[9][9]; //[x num box][y num box]
  private int xBoxLocation;
  private int yBoxLocation;

  private int xBoxGridCoor;
  private int yBoxGridCoor;
  
  //coordinates for drawing the numbers on screen
  private drawNumArr[][] drawNumArr = new drawNumArr[9][9];

  //initializes everything
  public Board() {
    for (int row = 0; row < 9; row++) {
      for (int col = 0; col < 9; col++) {
        boxLocationArr[col][row] = new xyLocations();
        boxLocationArr[col][row].x = (int)(col*xSide);
        boxLocationArr[col][row].y = (int)(row*ySide);
        
        drawNumArr[row][col] = new drawNumArr();
      }
    }
  }

  //draws the board by drawing first squares with thin lines and then a few thick lines to make it have the usual sodoku look
  public void drawBoard() {
    pushStyle();
    noFill();
    strokeWeight(2);
    background(139, 69, 19);

    for (int col = 0; col < 9; col++) { //draw square
      for (int row = 0; row < 9; row++) {
        rect(row*xSide, col*ySide, xSide, ySide);
      }
    }  
    strokeWeight(7); 
    for (int i = 0; i < 4; i++) { //draw thick lines
      line(0, 3*i*ySide, xEnd, (3*i*ySide));
      line(3*i*xSide, 0, 3*i*xSide, yEnd);
    }
    popStyle();
  }

  //prints out the x and y locations of each box
  public String toString() {
    String s = "Matrix: 9 x 9" + "\n";
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        s += boxLocationArr[j][i] + " ";
      }
      s += "\n";
    }
    return s;
  }
  
  //If mouse is clicked, determines which box the mouse is in.
  //Pass the x and y grid coordinates of that box to the variables xBoxGridCoor and yBoxGridCoor
  //Pass the x and y location coordinates of that box to the variables xBoxLocation and yBoxLocation
  //Sets the value of x and y coordinates in the drawNumArr. This basically gives the x and y coordinates for the numbers that will be drawn
  //Also prints out the x and y grid coordinates by adding 1 to the x and y grid coordinates
  public void mouseInBox(boolean clicked) {
    if (clicked == true) {
      for (int i = 0; i <9; i++) {
        for (int j = 0; j < 9; j++) {
          if ( mouseX > boxLocationArr[j][i].x && mouseX < boxLocationArr[j][i].x + xSide) {
            if (mouseY > boxLocationArr[j][i].y && mouseY < boxLocationArr[j][i].y + ySide) {
              xBoxLocation = (int)boxLocationArr[j][i].x;
              yBoxLocation = (int)boxLocationArr[j][i].y;
              xBoxGridCoor = j;
              yBoxGridCoor = i;
              
              drawNumArr[xBoxGridCoor][yBoxGridCoor].xNumLoc = (int)(xBoxLocation + xSide * .3);
              drawNumArr[xBoxGridCoor][yBoxGridCoor].yNumLoc = (int)(yBoxLocation + ySide * .8);
              
              int tempX = j + 1;
              int tempY = i + 1;
              System.out.println("X: " + tempX + " " + "Y: " + tempY);
            }
          }
        }
      }
      clicked = false;
    }
  }

  //If a key 1-9 is pressed, set the value of drawNumArr at that box's x and y location as that key
  public void arrayToDrawNum() {
    int num = 0;
    if (key == '1')
      num = 1;
    if (key == '2')
      num = 2;    
    if (key == '3')
      num = 3;  
    if (key == '4')
      num = 4;
    if (key == '5')
      num = 5;
    if (key == '6')
      num = 6;
    if (key == '7')
      num = 7;
    if (key == '8')
      num = 8;
    if (key == '9')
      num = 9;
    
    if (num > 0.0 && keyPressed == true) {
      drawNumArr[xBoxGridCoor][yBoxGridCoor].numVal = num;
    }
  }
  
  //add if key released statement to fix problem
  public void drawNum() {
    fill(139, 69, 19);
    arrayToDrawNum();
    textSize(ySide * .8);
    for (int col = 0; col < 9; col++) {
      for (int row = 0; row < 9; row++) {
        if (drawNumArr[row][col].numVal != 0.0)
          fill(255, 255, 255);
        text((int)drawNumArr[row][col].numVal, drawNumArr[row][col].xNumLoc, drawNumArr[row][col].yNumLoc);
      }
    }
  }
  
  public void setSudokuNum(int col, int row, int val) {
    drawNumArr[col][row].numVal = val;
  } 
  
  public int[][] getSudokuNum() {
    int[][] sudokuNum = new int[9][9];
    for (int col = 0; col < 9; col++) {
      for (int row = 0; row < 9; row++) {
        sudokuNum[row][col] = (int)drawNumArr[row][col].getNumVal();
      }
    }
    return sudokuNum;
  }
  
  /*public int[] getSudokuNum1DArr() {
    int[] sudokuNum = new int[81];
    int i = 0;
    for (int col = 0; col < 9; col++) {
      for (int row = 0; row < 9; row++) {
        sudokuNum[i] = (int)drawNumArr[row][col].getNumVal();
        i++;
      }
    }
    return sudokuNum;
  }*/
  
  public int[][] getXNumLoc() {
    int[][] xNumLoc = new int[9][9];
    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++) {
        xNumLoc[c][r] = (int)boxLocationArr[c][r].x;
      }
    }
    return xNumLoc;
  }
  
  public int[][] getYNumLoc() {
    int[][] yNumLoc = new int[9][9];
    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++) {
        yNumLoc[c][r] = (int)boxLocationArr[c][r].y;
      }
    }
    return yNumLoc;
  }
}