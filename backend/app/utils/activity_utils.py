# This file handles the utility for the activity view
from datetime import datetime


def get_activities():
    # Would have a call to a db
    # But due to having a singular user, it makes more sense
    activity_items = [
        {
            "desc": "Opened",
            "location": "Front Door",
            "type": "door_close",
            "timestamp": datetime.now(),
            "screenshot": "niagarafalls",
        },
        {
            "desc": "Turned On",
            "location": "Living Room",
            "type": "lights_on",
            "timestamp": datetime.now(),
            "screenshot": "niagarafalls",
        },
        {
            "desc": "Turned On",
            "location": "Living Room",
            "type": "lights_on",
            "timestamp": datetime.now(),
            "screenshot": None,
        },
    ]

    return activity_items
