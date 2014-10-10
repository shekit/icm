class Cloud{
 PImage img;
 PVector location;
 PVector speed;
 PImage[] images = new PImage[2];
 
 Cloud(float tempX, float tempY) {
   //img = loadImage("cloud.png");
   location = new PVector(tempX, tempY);
   speed = new PVector(1, 0);
   
   for(int i=0;i<images.length;i++){
      String filename = "cloud" + nf(i,1) + ".png";
      images[i] = loadImage(filename);
   }
 }
 
 void display() {
   
   if(frameCount%90>0 && frameCount%90<45){
     image(images[1], location.x, location.y);
   } else {
     image(images[0], location.x, location.y); 
   }
   //image(img, location.x, location.y);
 }
 
 void move() {
   location.x -= speed.x;
 }
 

  
}
