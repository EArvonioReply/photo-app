//
//  APIHandler.swift
//  photo-app
//
//  Created by Marco Agizza on 20/09/23.
//

import Foundation
import Alamofire

class APIHandler {
    static let sharedInstance = APIHandler()
    
    func fetchingAPIPhotos(handler: @escaping(_ apiData: SearchResult) -> (Void)) {
        let url = "https://api.flickr.com/services/rest/"
        let parameters = setParameters()
        
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { responce in
            switch responce.result {
            case .success(let data):
                do {
                    let searchResult = try JSONDecoder().decode(SearchResult.self, from: data!)
                    handler(searchResult)
                } catch {
                    print("error: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            }
        }
    }
    
    private func setParameters() -> Parameters {
        var parameters = Parameters()
        parameters["method"] = Constants.METHOD
        parameters["api_key"] = Constants.API_KEY
        parameters["text"] = Constants.searchKey
        parameters["per_page"] = Constants.NUMBER_OF_RESULTS
        parameters["format"] = Constants.RESPONSE_FORMAT
        parameters["nojsoncallback"] = 1
        
        return parameters
    }
    
}
