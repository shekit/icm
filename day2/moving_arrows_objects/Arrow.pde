class Arrow {
 
  int w;
  int h;
  float x = 0;
  float y = 0;
  float translateX;
  float translateY;
  float translateZ;
  float speedX;
  float speedY = 1;
  color c;
  int scaleX = 1; // to flip the triangle
  
  Arrow(int tempW, int tempH, float tempTranslateX, float tempTranslateY, float tempSpeedX, color tempC){
      w = tempW;
      h = tempH;
      //x = w/2;  // to move center of arrow to 
      //y = h/2;
      translateX = tempTranslateX;
      translateY = tempTranslateY;
      speedX = tempSpeedX;
      c = tempC;
  }
  
  void setTranslateZ(float mouse){
     translateZ = mouse; 
  }
  
  void setTranslateX(float mouse){
     translateX = mouse; 
  }
  
  void display() {
      pushMatrix();
        translate(translateX, translateY, translateZ);  
        fill(c);
        pushMatrix();
          translate(x,y,0);
          scale(scaleX,1);   // to flip the triangle
          beginShape();
          vertex(-w/2,-h/2);
          vertex(w/2,0);
          vertex(-w/2,h/2);
          vertex(-5,0);
          endShape(CLOSE);
        popMatrix();
      popMatrix();
  }
  
  void move() {
     
    x = x + speedX;
    
    if(x>border || x<0){
        speedX *= -1;
        
        y += speedY;  // shift it down on y axis    
        
        scaleX *= -1;  // flip it on the x axis to turn around
    }
    
    if(y>border || y<0){
        speedY *= -1;
        
        y += speedY;
    }

  }
  
  
}
