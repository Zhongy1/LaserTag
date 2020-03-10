#define dataPin D6 //connects to 14 on shift register
#define clockPin D8 //connects to 11
#define latchPin D4 // connect to 12
#define redPin D7
#define greenPin D5
#define bluePin 1

uint8_t patternDigital2[8][3] = 
{
  {0,0,0},
  {0,1,1},
  {0,0,1},
  {1,0,1},
  {1,0,0},
  {1,1,0},
  {0,1,0},
  {0,0,0}
};

uint8_t patternDigital[6][3] = 
{
  {0,1,1},
  {0,0,1},
  {1,0,1},
  {1,0,0},
  {1,1,0},
  {0,1,0}
};
void shiftOut(uint8_t bits){
  digitalWrite(latchPin, LOW);
  shiftOut(dataPin, clockPin, LSBFIRST, bits);
  digitalWrite(latchPin, HIGH);
}

void setup() {
  pinMode(dataPin, OUTPUT);
  pinMode(clockPin, OUTPUT);
  pinMode(latchPin, OUTPUT);
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);
}

void doRainbow(){
  for(int i=0; i<8; i++){
    digitalWrite(redPin,patternDigital2[i][0]);
    digitalWrite(greenPin, patternDigital2[i][1]);
    digitalWrite(bluePin, patternDigital2[i][2]);
    shiftOut(B00000001 << i);
    delay(1);
  }
}

void doDigitalPattern(){
  for(int i=0; i<6; i++){
    digitalWrite(redPin, patternDigital[i][0]);
    digitalWrite(greenPin, patternDigital[i][1]);
    digitalWrite(bluePin, patternDigital[i][2]);
    shiftOut(B00111100);
    delay(1000);
  }
}

void doAnalogTest(){
  digitalWrite(greenPin, HIGH);
  for(int i=0; i<1024; i+=10){
    analogWrite(redPin, i);
    analogWrite(bluePin, 1023-i);
    shiftOut(B11111111);
    delay(20);
  }
  for(int i=1023; i>=0; i-=10){
    analogWrite(redPin, i);
    analogWrite(bluePin, 1023-i);
    shiftOut(B11111111);
    delay(20);
  }
}

void loop() {
//  doAnalogTest();
//doDigitalPattern();
doRainbow();
}
