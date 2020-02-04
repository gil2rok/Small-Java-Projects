public class SymbolColumn {
  private ArrayList<Symbol> symbolColumn = new ArrayList<Symbol>();
  private int skipping = 1;
  private int decreasingGreen = 255;
  private boolean stopDrawing = false;
  private int xLoc;

  public SymbolColumn(int x) {
    xLoc = x;
    Symbol symbol = new Symbol(xLoc, 0);
    symbol.setToRandomSymbol();
    symbolColumn.add(symbol);
  }

  public void updateSymbolColumn() {
    for (int i = 0; i < symbolColumn.size(); i++) {
      symbolColumn.get(i).moveDown(5);
      symbolColumn.get(i).render();
    }
  }

  public void makeAnotherSymbol() {
    if (stopDrawing == false) {
      int num = symbolColumn.size() - 1;
      int textSize = symbolColumn.get(num).getTextSize();
      int yVal = 20;
      if (symbolColumn.size() <= 1) 
        yVal = (int)(symbolColumn.get(num).getY() - (textSize * skipping));
      else if (symbolColumn.size() > 1)
        yVal = (int)(symbolColumn.get(num).getY() - (textSize * 0.55 * skipping));
      if (symbolColumn.get(num).getY() > textSize) {          //if below value
        if ( (int)random(14) < 9) {        //have a high chance of making a new symbol
          Symbol newSymbol = new Symbol(xLoc, yVal);
          newSymbol.setTextSize(textSize);
          newSymbol.setToRandomSymbol();
          symbolColumn.add(newSymbol);
          symbolColumn.get(num).setGreen(decreasingGreen);
          decreasingGreen-=0.5;

          skipping = 1;
          if (decreasingGreen == 0)
            stopDrawing = true;
        }
        skipping++;
      }
    }
  }
  
  public void removeSymbolFromArrayList() {
    for (int i = symbolColumn.size() - 1; i >= 0; i--) {
      if (symbolColumn.get(i).getY() <= 0)
        symbolColumn.remove(i);
    }
  }
  
  public int getSymbolYVal(int index) {
    return symbolColumn.get(index).getY();
  }
  
  public int getSize() {
    return symbolColumn.size();
  }
  
  public boolean finishedColumn() {
    return stopDrawing;
  }
}