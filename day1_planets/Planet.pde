class Planet {
  
  int radius;
  color c;
  float orbit_radius;
  float angle;
  boolean has_moon;
  int num_moons;
  float translateX;
  float translateY;
  float translateZ;
  float rotate_speed;
  
  
  Planet(int tempRadius, color tempC, boolean tempHasMoon) {
     radius = tempRadius;
     c = tempC;
  }
  
  void display(float tempTranslateX, float tempTranslateY, float tempTranslateZ) {
     translateX = tempTranslateX;
     translateY = tempTranslateY;
     translateZ = tempTranslateZ;
     pushMatrix();
     translate(translateX,translateY,translateZ);
     fill(c);
     noStroke();
     sphere(radius);
     popMatrix();
  }
  
  
  
}
