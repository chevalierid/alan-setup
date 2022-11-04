#include <SPI.h>
#include <SD.h>
#include <RTClib.h>
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include "Adafruit_TSL2591.h"
#include <Adafruit_AS7341.h>

#define WHITE_PIN 2
#define AMBER_PIN 3
#define ENABLE_ARR_PIN 4
#define POWER_PIN 5
#define SECONDS_FROM_1970_TO_2000 946684800

/*
 * Connections:
 * Digital 4 to power LED in series with 1K resistor to GND
 */

File myFile;
File root;
RTC_DS3231 rtc;
uint32_t delta_ts[] = {10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
                      10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10};
unsigned long next_time;
unsigned long last_time;
int day_index;
String filename;
String print_data;
String print_lux;
bool arr_on;
bool amber;

Adafruit_TSL2591 tsl = Adafruit_TSL2591(2591); // pass in a number for the sensor identifier (for your use later)
Adafruit_AS7341 as7341;

void configureTSL(void)
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

uint16_t tslAdvancedRead(void)
{
  // More advanced data read example. Read 32 bits with top 16 bits IR, bottom 16 bits full spectrum
  // That way you can do whatever math and comparisons you want!
  uint32_t lum = tsl.getFullLuminosity();
  uint16_t ir, full;
  ir = lum >> 16;
  full = lum & 0xFFFF;

  return tsl.calculateLux(full, ir);
}

String asRead() {
  uint16_t as7341_readings[12];
  String allReadings;
  if (!as7341.readAllChannels(as7341_readings)){
    Serial.println("Error reading all channels!");
    return;
  }
  for (int i = 0; i < 12; i++) {
    allReadings = allReadings + "," + String(as7341_readings[i]);
    Serial.println(allReadings);
  }
  return allReadings;
}

unsigned long getCurrentTime() {
  
  return rtc.now().unixtime();
}

//void printDirectory(File dir, int numTabs) {
//   while (true) {
//
//      File entry = dir.openNextFile();
//      if (! entry) {
//         // no more files
//         break;
//      }
//      for (uint8_t i = 0; i < numTabs; i++) {
//         Serial.print('\t');
//      }
//      Serial.print(entry.name());
//      if (entry.isDirectory()) {
//         Serial.println("/");
//         printDirectory(entry, numTabs + 1);
//      } else {
//         // files have sizes, directories do not
//         Serial.print("\t\t");
//         Serial.println(entry.size(), DEC);
//      }
//      entry.close();
//   }
//}

void setup() {
  Serial.begin(115200); 
  Wire.begin();
  rtc.begin();
  pinMode(ENABLE_ARR_PIN, OUTPUT);
  digitalWrite(ENABLE_ARR_PIN, LOW);
  pinMode(WHITE_PIN, INPUT_PULLUP);
  pinMode(AMBER_PIN, INPUT_PULLUP);
  while (!Serial) {
    ; // wait for serial port to connect
  }
  Serial.print("Initializing SD card...");
  if (!SD.begin(53)) {
    Serial.println("Initialization failed!");
    while(1);
  }
  Serial.println("Initialization done.");

  arr_on = false;
  day_index = 0;
  amber = 0;
  last_time = rtc.now().unixtime();
  
  // open file
  myFile = SD.open("file0.txt", FILE_WRITE);
  if (myFile) {
    Serial.print("Writing to file...");
    myFile.println("Timestamp,Amber,ArrOn,Intensity,AS0,AS1,AS2,AS3,AS4,AS5,AS6,AS7,AS8,AS9,AS10,AS11");
    myFile.close();
    Serial.println("Done.");
  } else {
    Serial.println("couldn't open in setup");
  }

  if (tsl.begin()) 
  {
    Serial.println(F("Found a TSL2591 sensor"));
  } 
  else 
  {
    Serial.println(F("No sensor found ... check your wiring?"));
    while (1);
  }
  configureTSL();
  Serial.println("Configured");

  if (!as7341.begin()){
    Serial.println("Could not find AS7341");
    while (1) { delay(10); }
  }
  as7341.setATIME(100);
  as7341.setASTEP(999);
  as7341.setGain(AS7341_GAIN_256X);
}

void loop() {
  //Serial.println(day_index);
  Serial.println(getCurrentTime());
  Serial.print("hour: ");
  Serial.println(rtc.now().hour(), DEC);
  Serial.println(last_time + delta_ts[day_index]);
  if (day_index > (sizeof(delta_ts) / sizeof(delta_ts[0]))) {
    day_index = 0;
  }
  if (getCurrentTime() >= last_time + delta_ts[day_index]*360) {
    if (arr_on) {
      digitalWrite(ENABLE_ARR_PIN, LOW);
      arr_on = false; 
    }
    else {
      digitalWrite(ENABLE_ARR_PIN, HIGH); 
      arr_on = true;
    }
    if (digitalRead(WHITE_PIN)) {
      amber = 0;
    }
    else if (digitalRead(AMBER_PIN)) {
      amber = 1;
    }
    last_time = getCurrentTime();
    day_index = day_index + 1;
  }
   
  if (getCurrentTime() >= last_time + 10) { //5*60) {
    filename = "file" + rtc.now().hour();
    myFile = SD.open(filename, FILE_WRITE);   // FIXME have it change name every day
  
    if (myFile) {
      Serial.println("Printing to file");
      myFile.print(getCurrentTime());
      myFile.print(",");
      myFile.print(amber);
      myFile.print(",");
      myFile.print(arr_on);
      myFile.print(",");
      myFile.print(tslAdvancedRead(), 6);
      myFile.print(asRead());
      myFile.write("\n");
      myFile.close();
      Serial.println("Done.");
    } else {
      Serial.println("couldn't open in loop");
    }
  }
}
