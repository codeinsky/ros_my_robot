import rospy 
from std_srvs.srv import Empty, EmptyResponse, Trigger , TriggerResponse
from std_msgs.msg import Bool, String
from time import sleep 
import sys 
sys.path.insert(0,'../../Dofbot/0.py_install/Arm_Lib/')

from Arm_Lib import Arm_Device

is_busy = False 
free_slot = "none"
def movement_node():
    rospy.init_node('movement_serive_node', anonymous= True)
    service = rospy.Service("/start_movement", Trigger, start_movement)
    empty_slot_sub = rospy.Subscriber('/storage_free_slot',String, update_free_slot)
    rospy.spin()
    
def update_free_slot(msg):
    global free_slot
    free_slot = msg.data
    
def start_movement(req):
    global free_slot
    sleep_time = 3
    slots_coordinats = {
        '8': [90, 81, 8, 28, 90],
        '9': [129, 60, 24, 39, 93],
        '10': [112, 65, 33, 17, 90]
    }
    print("Going to slot:",str(free_slot))
    print("Slot coordinats of:"+ str(free_slot),":",slots_coordinats[str(free_slot)])
    current_free_slot = slots_coordinats[str(free_slot)]
    # movement sequince
    Arm = Arm_Device()
    Arm.Arm_Buzzer_On(1)
    sleep(1)
    Arm.Arm_Buzzer_On(0)
    # go home 
    Arm.Arm_serial_servo_write6(90,90,90,90,90,90,1500)
    sleep(sleep_time)
    # got to manual position 11 with open arm 
    Arm.Arm_serial_servo_write6(55, 66, 21, 33, 89, 90, 2000)
    sleep(sleep_time)
    # arm close 
    Arm.Arm_serial_servo_write(6,146,500)
    sleep(sleep_time)
    # go init with closed arm 
    Arm.Arm_serial_servo_write6(88, 131, 1, 49, 90, 146 ,2000)
    sleep(sleep_time)
    #go to posiiton 8 
    Arm.Arm_serial_servo_write6( *current_free_slot, 146, 2000)
    sleep(sleep_time)
    # open gripper 
    Arm.Arm_serial_servo_write(6,90,500)
    sleep(sleep_time)
    #go to init with kube
    Arm.Arm_serial_servo_write6(88, 131, 1, 49, 90, 90 ,2000)
    sleep(sleep_time)
    Arm.Arm_serial_servo_write6(90,90,90,90,90,90,1500)
    del Arm    
    return TriggerResponse(success= True, message = "movement completed")

if __name__ == "__main__":
    try: 
        movement_node()
    except rospy.ROSInterruptException:
        rospy.loginfo("Movement canceled")