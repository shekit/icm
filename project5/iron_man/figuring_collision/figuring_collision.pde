void setup() {
   size(640,360);
   
}

void draw(){
  
background(0);
fill(255);

rect(350,0,50,200);
 rect(mouseX,mouseY, 100,70);
 float d = dist(mouseX+100, 0, 350,0);
println(mouseX+100);
println(d);
if(d == 0 && mouseY<200){
    println("TOuching");
  
 } else {
  println("away"); 
}
}
