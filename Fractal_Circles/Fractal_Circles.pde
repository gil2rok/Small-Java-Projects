void setup() {
  fullScreen();
  background(255);
  circle(width/2, 700);
}

void circle(float xLoc, float size) {
  float temp = Math.abs(xLoc - width/2);
  float temp2 = map(temp, 0, width/2, 0, 255);
  fill(temp2, 50, 50, 90);
  ellipse(xLoc, height/2, size, size);
  if (size > 15) {
    circle(xLoc + size * 1.5, size * .7);
    circle(xLoc - size * 1.5, size * .7);
  }
}
    