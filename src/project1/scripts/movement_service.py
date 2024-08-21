import rospy 
from std_srvs.srv import Empty, EmptyResponse
from time import sleep 


def movement_node():
    rospy.init_node('movement_serive_node', anonymous= True)
    service = rospy.Service("/start_movement", Empty, start_movement)
    rospy.spin()

def start_movement(req):
    
    
    rospy.loginfo("Movement sequence is starting")
    sleep(5)
    rospy.loginfo("Movement sequence competed")
    return EmptyResponse()

if __name__ == "__main__":
    try: 
        movement_node()
    except rospy.ROSInterruptException:
        rospy.loginfo("Movement canceled")