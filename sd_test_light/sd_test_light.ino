#include <SPI.h>
#include <SD.h>
#include <RTClib.h>
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include "Adafruit_TSL2591.h"
#include <Adafruit_AS7341.h>

#define ENABLE_ARR_PIN 4
#define POWER_PIN 5

/*
 * Connections:
 * Digital 4 to power LED in series with 1K resistor to GND
 */

File myFile;
File root;
RTC_DS3231 rtc;
uint32_t delta_ts[] = {0,    60,   120,   180,   240,   300,   360,   420,   480,
                       540,   600,   660,   720,   780,   840,   900,   960,  1020,
                      1080,  1140,  1200,  1260,  1320,  1380,  1440,  1500,  1560,
                      1620,  1680,  1740,  1800,  1860,  1920,  1980,  2040,  2100,
                      2160,  2220,  2280,  2340,  2400,  2460,  2520,  2580,  2640,
                      2700,  2760,  2820,  2880,  2940,  3000,  3060,  3120,  3180,
                      3240,  3300,  3360,  3420,  3480,  3540,  3600,  3660,  3720,
                      3780,  3840,  3900,  3960,  4020,  4080,  4140,  4200,  4260,
                      4320,  4380,  4440,  4500,  4560,  4620,  4680,  4740,  4800,
                      4860,  4920,  4980,  5040,  5100,  5160,  5220,  5280,  5340,
                      5400,  5460,  5520,  5580,  5640,  5700,  5760,  5820,  5880,
                      5940,  6000,  6060,  6120,  6180,  6240,  6300,  6360,  6420,
                      6480,  6540,  6600,  6660,  6720,  6780,  6840,  6900,  6960,
                      7020,  7080,  7140,  7200,  7260,  7320,  7380,  7440,  7500,
                      7560,  7620,  7680,  7740,  7800,  7860,  7920,  7980,  8040,
                      8100,  8160,  8220,  8280,  8340,  8400,  8460,  8520,  8580,
                      8640,  8700,  8760,  8820,  8880,  8940,  9000,  9060,  9120,
                      9180,  9240,  9300,  9360,  9420,  9480,  9540,  9600,  9660,
                      9720,  9780,  9840,  9900,  9960, 10020, 10080, 10140, 10200,
                     10260, 10320, 10380, 10440, 10500, 10560, 10620, 10680, 10740,
                     10800, 10860, 10920, 10980, 11040, 11100, 11160, 11220, 11280,
                     11340, 11400, 11460, 11520, 11580, 11640, 11700, 11760, 11820,
                     11880, 11940, 12000, 12060, 12120, 12180, 12240, 12300, 12360,
                     12420, 12480, 12540, 12600, 12660, 12720, 12780, 12840, 12900,
                     12960, 13020, 13080, 13140, 13200, 13260, 13320, 13380, 13440,
                     13500, 13560, 13620, 13680, 13740, 13800, 13860, 13920, 13980,
                     14040, 14100, 14160, 14220, 14280, 14340, 14400, 14460, 14520,
                     14580, 14640, 14700, 14760, 14820, 14880, 14940, 15000, 15060,
                     15120, 15180, 15240, 15300, 15360, 15420, 15480, 15540, 15600,
                     15660, 15720, 15780, 15840, 15900, 15960, 16020, 16080, 16140,
                     16200, 16260, 16320, 16380, 16440, 16500, 16560, 16620, 16680,
                     16740, 16800, 16860, 16920, 16980, 17040, 17100, 17160, 17220,
                     17280, 17340, 17400, 17460, 17520, 17580, 17640, 17700, 17760,
                     17820, 17880, 17940, 18000, 18060, 18120, 18180, 18240, 18300,
                     18360, 18420, 18480, 18540, 18600, 18660, 18720, 18780, 18840,
                     18900, 18960, 19020, 19080, 19140, 19200, 19260, 19320, 19380,
                     19440, 19500, 19560, 19620, 19680, 19740, 19800, 19860, 19920,
                     19980, 20040, 20100, 20160, 20220, 20280, 20340, 20400, 20460,
                     20520, 20580, 20640, 20700, 20760, 20820, 20880, 20940, 21000,
                     21060, 21120, 21180, 21240, 21300, 21360, 21420, 21480, 21540,
                     21600, 21660, 21720, 21780, 21840, 21900, 21960, 22020, 22080,
                     22140, 22200, 22260, 22320, 22380, 22440, 22500, 22560, 22620,
                     22680, 22740, 22800, 22860, 22920, 22980, 23040, 23100, 23160,
                     23220, 23280, 23340, 23400, 23460, 23520, 23580, 23640, 23700,
                     23760, 23820, 23880, 23940, 24000, 24060, 24120, 24180, 24240,
                     24300, 24360, 24420, 24480, 24540, 24600, 24660, 24720, 24780,
                     24840, 24900, 24960, 25020, 25080, 25140, 25200, 25260, 25320,
                     25380, 25440, 25500, 25560, 25620, 25680, 25740, 25800, 25860,
                     25920, 25980, 26040, 26100, 26160, 26220, 26280, 26340, 26400,
                     26460, 26520, 26580, 26640, 26700, 26760, 26820, 26880, 26940,
                     27000, 27060, 27120, 27180, 27240, 27300, 27360, 27420, 27480,
                     27540, 27600, 27660, 27720, 27780, 27840, 27900, 27960, 28020,
                     28080, 28140, 28200, 28260, 28320, 28380, 28440, 28500, 28560,
                     28620, 28680, 28740, 28800, 28860, 28920, 28980, 29040, 29100,
                     29160, 29220, 29280, 29340, 29400, 29460, 29520, 29580, 29640,
                     29700, 29760, 29820, 29880, 29940, 30000, 30060, 30120, 30180,
                     30240, 30300, 30360, 30420, 30480, 30540, 30600, 30660, 30720,
                     30780, 30840, 30900, 30960, 31020, 31080, 31140, 31200, 31260,
                     31320, 31380, 31440, 31500, 31560, 31620, 31680, 31740, 31800,
                     31860, 31920, 31980, 32040, 32100, 32160, 32220, 32280, 32340,
                     32400, 32460, 32520, 32580, 32640, 32700, 32760, 32820, 32880,
                     32940, 33000, 33060, 33120, 33180, 33240, 33300, 33360, 33420,
                     33480, 33540, 33600, 33660, 33720, 33780, 33840, 33900, 33960,
                     34020, 34080, 34140, 34200, 34260, 34320, 34380, 34440, 34500,
                     34560, 34620, 34680, 34740, 34800, 34860, 34920, 34980, 35040,
                     35100, 35160, 35220, 35280, 35340, 35400, 35460, 35520, 35580,
                     35640, 35700, 35760, 35820, 35880, 35940};
uint32_t next_time;
uint32_t last_time;
uint32_t delta_t;
int day_index;
/*
 * if current time >= last_time + delta_t
 */
String print_data;
String print_lux;
bool arr_on;



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

void setup() {
  Wire.begin();
  pinMode(ENABLE_ARR_PIN, OUTPUT);           // set pin to input
  digitalWrite(ENABLE_ARR_PIN, LOW);       // turn on pullup resistors
  Serial.begin(115200);  if (rtc.now().unixtime() >= last_time + delta_ts[day_index]) {
    last_time = rtc.now().unixtime();
    day_index = day_index + 1;
    Serial.println("fired");
  }
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
  day_index = 0;
}

void loop() {
  // put your main code here, to run repeatedly:
  if (rtc.now().unixtime() >= last_time + delta_ts[day_index]) {
    digitalWrite(ENABLE_ARR_PIN, LOW);       // turn on pullup resistors
    last_time = rtc.now().unixtime();
    day_index = day_index + 1;
    Serial.println("fired");
  }
}
