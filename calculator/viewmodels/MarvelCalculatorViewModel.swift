


import Foundation
import Alamofire


class MarvelCalculatorViewModel{
    
    
    var MarvelData = [MarvelObj]()
    
    struct MarvelObj{
        var name : String?
        var id : Int?
    }
    
    
    
    func GetMarvelAPIResults(){
        
        
        let request = setupRequest()
        
        self.apiClientHandler?.PerformApiRequest(request: request){ result, error  in
            
            if let error = error{
                self.error = error
                self.isLoading = false
                return
            }
            
            
            if (MultipleResult.equalsZero == true){
                let serializedGeneralResponse = try! JSONDecoder().decode(CharacterGeneralClass.self, from: result!)
                self.SetupCharacters(characterData: serializedGeneralResponse.data.results)
            }
            else if (MultipleResult.multipleOf3 == true){
                let serializedGeneralResponse = try! JSONDecoder().decode(GeneralClass.self, from: result!)
                self.SetupComics(comicData: serializedGeneralResponse.data.results)
            }
            else if (MultipleResult.multipleOf5 == true){
                let serializedGeneralResponse = try! JSONDecoder().decode(GeneralClass.self, from: result!)
                self.SetupComics(comicData: serializedGeneralResponse.data.results)
            }
            else if (MultipleResult.multipleOf7 == true){
                let serializedGeneralResponse = try! JSONDecoder().decode(CreatorsGeneralClass.self, from: result!)
                self.SetupCreators(creatorData: serializedGeneralResponse.data.results)
            }
            else if (MultipleResult.multipleOf11 == true){
                let serializedGeneralResponse = try! JSONDecoder().decode(EventsGeneralClass.self, from: result!)
                self.SetupEvents(eventData: serializedGeneralResponse.data.results)
            }
            else if (MultipleResult.multipleOf13 == true){
                let serializedGeneralResponse = try! JSONDecoder().decode(SeriesGeneralClass.self, from: result!)
                self.SetupSeries(seriesData: serializedGeneralResponse.data.results)
            }
            else{
                let serializedGeneralResponse = try! JSONDecoder().decode(StoriesGeneralClass.self, from: result!)
                self.SetupStories(storiesData: serializedGeneralResponse.data.results)
            }
            
            self.error = nil
            self.isLoading = false
            self.loadingFinished?()
        }
    }
    
    
    
    private var isLoading: Bool = false{
        didSet{
            self.UpdateLoading?()
        }
    }
    
    private var error: Error? {
        didSet{
            self.ShowAlert?()
        }
    }
    
    private var apiClientHandler: RequestHandlers?
    
    
    init(apiClientHandler: RequestHandlers){
        self.apiClientHandler = apiClientHandler
    }
    
    init(comicData: [ComicResults]) {
        SetupComics(comicData: comicData)
    }
    
    init(characterData: [CharacterResults]) {
        SetupCharacters(characterData: characterData)
    }
    
    init (creatorsData: [CreatorsResults])
    {
        SetupCreators(creatorData: creatorsData)
    }
    
    init(eventsData: [EventsResults]) {
        SetupEvents(eventData: eventsData)
    }
    
    init(seriesData: [SeriesResults]) {
        SetupSeries(seriesData: seriesData)
    }
    
    init(storiesData: [StoriesResults]) {
        SetupStories(storiesData: storiesData)
    }
    
    
    
    var ShowAlert: (() -> ())?
    var UpdateLoading: (() -> ())?
    var loadingFinished: (() -> ())?
    
    
    
    // MARK:  Setup the object comics
    func SetupComics(comicData: [ComicResults]){
        if (comicData.count > 0){
            for item in comicData{
                let arrayData = MarvelObj(name: item.title, id: item.id)
                self.MarvelData.append(arrayData)
            }
        }
    }
    
    // MARK:  Setup the object characters
    func SetupCharacters(characterData: [CharacterResults]){
        if (characterData.count > 0){
            for item in characterData{
                let arrayData = MarvelObj(name: item.name, id: item.id)
                self.MarvelData.append(arrayData)
            }
        }
    }
    
    // MARK:  Setup the object creators
    func SetupCreators(creatorData: [CreatorsResults]){
        if (creatorData.count > 0){
            for item in creatorData{
                let arrayData = MarvelObj(name: item.fullName, id: item.id)
                self.MarvelData.append(arrayData)
            }
        }
    }
    
    // MARK:  Setup the object events
    func SetupEvents(eventData: [EventsResults]){
        if (eventData.count > 0){
            for item in eventData{
                let arrayData = MarvelObj(name: item.title, id: item.id)
                self.MarvelData.append(arrayData)
            }
        }
    }
    
    // MARK:  Setup the object series
    func SetupSeries(seriesData: [SeriesResults]){
        if (seriesData.count > 0){
            for item in seriesData{
                let arrayData = MarvelObj(name: item.title, id: item.id)
                self.MarvelData.append(arrayData)
            }
        }
    }
    
    // MARK:  Setup the object stories
    func SetupStories(storiesData: [StoriesResults]){
        if (storiesData.count > 0){
            for item in storiesData{
                let arrayData = MarvelObj(name: item.title, id: item.id)
                self.MarvelData.append(arrayData)
            }
        }
    }
    
    // MARK:  Setup the request to be sent to the API Client
    func setupRequest() -> URLRequest{
        
        let timestamp = Date().timeIntervalSince1970
        let publickey = "a158abb1ce09871f82acf12e699d2fea"
        let privateKey = "82bc78af8ed5ee08f09617409af58300c731ecc1"
        
        
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
        
        
        
        let url = URL(string: RequestURL)!
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        return request
    }
    
}

extension Date {
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
