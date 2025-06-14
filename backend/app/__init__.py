from flask import Flask, jsonify
from .utils import video_utils, activity_utils

app = Flask(__name__)


@app.route("/activity")
def activities():
    # Returns a list of activities
    return jsonify(activity_utils.get_activities()), 200


@app.route("/camera/video")
def camera_videos():
    # Returns a list of videos that have a hosted http
    return jsonify(video_utils.get_videos_http("tmp")), 200
