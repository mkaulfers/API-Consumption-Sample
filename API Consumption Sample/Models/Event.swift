//
//  Event.swift
//  API Consumption Sample
//
//  Created by Matthew Kaulfers on 1/4/21.
//

import Foundation

struct EventAPIData: Codable {
    var events: [Event]
}

struct Event: Codable {
    var id: Int
    var datetime_utc: String
    var venue: Venue
    var performers: [Performer]
    var title: String
}

struct Venue: Codable {
    var state: String
    var city: String
}

struct Performer: Codable {
    var image: String
}
