#include <Wire.h>
#include <DS3231.h>

#define ERROR_CURSOR_OUT_OF_RANGE 1
#define ERROR_NO_CLOCK 2
#define START_TIME 0
#define START_STATE 1
#define SECONDS_FROM_1970_TO_2000 946684800
#define SAMPLING_PERIOD_S 300

#define OVERSAMPLING_RESULT_SIZE 22
#define OVERSAMPLING_NUM 32
#define OVERSAMPLING_LED_FALL_TIME_MS 10
#define OVERSAMPLING_LED_RISE_TIME_MS 10
#define OVERSAMPLING_ON_TIME_MS 80
#define CHANNEL_NUM 10

String headers[OVERSAMPLING_RESULT_SIZE + 2];
headers[0] = "time";
headers[1] = "state"; 
// time, state

unsigned long schedule_time_aggregator;
unsigned int curs = 0;
unsigned long start_time = START_TIME;
unsigned long schedule_delta[] = {1,10,1,5,1};
unsigned long schedule_delta_length = 5;
unsigned long lastSampled = 0;
bool schedule_state;


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
    schedule_state = (schedule_state + curs) % 2;
    schedule_time_aggregator = next_step;
    curs++;
  }
}

bool applyLightSchedule() {
	updateState();
	bool overrideButton //set to digital read of button pin
	if (overrideButton || schedule_state) {
		setLightschedule_state(true);
		return true;
	}
	else {
		setLightschedule_state(false);
		return false;
	}
}

void sampling(float* results, bool state) {
	for (int i = 0; i < OVERSAMPLING_RESULT_SIZE; i++)
		results[i] = 0;
	for (int j = 0; j < OVERSAMPLING_NUM; j++) {
		setLightState(false);
		// wait OVERSAMPLING_LED_FALL_TIME_MS
		// read brightness sensor & store in results[0]
			// cast to float & divide by OVERSAMPLING_NUM
			// results[0] += the divided float
		// read spectral sensor:
		for (int i = 0; i < CHANNEL_NUM; i++) {
			// temporary 10-item array to store results
			// cast to float & divide by OVERSAMPLING_NUM
			// results[i] += the divided floats
		}
		if (state) {
			setLightState(true);
		}
		// wait OVERSAMPLING_LED_RISE_TIME_MS
		// read brightness sensor & store in results[OVERSAMPLING_RESULT_SIZE/2]
			// cast to float & divide by OVERSAMPLING_NUM
			// results[OVERSAMPLING_RESULT_SIZE/2] += the divided float
		// read spectral sensor:
		for (int i = 0; i < CHANNEL_NUM; i++) {
			// temporary 10-item array to store results
			// cast to float & divide by OVERSAMPLING_NUM
			// results[OVERSAMPLING_RESULT_SIZE/2+1] += the divided floats
		}
		// wait OVERSAMPLING_ON_TIME_MS
	}
}


// globally accessible function
void setLightState(bool state) {
	// turn light on or off via mosfet or relay, depending on rise time (probably mosfet)
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
  schedule_state = START_STATE;
  Serial.println("Curs | schedule_state | Aggregator | Time");
  
  return;
}

void loop() {
  bool light_state = applyLightSchedule();
  Serial.print(curs);
  Serial.print(" | ");
  Serial.print(schedule_state);
  Serial.print(" | ");
  Serial.print(schedule_time_aggregator);
  Serial.print(" | ");
  Serial.println(getCurrentTime());
  now = getCurrentTime();
  if (now >= lastSampled + SAMPLING_PERIOD_S) {
	float results[OVERSAMPLING_RESULT_SIZE];
	sampling(results, light_state);
	lastSampled = getCurrentTime();
		// check if there is already a file for this day
		// if not, create one. write headers on the file
	// append results to day file in same order as headers
	// write time
	// loop:
		// write comma
		// write next col
	// look into flushing/syncing after you write line
	// write each column to the buffer, then write full line to the file
  }
  delay(30);
  return;
}
