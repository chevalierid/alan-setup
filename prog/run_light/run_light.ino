#include <SPI.h>
#include <SD.h>
#include <RTClib.h>
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include "Adafruit_TSL2591.h"
#include <Adafruit_AS7341.h>

/*
 * Connections:
 * Digital 4 to power LED in series with 1K resistor to GND
 */

#define WHITE_PIN 2
#define AMBER_PIN 3
#define ENABLE_ARR_PIN 4
#define OVERRIDE_PIN 5
#define LED_PIN 6
#define SECONDS_FROM_1970_TO_2000 946684800
#define START_TIME 1687781409;

File myFile;
File root;
RTC_DS3231 rtc;
uint32_t delta_ts[] {58418, 28008, 58390, 28039, 58356, 28075, 58316, 28117, 58273, 28163, 58223, 28215, 58168, 28272, 58109, 28334, 58044, 28401, 57975, 28472, 57900, 28549, 57821, 28630, 57737, 28716, 57649, 28806, 57556, 28900, 57459, 29000, 57357, 29103, 57251, 29211, 57140, 29324, 57026, 29439, 56907, 29560, 56785, 29683, 56659, 29810, 56529, 29942, 56396, 30076, 56259, 30214, 56119, 30356, 55974, 30501, 55828, 30648, 55678, 30800, 55525, 30953, 55369, 31110, 55211, 31269, 55049, 31431, 54886, 31596, 54719, 31763, 54550, 31932, 54379, 32104, 54205, 32279, 54029, 32455, 53851, 32633, 53672, 32813, 53490, 32995, 53306, 33179, 53121, 33365, 52934, 33552, 52745, 33741, 52555, 33932, 52362, 34124, 52169, 34318, 51974, 34512, 51779, 34708, 51581, 34906, 51383, 35104, 51183, 35304, 50982, 35505, 50780, 35706, 50578, 35909, 50374, 36113, 50169, 36318, 49964, 36523, 49757, 36729, 49551, 36936, 49342, 37144, 49134, 37353, 48925, 37561, 48715, 37771, 48505, 37982, 48293, 38193, 48082, 38404, 47870, 38616, 47658, 38828, 47445, 39041, 47231, 39255, 47017, 39469, 46803, 39682, 46590, 39896, 46375, 40111, 46159, 40327, 45944, 40542, 45728, 40757, 45513, 40973, 45297, 41189, 45081, 41405, 44864, 41622, 44648, 41838, 44432, 42055, 44214, 42272, 43998, 42489, 43780, 42706, 43564, 42923, 43347, 43140, 43130, 43357, 42913, 43575, 42696, 43792, 42478, 44009, 42262, 44227, 42045, 44443, 41829, 44660, 41612, 44877, 41395, 45094, 41179, 45310, 40964, 45526, 40748, 45743, 40532, 45958, 40317, 46174, 40102, 46389, 39888, 46604, 39673, 46819, 39459, 47033, 39246, 47247, 39033, 47460, 38821, 47672, 38609, 47885, 38398, 48096, 38187, 48307, 37978, 48517, 37769, 48726, 37560, 48936, 37352, 49144, 37145, 49351, 36939, 49557, 36735, 49761, 36532, 49965, 36329, 50168, 36127, 50371, 35926, 50571, 35727, 50771, 35529, 50968, 35334, 51164, 35139, 51359, 34945, 51553, 34754, 51744, 34563, 51934, 34376, 52122, 34190, 52308, 34005, 52492, 33823, 52674, 33644, 52853, 33466, 53030, 33291, 53205, 33118, 53377, 32948, 53547, 32781, 53714, 32616, 53877, 32455, 54038, 32296, 54197, 32140, 54351, 31988, 54502, 31839, 54651, 31693, 54795, 31551, 54936, 31413, 55073, 31279, 55206, 31148, 55335, 31022, 55460, 30900, 55581, 30781, 55697, 30668, 55810, 30558, 55917, 30454, 56019, 30355, 56117, 30260, 56210, 30169, 56298, 30085, 56381, 30004, 56459, 29930, 56531, 29861, 56598, 29797, 56659, 29738, 56716, 29685, 56766, 29638, 56811, 29596, 56850, 29560, 56884, 29529, 56911, 29506, 56932, 29487, 56949, 29473, 56959, 29466, 56963, 29466, 56961, 29470, 56954, 29480, 56940, 29497, 56921, 29519, 56896, 29547, 56864, 29581, 56828, 29621, 56784, 29667, 56736, 29717, 56682, 29774, 56623, 29836, 56557, 29904, 56487, 29976, 56411, 30055, 56330, 30138, 56243, 30227, 56152, 30320, 56056, 30418, 55955, 30521, 55849, 30629};
unsigned long next_time;
unsigned long last_time;
unsigned long last_arr_time;
unsigned long prevSecond;
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
float tsl_read;

Adafruit_TSL2591 tsl = Adafruit_TSL2591(2591); // pass in a number for the sensor identifier (for your use later)
Adafruit_AS7341 as7341;

void configureTSL(void)
{
  // You can change the gain on the fly, to adapt to brighter/dimmer light situations
  //tsl.setGain(TSL2591_GAIN_LOW);    // 1x gain (bright light)
  //tsl.setGain(TSL2591_GAIN_MED);      // 25x gain
  tsl.setGain(TSL2591_GAIN_HIGH);   // 428x gain
  
  // Changing the integration time gives you a longer time over which to sense light
  // longer timelines are slower, but are good in very low light situtations!
  //tsl.setTiming(TSL2591_INTEGRATIONTIME_100MS);  // shortest integration time (bright light)
  // tsl.setTiming(TSL2591_INTEGRATIONTIME_200MS);
  //tsl.setTiming(TSL2591_INTEGRATIONTIME_300MS);
  // tsl.setTiming(TSL2591_INTEGRATIONTIME_400MS);
  // tsl.setTiming(TSL2591_INTEGRATIONTIME_500MS);
   tsl.setTiming(TSL2591_INTEGRATIONTIME_600MS);  // longest integration time (dim light)

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

float tslAdvancedRead(void)
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
  Serial.print("Writing to file...");
  if (is_newfile) {
    myFile.println("Timestamp,Site,Amber,White,On,Override,Intensity,AS00,AS01,AS02,AS03,AS04,AS05,AS06,AS07,AS08,AS09,AS10,AS11");
  }
  myFile.print(getCurrentTime());
  myFile.print(",");
  myFile.print("11"); // FIXME change depending on which site
  myFile.print(",");
  myFile.print(amber);
  myFile.print(",");
  myFile.print(white);
  myFile.print(",");
  myFile.print(arr_on);
  myFile.print(",");
  myFile.print(!digitalRead(OVERRIDE_PIN));
  myFile.print(",");
  myFile.print(tsl_read, 6);
  myFile.print(asRead());
  myFile.write("\n");
  myFile.close();
  Serial.println("Done.");
}

void setup() {
  Serial.begin(115200); 
  Wire.begin();
  rtc.begin();
  pinMode(ENABLE_ARR_PIN, OUTPUT);
  pinMode(WHITE_PIN, INPUT_PULLUP);
  pinMode(AMBER_PIN, INPUT_PULLUP);
  pinMode(OVERRIDE_PIN, INPUT_PULLUP);
  pinMode(LED_PIN,OUTPUT);
  digitalWrite(LED_PIN, ledState);
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

  override_on = LOW;
  arr_on = LOW;
  digitalWrite(ENABLE_ARR_PIN, arr_on);
  day_index = LOW;
  last_time = getCurrentTime();
  last_arr_time = START_TIME;

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
  tsl_read = 0;

  if (!as7341.begin()){
    Serial.println("Could not find AS7341");
    while (1) { delay(10); }
  }
 
  as7341.setATIME(100);
  as7341.setASTEP(999);
  as7341.setGain(AS7341_GAIN_256X);
}

void loop() {
  if (day_index > sizeof(delta_ts)) {// (sizeof(delta_ts) / sizeof(delta_ts[0]))) {
    return;
  }

  if (millis() - prevSecond > 1000) {
    Serial.println(getCurrentTime());
    prevSecond = millis();
  }

  if (digitalRead(OVERRIDE_PIN) == LOW) {
    override_on = 1;
    digitalWrite(ENABLE_ARR_PIN, override_on);
  }
  else if (override_on == 1 && digitalRead(OVERRIDE_PIN) == HIGH) {
    Serial.println("turning off override");
    override_on = 0;
    digitalWrite(ENABLE_ARR_PIN, arr_on);    
  }

  if (getCurrentTime() >= last_arr_time + delta_ts[day_index]) {
    digitalWrite(ENABLE_ARR_PIN, !arr_on);
    Serial.print("arr is turning ");
    Serial.println(!arr_on);
    arr_on = !arr_on;
    last_arr_time = getCurrentTime();
    day_index = day_index + 1;
  }


  if (getCurrentTime() >= last_time + 5*60) {
    filename = String(rtc.now().month())+"-"+String(rtc.now().day())+"-"+String(rtc.now().hour())+".csv";
    Serial.print("filename: ");
    Serial.println(filename);

//    ledState = HIGH;
//    digitalWrite(LED_PIN, ledState);

    if (SD.exists(filename)) {
      new_file = 0;
    }
    else {
      new_file = 1;
    }
    myFile = SD.open(filename, FILE_WRITE);
    amber = digitalRead(AMBER_PIN);
    white = digitalRead(WHITE_PIN);
    tsl_read = tslAdvancedRead();
    if (tsl_read < 0) {
    tsl.setGain(TSL2591_GAIN_LOW);
    tsl.setTiming(TSL2591_INTEGRATIONTIME_100MS);
    }
    else if (tsl_read == 0.00 ) {
      tsl.setGain(TSL2591_GAIN_HIGH);
      tsl.setTiming(TSL2591_INTEGRATIONTIME_600MS);
    }
    if (myFile) {
      printToFile(new_file,myFile);
    } else {
      Serial.println("couldn't open in loop");
    }
  last_time = getCurrentTime();
  }
}
