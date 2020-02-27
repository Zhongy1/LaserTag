#define batteryPin A0
#define MAX 700 //To Do: Find actual value of MAX and MIN
#define MIN 300
void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
}

void loop() {
  // put your main code here, to run repeatedly:
  int analogVal = analogRead(batteryPin);
  Serial.print("Analog Read Value: ");
  Serial.println(analogVal);
  if (analogVal >= MIN){
    Serial.print("Predicted Percentage: ");
    Serial.print(((analogVal-MIN)*100)/(MAX-MIN));
    Serial.println("%");
  }
  delay(1000);  
}
