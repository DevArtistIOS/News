//
//  Categoty.swift
//  NewsAPI - Alamofire
//
//  Created by dream.one on 01.12.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import Foundation

// MARK: Model for Bundle json Category
struct Categories : Decodable {
    var category : [Category]

}

struct Category : Decodable {
    var id : String
    var name : String

}
