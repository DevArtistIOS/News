//
//  Countries.swift
//  NewsAPI - Alamofire
//
//  Created by dream.one on 19.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import Foundation

    // MARK: Model for Bundle json Country
struct Countries : Decodable {
    var country : [Country]
    
}

struct Country : Decodable {
    var id : String
    var name : String
    
}
