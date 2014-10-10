import processing.serial.*;

IronMan man;
IronMan introMan;
ArrayList<WallCombo> walls;
int spacing = 400;
int cloud_spacing = 250;
int num_walls;
int num_clouds;
int num_ground = 2;
float offscreen_offset_new_wall;
int score = 0;
PFont munro;
float angle=0;
float angle_increment = 0.05;
PImage ground;
PImage logo;
Cloud cloud;
ArrayList<Cloud> clouds;
ArrayList<Ground> rolling_ground;
boolean display_man_hover = false;
boolean first_contact = false;
boolean state = false;
String inputString = null;
boolean intro = true;
boolean end = false;

boolean up = false;
boolean lastUp = false;
int prev_value = 0;

Serial myPort;

void setup() {
  size(1250, 800);
  munro = createFont("MunroSmall.ttf",40); 
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[5], 9600);
  myPort.bufferUntil('\n');
  man = new IronMan();
  introMan = new IronMan();
  walls = new ArrayList<WallCombo>();

  num_walls=0;
  for (int i=0; i < width; i+=spacing) {
    WallCombo wall = new WallCombo(i+width); 
    walls.add(wall);
    num_walls++;
  }
  println("INDEX:"+ num_walls);

  // find distance of last rect from width end. Subtract from number to find at what position off screen to create new wall so they are evenly spaced
  WallCombo lastWall = walls.get(walls.size()-1);
  float distance_of_last_rect_from_edge = dist(lastWall.location.x+lastWall.size.x, 0, width*2, 0); // you multiply width by 2 because you are drawing the walls offscreen
  println(distance_of_last_rect_from_edge);
  offscreen_offset_new_wall = spacing - distance_of_last_rect_from_edge;
  print(offscreen_offset_new_wall);

  clouds = new ArrayList<Cloud>();

  num_clouds = 0;
  for (int i=0; i<width; i+=cloud_spacing) {
    Cloud cloud = new Cloud(i+100, random(0, 80));
    clouds.add(cloud);
    num_clouds++;
  }

  rolling_ground = new ArrayList<Ground>();
  for (int i=0; i<2; i++) {
    Ground ground = new Ground(i*width, height-100, width, 100);
    rolling_ground.add(ground);
  }

  ground = loadImage("ground.jpg");
  logo = loadImage("flappy_man.png");
}


void draw() {

  if (frameCount < 120) {
    background(#B0F8FF);
    textFont(munro,30);
    fill(0);
    textAlign(CENTER);
    for (int i=0; i<clouds.size (); i++) {
      clouds.get(i).display();
      clouds.get(i).move();
    }

    imageMode(CENTER);
    image(logo, width/2, height/2);
    textSize(18);
    text("GET READY", width/2, height/2 + 80);

    angle += angle_increment;
    float y1 = 30 * sin(angle);
    introMan.setY(y1);
    pushMatrix();
    translate(0, height/2);
    introMan.display_hover();
    popMatrix();
    imageMode(CORNER);
    image(ground, 0, height-100, width, 100);
  } else if (frameCount >= 120 && frameCount < 180) {
    fill(255, 255, 255, 15);
    rect(0, 0, width, height);
  } else {

    // set sky color
    background(#B0F8FF);

    //display and move clouds
    for (Cloud c : clouds) {
      c.display();
      c.move();
    }

    // remove cloud once it goes off screen
    if (clouds.get(0).location.x < -200) {
      clouds.remove(0);     
      //println("removed");
    } 

    // add new cloud to array list just outside the width
    if (clouds.size() < num_clouds) {
      Cloud new_cloud = new Cloud(width, random(10, 50)); 
      clouds.add(new_cloud);
    }


    walls.get(0).setColor(#EFCE0B);
    if (display_man_hover == false) {
      man.display();
      //man.moveDown();
    } else {
      man.display_hover();
    }


    if (keyPressed) {
      if (keyCode == UP) {
        man.moveUp();
      }
    }

    //show and move the walls
    for (WallCombo w : walls) {
      w.display(); 
      w.move();
    }

    //remove wall if it goes off screen
    if (walls.get(0).location.x < 0-walls.get(0).size.x) {
      // dont remove from empty array
      if (walls.size()>0) {
        walls.remove(0); 
        println(walls.size());  
        score++;
      }
    }

    // check to see if new wall needs to be added
    if (walls.size() < num_walls) {
      // change last hardcoded value to compensate for width of wall. It should be equal to wall width
      WallCombo new_wall = new WallCombo(width + offscreen_offset_new_wall - 50);
      walls.add(new_wall);
    }

    image(ground, 0, height-100, width, 100);

    // make ground move
    for (Ground g : rolling_ground) {
      g.display();
      g.move();
    }

    //pop first element once its off screen and add to the end
    if (rolling_ground.get(0).location.x < -width) {
      rolling_ground.remove(0);
    }

    if (rolling_ground.size() < 2) {
      Ground new_ground = new Ground(width, height-100, width, 100);
      rolling_ground.add(new_ground);
    }



    fill(0);
    textSize(36);
    textAlign(LEFT);
    text("Score: "+score, 50, 50);

    //Check for collision with man
    if (man.collision(walls.get(0))) {
      fill(0, 0, 0, 175);
      rect(0, 0, width, height);
      fill(255);
      textAlign(CENTER);
      textSize(60);
      if (score<5) {
        text("Score: "+score, width/2, height/2 - 100);
        text("Go learn how to fly", width/2, height/2);
      } else if (score < 10) {
        text("Score: "+score, width/2, height/2 - 100);
        text("Was that your first flight?", width/2, height/2);
      } else if (score < 15) {
        text("Score: "+score, width/2, height/2 - 100);
        text("Hmm.. you're improving", width/2, height/2);
      } else if (score < 20) {
        text("Score: "+score, width/2, height/2 - 100);
        text("You're quite the pro!", width/2, height/2);
      } else {
        text("Score: "+score, width/2, height/2 - 100);
        text("You da Man!!!", width/2, height/2);
      }
      noLoop();
    }
  }
}


void keyPressed() {

  //   if(key == CODED && keyCode == UP){
  //      man.moveUp(); 
  //   } 

  if (key == ' ') {
    display_man_hover = true;
    for (WallCombo w : walls) {
      w.setSpeed(0);
    }

    for (Ground g : rolling_ground) {
      g.setSpeed(0);
    }
  }

  if (key == 's') {
    display_man_hover = false;
    for (WallCombo w : walls) {
      w.setSpeed(5);
    }

    for (Ground g : rolling_ground) {
      g.setSpeed(5);
    }
  }

  if (key == 'r') {
    frameCount = 0;
    score = 0;
    loop();
  }
}

void serialEvent (Serial myPort) {
  
  // handshake method
  
  String myString = myPort.readStringUntil('\n');
  println(myString);
  
  if(myString != null) {
     myString = trim(myString);
     
     if(first_contact == false){
       if(myString.equals("hello")) {
          println("got first contact");
          myPort.clear();
          first_contact = true;
          myPort.write('A');
       }
     }
     
     else {
            println("got data");
     
        int sensors[] = int(split(myString,','));
         println(sensors.length);
         
        
         
        if(sensors.length > 1){
          
          int current_value = sensors[0];
          
          if(current_value != prev_value){
          
              if(sensors[0]==1){
                 man.moveUp(); 
              } else if(sensors[0] == 0 && frameCount > 220) {
                 man.moveDown(); 
              }
              
              if(sensors[1]>130){
                 display_man_hover = false; 
                 for (WallCombo w : walls) {
                    w.setSpeed(5);
                  }
              
                  for (Ground g : rolling_ground) {
                    g.setSpeed(5);
                  }
                  
                  man.downSpeed.y = 15;
                 
              } else if (sensors[1] <= 130) {
                display_man_hover = true;
                for (WallCombo w : walls) {
                  w.setSpeed(0);
                }
            
                for (Ground g : rolling_ground) {
                  g.setSpeed(0);
                }
                
                man.downSpeed.y = 0;
              }
           }
            prev_value = current_value;
        }
        
     }
          
       println("sending data");
       myPort.write("A");
     
    
  }
  // myPort.write("X");
  // println("sending data");
  // inputString = trim(inputString);
  // if(inputString.equals("1")){
  //   man.moveUp();
  //  // intro = false;
  // }
  // print(inputString);
  
  // // Read button value method
  //  int val = myPort.read();
  //  println("Im here");
  //  println(val);
  //  if(val==1) {
  //     man.moveUp(); 
  //  }

}
