class Ground extends Cloud {
  
  PVector size;
 
  Ground(float tempX, float tempY, float tempW, float tempH) {
     super(tempX, tempY);
     img = loadImage("ground.jpg");
     location = new PVector(tempX, tempY);
     speed = new PVector(5,0);
     size = new PVector(tempW, tempH);
  }
  
  void display(){
     image(img, location.x, location.y, size.x, size.y);  
  }
  
  void setSpeed(float tempX) {
     speed.x = tempX; 
  }
}
