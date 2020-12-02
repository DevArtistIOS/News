//
//  NetworkManager.swift
//  NewsAPI - Alamofire
//
//  Created by dream.one on 10.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import Foundation

    // MARK: Fetch News 
class NetworkManager {
    let requestData = RequestData()
    let apiString = "c8f28eca4ffc4602adfa49f143693576"
    let resourceURL = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c8f28eca4ffc4602adfa49f143693576"
    

    // MARK: - Parsing Data for News
    func fetchDataNews(response: @escaping ([Article]?)->()) {
        requestData.getDataRequest(urlString: resourceURL) { result in
            switch result {
            case .success(let data):
                do {
                    let news = try JSONDecoder().decode(News.self, from: data)
                    let article = news.articles
                    response(article)
                } catch let err {
                    print("No Data")
                    print(err.localizedDescription)
                }
            case .failure(_):
                response(nil)
            }
        }
    }
    
    // MARK: Fetch Country
       func fetchDataCoutnry(country: String, response: @escaping ([Article]?)->()) {
           let url = NewsType.countries(apikey: self.apiString, country: country).request
           requestData.getDataRequestURLRequest(urlString: url) { result in
               switch result {
               case .success(let data):
                   do {
                       let news = try JSONDecoder().decode(News.self, from: data)
                       let article = news.articles
                       response(article)
                   } catch let err {
                       print("No Data")
                       print(err.localizedDescription)
                   }
               case .failure(_):
                   response(nil)
               }
           }
       }
       
       // MARK: Fetch Category
       func fetchDataCategories(category: String, response: @escaping ([Article]?)->()) {
        let url = NewsType.categories(apikey: self.apiString, category: category).request
           requestData.getDataRequestURLRequest(urlString: url) { result in
               switch result {
               case .success(let data):
                   do {
                       let news = try JSONDecoder().decode(News.self, from: data)
                       let article = news.articles
                       response(article)
                   } catch let err {
                       print("No Data")
                       print(err.localizedDescription)
                   }
               case .failure(_):
                   response(nil)
               }
           }
       }
    
}

    // MARK: Composite URL for Sorted 
enum NewsType: FinalURL {
    case countries(apikey: String, country: String)
    case categories(apikey: String, category: String)
    
    var baseURL: URL {
        return URL(string: "https://newsapi.org")!
    }
    
    var path: String {
        switch self {
        case .countries(let apiKey, country: let country):
            return "/v2/top-headlines?country=\(country)&category=business&apiKey=\(apiKey)"
        case .categories(let apiKey, let category):
            return "/v2/top-headlines?country=us&category=\(category)&apiKey=\(apiKey)"
        }
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: baseURL)
        return URLRequest(url: url!)
    }
}


