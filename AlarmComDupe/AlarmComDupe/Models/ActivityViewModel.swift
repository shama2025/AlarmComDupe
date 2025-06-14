//
//  ActivityViewModel.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/9/25.
//

import Foundation

struct ActivityItem: Decodable, Identifiable {
    var id: UUID = .init() // Unique ID for each element
    var desc: String // Unique that points to specific image (open, locked)
    var location: String // Location of action (porch, bedroom, front door
    var type: ActionType // Unique action that (turning light on, opening a door
    var timestamp: Date // Time when action occured
    var screenshot: String? // Screenshot of an action, if need be
}

enum ActionType: String, Decodable {
    case lights_on = "lights_on"
    case lights_off = "lights_off"
    case door_open = "door_open"
    case door_close = "door_close"
    case id_animal = "id_animal"
    case id_person = "id_person"
    
    var iconName: String {
        switch self {
        case .lights_on: return "lightbulb.fill"
        case .lights_off: return "lightbulb"
        case .door_open: return "lock.open"
        case .door_close: return "lock.fill"
        case .id_animal: return "pawprint"
        case .id_person: return "person.fill"
        }
    }
}

enum ActivityViewItemError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
