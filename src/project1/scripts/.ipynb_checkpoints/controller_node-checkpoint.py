import rospy 
from std_msgs.msg import Bool, String
from std_srvs.srv import Empty, EmptyResponse

counter = 0 
threshold = 10 
def controller():
    global move_service 
    print("Controller node started")
    rospy.init_node("movement_controller_node", anonymous=True)
    sensor_sub = rospy.Subscriber('/sensor11_topic', String, sensor_callback)
    move_service = rospy.ServiceProxy("/start_movement", Empty)
    rospy.spin()

def sensor_callback(msg):
    global threshold
    global counter
    current_state = msg.data
    print(current_state)
    if current_state == "0":
        counter += 1 
        print(f"Detected object. Count {counter}")
    else:
        counter = 0 
    if counter == threshold:
        print("Starting the movement")
        counter = 0 
        move_service()
        
if __name__ == "__main__":
    try:
        controller()
    except rospy.ROSInterruptException:
        pass 

    
    
