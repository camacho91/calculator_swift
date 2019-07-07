//
//  RequestHandlers.swift
//  calculator
//
//  Created by Backlayer on 7/6/19.
//  Copyright © 2019 calculator test. All rights reserved.
//

import Foundation
import Alamofire


public class RequestHandlers{
    
    static var timestamp = Date().timeIntervalSince1970
    static var publickey = "a158abb1ce09871f82acf12e699d2fea"
    static var privateKey = "82bc78af8ed5ee08f09617409af58300c731ecc1"
    
    
    public static func GetRequest(completion: @escaping (String) -> Void) {
        
        let TimestampString = String(timestamp)
        let timestampSplit = TimestampString.components(separatedBy: ".")
        
        let timestampConverted: String = timestampSplit[0]
        
        
        let concatHashSource = timestampConverted + privateKey + publickey
        
        let hash = StringHandlers.MD5(stringValue: concatHashSource)
        let md5Hex =  hash.map { String(format: "%02hhx", $0) }.joined()
        
        var RequestURL = ""
        
        if (MultipleResult.equalsZero == true){
            RequestURL = WebServicesAddresses.getCharactersURL()
        }
        else if (MultipleResult.multipleOf3 == true){
            RequestURL = WebServicesAddresses.getComicsURL()
        }
        else if (MultipleResult.multipleOf5 == true){
            RequestURL = WebServicesAddresses.getComicsURL()
        }
        else if (MultipleResult.multipleOf7 == true){
            RequestURL = WebServicesAddresses.getCreatorsURL()
        }
        else if (MultipleResult.multipleOf11 == true){
            RequestURL = WebServicesAddresses.getEventsURL()
        }
        else if (MultipleResult.multipleOf13 == true){
            RequestURL = WebServicesAddresses.getSeriesURL()
        }
        else{
            RequestURL = WebServicesAddresses.getStoriesURL()
        }
       
        RequestURL = String(format: RequestURL+"?ts=%@&apikey=%@&hash=%@", timestampConverted,publickey,md5Hex)
      

        
        
        Alamofire.request(RequestURL).responseJSON { response in
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                completion(utf8Text)
            }
        }
        
        
     
        
        
        
       
        
    }
    
    
    public static func getComics(completionHandler: @escaping (String) -> Void) {
        RequestHandlers.GetRequest(completion: completionHandler)
    }
    
    
    
}

extension Date {
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
