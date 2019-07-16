//
//  creators.swift
//  calculator
//
//  Created by Backlayer on 7/7/19.
//  Copyright © 2019 calculator test. All rights reserved.
//

import Foundation

struct CreatorsGeneralClass : Decodable{
    let code: Int
    let status: String
    let data: CreatorsData
}

struct CreatorsData : Decodable{
    
    let results :[CreatorsResults]
}

struct CreatorsResults : Decodable{
    let id: Int
    let fullName: String
}
