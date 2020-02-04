float l1 = 200;
float l2 = 200;
float l3 = 200;

float m1 = 40;
float m2 = 40;
float m3 = 40;

float a1 = PI/2;
float a2 = PI/3;
float a3 = PI/4;

float a1v = 0;
float a2v = 0;
float a3v = 0;

float a1a;
float a2a;
float a3a;

float g = 1;
ArrayList<Float> xPos = new ArrayList<Float>();
ArrayList<Float> yPos = new ArrayList<Float>();


void setup() {
  size(900, 900);
}

void draw() {
  translate(width/2, 50);
  background(255);
  stroke(0);
  fill(0);
  strokeWeight(2);
  
  a1a = a1A();
  a2a = a2A();
  a3a = a3A();

  float y1 = (l1/2) * cos(a1);
  float y2 = l1 * cos(a1) + (l2/2) * cos(a2);
  float y3 = l1 * cos(a1) + l2 * cos(a2) + (l3/2) * cos(a3);
  float x1 = (l1/2) * sin(a1);
  float x2 = l1 * sin(a1) + (l2/2) * sin(a2);
  float x3 = l1 * sin(a1) + l2 * sin(a2) + (l3/2) * sin(a3);
  
  xPos.add(x3);
  yPos.add(y3);
  
  line(0, 0, x1, y1);
  ellipse(x1, y1, m1, m1);

  line(x1, y1, x2, y2);
  ellipse(x2, y2, m2, m2);
  
  line(x2, y2, x3, y3);
  ellipse(x3, y3, m3, m3);

  a1v += a1a;
  a2v += a2a;
  a3v += a3a;
  a1 += a1v;
  a2 += a2v;
  a3 += a3v;

  // a1_v *= 0.99;
  // a2_v *= 0.99;
  
  if (frameCount > 1) {
    for (int i = 0; i < xPos.size() - 1; i++)
      line(xPos.get(i), yPos.get(i), xPos.get(i+1), yPos.get(i+1));
  }
}

float a1A() {
  -1*(2*(((l3*l3)*(m3*m3)*sin(2*a1-2*a3)(4
}

float a2A() {
  float num1 = 2 * sin(a1-a2);
  float num2 = (a1v*a1v*l1*(m1+m2));
  float num3 = g * (m1 + m2) * cos(a1);
  float num4 = a2v*a2v*l2*m2*cos(a1-a2);
  float den = l2 * (2*m1+m2-m2*cos(2*a1-2*a2));
  float a2_a = (num1*(num2+num3+num4)) / den;
  return a2_a;
}

float a3A() {
  return 0;
}