float x;
float y;
float px;
float py;
float speedX = 0.4;
float speedY = 1;
float border = 40;
int scaleX = 1;

void setup() {
  size(800,600);
  x = width/2;
  y = height/2;
  px=15;
  py=5;
}

void draw() {
  background(0);
  
  translate(x,y);
  fill(255);
  pushMatrix();
  translate(px,py);
  beginShape();
  scale(scaleX,1);
  vertex(0,0);
  vertex(30,5);
  vertex(0,10);
  vertex(5,5);
  endShape(CLOSE);
  popMatrix();
  
  // increase x speed
  px = px + speedX;
  
  
  if(px>border || px < 0){
      speedX *= -1; 
      
      //increment y by 1 everytime it hits the edge so it moves down or up
      py += speedY;
      
      scaleX *= -1;
  }
  
  if(py>border || py < 0){
    //change y speed 
    speedY *= -1;
     
     // apply y speed
     py += speedY;
  }
  // if(py>border+.1 || py < 0.1){
  //    py -= 1; 
  // }
  
  println(px);
  println(py);
  
}
