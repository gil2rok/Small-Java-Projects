float angleY = 0;
float angleX = 0;
ArrayList<PVector> vectors = new ArrayList<PVector>();
float beta = 0;

void setup() {
  size(1000, 1000, P3D);
}

void draw() {
  background(19, 19, 19);
  translate(width/2, height/2);
  rotateY(angleY);
  rotateX(angleX);
  angleY += 0.03;
  angleX += 0.0007;
  
   /*//SHAPE 1
  float r = 130*(0.8 + 1.6 * sin(6*beta));
  float theta = 2 * beta;
  float phi = 0.6 * PI * sin(12 *beta); 
  float x = r * cos(phi) * cos(theta);
  float y = r * cos(phi) * sin(theta);
  float z = r * sin(phi);*/

   /* //SHAPE 2
  float x = 41*cos(beta) - 18*sin(beta) - 83*cos(2*beta) - 83*sin(2 * beta) - 11*cos(3 * beta) + 27*sin(3 * beta);
  float y = 36*cos(beta) + 27*sin(beta) - 113*cos(2 * beta) + 30*sin(2 * beta) + 11*cos(3 * beta) - 27*sin(3 * beta);
  float z = 45*sin(beta) - 30*cos(2 * beta) + 113*sin(2 * beta) - 11*cos(3 * beta) + 27*sin(3 * beta);*/
  
  //SHAPE 3
  float nmeridian  = 8;
  float nlongitude = 11;
  float x = 200 * ( cos(beta) * (1 + cos(nlongitude*beta/nmeridian) / 2.0) );
  float y = 200 * ( sin(beta) * (1 + cos(nlongitude*beta/nmeridian) / 2.0) );
  float z = 200 * (sin(nlongitude*beta/nmeridian) / 2.0 ); 
  
  /*SHAPE 4
  float x = sin(beta)*500;
  float y = 78*cos(beta)*cos(beta);
  float z = 400*cos(beta*beta);*/
  
  /*//ShAPE 5
  float x = 300*beta;
  float phrase1 = (float)Math.abs(0.5*x);
  float phrase2_5 = (float)Math.pow( Math.abs( Math.abs(x) - 2) - 1, 2);
  float phrase2 = (float)Math.sqrt(1- phrase2_5);
  float phrase3 = -(1/112)*(3*(float)Math.sqrt(33)-7)*x*x);
  float y1 = 0.5 * (phrase1 + phrase2 + phrase3;*/
  
  vectors.add(new PVector(x, y, z));
  beta += 0.05;
  noFill();
  stroke(255);
  strokeWeight(45);
  beginShape();
  for (PVector v : vectors) {
    vertex(v.x, v.y, v.z);
    stroke(v.x, v.y, v.z);
  }
  endShape();
} 