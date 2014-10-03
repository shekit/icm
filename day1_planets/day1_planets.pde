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
  planet3 = new Planet(35, #166C15, true ,120,70,15, 0.6);
}

void draw() {
  background(0);
  //r += 0.0002;
  r += 0.02;
  r1 += 0.01;
  r2 += 0.02;
  r3 += 0.008;
  //r += r;
  lights();
  
  translate(width/2, height/2, mouseX);
  //rotateX(30);
  rotateX(radians(mouseY));
  sun.display(0,0,0);
    
    rotatePlanet(planet, 0, 200, 100, r);
    
    rotatePlanet(planet1, 0, 300, 200, r1);
    rotatePlanet(planet2, 0, 400, 300, r2);
    rotatePlanet(planet3, 0, 500, 400, r3);

    // pushMatrix();
    // rotateX(rotateX);
    //   float x = 200 * cos(r);
    //   float y = 350 * sin(r);
    //   translate(x1, y1,0);
    //   planet1.display(100, 50, 0);
    // popMatrix();
    
  
    // pushMatrix();
    // rotateZ(90);
    //   float x2 = 200 * cos(r);
    //   float y2 = 350 * sin(r);
    //   translate(x2, y2,0);
    //   planet2.display(100, 50, 0);
    // popMatrix();
    
    // pushMatrix();
    // rotateX(90);
    //   float x3 = 500 * cos(r);
    //   float y3 = 150 * sin(r);
    //   translate(x3, y3,0);
    //   planet3.display(100, 50, 0);
    // popMatrix();
  // pushMatrix();
  // //float x1 = 200 * cos(r);
  // //float y1 = 200 * sin(r/2);
  // translate(width/2,height/2,0);
  // rotate(radians(r));
  // planet.display(200,100, 0);
  // popMatrix();
  
  
  // pushMatrix();
  // translate(width/2, height/2,0);
  // planet1.display(100, 50, 0);
  // popMatrix();
  
  // pushMatrix();
  // translate(width/2, height/2,0);
  // planet2.display(150, 200, 0);
  // popMatrix();
  
  // pushMatrix();
  // translate(width/2, height/2,0);
  // planet3.display(70, 300, 0);
  // popMatrix();
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
