public class Symbol {
  private int x;
  private int y;
  private String val;
  private int textSize;
  private int red = 0;
  private int green = 255;
  private int blue = 70;
  private int alpha = 200;
  
  public Symbol(int xLoc, int yLoc) {
    this.x = xLoc;
    this.y = yLoc;
    textSize = (int)random(15, 23);
  }
  
  /*public String fromCharCode(int... codePoints) {
    return new String(codePoints, 0, codePoints.length);
  }
  
  public void setToRandomSymbol() {
    int temp = (int)random(96);
    this.val = fromCharCode(0x30A0 + temp);
  }*/
  
  public void setToRandomSymbol() {
    int temp = (int)random(0, 9);
    this.val = str(temp);
  }
  
  public void moveDown(int y) {
    this.y += y;
  }
 
  public void render() {
    pushStyle();
    fill(red, green, blue, alpha);
    textSize(textSize);
    text(this.val, this.x, this.y);
    popStyle();
  }
  
  public int getY() {
    return this.y;
  }
  
  public int getTextSize() {
    return textSize;
  }
  
  public void setTextSize(int size) {
    textSize = size;
  }
  
  public void setRed(int redColor) {
    red = redColor;
  }
  
  public void setGreen(int greenColor) {
    green = greenColor;
  }
  
  public void setBlue(int blueColor) {
    blue = blueColor;
  }
  
  public void setAlpha(int alphaVal) {
    alpha = alphaVal;
  }
    
}
