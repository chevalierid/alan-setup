#include <Wire.h>
#include <DS3231.h>

#define SECONDS_FROM_1970_TO_2000 946684800
String inputString = "";         // a string to hold incoming data
boolean stringComplete = false;  // whether the string is complete

unsigned long py_time;

RTClib myRTC;
DS3231 myDS;

unsigned long getCurrentTime() {
  return myRTC.now().unixtime() - SECONDS_FROM_1970_TO_2000;
}

void setup() {
  Wire.begin();
  Serial.begin(115200);
  //Serial.println(__TIME__);
  delay(100);
  //Serial.print("Ready...\n");
  //inputString = Serial.readStringUntil('\n');
  Serial.setTimeout(1);
}

void loop() {

  while (Serial.available()) {
    py_time = Serial.readString().toInt();
    myDS.setEpoch(py_time - SECONDS_FROM_1970_TO_2000,false);
  }
    DateTime now = myRTC.now();
    
    Serial.print(now.year(), DEC);
    Serial.print('/');
    Serial.print(now.month(), DEC);
    Serial.print('/');
    Serial.print(now.day(), DEC);
    Serial.print(' ');
    Serial.print(now.hour(), DEC);
    Serial.print(':');
    Serial.print(now.minute(), DEC);
    Serial.print(':');
    Serial.print(now.second(), DEC);
    Serial.println();
    delay(5000);
    
    Serial.println("set");
}
