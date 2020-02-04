public class AllSymbols {
  private ArrayList<SymbolColumn> allSymbols = new ArrayList<SymbolColumn>();
  private int randomXLoc;
  private SymbolColumn newCol;
  private int numCols = 0;
  
  public AllSymbols() {
    SymbolColumn col1 = new SymbolColumn(20);
    allSymbols.add(col1);
  }
  
  public void updateAllSymbols() {
    randomXLoc = (int)random(width);
    int symbolColFrequency = (int)random(100);
    if (symbolColFrequency < 7 && numCols < 10) {
      newCol = new SymbolColumn(randomXLoc);
      allSymbols.add(newCol);
      System.out.println("Making A New Symbol");
      numCols++;
    }
    for (int i = 0; i < allSymbols.size(); i++) {
      allSymbols.get(i).updateSymbolColumn();
      allSymbols.get(i).makeAnotherSymbol();
      allSymbols.get(i).removeSymbolFromArrayList();
    }
  }
  
  public void removeSymbolColFromArrayList() {
    for (int i = allSymbols.size() - 1; i >= 0; i--) {
      SymbolColumn symbolCol = allSymbols.get(i); //<>//
      int num = symbolCol.getSize() - 1;
      boolean finishedCol = symbolCol.finishedColumn();
      if (allSymbols.get(i).getSymbolYVal(num) >= height && finishedCol == true) //the entire matrix of nums-->take a symbol column represented by i --> take the last symbol represnted by num --> take it's y value 
        allSymbols.remove(i);
        numCols--;
    }
    System.out.println(allSymbols.size());
    System.out.println(numCols);
  }
}