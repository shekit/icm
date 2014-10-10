void setup() {
 Serial.begin(9600); 
  
}

void loop() {
   int x = analogRead(A0)/4;
   int y = analogRead(A1)/4;
   int z = analogRead(A2)/4;
   y = map(y,70,90,0,100);
  Serial.write(y);
  
 //Serial.println("Y: ");
 //Serial.println(y);
  //Serial.println("Z: ");
 //Serial.println(z); 
  //delay(100);
}
