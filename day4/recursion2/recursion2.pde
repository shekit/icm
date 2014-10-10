//float r = 50;
//float x;
//float y;

void setup() {
   size(800,600);
   //x = width/2;
   //y = height/2;
     background(255);
  stroke(0);
  strokeWeight(2);
  //rotate(radians(mouseY));
  draw_branch(width/2,height,300,-90,0);
}

void draw() {

  
}


void draw_branch(float tx, float ty, float y, float rotation, int index){
  
  pushMatrix();
  translate(tx,ty);
  rotate(radians(index*rotation/2));
  line(0,0,0,-y);
  
  if(index<10){
     draw_branch(tx*0, -y, -y/2, rotation,index+1);
     draw_branch(tx*0, -y, -y/2, -rotation, index+1);
     draw_branch(tx*0, -y, -y/2, rotation,index+1);
     draw_branch(tx*0, -y, -y/2, -rotation, index+1);
  }
  
  popMatrix();
  
}
