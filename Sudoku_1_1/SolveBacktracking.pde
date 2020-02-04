public class SolveBacktracking {
  private int[][] sudokuNum = new int[9][9];
  private int[][] xNumLoc = new int[9][9];
  private int[][] yNumLoc = new int[9][9];
  private boolean correctVal = true;
  private float x;
  private float y;
  private float w;
  private float h;
  private int clickedButton = 0;
  private int[] rVal;
  private int[] cVal;
  private int count;
  private int printingVar = 0;
  private int[][] solvedSudokuNum = new int[9][9];
  
  public SolveBacktracking(Board board, Correct correct)  {
    sudokuNum = board.getSudokuNum();
    xNumLoc = board.getXNumLoc();
    yNumLoc = board.getYNumLoc();
    correctVal = correct.allCorrect();
  }
  
  public void updateSolveBacktracking(Board board, Correct correct) {
    sudokuNum = board.getSudokuNum();
    xNumLoc = board.getXNumLoc();
    yNumLoc = board.getYNumLoc();
    correctVal = correct.allCorrect();
  }
  
  public void drawSolveButton() {
    x = width/2;
    y = height * .95;
    w = width * 0.5;
    h = height * .066;
    pushStyle();  
    rectMode(CENTER);
    fill(200, 200, 200);
    rect(x, y, w, h);
    fill(0, 0, 0, 200);
    textSize(h*.9);
    text("Solve", .85*x, y+h*.25);
    popStyle();
  }
  
  public void clickingButton() {
    if (mousePressed == true) {
      if (mouseX > x - w*.5 && mouseX < x + w*.5 && mouseY > y - h*.5 && mouseY < y + h*.5)
        clickedButton++;
    }
  }
  
  public void setRValCVal() {
     //see how many places on the sudoku board are equal to 0 aka don't have a num put in them yet
    count = 81;
    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++) {
        for (int num = 1; num <= 9; num++) {
          if (sudokuNum[r][c] == num)
            count--;
        }
      }
    }
    
    //make an array that stores the coordinates of the places on the sudoku board that are equal to 0
    rVal = new int[count];
    cVal = new int[count];
    int i = 0;
    int tempVal = 0;
    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++) {
        for (int num = 1; num <= 9; num++) {
          if (sudokuNum[c][r] != num) 
            tempVal++;
        }
        int tempVal2 = tempVal;
        tempVal = 0;
        if (tempVal2 == 9) {
          rVal[i] = r;
          cVal[i] = c;
          i++;
        }
      }
    }
  }
      
    
  public void solve(Board board, Correct correct) {
    correct.updateCorrect(board);
    correctVal = correct.allCorrect();
    if (clickedButton > 0 && correctVal == true) {
      setRValCVal();
      int backToPreviousNum = 0;
      
      for (int j = 0; j < count; j++) { //go through every place that is equal to 0
        int numC = cVal[j];
        int numR = rVal[j];
        int printC = numC + 1;
        int printR = numR + 1; //<>//
        
        sudokuNum[numC][numR] = backToPreviousNum + 1;
        int num = sudokuNum[numC][numR];

        correctVal = true;
        board.setSudokuNum(numC, numR, num);
        correct.updateCorrect(board);
        correctVal = correct.allCorrect();
        
        if (correctVal == true && num <= 9) {
          solvedSudokuNum[numC][numR] = num;
          board.setSudokuNum(numC, numR, num);
          backToPreviousNum = 0;
          System.out.println("The value " + num + " at [" + printC + ", " + printR + "] works");
        }
        else if (correctVal == false && num < 9) {
          solvedSudokuNum[numC][numR] = num + 1;
          board.setSudokuNum(numC, numR, num + 1);
          backToPreviousNum++;
          int temp = num + 1;
          System.out.println("The value " + num + " at [" + printC + ", " + printR + "] doesn't work so I'm setting it to " + temp);
          j--;
        }
        else if (correctVal == false && num == 9) {
          int numPrevC = cVal[j-1];
          int numPrevR = rVal[j-1];
          int numPrev = sudokuNum[numPrevC][numPrevR];
          int printPrevC = numPrevC + 1;
          int printPrevR = numPrevR + 1;
      
          sudokuNum[numC][numR] = 0;
          board.setSudokuNum(numC, numR, 0);
          
          if (numPrev < 9) {
            board.setSudokuNum(numPrevC, numPrevR, numPrev + 1);
            backToPreviousNum = numPrev;
            int temp = numPrev + 1;
            System.out.println("The num " + num + " at [" + printC + ", " + printR + "] doesn't work so setting the num at [" + printPrevC + ", " + printPrevR + "] to " + temp);
            solvedSudokuNum[numC][numR] = 0; 
            solvedSudokuNum[numPrevC][numPrevR] = numPrev;
            j-=2;
          }
          else if (numPrev == 9) {
            int numPrev2C = cVal[j-2];
            int numPrev2R = rVal[j-2];
            int numPrev2 = sudokuNum[numPrev2C][numPrev2R];
            int printPrev2C = numPrev2C + 1;
            int printPrev2R = numPrev2R + 1;
          
            System.out.println("Thing");
            board.setSudokuNum(numPrevC, numPrevR, 0);
            board.setSudokuNum(numPrev2C, numPrev2R, numPrev2 + 1);
            backToPreviousNum = numPrev2;
            int temp = numPrev + 1;
            int temp1 = numPrev2 + 1;
            System.out.println("The num " + num + " at [" + printC + ", " + printR + "] doesn't work and the num " + temp + " at [" + printPrevC + ", " + printPrevR + "] is too high so setting the num at [" + printPrev2C + ", " + printPrev2R + "] to " + temp1);
            solvedSudokuNum[numC][numR] = 0; 
            solvedSudokuNum[numPrevC][numPrevR] = 0;
            solvedSudokuNum[numPrev2C][numPrev2R] = numPrev2;
            j-=3;
          }
        }
      }
    }
    else if (clickedButton > 0 && correctVal == false)
      System.out.println("The numbers you entered are not valid");
  }
  
  public void displaySolvingNums() {
    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++) {
        if (solvedSudokuNum[c][r] > 0) { 
          float xLoc = (c * (width/9) ) + (width/9) * .3;
          float yLoc = (r * (height*.9)/9) + ((height*.9)/9) * .8;
          float temp1 = c + 1;
          float temp2 = r + 1;
          
          pushStyle();
          fill(0, 0, 200);
          textSize((height*.9)/9 * .8);
          text(solvedSudokuNum[c][r], xLoc, yLoc);
          popStyle();
          //System.out.println("Printing " + sudokuNum[c][r] + " at [" + temp1 + ", " + temp2 + "] and at [" + xLoc + ", " + yLoc + "]");
        }
      }
    }
  }
}