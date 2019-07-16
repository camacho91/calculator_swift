//
//  SessionVariable.swift
//  calculator
//
//  Created by Backlayer on 7/6/19.
//  Copyright © 2019 calculator test. All rights reserved.
//

import Foundation



public class comics{

    var title : String
    var id : Int
    
    init(_title: String, _id: Int) {
        self.title = _title
        self.id = _id
    }
    
}

public class characters{
    
    var name : String
    var id : Int
    
    init(_name: String, _id: Int) {
        self.name = _name
        self.id = _id
    }
    
}

public class creators{
    
    var fullname : String
    var id : Int
    
    init(_fullname: String, _id: Int) {
        self.fullname = _fullname
        self.id = _id
    }
    
}

public class events{
    
    var title : String
    var description : String
    var id : Int
    
    init(_title: String, _id: Int, _description: String) {
        self.title = _title
        self.id = _id
        self.description = _description
    }
    
}

public class series{
    
    var title : String
    var id : Int
    
    init(_title: String, _id: Int) {
        self.title = _title
        self.id = _id
    }
    
}

public class stories{
    
    var title : String
    var id : Int
    
    init(_title: String, _id: Int) {
        self.title = _title
        self.id = _id
    }
    
}
