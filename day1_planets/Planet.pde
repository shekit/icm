class Planet {
  
  int radius;
  color c;
  float orbit_width;
  float orbit_height;
  float angle = 0;
  float angle_increment;
  boolean has_moon;
  int num_moons;
  float translateX;
  float translateY;
  float translateZ;
  float rotate_speed;
  float moon_radius;
  
  
  Planet(int tempRadius, color tempC, boolean tempHasMoon, float tempOrbitWidth, float tempOrbitHeight, float tempMoonRadius, float tempAngleIncrement) {
     radius = tempRadius;
     c = tempC;
     has_moon = tempHasMoon;
     orbit_width = tempOrbitWidth;
     orbit_height = tempOrbitHeight;
     moon_radius = tempMoonRadius;
     angle_increment = tempAngleIncrement;
  }
  
  // void setAngleIncrement(float tempAngle){
  //     angle_increment = tempAngle;
  // }
  
  void display(float tempTranslateX, float tempTranslateY, float tempTranslateZ) {
     translateX = tempTranslateX;
     translateY = tempTranslateY;
     translateZ = tempTranslateZ;
     pushMatrix();
     translate(translateX,translateY,translateZ);
     fill(c);
     noStroke();
     sphere(radius);
       if(has_moon) {
         this.display_moons(moon_radius, orbit_width, orbit_height);
       }
       
     popMatrix();
  }
  
  void display_moons(float tempMoonRadius, float tempOrbitWidth, float tempOrbitHeight){ 
     angle  += angle_increment;
     pushMatrix();
     stroke(255,50);
     strokeWeight(1);
     noFill();
     rotateX(radians(angle));
     rotateY(radians(angle/2));
     ellipse(0,0,tempOrbitWidth*2, tempOrbitHeight*2);
     println(tempOrbitWidth*3);
     
       pushMatrix();
       float x = tempOrbitWidth * cos(angle/8);
       float y = tempOrbitHeight * sin(angle/8);
       translate(x, y,0);
       fill(200);
       sphere(tempMoonRadius);
       
       popMatrix();
     popMatrix();
  }
  
  
}
