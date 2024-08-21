gripper_open = Arm.Arm_serial_servo_write(6,90,100)
gripper_close = Arm.Arm_serial_servo_write(6,144,100)

home_position = [90,90,90,90,90,90]

# go to kube postion 11 with open gripper from HOME 
Arm.Arm_serial_servo_write6(55, 66, 21, 33, 89, 80, 2000)

# got to kube position 8 with open gripper from HOME 
Arm.Arm_serial_servo_write6( 90, 81, 8, 28, 90, 90, 2000)

# go to kube position 10 with open gropper from home
Arm.Arm_serial_servo_write6( 112, 65, 33, 17, 90, 90,2000)

# go to kube position 9 with open gripper from home 
Arm.Arm_serial_servo_write6( 129, 60, 24, 39, 93, 90,2000)

