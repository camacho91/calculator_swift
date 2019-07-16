//
//  WebServicesAddresses.swift
//  calculator
//
//  Created by Backlayer on 7/6/19.
//  Copyright © 2019 calculator test. All rights reserved.
//

import Foundation

public class WebServicesAddresses{
    
    
    static var mainDomain = "https://gateway.marvel.com:443"
    
    static var charactersURL = "/v1/public/characters"
    static var comicsURL = "/v1/public/comics"
    static var creatorsURL = "/v1/public/creators"
    static var eventsURL = "/v1/public/events"
    static var seriesURL = "/v1/public/series"
    static var storiesURL = "/v1/public/stories"
    
    
    public static func getCharactersURL() -> String{
        
        return mainDomain + charactersURL
    }
    
    public static func getComicsURL() -> String{
        
        return mainDomain + comicsURL
    }
    
    public static func getCreatorsURL() -> String{
        
        return mainDomain + creatorsURL
    }
    
    public static func getEventsURL() -> String{
        
        return mainDomain + eventsURL
    }
    
    public static func getSeriesURL() -> String{
        
        return mainDomain + seriesURL
    }
    
    public static func getStoriesURL() -> String{
        
        return mainDomain + storiesURL
    }
    
}
