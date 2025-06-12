//
//  VideoViewDataService.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/9/25.
//

import AVKit
import Foundation

struct VideoViewDataService {
    // Get a list of camera names for streaming
    func getCameraNames() async throws -> [Camera] {
        let url = "" // Endpoint to retrieve available cameras

        return [
            Camera(camera_name: "Front Door"),
            Camera(camera_name: "Backyard"),
            Camera(camera_name: "Garage"),
            Camera(camera_name: "Living Room"),
            Camera(camera_name: "Parking Lot"),
        ]
    }

    // Passes list of rtsp endpoint for ffmpeg conversion
    func getVideoUrl() async throws -> [CamerasHttp] {
        let url = "" // Endpoint for running ffmpeg on rtspUrl

        let fakeCameras: [CamerasRtsp] = [
            CamerasRtsp(camera_name: "Front Door", camera_rtsp_url: "rtsp://192.168.1.100:554/stream1"),
            CamerasRtsp(camera_name: "Backyard", camera_rtsp_url: "rtsp://192.168.1.101:554/stream2"),
            CamerasRtsp(camera_name: "Garage", camera_rtsp_url: "rtsp://192.168.1.102:554/stream3"),
            CamerasRtsp(camera_name: "Living Room", camera_rtsp_url: "rtsp://192.168.1.103:554/stream4"),
        ]

        return [
            CamerasHttp(camera_name: "Front Door", camera_http_url: "http://192.168.1.100:8080/frontdoor.m3u8"),
            CamerasHttp(camera_name: "Backyard", camera_http_url: "http://192.168.1.100:8080/backyard.m3u8"),
            CamerasHttp(camera_name: "Garage", camera_http_url: "http://192.168.1.100:8080/garage.m3u8"),
            CamerasHttp(camera_name: "Living Room", camera_http_url: "http://192.168.1.100:8080/livingroom.m3u8"),
        ]
    }

    // Load stream and retrun player object
    func loadStreams(videos: [CamerasHttp], completion: @escaping ([AVPlayer?]) -> Void) {
        var players: [AVPlayer?] = Array(repeating: nil, count: videos.count)
        let group = DispatchGroup()

        for (index, video) in videos.enumerated() {
            guard let apiUrl = URL(string: video.camera_http_url) else {
                print("Invalid URL for camera: \(video.camera_name)")
                continue
            }

            group.enter()
            URLSession.shared.dataTask(with: apiUrl) { data, _, _ in
                defer { group.leave() }

                guard let data = data,
                      let result = try? JSONDecoder().decode([String: String].self, from: data),
                      let streamUrlString = result["url"],
                      let streamUrl = URL(string: streamUrlString)
                else {
                    print("Failed to get stream for \(video.camera_name)")
                    return
                }

                DispatchQueue.main.async {
                    let player = AVPlayer(url: streamUrl)
                    players[index] = player
                }
            }.resume()
        }

        group.notify(queue: .main) {
            completion(players)
        }
    }
}
