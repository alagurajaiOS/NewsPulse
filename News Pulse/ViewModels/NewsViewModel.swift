//
//  NewsViewModel.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit

class NewsViewModel {
    
    var articles = [Article]()
    
    func getNews(type: NewsType, completion: @escaping (Bool)->Void){
        let params: [String: Any] = ["country":"in"]
        
        ApiService().makeApicallWith(endPoint: .TOP_HEADLINES, method: .GET, modelType: NewsModel.self, params: params) { (result: Result<NewsModel, Error>) in
            switch result {
            case .success(let decodedData):
                if decodedData.status.uppercased() == "OK"{
                    self.articles = decodedData.articles
                    completion(true)
                } else{
                    completion(false)
                }
            case .failure(let error):
                print(error.localizedDescription)
                print(error)
                completion(false)
            }
        }
    }
}
