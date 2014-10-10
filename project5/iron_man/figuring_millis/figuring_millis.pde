long prev_time;
int interval = 1000;
void setup(){
  prev_time = millis();
}

void draw(){
//println(prev_time);
long new_time = millis();

if(new_time-prev_time > interval){
   println("DO SOMETHING"); 
   prev_time = new_time;
}



}
