#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

Adafruit_SSD1306 display(-1);

void setup()   
{                
  // initialize with the I2C addr 0x3C
  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);  
  // Clear the buffer.
  display.clearDisplay();
}

void loop(){
  //Display ID and count down from 10
  display.setTextColor(WHITE);
  for(int x = 10; x >= 0; x--){
    display.setTextSize(1);
    display.setCursor(0,0);
    display.println("IDENTIFICATION: 01");
    display.setTextSize(2);
    display.setCursor(50, 14);
    display.println(x);
    display.display();
    delay(500);
    display.clearDisplay();
  }
  display.display();
  delay(2000);
  
}
