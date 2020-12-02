//
//  News.swift
//  NewsAPI - Alamofire
//
//  Created by dream.one on 10.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import Foundation

    // MARK: Model JSON
struct News: Decodable {
    var articles : [Article]
    
}

struct Article: Decodable {
    var source : Sourse
    var author : String?
    var title: String?
    var description: String?
    var urlToImage: String?
    var url: String?
    
}

struct Sourse: Decodable {
    var name : String?
    
}

