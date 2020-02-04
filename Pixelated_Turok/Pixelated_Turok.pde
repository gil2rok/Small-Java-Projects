PImage turok;
PImage smaller;
int scl = 8;
int w;
int h;
 
void setup() {
  size(480, 360);
  turok = loadImage("turok1.jpg");
  w = turok.width/scl;
  h = turok.height/scl;
  smaller = createImage(w, h, RGB);
  smaller.copy(turok,0,0,turok.width,turok.height,0,0,w,h);
}

void draw() {
  smaller.loadPixels();
  for (int x = 0; x < w; x++) {
    for (int y = 0; y < h; y++) {
      int index = x + y * w;
      color c = smaller.pixels[index];
      noStroke();
      fill(c);
      rect(x*scl,y*scl, scl, scl);
    }
  }
  //image(turok, 0, 0);
  //image(smaller, 0, 0);
  
  noLoop();
}