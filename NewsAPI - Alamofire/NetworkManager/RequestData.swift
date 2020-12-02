//
//  RequestData.swift
//  NewsAPI - Alamofire
//
//  Created by dream.one on 10.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import Foundation
import Alamofire

    // MARK: Get Data Request
class RequestData {
    
    func getDataRequest(urlString: String,
                        completion: @escaping (Result<Data,Error>)->()) {
        guard let url = URL(string: urlString) else { return }
        
        AF.request(url).responseJSON { (responseJSON) in
            // error
            if let error = responseJSON.error {
                print("Error Data")
                completion(.failure(error))
                return
            }
            // data
            guard let data = responseJSON.data else { return }
                completion(.success(data))
        }
    }
    
    
    // MARK: Get use URLRequest for Data
    func getDataRequestURLRequest(urlString: URLRequest,
                                  completion: @escaping (Result<Data,Error>)->()) {

        URLSession.shared.dataTask(with: urlString) { (data, response, error) in
             // error
               if let error = error {
               print("Error Data")
               completion(.failure(error))
               return
           }
            // data
            guard let data = data else { return }
                completion(.success(data))
        }.resume()
    }
    
}
