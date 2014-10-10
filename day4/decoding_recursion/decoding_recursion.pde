size(800,600);

background(255);

pushMatrix();
translate(width/2,height);
rotate(radians(0*-90));
line(0, 0,0,-90);
pushMatrix();

translate(0,-90);
rotate(radians(1*-90/2));
stroke(255,0,0);
line(0,0,0,-45);
pushMatrix();

translate(0,-45);
rotate(radians(2*-90/6));
stroke(0,255,0);
line(0,0,0,-22.5);
popMatrix();
popMatrix();
popMatrix();
