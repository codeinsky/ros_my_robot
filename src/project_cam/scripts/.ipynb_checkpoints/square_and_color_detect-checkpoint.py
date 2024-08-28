import rospy 
from sensor_msgs.msg import Image
from std_srvs.srv import Trigger, TriggerResponse 
from cv_bridge import CvBridge
import cv2
import numpy as np 
message = ""
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
        slot_id = rospy.get_param('/slot_scan_id', "no param")
        print("Scanned slot:", slot_id)
        image_frame = self.current_image
        # object detecting 
        # 1. detetcing square 
        path = "./slot_" + slot_id +"/"
        cv2.imwrite(path+"image.jpg", image_frame)
        # Transfor to grey 
        gray = cv2.cvtColor(self.current_image, cv2.COLOR_BGR2GRAY)
        cv2.imwrite(path+"image_gray.jpg", gray)
        # brurred 
        blurred = cv2.GaussianBlur(gray,(5,5),1)
        cv2.imwrite(path+"blur.jpg", blurred)
        # exctrating shape edges
        edges = cv2.Canny(blurred,2,80)
        cv2.imwrite(path+"edges.jpg", edges)
        # fill the gaps 
        dilated = cv2.dilate(edges, None, iterations=1)
        cv2.imwrite(path+"dilated.jpg", dilated)
        # create conturs 
        contours,_ = cv2.findContours(dilated, cv2.RETR_EXTERNAL ,cv2.CHAIN_APPROX_SIMPLE) 
        for c in contours:
            approx = cv2.approxPolyDP(c, 0.02*cv2.arcLength(c, True),True)
            if len(approx) ==4:
                print("found")
                x,y,w,h = cv2.boundingRect(approx)
                ratio  = float(w)/h
                if 0.085 <= ratio <=2.05:
                    print(ratio)
                    print("found square")
                    cv2.drawContours(image_frame,[approx],0,(0,255,0),2)
        cv2.imwrite(path+ "image_processed.jpg", image_frame)
        return TriggerResponse(success= True, message = "movement completed")
        
        
if __name__ == "__main__":
    try:
        detect_class = SquareAndColorDetectionNode()
        rospy.spin()
    except:
        pass 
    

