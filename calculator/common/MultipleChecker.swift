//
//  MultipleChecker.swift
//  calculator
//
//  Created by Backlayer on 7/6/19.
//  Copyright © 2019 calculator test. All rights reserved.
//

import Foundation

public class MultipleChecker{
    
    
    public static func CheckMultiple(value: Int)  -> Int {
        
        var result:Int = 0
        
        
        
        if (value == 0){
            MultipleResult.equalsZero = true
        }else if (value % 3 == 0){
            MultipleResult.multipleOf3 = true
        }else if (value % 5 == 0){
            MultipleResult.multipleOf5 = true
        }else if (value % 7 == 0){
            MultipleResult.multipleOf7 = true
        }else if (value % 11 == 0){
            MultipleResult.multipleOf11 = true
        }else if (value % 13 == 0){
            MultipleResult.multipleOf13 = true
        }else{
            MultipleResult.isInvalid = true
        }
        
        
        return result
    }
    
    
    public static func resetValue(){
        
        MultipleResult.equalsZero = false
        MultipleResult.multipleOf3 = false
        MultipleResult.multipleOf5 = false
        MultipleResult.multipleOf7 = false
        MultipleResult.multipleOf11 = false
        MultipleResult.multipleOf13 = false
        MultipleResult.isInvalid = false
    }
    
}
