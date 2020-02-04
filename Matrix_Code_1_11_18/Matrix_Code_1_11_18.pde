AllSymbols matrix;
//SymbolColumn symbolCol;

void setup() {
  fullScreen();
 //size(1000, 1000);
 matrix = new AllSymbols();
 //symbolCol = new SymbolColumn(width/2);
}

void draw() {
  background(0);
  //symbolCol.updateSymbolColumn();
  //symbolCol.makeAnotherSymbol();
  //symbolCol.removeSymbolFromArrayList();
  matrix.updateAllSymbols();
  matrix.removeSymbolColFromArrayList();
}