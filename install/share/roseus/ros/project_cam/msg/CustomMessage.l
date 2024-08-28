;; Auto-generated. Do not edit!


(when (boundp 'project_cam::CustomMessage)
  (if (not (find-package "PROJECT_CAM"))
    (make-package "PROJECT_CAM"))
  (shadow 'CustomMessage (find-package "PROJECT_CAM")))
(unless (find-package "PROJECT_CAM::CUSTOMMESSAGE")
  (make-package "PROJECT_CAM::CUSTOMMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude CustomMessage.msg.html


(defclass project_cam::CustomMessage
  :super ros::object
  :slots (_message ))

(defmethod project_cam::CustomMessage
  (:init
   (&key
    ((:message __message) "")
    )
   (send-super :init)
   (setq _message (string __message))
   self)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get project_cam::CustomMessage :md5sum-) "5f003d6bcc824cbd51361d66d8e4f76c")
(setf (get project_cam::CustomMessage :datatype-) "project_cam/CustomMessage")
(setf (get project_cam::CustomMessage :definition-)
      "string message

")



(provide :project_cam/CustomMessage "5f003d6bcc824cbd51361d66d8e4f76c")


