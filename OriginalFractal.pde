//https://processing.org/examples/star.html
void setup() {
  size(600, 600);
  background(0);
}

void draw() {
  background(0);
  translate(width / 2, height / 2);

  int numStars = 160;
  float angle = 0;
  float radius = 0;

  for (int i = 0; i < numStars; i++) {
    pushMatrix();
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;
    translate(x, y);
    rotate(frameCount / -100.0 + angle);
    star(0, 0, 10, 30, 5);
    noFill();
    stroke(0, 150, 0);
    popMatrix();
    
    angle += 0.2;
    radius += 2.5;
  }
}
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle / 2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a + halfAngle) * radius1;
    sy = y + sin(a + halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
