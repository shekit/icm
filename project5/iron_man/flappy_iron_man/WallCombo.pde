class WallCombo {
   
  float[] wall_sizes = {50,75,100,125,150,175,200,225,250,275,300,325,350,375};
  float gap_size = 200;
  PVector size;
  PVector location;
  PVector speed = new PVector(5,0);
  PVector rectEnd = new PVector(5,30);
  color c = #DC1405;
  
  WallCombo(float tempX){
      
      float wall_size = wall_sizes[int(random(wall_sizes.length))];
      float wall_width = 70;
      size = new PVector(wall_width, wall_size);
      location = new PVector(tempX,0);
}

  void setSpeed(float tempX){
     speed.x = tempX; 
  }
  
  void display() {
      fill(c);
      
      rect(location.x,0,size.x, size.y);
      // drawing end of rect
      rect(location.x-(rectEnd.x),size.y-rectEnd.y,size.x+(rectEnd.x*2),rectEnd.y);
      //draw lower rect based on gap size
      rect(location.x,size.y+gap_size,size.x,height-size.y-gap_size);
      
      //draw end of lower rect
      rect(location.x-(rectEnd.x),size.y+gap_size,size.x+(rectEnd.x*2),rectEnd.y);
  }
  
  void move() {
     location.sub(speed);
  }
  
  float gap_top(){
    return size.y;
  }
  
  float gap_bottom() {
    return size.y+gap_size;
  }
  
  float get_wall_width() {
     return size.x; 
  }
  
  void setColor(color tempC){
     c = tempC; 
  }
  
}
