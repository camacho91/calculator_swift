//
//  stories.swift
//  calculator
//
//  Created by Backlayer on 7/7/19.
//  Copyright © 2019 calculator test. All rights reserved.
//

import Foundation

struct StoriesGeneralClass : Decodable{
    let code: Int
    let status: String
    let data: StoriesData
}

struct StoriesData : Decodable{
    
    let results :[StoriesResults]
}

struct StoriesResults : Decodable{
    let id: Int
    let title: String
}
