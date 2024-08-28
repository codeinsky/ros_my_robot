import rospy 
from sensor_msgs.msg import Image
from std_srvs.srv import Trigger, TriggerResponse 
from cv_bridge import CvBridge
import cv2
import numpy as np 

class SquareAndColorDetectionNode():
    def __init__(self):
        rospy.init_node("square_color_detetion_service")
        self.bridge = CvBridge()
        self.current_image = None 
        self.image_subscriber = rospy.Subscriber('/camera/images',Image, self.store_image)
        self.service = rospy.Service('process_image', Trigger, self.detect_object)

    def store_image(self, msg):
        try:
            self.current_image = self.bridge.imgmsg_to_cv2(msg, "bgr8")
        except:
            print("failed to parse image from message")
        
    def detect_object(self,msg):
        print("Startind image processing")
        # object detecting 
        # 1. detetcing square 
        cv2.imwrite("image.jpg", self.current_image)
        # if self.current_image is not None : 
            
        #     gray = cv2.cvtColor(self.current_image, cv2.COLOR_BGR2GRAY)
        #     blurred = cv2.GaussianBlur(gray,(5,5),0)
        #     edged_img = cv2.Canny(blurred,50,150)
        #     count, na = cv2.findContours(edged_img.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
        #     for c in count:
        #         edge_count = cv2.approxPolyDP(c, 0.04* cv2.arcLength(c, True), True)
        #         print(edge_count)
        #         # if edge_count == 4: 
        #         #     print("detetcted")
        return TriggerResponse(success= True, message = "movement completed")
        
        
if __name__ == "__main__":
    try:
        detect_class = SquareAndColorDetectionNode()
        rospy.spin()
    except:
        pass 
    

