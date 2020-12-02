//
//  CountryDelegate.swift
//  NewsAPI - Alamofire
//
//  Created by dream.one on 20.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import Foundation

protocol CountryDelegate: class {
    func useCountry(country: String)
    func useCategoty(category: String)
}
