#include <Wire.h>
#include <DS3231.h>

#define ERROR_CURSOR_OUT_OF_RANGE 1
#define ERROR_NO_CLOCK 2
#define START_TIME 0
#define SECONDS_FROM_1970_TO_2000 946684800

unsigned long schedule_time_aggregator;
unsigned int curs = 0;
unsigned long start_time = START_TIME;
unsigned long schedule_delta[] = {1,10,1,5,1};
unsigned long schedule_delta_length = 5;
bool start_state;

RTClib myRTC;


void error(int code) {
  while (true) {
    delay(code*1000);
    Serial.print("Error: ");
    Serial.println(code);
  }
}

unsigned long getCurrentTime() {
  
  return myRTC.now().unixtime() - SECONDS_FROM_1970_TO_2000;
}

void updateState() {
  unsigned long real_time;
  while (true) { // 
    if (curs >= schedule_delta_length)
      error(ERROR_CURSOR_OUT_OF_RANGE);
    
    real_time = getCurrentTime();
    long next_step = schedule_time_aggregator + schedule_delta[curs];
    if (next_step >= real_time) {
      return;
    }
    start_state = (start_state + curs) % 2;
    schedule_time_aggregator = next_step;
    curs++;
  }
}


void setup() {
  Wire.begin();
  Serial.begin(9600);
  DS3231 myDS;
  Serial.println(__TIME__);
  
  myDS.setEpoch(1647214960 - SECONDS_FROM_1970_TO_2000,false);
  start_time = getCurrentTime();
  //^ fixme!!! should be reference pt e.g. day before setup
  delay(100);
  schedule_time_aggregator = start_time;
  start_state = 1;
  Serial.println("Curs | State | Aggregator | Time");
  return;
}

void loop() {
  updateState();
  Serial.print(curs);
  Serial.print(" | ");
  Serial.print(start_state);
  Serial.print(" | ");
  Serial.print(schedule_time_aggregator);
  Serial.print(" | ");
  Serial.println(getCurrentTime());
  delay(1000);
  return;
}
