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
    let data: data
}

struct data : Decodable{
    
    let results :[results]
}

struct results : Decodable{
    let id: Int
    let title: String
}
