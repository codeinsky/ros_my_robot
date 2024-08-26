import rospy 
from sensor_msgs.msg import Image
from std_srvs.srv import Trigger, TriggerResponse 
from cv_bridge import CvBridge
import cv2
import numpy as np 

class SquareAndColorDetectionNode():
    rospy.init_node("square_color_detetion_service")
    selft.bridge = CvBridge()
    self.current_image = None 
    self.image_subscriber = rospy.Subscriber('/camera/images',Image, self.store_image)
    self.service = rospy.Service('process_image', Trigger, self.detect_object)

    def store_image(self, msg):
        try:
            self.current_image = self.bridge.imgmsg_to_cv2(msg, "bgr8")
        except:
            print("failed to parse image from message")
        
    def detect_object(msg):
        print("Startind image processing")
        

if __name__ == "__main__":
    try:
        detect_class = SquareAndColorDetectionNode()
    except:
        pass 
    

