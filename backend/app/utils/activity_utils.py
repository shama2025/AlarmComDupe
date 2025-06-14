# This file handles the utility for the activity view
from datetime import datetime, timezone
import uuid
import json


def get_activities():
    # Would have a call to a db
    # But due to having a singular user

    activity_items = [
        {
            "id": uuid.UUID("123e4567-e89b-12d3-a456-426614174000"),
            "desc": "Opened",
            "location": "Front Door",
            "type": "door_close",
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "screenshot": "niagarafalls",
        },
        {
            "id": uuid.UUID("223e4567-e89b-12d3-a456-426614174001"),
            "desc": "Turned On",
            "location": "Living Room",
            "type": "lights_on",
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "screenshot": None,
        },
        {
            "id": uuid.UUID("323e4567-e89b-12d3-a456-426614174002"),
            "desc": "Turned On",
            "location": "Living Room",
            "type": "lights_on",
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "screenshot": None,
        },
    ]
    return activity_items
