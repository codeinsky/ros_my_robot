import rospy 
from sensor_msgs.msg import Image 
from cv_bridge import CvBridge
import cv2
import numpy as np 
import cv2

def main():
    rospy.init_node("camera_node")
    image_publisher = rospy.Publisher('camera/images',Image, queue_size=10)
    bridge = CvBridge()
    delay = rospy.Rate(10)
    cam_object = cv2.VideoCapture(0)
    while not rospy.is_shutdown():
        ret, frame = cam_object.read()
        if not ret:
            print("failed to start camera")
            break
        # cv2.imshow('Online video', frame)
    
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

        # cast image to ros message type 
        ros_image = bridge.cv2_to_imgmsg(frame, encoding="bgr8")
        image_publisher.publish(ros_image)
        delay.sleep()  
    image_publisher.release()
    cv2.destroyAllWindows()
    
if __name__=="__main__":
    try:
        main()
    except:
        pass 
        
