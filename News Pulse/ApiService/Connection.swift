//
//  Connection.swift
//  News Pulse
//
//  Created by alagu-raja
//


struct Connection {
    //    172.20.41.228
    var BASE_URL: String {
        return "https://newsapi.org/v2/"
    }
    
    static let AuthKey = "apiKey"
    static let token = "194a52433b62447a9941c4a1b2fc9330"
    
    enum Method: String {
        case POST = "POST"
        case GET = "GET"
        case PUT = "PUT"
        case DELETE = "DELETE"
    }
    
    struct HeaderValues {
        static let user_agent = "User-Agent"
        static let accept_type = "Accept"
        static let content_type = "content-type"
        static let authorization = "Authorization"
        static let X_MDM_Token = "X-MDM-Token"
        static let accept_language = "Accept-Language"
    }
    
    enum AcceptType: String {
        case applicationJson = "application/json"
        case imageJPEG = "image/jpeg"
        case imagePNG = "image/png"
        case videMP4 = "video/mp4"
    }
    
    enum EndPoints: String {
        
        case TOP_HEADLINES = "top-headlines"
        case GET_SOURCES = "top-headlines/sources"
       
    }
    
}
