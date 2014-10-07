//float r = 50;
//float x;
//float y;

void setup() {
   size(800,600);
   //x = width/2;
   //y = height/2;
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(2);
  //rotate(radians(mouseY));
  draw_branch(width/2,height,300,0,10);
  
}


void draw_branch(float tx, float ty, float y, float rotation, int index){
  
  pushMatrix();
  translate(tx,ty);
  rotate(radians(rotation));
  line(0,0,0,-y);
  
  if(index>2){
     draw_branch(tx*0, -y, -y/2, rotation-45,index-1);
     draw_branch(tx*0, -y, -y/2, rotation+45, index-1);
     draw_branch(tx*0, -y, -y/2, rotation-135,index-1);
     draw_branch(tx*0, -y, -y/2, rotation+135, index-1);
  }
  
  popMatrix();
  
}
