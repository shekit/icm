//float y;
float r;
float angle = 0;
float angle_increment = 0.1;
float num_balls;
float ball_radius = 20;
float theta = 0.1;

void setup() {
  size(800,600);  
  r = 100;
  num_balls = width/ball_radius;
}

void draw() {
  background(0);
  angle += angle_increment;
  fill(255);
  noStroke();
  
  for(int i=0;i<num_balls;i++){
     pushMatrix();
     translate(i*ball_radius + ball_radius/2, height/2);
     float y = r * sin(angle*theta);
     ellipse(0,y,ball_radius,ball_radius);
     popMatrix();
     theta += 0.01;
  }
  
  // translate(width/2,height/2);
  // float y = r * sin(angle);
  // ellipse(0, y, ball_radius, ball_radius);
  
}
