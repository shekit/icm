class IronMan {
   PVector location; 
   PVector size;
   PVector hover_size;
   PVector speedY = new PVector(0,15);
   PVector downSpeed = new PVector(0,15);
   float max_speed;
   float max_down_speed = 15;
   WallCombo wall;
   float acceleration = 1;
   PVector acc = new PVector(0,0.5);
   PVector downAcc = new PVector(0,0.5);
   //PImage iron_man;
   PImage[] iron_man_flying = new PImage[2];
   PImage[] iron_man_hovering = new PImage[2];
  
   IronMan() {
      location = new PVector(40, height/2); 
      size = new PVector(100,34);
      hover_size = new PVector(62,87);
      max_speed = 15;
      
      for(int i =0;i<iron_man_flying.length;i++){
         String filename = "iron_man_flying" + nf(i,1) + ".png";
         iron_man_flying[i] = loadImage(filename);  
      } 
      
      for(int i=0;i<iron_man_hovering.length;i++) {
         String filename = "iron_man_hover" + nf(i,0) + ".png"; 
         iron_man_hovering[i] = loadImage(filename);
      }
   }
   
   
   void display() {
     
     if(frameCount%30>0 && frameCount%30 <15){
         image(iron_man_flying[0], location.x, location.y, size.x, size.y);
     } else {
         image(iron_man_flying[1], location.x, location.y, size.x, size.y);
     }

   }
   
   void display_hover() {
     
     if(frameCount%60>0 && frameCount%60<30){
       image(iron_man_hovering[0], location.x, location.y, hover_size.x, hover_size.y);
     } else {
       image(iron_man_hovering[1], location.x, location.y, hover_size.x, hover_size.y);
     }
   }
   
   void moveUp() {
      speedY.add(acc);
      speedY.limit(max_speed);
      //move_speed += acceleration;
      //move_speed = constrain(move_speed,10,20);
      //location.y -= move_speed;
      location.sub(speedY);
      
      if(location.y < 0){
          location.y = 0;
      }
   }
   
   void moveDown() {
      //setMoveSpeed(10);
      downSpeed.add(downAcc);
      downSpeed.limit(max_down_speed);
      location.add(downSpeed);
      //move_speed += acceleration;
      //move_speed = constrain(move_speed,10,20);
      //location.y += move_speed;
  
      if(location.y > height - size.y){
         location.y = height - size.y; 
      }
   }
   
   boolean collision(WallCombo tempWall) {
     wall = tempWall;
       
       // find distance between man and wall
       float manX = location.x + size.x; // find leading edge of the man
       float wallX = wall.location.x;    // find trailing edge of the wall
       float d = dist(manX,0,wallX,0);  // find distance between man and edge
       //println("DISTANCE: "+ d);
       // check points along entire height of wall leaving the gap
       if((location.y < wall.gap_top() || location.y > wall.gap_bottom()) && (d==0)){
          return true;
       }
       
       return false;
   }
   
    void setY(float tempY) {
    location.y = tempY; 
 }
 
 void setDownSpeed(float tempY) {
       downSpeed.y = tempY; 
    }
  
}
