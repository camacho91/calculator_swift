//
//  Comics.swift
//  calculator
//
//  Created by Backlayer on 7/6/19.
//  Copyright © 2019 calculator test. All rights reserved.
//

import Foundation
import UIKit


struct GeneralClass : Decodable{
    let code: Int
    let status: String
    let data: ComicData
}

struct ComicData : Decodable{
    
    let results :[ComicResults]
}

struct ComicResults : Decodable{
    let id: Int
    let title: String
}
