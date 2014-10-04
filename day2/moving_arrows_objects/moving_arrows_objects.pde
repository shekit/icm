int border;
Arrow[] arrowList;
int arrowWidth = 30;
int arrowHeight = 10;
color[] colorList = {#CFF09E, #A8DBA8, #79BD9A, #3B8686, #0B486B};

void setup() {
  size(800,600,P3D);
  border = 40;
  
  int count = width/border * height/border;
  println(count);
  arrowList = new Arrow[count];
  
  println(arrowList.length);
  int index = 0;  // to set number of items in the array
  for(int x = 0; x<width; x+= border){   // used mainly to set the x,y coordinates of the arrows, so they know where to be drawn
     for(int y = 0; y<height;  y+=border) {
        color c  = colorList[int(random(colorList.length))]; // select color from array randomly
        arrowList[index] = new Arrow(30,10,x,y,random(0.8), c);  // create array based on number of arrows
        index++;  
   }
  }
}

void draw() {
  background(255);
  noStroke();
  
  for(int i = 0; i<arrowList.length; i++){
     arrowList[i].setTranslateZ(mouseX/4); // ability to zoom in
     //arrowList[i].setTranslateX(mouseY);
     arrowList[i].display();
     arrowList[i].move();
  }
}
