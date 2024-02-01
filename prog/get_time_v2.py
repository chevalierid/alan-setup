# Importing Libraries
import serial
import time
rtc_set = 0

arduino = serial.Serial(port='/dev/ttyACM0', baudrate=115200, timeout=.1)
def write_read(x):
    print(x) # printing the value
    arduino.write(bytes(x, 'utf-8'))
    time.sleep(0.05)
    data = arduino.readline()
    return data
while rtc_set == 0:
    time.sleep(5)
    value = write_read(str(int(time.time()))).decode()
    print(value) # printing the value
    if value == "set\r\n":
        arduino.close()
        rtc_set = 1