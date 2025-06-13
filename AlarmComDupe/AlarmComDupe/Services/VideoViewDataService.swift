//
//  VideoViewDataService.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/9/25.
//

import Foundation

class VideoViewDataService : ObservableObject {
    @Published public var httpDevices: [VideoUrls] = []
    @Published public private(set) var rtspDevices: [VideoDevice] = []
    
    func loadDevices() async {
        do {
            let devices = try await getDevices()
            rtspDevices = devices // triggers UI update
        } catch VideoViewItemError.invalidURL {
            print("Invalid URL")
        } catch VideoViewItemError.invalidData {
            print("Invalid Data")
        } catch VideoViewItemError.invalidResponse {
            print("Invalid Response")
        } catch {
            print("Something went wrong: \(error)")
        }
    }

    // Get list of devices
    func getDevices() async throws -> [VideoDevice]{
        
        let endpoint = "" // Url endpoint for activity

//        guard let url: URL = URL(string: endpoint) else { // Set endpoint to be of type url
//            throw VideoViewItemError.invalidURL
//        }
//
//        let (data,response) = try await URLSession.shared.data(from: url)
//
//        guard let response:HTTPURLResponse = response as? HTTPURLResponse, response.statusCode == 200 else {
//            throw VideoViewItemError.invalidResponse
//        }
//
        do {
            let decoder = JSONDecoder() // Decode the JSON
            decoder.keyDecodingStrategy = .convertFromSnakeCase // Helps convert the data from snake to camel case

            // return try decoder.decode(ActivityItem.self, from: data) // Decode data into ActivityItem Object
            // May fail, make sure to check property names in ActivityViewModel

            return [
                VideoDevice(
                    id: UUID(uuidString: "a1b2c3d4-e5f6-7a8b-9c0d-ef1234567890")!,
                    name: "Front Door Camera",
                    rtsp_url: "rtsp://192.168.1.10:554/stream1"
                ),
                VideoDevice(
                    id: UUID(uuidString: "b2c3d4e5-f6a7-8b9c-0def-234567890abc")!,
                    name: "Backyard Camera",
                    rtsp_url: "rtsp://192.168.1.11:554/stream2"
                ),
                VideoDevice(
                    id: UUID(uuidString: "c3d4e5f6-a7b8-9c0d-ef12-34567890abcd")!,
                    name: "Garage Camera",
                    rtsp_url: "rtsp://192.168.1.12:554/garage"
                ),
                VideoDevice(
                    id: UUID(uuidString: "d4e5f6a7-b8c9-0def-1234-567890abcdef")!,
                    name: "Office Camera",
                    rtsp_url: "rtsp://192.168.1.13:554/office_view"
                )
            ]
        } catch {
            throw VideoViewItemError.invalidData
        }
    }
    
    func getVideoUrls() async throws -> [VideoUrls]? {
        
        let endpoint = "" // Url endpoint for activity

//        guard let url: URL = URL(string: endpoint) else { // Set endpoint to be of type url
//            throw VideoViewItemError.invalidURL
//        }
//
//        let (data,response) = try await URLSession.shared.data(from: url)
//
//        guard let response:HTTPURLResponse = response as? HTTPURLResponse, response.statusCode == 200 else {
//            throw VideoViewItemError.invalidResponse
//        }
//
        do {
            let decoder = JSONDecoder() // Decode the JSON
            decoder.keyDecodingStrategy = .convertFromSnakeCase // Helps convert the data from snake to camel case

            // return try decoder.decode(ActivityItem.self, from: data) // Decode data into ActivityItem Object
            // May fail, make sure to check property names in ActivityViewModel

            return [
                VideoUrls(
                    id: UUID(uuidString: "123e4567-e89b-12d3-a456-426614174000")!,
                    name: "Front Door Camera",
                    https_url: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4"
                ),
                VideoUrls(
                    id: UUID(uuidString: "223e4567-e89b-12d3-a456-426614174001")!,
                    name: "Backyard Camera",
                    https_url: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
                ),
                VideoUrls(
                    id: UUID(uuidString: "323e4567-e89b-12d3-a456-426614174002")!,
                    name: "Garage Camera",
                    https_url: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
                ),
            ]

        } catch {
            throw VideoViewItemError.invalidData
        }
    }
    
}
        
