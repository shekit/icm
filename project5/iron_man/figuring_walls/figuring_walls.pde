int[] wall_top = {50,75,100,125,150,175,200,225,250,275,300,325,350,375};
int gap = 200;
int spacing = 300;
int wall_width = 50;

void setup(){
   size(800,600); 
   background(0);
   noLoop();
}

void draw() {
  fill(255);
  for(int i=20;i<width;i+=spacing){
     int wall_size = wall_top[int(random(wall_top.length))];
     rect(i,0, wall_width, wall_size);
     rect(i,wall_size+gap,wall_width,height-wall_size-gap);
  }
  // rect(30,0,50,300);
  // rect(30,500,50,100);
}
