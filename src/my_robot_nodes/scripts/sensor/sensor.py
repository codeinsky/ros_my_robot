import rospy 
from std_msgs.msg import String
import serial

def stream_sensor():
    rospy.init_node('arduino_sensor_node', anonymous=True)
    publisher = rospy.Publisher('sensor_data',String, queue_size=10)
    serial_object = serial.Serial('/dev/ttyUSB1',9600)
    rate= rospy.Rate(10)
    while not rospy.is_shutdown():
        # check if there is data in the serial port ready fot intro 
        if serial_object.in_waiting > 0:
            sensor_status = serial_object.readline().decode('utf-8').strip()
            publisher.publish(sensor_status)
            print(sensor_status)
        rate.sleep()
if __name__ == '__main__':
    try:
        stream_sensor()
    except rospy.ROSInterruptException:
        pass