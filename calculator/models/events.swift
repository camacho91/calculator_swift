//
//  events.swift
//  calculator
//
//  Created by Backlayer on 7/7/19.
//  Copyright © 2019 calculator test. All rights reserved.
//

import Foundation


struct EventsGeneralClass : Decodable{
    let code: Int
    let status: String
    let data: EventsData
}

struct EventsData : Decodable{
    
    let results :[EventsResults]
}

struct EventsResults : Decodable{
    let id: Int
    let title: String
    let description: String
}
