Planet sun;
Planet planet;
Planet planet1;
Planet planet2;
Planet planet3;
//float r = 0.0002;
float r = 0;
float r1 = 0;
float r2 = 0;
float r3 = 0;

void setup() {
  size(1200,800,P3D);
  sun = new Planet(60, #E8D821, false, 0 , 0 ,0 ,0);
  planet = new Planet(40, #f05a28, true ,90,50,10, 0.4);
  planet1 = new Planet(30, #79180F, true ,70,60,5, 0.2);
  planet2 = new Planet(20, #6B68DB, true ,50,30,4, 0.8);
  planet3 = new Planet(35, #166C15, true ,80,50,15, 0.6);
}

void draw() {
  background(0);
  r += 0.02;
  r1 += 0.01;
  r2 += 0.02;
  r3 += 0.008;
  lights();
  // map translate z to mouse x to zoom in and out
  translate(width/2, height/2, mouseX);
  
  // allow to pan over and under based on y axis
  rotateX(radians(mouseY));
  sun.display(0,0,0);
    
    // write function for planet, perhaps can make sun a planet and other planets its moons in the future
    rotatePlanet(planet, 0, 200, 100, r);
    rotatePlanet(planet1, 0, 300, 200, r1);
    rotatePlanet(planet2, 0, 400, 300, r2);
    rotatePlanet(planet3, 0, 500, 400, r3);

  
}


void rotatePlanet(Planet p, float protateX, int orbit_w, int orbit_h, float angle_increment) {
    pushMatrix();
    rotateX(protateX);
      noFill();
      stroke(255,30);
      ellipse(0,0, orbit_w*2,orbit_h*2);
      float px = orbit_w * cos(angle_increment);
      float py = orbit_h * sin(angle_increment);
      
      p.display(px, py, 0);
    popMatrix();
  
}
