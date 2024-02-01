/*
 * This file tests override and scheduling capabilities.
 * Watch serial monitor: if you're holding down override button, release it as soon as you see the filename pop up
 * Expected file pattern:
 * Amber White On  Override
    -------------------------
    0 1 1 0
    -------------------------
    0 1 0 0
    -------------------------
    0 1 1 1
    -------------------------
    1 1 1 0
    -------------------------
    1 1 0 0
    -------------------------
    1 1 1 1
    -------------------------
    1 0 1 0
    -------------------------
    1 0 0 0
    -------------------------
    1 0 1 1

 */





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
#define OVERRIDE_PIN 5
#define LED_PIN 6
#define SECONDS_FROM_1970_TO_2000 946684800

File myFile;
File root;
RTC_DS3231 rtc;
unsigned long start_time;
unsigned long next_time;
unsigned long current_time;
unsigned long last_time;
unsigned long last_write_time;
int day_index;
String filename;
String print_data;
String print_lux;
bool override_on;
bool arr_on;
bool amber;
bool white;
bool new_file;
int ledState = LOW;
int written = 0;

Adafruit_TSL2591 tsl = Adafruit_TSL2591(2591); // pass in a number for the sensor identifier (for your use later)
Adafruit_AS7341 as7341;

void configureTSL(void)
{
  tsl.setGain(TSL2591_GAIN_MED);      // 25x gain
  tsl.setTiming(TSL2591_INTEGRATIONTIME_300MS);
  
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
    //Serial.println(allReadings);
  }
  return allReadings;
}

unsigned long getCurrentTime() {
  return rtc.now().unixtime();// - SECONDS_FROM_1970_TO_2000;
}

void printDirectory(File dir, int numTabs) {
   while (true) {

      File entry = dir.openNextFile();
      if (! entry) {
         // no more files
         break;
      }
      for (uint8_t i = 0; i < numTabs; i++) {
         Serial.print('\t');
      }
      Serial.print(entry.name());
      if (entry.isDirectory()) {
         Serial.println("/");
         printDirectory(entry, numTabs + 1);
      } else {
         // files have sizes, directories do not
         Serial.print("\t\t");
         Serial.println(entry.size(), DEC);
      }
      entry.close();
   }
}

void printToFile(bool is_newfile,File myFile) {
  if (is_newfile) {
    myFile.println("Timestamp,Amber,White,On,Override,Day_Ind");
  }
  myFile.print(getCurrentTime());
  myFile.print(",");
  myFile.print(amber);
  myFile.print(",");
  myFile.print(white);
  myFile.print(",");
  myFile.print(arr_on);
  myFile.print(",");
  myFile.print(!digitalRead(OVERRIDE_PIN));
  myFile.print(",");
  myFile.print(day_index);
  myFile.write("\n");
  myFile.close();
}

void setup() {
  Serial.begin(115200);
  Wire.begin();
  rtc.begin();
  pinMode(LED_PIN,OUTPUT);
  digitalWrite(LED_PIN, ledState);
  pinMode(ENABLE_ARR_PIN, OUTPUT);
  pinMode(WHITE_PIN, INPUT_PULLUP);
  pinMode(AMBER_PIN, INPUT_PULLUP);
  pinMode(OVERRIDE_PIN, INPUT_PULLUP);
  while (!Serial) {
    ; // wait for serial port to connect
  }
  Serial.print("Initializing SD card...");
  if (!SD.begin(53)) {
    Serial.println("Initialization failed!");
    ledState = HIGH;
    digitalWrite(LED_PIN, ledState);
    while(1);
  }
  Serial.println("Initialization done.");

  Serial.println(rtc.now().day());

  override_on = 0;
  arr_on = 0;
  digitalWrite(ENABLE_ARR_PIN, arr_on);
  day_index = 0;
  start_time = getCurrentTime();
  last_time = getCurrentTime();
  last_write_time = getCurrentTime();

//  if (tsl.begin()) 
//  {
//    Serial.println(F("Found a TSL2591 sensor"));
//  } 
//  else 
//  {
//    Serial.println(F("No sensor found ... check your wiring?"));
//    while (1);
//  }
//  configureTSL();
//  Serial.println("Configured");
//
//  if (!as7341.begin()){
//    Serial.println("Could not find AS7341");
//    while (1) { delay(10); }
//  }
//  as7341.setATIME(100);
//  as7341.setASTEP(999);
//  as7341.setGain(AS7341_GAIN_256X);

  Serial.println(getCurrentTime());
}

void loop() {
//  if (day_index > sizeof(delta_ts)) {// (sizeof(delta_ts) / sizeof(delta_ts[0]))) {
//    return;
//  }

  current_time = getCurrentTime();
  
  if (digitalRead(OVERRIDE_PIN) == LOW) {
    override_on = 1;
    arr_on = 1; // make sure this doesn't throw off whether it registers array as on or off
    digitalWrite(ENABLE_ARR_PIN, arr_on);
  }
  else if (override_on == 1 && digitalRead(OVERRIDE_PIN) == HIGH) {
    Serial.println("turning off override");
    override_on = 0;
    arr_on = 0; // FIXME: if holding down override during switch from dawn to dusk, might end up preventing array from turning on as scheduled
    digitalWrite(ENABLE_ARR_PIN, arr_on);    
  }

  if (current_time >= last_time + 2) {
    day_index = current_time - start_time;
    Serial.println(day_index);
    switch (day_index) {
      case 2:
        Serial.println("turn dial to white. white should be on");
        arr_on = 1;
        break;
      case 4:
        Serial.println("waiting for white to be on");
        break;
      case 6:
        Serial.println("white turning off");
        arr_on = 0;
        break;
      case 8:
        Serial.println("do nothing (wait for white to turn off)");
        break;
      case 10:
        Serial.println("press override button");
        break;
      case 12:
        Serial.println("white should be on");
        break;
      case 14:
        Serial.println("release override and turn dial to off");
        arr_on = 1;
        break;
      case 16:
        Serial.println("everything should be off");
        break;
      case 18:
        Serial.println("do nothing");
        arr_on = 0;
        break;
      case 20:
        Serial.println("everything should still be off");
        break;
      case 22:
        Serial.println("press override button");
        break;
      case 24:
        Serial.println("everything should still be off");
        break;
      case 26:
        Serial.println("release override button and turn dial to amber");
        arr_on = 1;
        break;
      case 28:
        Serial.println("waiting for amber to be on");
        arr_on = 1;
        break;
      case 30:
        Serial.println("amber turning off");
        arr_on = 0;
        break;  
      case 32:
        Serial.println("waiting for amber to be off");
        break;
      case 34:
        Serial.println("press override button now");
        break;
      case 36:
        Serial.println("amber should be on");
        break;
    }
    if (current_time - last_write_time >= 4) {
      Serial.println(current_time - last_time);
      filename = String(rtc.now().day())+"-"+String(rtc.now().hour())+"-"+String(rtc.now().minute())+".csv";
      Serial.print("----------filename: ");
      Serial.println(filename);
      if (SD.exists(filename)) {
        new_file = 0;
      }
      else {
        new_file = 1;
      }
      myFile = SD.open(filename, FILE_WRITE);
      amber = digitalRead(AMBER_PIN);
      white = digitalRead(WHITE_PIN);
      if (myFile) {
        printToFile(new_file,myFile);
        last_write_time = current_time;
      } else {
        Serial.println("couldn't open in loop");
      }
    }
    last_time = current_time;
    digitalWrite(ENABLE_ARR_PIN, arr_on);    
  }
}
