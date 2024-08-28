; Auto-generated. Do not edit!


(cl:in-package project_cam-srv)


;//! \htmlinclude CustomService-request.msg.html

(cl:defclass <CustomService-request> (roslisp-msg-protocol:ros-message)
  ((input
    :reader input
    :initarg :input
    :type cl:string
    :initform ""))
)

(cl:defclass CustomService-request (<CustomService-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CustomService-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CustomService-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name project_cam-srv:<CustomService-request> is deprecated: use project_cam-srv:CustomService-request instead.")))

(cl:ensure-generic-function 'input-val :lambda-list '(m))
(cl:defmethod input-val ((m <CustomService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader project_cam-srv:input-val is deprecated.  Use project_cam-srv:input instead.")
  (input m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CustomService-request>) ostream)
  "Serializes a message object of type '<CustomService-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'input))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'input))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CustomService-request>) istream)
  "Deserializes a message object of type '<CustomService-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'input) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'input) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CustomService-request>)))
  "Returns string type for a service object of type '<CustomService-request>"
  "project_cam/CustomServiceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CustomService-request)))
  "Returns string type for a service object of type 'CustomService-request"
  "project_cam/CustomServiceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CustomService-request>)))
  "Returns md5sum for a message object of type '<CustomService-request>"
  "3291d4b5bdf7cffb16ecf585381bb69a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CustomService-request)))
  "Returns md5sum for a message object of type 'CustomService-request"
  "3291d4b5bdf7cffb16ecf585381bb69a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CustomService-request>)))
  "Returns full string definition for message of type '<CustomService-request>"
  (cl:format cl:nil "string input~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CustomService-request)))
  "Returns full string definition for message of type 'CustomService-request"
  (cl:format cl:nil "string input~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CustomService-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'input))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CustomService-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CustomService-request
    (cl:cons ':input (input msg))
))
;//! \htmlinclude CustomService-response.msg.html

(cl:defclass <CustomService-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass CustomService-response (<CustomService-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CustomService-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CustomService-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name project_cam-srv:<CustomService-response> is deprecated: use project_cam-srv:CustomService-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <CustomService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader project_cam-srv:success-val is deprecated.  Use project_cam-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CustomService-response>) ostream)
  "Serializes a message object of type '<CustomService-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CustomService-response>) istream)
  "Deserializes a message object of type '<CustomService-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CustomService-response>)))
  "Returns string type for a service object of type '<CustomService-response>"
  "project_cam/CustomServiceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CustomService-response)))
  "Returns string type for a service object of type 'CustomService-response"
  "project_cam/CustomServiceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CustomService-response>)))
  "Returns md5sum for a message object of type '<CustomService-response>"
  "3291d4b5bdf7cffb16ecf585381bb69a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CustomService-response)))
  "Returns md5sum for a message object of type 'CustomService-response"
  "3291d4b5bdf7cffb16ecf585381bb69a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CustomService-response>)))
  "Returns full string definition for message of type '<CustomService-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CustomService-response)))
  "Returns full string definition for message of type 'CustomService-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CustomService-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CustomService-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CustomService-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CustomService)))
  'CustomService-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CustomService)))
  'CustomService-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CustomService)))
  "Returns string type for a service object of type '<CustomService>"
  "project_cam/CustomService")