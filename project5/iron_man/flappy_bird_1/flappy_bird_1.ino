int val=0;
int buttonPin=7;
int flexPin = A0;

void setup(){
  Serial.begin(9600);
  pinMode(buttonPin,INPUT);
  establishContact();
}

void loop(){
  
  if(Serial.available() > 0){
    int inByte = Serial.read();
    val = digitalRead(buttonPin);
    
    
    
    int flexValue = analogRead(flexPin);
    Serial.print(val);
    Serial.print(",");
    Serial.println(flexValue);
   
    /*Trying accelerometer */
//    int accValue = analogRead(accPin);
//    //accValue = map(accValue,70,90,0,100);
//    Serial.print("Acc: ");
//    Serial.println(accValue);
//    if(accValue < 327) {
//      Serial.println(1);
//    } else {
//      Serial.println(0); 
//    }
    delay(75);
    
  }
}

void establishContact() {
   while(Serial.available() <= 0){
      Serial.println("hello");
      //delay(100);
   } 
}

