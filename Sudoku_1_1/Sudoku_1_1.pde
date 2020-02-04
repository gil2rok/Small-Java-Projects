xyLocations locations;
Board board;
boolean clicked = false;
Correct correct;
SolveBacktracking solving;

void setup() {
  size(1000, 1000);
  locations = new xyLocations();
  board = new Board();
  correct = new Correct(board);
  solving = new SolveBacktracking(board, correct);
}

void draw() {
  board.drawBoard();
  board.drawNum();
  correct.updateCorrect(board);
  correct.allCorrect();
  solving.updateSolveBacktracking(board, correct);
  solving.drawSolveButton();
  solving.clickingButton();
  solving.solve(board, correct);
  solving.displaySolvingNums();
}

public void mouseClicked() {
  clicked = true;
  board.mouseInBox(clicked);
}