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
    
    func PerformApiRequest(request: URLRequest, completion: @escaping (Data?, Error?) -> Void){
        
        Alamofire.request(request).responseJSON { response in
            if let error = response.error{
                completion(nil, error)
                return
            }
            
            if let data = response.data, let stringResponse = String(data: data, encoding: .utf8) {
                
                let dataNew = Data(stringResponse.utf8)
                
                completion(dataNew, nil)
            }
        }
    }
    
    
    
}

