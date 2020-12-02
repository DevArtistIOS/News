//
//  ViewModel.swift
//  NewsAPI - Alamofire
//
//  Created by dream.one on 12.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import Foundation

class NewsViewModel {
    
    // MARK: Public Properties
    var news = [Article]()
    var networkManager = NetworkManager()
    
    
    // MARK: Получение новостей по дефолту
    func fetchNews(completion: @escaping ()->()) {
        networkManager.fetchDataNews { [weak self] result in
            guard let resultActicle = result else { return }
            self?.news = resultActicle
            completion()
        }
    }
    
    // MARK: Получение новостей по конкретной стране
    func fetchCoutry(country: String, completion: @escaping ()->()) {
        networkManager.fetchDataCoutnry(country: country) { [weak self] result in
            guard let resultActicle = result else { return }
            self?.news = resultActicle
            completion()
        }
    }
    
    // MARK: Получение новостей по конкретной категории
    func fetchCategory(categoty: String, completion: @escaping ()->()) {
        networkManager.fetchDataCategories(category: categoty) { [weak self] result in
            guard let resultActicle = result else { return }
            self?.news = resultActicle
            completion()
        }
    }
    
    // MARK: UI Update
    func numberOfRowsInSection(section: Int) -> Int {
        if news.count != 0 {
            return news.count
        }
        return 0
    }
    
    func cellForRowsAt(indexPath : IndexPath) -> Article {
        return news[indexPath.row]
    }
    
}
