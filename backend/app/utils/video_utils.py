# This file handles the utility functions for the video view
import uuid

# import os
# import http.server
# import ssl
# import subprocess
# import shlex
# from flask import request


def get_videos_rtsp():
    video_devices = [
        {
            "id": uuid.UUID("a1b2c3d4-e5f6-7a8b-9c0d-ef1234567890"),
            "name": "Front Door Camera",
            "rtsp_url": "rtsp://192.168.1.10:554/stream1",
        },
        {
            "id": uuid.UUID("b2c3d4e5-f6a7-8b9c-0def-234567890abc"),
            "name": "Backyard Camera",
            "rtsp_url": "rtsp://192.168.1.11:554/stream2",
        },
        {
            "id": uuid.UUID("c3d4e5f6-a7b8-9c0d-ef12-34567890abcd"),
            "name": "Garage Camera",
            "rtsp_url": "rtsp://192.168.1.12:554/garage",
        },
        {
            "id": uuid.UUID("d4e5f6a7-b8c9-0def-1234-567890abcdef"),
            "name": "Office Camera",
            "rtsp_url": "rtsp://192.168.1.13:554/office_view",
        },
    ]

    return video_devices


def get_videos_http(video_devices):
    # Data is fake, so actual video transformation is disabled
    # for device in video_devices:
    #     folder = device.get("name").replace(" ", "_")
    #     output_dir = f"/var/www/html/{folder}"
    #     os.makedirs(output_dir, exist_ok=True)

    #     rtsp_url = device.get("rtsp_url")
    #     output_path = f"{output_dir}/stream.m3u8"

    #     cmd = f"ffmpeg -i {shlex.quote(rtsp_url)} " \
    #           f"-c:v libx264 -preset veryfast -tune zerolatency " \
    #           f"-c:a aac -f hls " \
    #           f"-hls_time 2 -hls_list_size 5 -hls_flags delete_segments " \
    #           f"{shlex.quote(output_path)}"

    #     subprocess.Popen(shlex.split(cmd))

    # ip = request.remote_addr

    # video_urls = [
    #     {
    #         "id": str(uuid.uuid4()),
    #         "name": device.get("name"),
    #         "https_url": f"https://{ip}/{device.get('name').replace(' ', '_')}/stream.m3u8"
    #     }
    #     for device in video_devices
    # ]

    video_urls = [
        {
            "id": uuid.UUID("123e4567-e89b-12d3-a456-426614174000"),
            "name": "Front Door Camera",
            "https_url": "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
        },
        {
            "id": uuid.UUID("223e4567-e89b-12d3-a456-426614174001"),
            "name": "Backyard Camera",
            "https_url": "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
        },
        {
            "id": uuid.UUID("323e4567-e89b-12d3-a456-426614174002"),
            "name": "Garage Camera",
            "https_url": "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        },
    ]

    return video_urls
