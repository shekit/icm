//float y;
float r;
float angle = 0;
float angle_increment = 0.1;
int num_balls;
float ball_radius = 10;
//float theta = 0;
//float[] yValues;

void setup() {
  size(800,600);  
  r = 100;
  num_balls = int(width/ball_radius);
  //yValues = new float[num_balls];
}

void draw() {
  background(0);
  angle += 0.004;
  fill(255);
  noStroke();

  float x = angle;
  for(int i=0;i<num_balls;i++){
     //pushMatrix();
     //translate(i*ball_radius + ball_radius/2, height/2);
     //float theta = 0;
     float y = r * sin(x);
     ellipse(i*ball_radius,y+height/2,ball_radius,ball_radius);
     //popMatrix();
     //theta += 1;
     x += 0.09;
  }
  
  //theta+=0.2;
  // translate(width/2,height/2);
  // float y = r * sin(angle);
  // ellipse(0, y, ball_radius, ball_radius);
  
}
