//
//  series.swift
//  calculator
//
//  Created by Backlayer on 7/7/19.
//  Copyright © 2019 calculator test. All rights reserved.
//

import Foundation



struct SeriesGeneralClass : Decodable{
    let code: Int
    let status: String
    let data: SeriesData
}

struct SeriesData : Decodable{
    
    let results :[SeriesResults]
}

struct SeriesResults : Decodable{
    let id: Int
    let title: String
}
