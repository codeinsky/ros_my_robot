import rospy 
import cv2
from std_srvs.srv import Trigger, TriggerResponse
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import sys
sys.path.insert(0,'../../Dofbot/0.py_install/Arm_Lib/')
from Arm_Lib import Arm_Device
from time import sleep
class scan_store_slots:
    def __init__(self):
        rospy.init_node("scan_store_slots")
        self.brige = CvBridge()
        self.service = rospy.Service("start_scan", Trigger, self.start_scan)
        self.positions = {
            "home": [90,90,90,90,90,90],
            "init": [88, 131, 1, 49, 90, 146], 
            "slot_8": [90, 81, 8, 28, 90, 90, 2000],
            "slot_10": [112, 65, 33, 17, 90, 90,2000],
            "slot_9": [129, 60, 24, 39, 93, 90,2000],
            "gripper_open": [6,90,100],
            "gripper_close":[6,144,100]
        }

    def start_scan(self,message):
        print("Start scan")
        sleep_time= 3
        Arm = Arm_Device()
        Arm.Arm_Buzzer_On(1)
        sleep(1)
        Arm.Arm_Buzzer_On(0)
        # go home 
        Arm.Arm_serial_servo_write6(90,90,90,90,90,90,1500)
        sleep(sleep_time)
        # go init 
        Arm.Arm_serial_servo_write6(88, 131, 1, 49, 90, 90 ,2000)
        sleep(sleep_time)
        # go slot 8 
        Arm.Arm_serial_servo_write6(*self.positions['slot_8'])
        sleep(sleep_time)
        # take image and process 
        self.process_image("8")
        # go init
        Arm.Arm_serial_servo_write6(88, 131, 1, 49, 90, 90 ,2000)
        sleep(sleep_time)
        
        # go slot 10
        Arm.Arm_serial_servo_write6(*self.positions['slot_10'])
        sleep(sleep_time)
        # take image and process 
        self.process_image("10")
        
        # go init
        Arm.Arm_serial_servo_write6(88, 131, 1, 49, 90, 90 ,2000)
        sleep(sleep_time)
        
        # go to slot 9
        Arm.Arm_serial_servo_write6(*self.positions['slot_9'])
        sleep(sleep_time)
        # take image and process 
        self.process_image("9")
        
        # go init
        Arm.Arm_serial_servo_write6(88, 131, 1, 49, 90, 90 ,2000)
        sleep(sleep_time)
        # go home , complted
        Arm.Arm_serial_servo_write6(90,90,90,90,90,90,1500)
        return TriggerResponse(success=True, message="Completed")
    def process_image(self, slot_name):
        print("processing the image for slot:", slot_name) 
        return {"status:":"sucess"}
if __name__== '__main__':
    try:
        main_node = scan_store_slots()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass 
        
    
    