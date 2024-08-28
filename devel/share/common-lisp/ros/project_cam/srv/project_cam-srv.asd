
(cl:in-package :asdf)

(defsystem "project_cam-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CustomService" :depends-on ("_package_CustomService"))
    (:file "_package_CustomService" :depends-on ("_package"))
  ))