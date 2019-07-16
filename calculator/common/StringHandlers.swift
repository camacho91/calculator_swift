//
//  StringHandlers.swift
//  calculator
//
//  Created by Backlayer on 7/6/19.
//  Copyright © 2019 calculator test. All rights reserved.
//

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG


public class StringHandlers{
    
    public static func MD5(stringValue: String) -> Data {
        let messageData = stringValue.data(using:.utf8)!
        var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
        
        _ = digestData.withUnsafeMutableBytes {digestBytes in
            messageData.withUnsafeBytes {messageBytes in
                CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        
        return digestData
    }
    
    public static func EvaluatesignRule(equationValue: String) -> String{
        var EvaluatedOutput: String = equationValue
        
        if (EvaluatedOutput.contains("++")){
            EvaluatedOutput = EvaluatedOutput.replacingOccurrences(of: "++", with: "+")
        }
        if (EvaluatedOutput.contains("--")){
            EvaluatedOutput = EvaluatedOutput.replacingOccurrences(of: "--", with: "+")
        }
        if (EvaluatedOutput.contains("+-")){
            EvaluatedOutput = EvaluatedOutput.replacingOccurrences(of: "+-", with: "-")
        }
        if (EvaluatedOutput.contains("-+")){
            EvaluatedOutput = EvaluatedOutput.replacingOccurrences(of: "-+", with: "-")
        }
        if (EvaluatedOutput.contains(" ")){
            EvaluatedOutput = EvaluatedOutput.replacingOccurrences(of: " ", with: "")
        }
        if (EvaluatedOutput.contains("**")){
            EvaluatedOutput = EvaluatedOutput.replacingOccurrences(of: "**", with: "*")
        }
        if (EvaluatedOutput.contains("//")){
            EvaluatedOutput = EvaluatedOutput.replacingOccurrences(of: "//", with: "/")
        }
        return EvaluatedOutput
    }
    
    public static func EvaluateParenthesisRule(equationValue: String) -> Bool{
         var EvaluatedOutput: String = equationValue
        
        if (EvaluatedOutput.contains("(") || EvaluatedOutput.contains(")")){
            
            let openingParenthesisCount = EvaluatedOutput.characters.filter { $0 == "(" }.count
            let ClosingParenthesisCount = EvaluatedOutput.characters.filter { $0 == ")" }.count
            if (openingParenthesisCount == ClosingParenthesisCount){
                return true
            }else{
                return false
            }
            
        }
        
        return true
    }
    
    public static func ValidateEquation(equationValue: String) -> Bool{
        var EvaluatedOutput: String = equationValue
        
        let validationpoint = NSCharacterSet.letters
        
        
        let range = EvaluatedOutput.rangeOfCharacter(from: validationpoint)
        
       
        if let test = range {
            return true
        }
        else {
            return false
        }
        
        
    }
    
}
