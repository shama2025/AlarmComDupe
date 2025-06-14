from flask import Flask, Response, request, render_template, send_from_directory


def create_app(test_config=None):
    app = Flask(__name__)

    app.route("/activity")

    def activities():
        # Returns a list of activities
        return ""

    app.route("/camera/video")

    def camera_videos():
        # Returns a list of videos that have a hosted http
        return ""

    app.route("/appliance")

    def appliances():
        # Updates a light or lock when turned on or off
        return ""

    return app
