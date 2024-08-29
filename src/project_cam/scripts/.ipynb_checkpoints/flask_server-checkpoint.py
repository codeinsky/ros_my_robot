from flask import Flask, render_template 
import rospy 
from std_srvs.srv import Trigger, TriggerRequest 

app = Flask(__name__)

rospy.init_node("flask_server", anonymous=TriggerRequest)
service = rospy.ServiceProxy('/start_scan', Trigger)

@app.route('/home')
def home():
    return render_template('index.html')


@app.route('/start_service', methods=['POST'])
def trigger_start():
    # start request 
    response = service()
    if response.success:
            return {"status:":"sucess"}
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

