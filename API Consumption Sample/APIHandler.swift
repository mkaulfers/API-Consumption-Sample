//
//  APIHandler.swift
//  API Consumption Sample
//
//  Created by Matthew Kaulfers on 1/4/21.
//

import Foundation

class APIHandler {
    let secret = "9dff89697947d0caa95800d38206dc8dc5fca32c6dfacfcdfc6540fe1d57061a"
    let clientID = "MjE0Nzg5MzB8MTYwOTc4NzIyMC40MjE3NTc1"
    
    var apiLink: URL {
        ///Force unwrap, we know it exists.
        return URL(string: "https://api.seatgeek.com/2/events?client_id=\(clientID)&client_secret=\(secret)")!
    }
}
