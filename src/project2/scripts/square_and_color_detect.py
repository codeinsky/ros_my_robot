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
        # Transfor to grey 
        gray = cv2.cvtColor(self.current_image, cv2.COLOR_BGR2GRAY)
        # brurred 
        blurred = cv2.GaussianBlur(gray,(5,5),1)
        # exctrating shape edges
        edges = cv2.Canny(blurred,2,80)
        # fill the gaps 
        dilated = cv2.dilate(edges, None, iterations=1)
        # create conturs 
        contours,_ = cv2.findContours(dilated, cv2.RETR_EXTERNAL ,cv2.CHAIN_APPROX_SIMPLE) 
        for c in contours:
            approx = cv2.approxPolyDP(c, 0.02*cv2.arcLength(c, True),True)
            if len(approx) ==4:
                print("found")
                x,y,w,h = cv2.boundingRect(approx)
                ratio  = float(w)/h
                if 0.85 <= ratio <=1.05:
                    print(ratio)
                    print("found square")
                    cv2.drawContours(img,[approx],0,(0,255,0),2)
        return TriggerResponse(success= True, message = "movement completed")
        
        
if __name__ == "__main__":
    try:
        detect_class = SquareAndColorDetectionNode()
        rospy.spin()
    except:
        pass 
    

