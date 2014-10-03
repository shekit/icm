Planet planet;

void setup() {
  size(800,800, P3D);
  planet = new Planet(40, #f05a28, false);
}

void draw() {
  background(0);
  lights();
  planet.display(width/2, height/2,0);
}
