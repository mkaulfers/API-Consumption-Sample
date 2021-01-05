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
    
    var readableTime: String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = .withInternetDateTime
        let date = isoFormatter.date(from: "\(datetime_utc)Z")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d, yyyy \nh:mm a"
        
        if let date = date {
            return dateFormatter.string(from: date)
        }
        
        return "Time Not Available"
    }
}

struct Venue: Codable {
    var state: String
    var city: String
}

struct Performer: Codable {
    var image: String
}
