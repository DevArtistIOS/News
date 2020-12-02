//
//  CompositeURL.swift
//  NewsAPI - Alamofire
//
//  Created by dream.one on 20.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import Foundation

protocol FinalURL {
    var baseURL: URL { get }
    var path: String { get }
    var request: URLRequest { get }
    
}
