#include <RTClib.h>
#include <Wire.h>
RTC_DS3231 rtc;

void setup() {
  Wire.begin();
  Serial.begin(115200);
  if (!rtc.begin()) {
    Serial.println("Couldn't find RTC");
    Serial.flush();
    while (1) delay(10);
  }
  Serial.println(rtc.now().unixtime());
  rtc.setAlarm1(rtc.now() + TimeSpan(0, 0, 0, 5), DS3231_A1_Minute); // In 5 seconds from now
}

void loop() {
  if (rtc.alarmFired(1)) {
    Serial.println("fired");
    Serial.println(rtc.now().unixtime());
    rtc.clearAlarm(1);
    rtc.setAlarm1(rtc.now() + TimeSpan(0, 0, 0, 5), DS3231_A1_Minute); // In 5 seconds from now
  }
}
