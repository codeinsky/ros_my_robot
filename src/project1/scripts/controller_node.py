import rospy 
from std_msgs.msg import Bool, String
from std_srvs.srv import Empty,Trigger
import datetime 
counter = 0 
threshold = 100
def controller():
    global move_service 
    global sensor_sub
    print("Controller node started")
    rospy.init_node("movement_controller_node", anonymous=True)
    sensor_sub = rospy.Subscriber('/sensor11_topic', String, sensor_callback)
    move_service = rospy.ServiceProxy("/start_movement", Trigger)
    rospy.spin()

def sensor_callback(msg):
    global threshold
    global counter
    global sensor_sub
    current_state = msg.data
    print(current_state)
    if current_state == "0":
        counter += 1 
        print(f"Detected object. Count {counter}")
    else:
        counter = 0 
        print("No object")
    if counter == threshold:
        print("Starting the movement")
        print(datetime.datetime.now().time())
        print("***************************")
        counter = 0 
        # stop reading data from senor 
        sensor_sub.unregister()
        print("Stop reading data from the sensor during run")
        # trigger the service to start the movement 
        response = move_service()
        if response.success: 
            print(response.message)
            print("reading sensor data")
            sensor_sub = rospy.Subscriber('/sensor11_topic', String, sensor_callback)
            
            
if __name__ == "__main__":
    try:
        controller()
    except rospy.ROSInterruptException:
        pass 

    
    
