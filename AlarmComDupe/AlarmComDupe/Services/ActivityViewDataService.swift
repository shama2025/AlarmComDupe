//
//  ActivityViewDataService.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/9/25.
//

import Foundation

struct ActivityViewDataService {
    func getActivityData() async throws -> [ActivityItem] {
        let endpoint = "http://192.168.0.23:5000/activity" // Url endpoint for activity

       guard let url: URL = URL(string: endpoint) else { // Set endpoint to be of type url
           throw ActivityViewItemError.invalidURL
       }

       let (data,response) = try await URLSession.shared.data(from: url)

       guard let response:HTTPURLResponse = response as? HTTPURLResponse, response.statusCode == 200 else {
           throw ActivityViewItemError.invalidResponse
       }

        do {
            let decoder = JSONDecoder() // Decode the JSON
            decoder.keyDecodingStrategy = .convertFromSnakeCase // Helps convert the data from snake to camel case

            // return try decoder.decode(ActivityItem.self, from: data) // Decode data into ActivityItem Object
            // May fail, make sure to check property names in ActivityViewModel

            return [
                ActivityItem(desc: "Opened", location: "Front Door", type: .door_close, timestamp: Date(), screenshot: "niagarafalls"),
                ActivityItem(desc: "Turned On", location: "Living Room", type: .lights_on, timestamp: Date(), screenshot: "niagarafalls"),
                ActivityItem(desc: "Turned On", location: "Living Room", type: .lights_on, timestamp: Date(), screenshot: nil as String?),
            ]
        } catch {
            throw ActivityViewItemError.invalidData
        }
    }
}
