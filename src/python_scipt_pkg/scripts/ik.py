import rospy
import moveit_commander
from geometry_msgs.msg import Pose
import sys
def main():
    rospy.init_node('moveit_ik_example', anonymous=True)
    moveit_commander.roscpp_initialize(sys.argv)
    
    robot = moveit_commander.RobotCommander()
    scene = moveit_commander.PlanningSceneInterface()
    group = moveit_commander.MoveGroupCommander("arm")  # Adjust to your group name
    
    current_pose = group.get_current_pose().pose
    print("Beginning pose:", current_pose)
    joints = group.get_current_joint_values()
    print("Values are:", joints)
    group.set_planning_time(120)
    # Define target pose
    pose_target = Pose()
    pose_target.orientation.w = 1.0
    pose_target.position.x = -0.006258027992965392
    pose_target.position.y = -0.0018534419119729817
    pose_target.position.z = 0.3468777549634535
    group.set_pose_target(pose_target)
    
    # Perform IK
    plan = group.go(wait=True)
    joints = group.get_current_joint_values()
    print("Values are:", joints)
    group.stop()
    group.clear_pose_targets()

    rospy.loginfo("IK solution computed and executed")

if __name__ == "__main__":
    main()
