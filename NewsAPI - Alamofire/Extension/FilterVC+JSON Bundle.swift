//
//  FilterVC+JSON Bundle.swift
//  NewsAPI - Alamofire
//
//  Created by dream.one on 01.12.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

extension SortedViewController {
    
    func getJsonFromCountry() {
        if let path = Bundle.main.path(forResource: "countries", ofType: "json") {
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let country = try JSONDecoder().decode(Countries.self, from: data)
            let sortedCountry = country.country.sorted(by: { $0.name < $1.name })
            self.countiesList = sortedCountry
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } catch let error {
            print("parse error: \(error.localizedDescription)")
        }
        } else {
            print("Invalid filename/path.")
        }
    }
    
    func getJsonFromCategoty() {
        if let path = Bundle.main.path(forResource: "category", ofType: "json") {
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let categoty = try JSONDecoder().decode(Categories.self, from: data)
            let sortedCategory = categoty.category.sorted(by: { $0.name < $1.name })
            self.categoryList = sortedCategory
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } catch let error {
            print("parse error: \(error.localizedDescription)")
        }
        } else {
            print("Invalid filename/path.")
        }
    }
    
    func updateVC(_ bool: Bool) {
        if bool {
            self.navigationItem.title = "Выберите страну"
            getJsonFromCountry()
        } else {
            self.navigationItem.title = "Выберите категорию"
            getJsonFromCategoty()
        }
    }
    
}
