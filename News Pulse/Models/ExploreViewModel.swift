//
//  ExploreViewModel.swift
//  News Pulse
//
//  Created by alagu-16152 on 15/06/24.
//

import UIKit

class ExploreViewModel {
    
    var sources = [Source]()
    
    func getSources(completion: @escaping (Bool)->Void){
//        let params: [String: Any] = ["country":"in"]
        
        ApiService().makeApicallWith(endPoint: .GET_SOURCES, method: .GET, modelType: SourcesModel.self) { (result: Result<SourcesModel, Error>) in
            switch result {
            case .success(let decodedData):
                if decodedData.status.uppercased() == "OK"{
                    self.sources = decodedData.sources
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
