;; Auto-generated. Do not edit!


(when (boundp 'project_cam::CustomService)
  (if (not (find-package "PROJECT_CAM"))
    (make-package "PROJECT_CAM"))
  (shadow 'CustomService (find-package "PROJECT_CAM")))
(unless (find-package "PROJECT_CAM::CUSTOMSERVICE")
  (make-package "PROJECT_CAM::CUSTOMSERVICE"))
(unless (find-package "PROJECT_CAM::CUSTOMSERVICEREQUEST")
  (make-package "PROJECT_CAM::CUSTOMSERVICEREQUEST"))
(unless (find-package "PROJECT_CAM::CUSTOMSERVICERESPONSE")
  (make-package "PROJECT_CAM::CUSTOMSERVICERESPONSE"))

(in-package "ROS")





(defclass project_cam::CustomServiceRequest
  :super ros::object
  :slots (_input ))

(defmethod project_cam::CustomServiceRequest
  (:init
   (&key
    ((:input __input) "")
    )
   (send-super :init)
   (setq _input (string __input))
   self)
  (:input
   (&optional __input)
   (if __input (setq _input __input)) _input)
  (:serialization-length
   ()
   (+
    ;; string _input
    4 (length _input)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _input
       (write-long (length _input) s) (princ _input s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _input
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _input (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass project_cam::CustomServiceResponse
  :super ros::object
  :slots (_success ))

(defmethod project_cam::CustomServiceResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass project_cam::CustomService
  :super ros::object
  :slots ())

(setf (get project_cam::CustomService :md5sum-) "3291d4b5bdf7cffb16ecf585381bb69a")
(setf (get project_cam::CustomService :datatype-) "project_cam/CustomService")
(setf (get project_cam::CustomService :request) project_cam::CustomServiceRequest)
(setf (get project_cam::CustomService :response) project_cam::CustomServiceResponse)

(defmethod project_cam::CustomServiceRequest
  (:response () (instance project_cam::CustomServiceResponse :init)))

(setf (get project_cam::CustomServiceRequest :md5sum-) "3291d4b5bdf7cffb16ecf585381bb69a")
(setf (get project_cam::CustomServiceRequest :datatype-) "project_cam/CustomServiceRequest")
(setf (get project_cam::CustomServiceRequest :definition-)
      "string input
---
bool success

")

(setf (get project_cam::CustomServiceResponse :md5sum-) "3291d4b5bdf7cffb16ecf585381bb69a")
(setf (get project_cam::CustomServiceResponse :datatype-) "project_cam/CustomServiceResponse")
(setf (get project_cam::CustomServiceResponse :definition-)
      "string input
---
bool success

")



(provide :project_cam/CustomService "3291d4b5bdf7cffb16ecf585381bb69a")


