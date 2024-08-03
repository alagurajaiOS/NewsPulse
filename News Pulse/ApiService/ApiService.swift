//
//  ApiService.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit

class ApiService {
    enum HTTPError: Error {
        case missingHTTPResponse
        case invalidHTTPStatusCode(Int)
        // Add more custom error cases as needed
    }
    
    func makeApicallWith<T:Codable>(endPoint: Connection.EndPoints, method: Connection.Method, modelType: T.Type, params: [String:Any]? = [:], headers: [String: String]? = nil, completion: @escaping(Result<T,Error>)->Void){
        
        guard let apiURL = URL(string: Connection().BASE_URL + endPoint.rawValue) else {return}
        
        do{
            
            var request: URLRequest = URLRequest(url: apiURL)
            
            //SET PARAMS
            if var params = params{
                
                if !(method == .GET){
                    //SET PARAMS IN BODY OF REQUEST
                    let jsonData = try JSONSerialization.data(withJSONObject: params, options: [])
                    request.httpBody = jsonData
                    
                    if let headers = headers{
                        // Add headers to the request
                        for (key, value) in headers {
                            request.addValue(value, forHTTPHeaderField: key)
                        }
                    } else{
                        request.setValue(Connection.AcceptType.applicationJson.rawValue, forHTTPHeaderField: Connection.HeaderValues.content_type)
                    }
                } else if method == .GET{
                    //SET PARAMS AS QUERY
                    var components = URLComponents(string: apiURL.absoluteString)
                    params[Connection.AuthKey] = Connection.token
                    components?.queryItems = params.map { key, value in
                        URLQueryItem(name: key, value: "\(value)")
                    }
                    
                    guard let url = components?.url else {
                        // If there's an error or no data, create and pass an error instance
                        let error = NSError(domain: "\(apiURL)", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
                        completion(.failure(error))
                        fatalError("Invalid URL")
                    }
                    request = URLRequest(url: url)
                }
            }
            
            
            // 2. SET URL REQUEST METHOD
            request.httpMethod = method.rawValue//"GET"
            
            
            // CREATE URL-SESSION AND PERFOM THE DATA TASK
            let session = URLSession.shared
            let task = session.dataTask(with: request) { data, response, error in
                if let error = error as? NSError {
                    print("Error Code: \(error.code)")
                    print("Error Reson: \(error.localizedFailureReason ?? "")")
                    print("Error Description: \(error.localizedDescription)")
                    completion(.failure(error))
                    return
                }
                guard let response = response as? HTTPURLResponse else {
                    completion(.failure(HTTPError.missingHTTPResponse))
                    return
                }
                
                #if DEBUG
                print("Response Status Code: \(response.statusCode)")
                self.printResponse(apiURL: apiURL, jsonData: data, params: params, method: method.rawValue)
                #endif
                
                if response.statusCode == 401{
                    return
                }
                
                guard response.statusCode == 200 else{
                    completion(.failure(HTTPError.invalidHTTPStatusCode(response.statusCode)))
                    return
                }
                
                guard let data = data else {
                    // If there's an error or no data, create and pass an error instance
                    completion(.failure(NSError(domain: "\(apiURL)", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Data not available"])))
                    return
                }
                self.decodeJSON(data: data, modelType: modelType, completion: completion)
            }
            // START THE DATA TASK
            task.resume()
        } catch{
            #if DEBUG
            print(error)
            print(error.localizedDescription)
            #endif
            
            completion(.failure(error))
        }
    }
    
    func decodeJSON<T: Decodable>(data: Data, modelType: T.Type, completion: @escaping(Result<T,Error>)->Void) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(modelType, from: data)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
    
    func printResponse(apiURL: URL, jsonData: Data?, params: [String:Any]?, method: String){
        print("{")
        print("URL: \(apiURL.absoluteString)")
        print("METHOD: \(method)")
        if let params = params{
            print("PARAMS: \(params)")
        } else{
            print("PARAMS: NULL")
        }
        print("RESPONSE")
        if let jsonData = jsonData {
            // Handle the data response
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])

                // Convert the JSON object to Data with pretty printing
                let prettyPrintedData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])

                // Convert the Data to a String
                if let jsonString = String(data: prettyPrintedData, encoding: .utf8) {
                    print(jsonString)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else{
            print("NO DATA")
        }
        
        print("}")
    }

}

