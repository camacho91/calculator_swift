//
//  characters.swift
//  calculator
//
//  Created by Backlayer on 7/7/19.
//  Copyright © 2019 calculator test. All rights reserved.
//

import Foundation


struct CharacterGeneralClass : Decodable{
    let code: Int
    let status: String
    let data: CharacterData
}

struct CharacterData : Decodable{
    
    let results :[CharacterResults]
}

struct CharacterResults : Decodable{
    let id: Int
    let name: String
}
