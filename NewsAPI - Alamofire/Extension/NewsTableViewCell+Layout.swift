//
//  NewsTableViewCell+Layout.swift
//  NewsAPI - Alamofire
//
//  Created by dream.one on 01.12.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

// MARK: Setup Layout for UItem
extension NewsTableViewCell {

func setupLayout() {
    contentView.addSubview(titleLabel)
    contentView.addSubview(authorLabel)
    contentView.addSubview(descriptionLabel)
    contentView.addSubview(sourceLabel)
    contentView.addSubview(posterImage)
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    authorLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    sourceLabel.translatesAutoresizingMaskIntoConstraints = false
    posterImage.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
        posterImage.topAnchor.constraint(equalTo:
            contentView.topAnchor, constant: 15),
        posterImage.leadingAnchor.constraint(equalTo:
            contentView.leadingAnchor, constant: 10),
        posterImage.bottomAnchor.constraint(equalTo:
            contentView.bottomAnchor, constant: -15),
        posterImage.widthAnchor.constraint(equalToConstant: 140),
        
        titleLabel.topAnchor.constraint(equalTo:
            contentView.topAnchor, constant: 5),
        titleLabel.leadingAnchor.constraint(equalTo:
            posterImage.trailingAnchor, constant: 10),
        titleLabel.trailingAnchor.constraint(equalTo:
            contentView.trailingAnchor, constant: -10),
        
        descriptionLabel.topAnchor.constraint(equalTo:
            titleLabel.bottomAnchor, constant: 20),
        descriptionLabel.leadingAnchor.constraint(equalTo:
            posterImage.trailingAnchor, constant: 10),
        descriptionLabel.trailingAnchor.constraint(equalTo:
            contentView.trailingAnchor, constant: -10),
        
        authorLabel.bottomAnchor.constraint(equalTo:
            contentView.bottomAnchor, constant: -5),
        authorLabel.leadingAnchor.constraint(equalTo:
            posterImage.trailingAnchor, constant: 10),
        authorLabel.widthAnchor.constraint(equalToConstant: 150),
        
        sourceLabel.bottomAnchor.constraint(equalTo:
            contentView.bottomAnchor, constant: -5),
        sourceLabel.trailingAnchor.constraint(equalTo:
            contentView.trailingAnchor, constant: -10),
    ])
}

}
