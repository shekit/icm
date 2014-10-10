//int inByte;

void setup() {
 Serial.begin(9600); 
 pinMode(6, INPUT);
 //establishContact();
}

void loop() {


  // int x = analogRead(A0)/4;
   int x = digitalRead(6);
   //int z = analogRead(A2)/4;

  //delay(1000);
  Serial.write(x);
 //Serial.println("Y: ");
 //Serial.println(y);
  //Serial.println("Z: ");
 //Serial.println(z); 
  //delay(100);
}


