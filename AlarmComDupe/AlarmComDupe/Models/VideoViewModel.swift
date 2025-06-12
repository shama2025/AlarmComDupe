//
//  VideoViewModel.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/11/25.
//

import Foundation

// Object that has rtsp server url for future ffmpeg configuration
struct CamerasRtsp: Codable, Identifiable {
    var id: UUID = .init()
    var camera_name: String
    var camera_rtsp_url: String
}

// Object that has http url for future streaming
struct CamerasHttp: Codable, Identifiable {
    var id: UUID = .init()
    var camera_name: String
    var camera_http_url: String
}

// Object that has attributes for security camera
struct Camera: Codable, Identifiable {
    var id: UUID = .init()
    var camera_name: String
}

enum VideoViewItemError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
