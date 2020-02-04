public class Correct {
  private int[][] sudokuNum = new int[9][9];
  
  public Correct(Board board)  {
    int[][] temp = board.getSudokuNum();
    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++)
        sudokuNum[r][c] = temp[r][c];
    }
  }
  
  public void updateCorrect(Board board) {
    int[][] temp = board.getSudokuNum();
    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++)
        sudokuNum[r][c] = temp[r][c];
      //System.out.print(sudokuNum[i]);
    }
    //System.out.println();
    
    verticalCorrect();
    horizontalCorrect();
    boxCorrect();
  }
  
  public boolean horizontalCorrect() {
    for (int c = 0; c < 9; c++) {
      int[] temp = new int[9];
      for (int r = 0; r < 9; r++) {
        temp[r] = sudokuNum[r][c];
      }
      for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
          if (i != j) {
            if (temp[i] > 0 && temp[j] > 0) {
              if (temp[i] == temp[j]) {
                //System.out.println("Horizontal Correct is false");
                return false;
              }
            }
          }
        }
      }
    }          
    return true;
  }
  
  public boolean verticalCorrect() {
    for (int r = 0; r < 9; r++) {
      int[] temp = new int[9];
      for (int c = 0; c < 9; c++) {
        temp[c] = sudokuNum[r][c];
      }
      for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
          if (i != j) {
            if (temp[i] > 0 && temp[j] > 0) {
              if (temp[i] == temp[j]) {
                //System.out.println("Vertical Correct is false");
                return false;
              }
            }
          }
        }
      }
    }          
    return true;
  }
  
  public boolean boxCorrect() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        int[][] temp = new int[3][3];
        for (int r = 0; r < 3; r++) {
          for (int c = 0; c < 3; c++) {
            temp[r][c] = sudokuNum[3*i + r][j*3 + c];
          }
        }
        for (int k = 0; k < 3; k++) {
          for (int l = 0; l < 3; l++) {
            for (int m = 0; m < 3; m++) {
              for (int n = 0; n < 3; n++) {
                if (k != m && l != n) {
                  if (temp[k][l] > 0 && temp[m][n] > 0) {
                    if (temp[k][l] == temp[m][n]) {
                      //System.out.println("Box Correct is false");
                      return false;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    return true;
  }
 
  public boolean allCorrect() {
    if (verticalCorrect() == false || horizontalCorrect() == false || boxCorrect() == false)
      return false;
    else
      return true;
  }
}