#include <SPI.h>
#include <SD.h>
#include <RTClib.h>
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include "Adafruit_TSL2591.h"
#include <Adafruit_AS7341.h>

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
uint32_t delta_ts[] = {5,  10,  15,  20,  25,  30,  35,  40,  45,  50,  55,  60,  65,
        70,  75,  80,  85,  90,  95, 100, 105, 110, 115};
unsigned long next_time;
unsigned long last_time;
int day_index;
String print_data;
String print_lux;
bool arr_on;

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
  pinMode(ENABLE_ARR_PIN, OUTPUT);           // set pin to input
  digitalWrite(ENABLE_ARR_PIN, LOW);       // turn on pullup resistors
  while (!Serial) {
    ; // wait for serial port to connect
  }
  Serial.print("Initializing SD card...");
  if (!SD.begin(53)) {
    Serial.println("Initialization failed!");
    while(1);
  }
  Serial.println("Initialization done.");
  // open file
  myFile = SD.open("not_test.txt", FILE_WRITE);
  if (myFile) {
    Serial.print("Writing to file...");
    myFile.println("Timestamp,Intensity,AS0,AS1,AS2,AS3,AS4,AS5,AS6,AS7,AS8,AS9,AS10,AS11");
    myFile.close();
    Serial.println("Done.");
  } else {
    Serial.println("couldn't open in setup");
  }
  arr_on = false;
  day_index = 0;
//  DateTime now = rtc.now();
//  sprintf(t, "%02d:%02d:%02d %02d/%02d/%02d", now.hour(), now.minute(), now.second(), now.day(), now.month(), now.year());  
  last_time = rtc.now().unixtime();
}

void loop() {
  Serial.println(day_index);
  Serial.println(getCurrentTime());
  Serial.println(last_time + delta_ts[day_index]);
  if (day_index > (sizeof(delta_ts) / sizeof(delta_ts[0]))) {
    day_index = 0;
  }
  if (getCurrentTime() >= last_time + delta_ts[day_index]) {
    if (arr_on) {
      digitalWrite(ENABLE_ARR_PIN, LOW);
      arr_on = false; 
      Serial.print("off");
    }
    else {
      digitalWrite(ENABLE_ARR_PIN, HIGH); 
      arr_on = true;
      Serial.print("on");
    }
    last_time = getCurrentTime();
    day_index = day_index + 1;
  }
  delay(2000);
}
