#include <SPI.h>
#include <SD.h>

#include <Wire.h>
#include <Adafruit_Sensor.h>
#include "Adafruit_TSL2591.h"

File myFile;
int j;
String print_data;
String print_lux;

Adafruit_TSL2591 tsl = Adafruit_TSL2591(2591); // pass in a number for the sensor identifier (for your use later)

void configureSensor(void)
{
  // You can change the gain on the fly, to adapt to brighter/dimmer light situations
  //tsl.setGain(TSL2591_GAIN_LOW);    // 1x gain (bright light)
  tsl.setGain(TSL2591_GAIN_MED);      // 25x gain
  //tsl.setGain(TSL2591_GAIN_HIGH);   // 428x gain
  
  // Changing the integration time gives you a longer time over which to sense light
  // longer timelines are slower, but are good in very low light situtations!
  //tsl.setTiming(TSL2591_INTEGRATIONTIME_100MS);  // shortest integration time (bright light)
  // tsl.setTiming(TSL2591_INTEGRATIONTIME_200MS);
  tsl.setTiming(TSL2591_INTEGRATIONTIME_300MS);
  // tsl.setTiming(TSL2591_INTEGRATIONTIME_400MS);
  // tsl.setTiming(TSL2591_INTEGRATIONTIME_500MS);
  // tsl.setTiming(TSL2591_INTEGRATIONTIME_600MS);  // longest integration time (dim light)

  /* Display the gain and integration time for reference sake  
  Serial.println(F("------------------------------------"));
  Serial.print  (F("Gain:         "));*/
  tsl2591Gain_t gain = tsl.getGain();
  Serial.print  (F("Timing:       "));
  Serial.print((tsl.getTiming() + 1) * 100, DEC); 
  Serial.println(F(" ms"));
  Serial.println(F("------------------------------------"));
  Serial.println(F(""));
}

void advancedRead(void)
{
  // More advanced data read example. Read 32 bits with top 16 bits IR, bottom 16 bits full spectrum
  // That way you can do whatever math and comparisons you want!
  uint32_t lum = tsl.getFullLuminosity();
  uint16_t ir, full;
  ir = lum >> 16;
  full = lum & 0xFFFF;
  myFile = SD.open("readings.txt", FILE_WRITE);

  if (myFile) {
    Serial.println("Printing to file");
    myFile.print(millis()); 
    myFile.print(F(",")); 
    myFile.println(tsl.calculateLux(full, ir), 6);
    myFile.close();
    Serial.println("Done.");
  } else {
    Serial.println("error opening test.txt");
  }
 
}

void setup() {
  Wire.begin();
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect
  }
  if (!SD.begin(53)) {
    Serial.println("Initialization failed!");
    while(1);
  }
  Serial.println("Initialization done");

  if (tsl.begin()) 
  {
    Serial.println(F("Found a TSL2591 sensor"));
  } 
  else 
  {
    Serial.println(F("No sensor found ... check your wiring?"));
    while (1);
  }
  configureSensor();
  j = 0;
}

void loop() {
  // put your main code here, to run repeatedly:
  if (j < 10) {
    advancedRead();
  } else {
    Serial.println("done");
  }
  j++;
  //delay(2000);
  
}
