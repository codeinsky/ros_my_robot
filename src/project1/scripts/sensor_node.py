import rospy 
from std_msgs.msg import String, Float32
import serial


def sensors_node():
    print("node start")
    # node initialize
    # arg1 - node name 
    # arg2 - node can have few instances and node name will be generated to avoid nodes with same name 
    rospy.init_node('sensors_node_status', anonymous=True)
    # setup publishers 
    # arg1 - publisher name 
    # arg2 - Message type 
    # queue_size - buffer for streamed messages
    pub1 = rospy.Publisher('sensor6_topic', String, queue_size = 10)
    pub2 = rospy.Publisher('sensor7_topic', String, queue_size = 10)
    pub3 = rospy.Publisher('sensor8_topic', String, queue_size = 10)
    pub4 = rospy.Publisher('sensor9_topic', String, queue_size = 10)
    pub5 = rospy.Publisher('sensor10_topic', String, queue_size = 10)
    pub6 = rospy.Publisher('sensor11_topic', String, queue_size = 10)
    #Serial connection 
    serial_object = serial.Serial('/dev/ttyUSB0',9600)
    # Setting loop friquency 
    rate = rospy.Rate(10)
    # Main node loop 
    while not rospy.is_shutdown():
        # Check if data arravied on serial 
        if serial_object.in_waiting > 0:
            sensor_status = serial_object.readline().decode('utf-8').strip()
            print(sensor_status)
            # parsing result 
            data = sensor_status.split(',')
            pub1.publish(data[0].split(":")[1])
            pub2.publish(data[1].split(":")[1])
            pub3.publish(data[2].split(":")[1])
            pub4.publish(data[3].split(":")[1])
            pub5.publish(data[4].split(":")[1])
            pub6.publish(data[5].split(":")[1])
            
            
        rate.sleep()
if __name__=='__main__':
    try:
        sensors_node()
    except rospy.ROSInterruptException:
        pass