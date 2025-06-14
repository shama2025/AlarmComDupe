//
//  VideoViewModel.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/12/25.
//

import Foundation

// Struct for devices that have video capabilities
// Get from backend, list of devices
// Pass to backend to get list of http urls
struct VideoDevice: Codable, Identifiable {
    var id: UUID = .init() // Unique id for VideoDevice
    var name: String // Name of device
    var rtspUrl: String // RTSP url used for future ffmpeg conversion
}

// Struct containing https urls for video streaming
struct VideoUrls: Decodable, Identifiable {
    var id: UUID = .init() // Unique id for VideoDevice
    var name: String // Name of device
    var httpsUrl: String // Https url, post ffmpeg conversion
}

// Enum for potential errors when accessing backend
enum VideoViewItemError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
