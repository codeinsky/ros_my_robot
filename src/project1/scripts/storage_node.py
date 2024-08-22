import rospy 
import json 
from std_msgs.msg import String, Int32

storage_status = {
  8 : 0,
  9 : 0,
  10: 0   
}

empty_slot_msgs = "none"
def storage_node_publisher():
    global storage_status
    global empty_slot_msgs
    rospy.init_node("stoarge_publisher")
    sensor8_sub = rospy.Subscriber('/sensor8_topic', String, sensor8_callback)
    sensor9_sub = rospy.Subscriber('/sensor9_topic', String, sensor9_callback)
    sensor10_sub = rospy.Subscriber('/sensor10_topic', String, sensor10_callback)
    pub_status = rospy.Publisher('storage_status', String, queue_size = 10)
    pub_free_slot = rospy.Publisher('storage_free_slot', String, queue_size = 10)
    rate = rospy.Rate(8)
    while not rospy.is_shutdown():
         # publish general stoarge status 
        pub_status.publish(str(storage_status))
        # publish first empty slot 
        empty_slots_list = [key for key,value in storage_status.items() if value == 1]
        if len(empty_slots_list) > 0:
            empty_slot_msgs = str(empty_slots_list[0])
        else:
            empty_slot_msgs = "none"
        pub_free_slot.publish(empty_slot_msgs)
        rate.sleep()
         
def sensor8_callback(data):
    global storage_status
    storage_status[8] = int(data.data)

def sensor9_callback(data):
    global storage_status
    storage_status[9] = int(data.data)

def sensor10_callback(data):
    global storage_status
    storage_status[10] = int(data.data)

if __name__=="__main__":
    try: 
        storage_node_publisher()
    except rospy.ROSInterruptException: 
        pass 
    
    