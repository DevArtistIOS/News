//
//  CountriesTableViewCell.swift
//  NewsAPI - Alamofire
//
//  Created by dream.one on 17.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {

    static let cellID = "Cell"
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    
}
