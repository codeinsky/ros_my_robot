# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "project_cam: 1 messages, 1 services")

set(MSG_I_FLAGS "-Iproject_cam:/home/yahboom/my_project_move_it/src/project_cam/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(project_cam_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/yahboom/my_project_move_it/src/project_cam/msg/CustomMessage.msg" NAME_WE)
add_custom_target(_project_cam_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "project_cam" "/home/yahboom/my_project_move_it/src/project_cam/msg/CustomMessage.msg" ""
)

get_filename_component(_filename "/home/yahboom/my_project_move_it/src/project_cam/srv/CustomService.srv" NAME_WE)
add_custom_target(_project_cam_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "project_cam" "/home/yahboom/my_project_move_it/src/project_cam/srv/CustomService.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(project_cam
  "/home/yahboom/my_project_move_it/src/project_cam/msg/CustomMessage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/project_cam
)

### Generating Services
_generate_srv_cpp(project_cam
  "/home/yahboom/my_project_move_it/src/project_cam/srv/CustomService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/project_cam
)

### Generating Module File
_generate_module_cpp(project_cam
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/project_cam
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(project_cam_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(project_cam_generate_messages project_cam_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yahboom/my_project_move_it/src/project_cam/msg/CustomMessage.msg" NAME_WE)
add_dependencies(project_cam_generate_messages_cpp _project_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yahboom/my_project_move_it/src/project_cam/srv/CustomService.srv" NAME_WE)
add_dependencies(project_cam_generate_messages_cpp _project_cam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(project_cam_gencpp)
add_dependencies(project_cam_gencpp project_cam_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS project_cam_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(project_cam
  "/home/yahboom/my_project_move_it/src/project_cam/msg/CustomMessage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/project_cam
)

### Generating Services
_generate_srv_eus(project_cam
  "/home/yahboom/my_project_move_it/src/project_cam/srv/CustomService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/project_cam
)

### Generating Module File
_generate_module_eus(project_cam
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/project_cam
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(project_cam_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(project_cam_generate_messages project_cam_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yahboom/my_project_move_it/src/project_cam/msg/CustomMessage.msg" NAME_WE)
add_dependencies(project_cam_generate_messages_eus _project_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yahboom/my_project_move_it/src/project_cam/srv/CustomService.srv" NAME_WE)
add_dependencies(project_cam_generate_messages_eus _project_cam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(project_cam_geneus)
add_dependencies(project_cam_geneus project_cam_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS project_cam_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(project_cam
  "/home/yahboom/my_project_move_it/src/project_cam/msg/CustomMessage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/project_cam
)

### Generating Services
_generate_srv_lisp(project_cam
  "/home/yahboom/my_project_move_it/src/project_cam/srv/CustomService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/project_cam
)

### Generating Module File
_generate_module_lisp(project_cam
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/project_cam
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(project_cam_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(project_cam_generate_messages project_cam_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yahboom/my_project_move_it/src/project_cam/msg/CustomMessage.msg" NAME_WE)
add_dependencies(project_cam_generate_messages_lisp _project_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yahboom/my_project_move_it/src/project_cam/srv/CustomService.srv" NAME_WE)
add_dependencies(project_cam_generate_messages_lisp _project_cam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(project_cam_genlisp)
add_dependencies(project_cam_genlisp project_cam_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS project_cam_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(project_cam
  "/home/yahboom/my_project_move_it/src/project_cam/msg/CustomMessage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/project_cam
)

### Generating Services
_generate_srv_nodejs(project_cam
  "/home/yahboom/my_project_move_it/src/project_cam/srv/CustomService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/project_cam
)

### Generating Module File
_generate_module_nodejs(project_cam
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/project_cam
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(project_cam_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(project_cam_generate_messages project_cam_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yahboom/my_project_move_it/src/project_cam/msg/CustomMessage.msg" NAME_WE)
add_dependencies(project_cam_generate_messages_nodejs _project_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yahboom/my_project_move_it/src/project_cam/srv/CustomService.srv" NAME_WE)
add_dependencies(project_cam_generate_messages_nodejs _project_cam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(project_cam_gennodejs)
add_dependencies(project_cam_gennodejs project_cam_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS project_cam_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(project_cam
  "/home/yahboom/my_project_move_it/src/project_cam/msg/CustomMessage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/project_cam
)

### Generating Services
_generate_srv_py(project_cam
  "/home/yahboom/my_project_move_it/src/project_cam/srv/CustomService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/project_cam
)

### Generating Module File
_generate_module_py(project_cam
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/project_cam
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(project_cam_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(project_cam_generate_messages project_cam_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yahboom/my_project_move_it/src/project_cam/msg/CustomMessage.msg" NAME_WE)
add_dependencies(project_cam_generate_messages_py _project_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yahboom/my_project_move_it/src/project_cam/srv/CustomService.srv" NAME_WE)
add_dependencies(project_cam_generate_messages_py _project_cam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(project_cam_genpy)
add_dependencies(project_cam_genpy project_cam_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS project_cam_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/project_cam)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/project_cam
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(project_cam_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/project_cam)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/project_cam
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(project_cam_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/project_cam)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/project_cam
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(project_cam_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/project_cam)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/project_cam
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(project_cam_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/project_cam)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/project_cam\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/project_cam
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(project_cam_generate_messages_py std_msgs_generate_messages_py)
endif()
