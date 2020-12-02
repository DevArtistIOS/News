//
//  NewsTableViewCell.swift
//  NewsAPI - Alamofire
//
//  Created by dream.one on 10.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit
import Alamofire

class NewsTableViewCell: UITableViewCell {
    
    static let cellID = "Cell"
    
    // MARK: Public Properties
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        lbl.numberOfLines = 2
        return lbl
    }()
    
    let authorLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .red
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    
    let sourceLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .systemBlue
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    
    let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .systemGray
        lbl.numberOfLines = 2
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    let posterImage: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        return img
    }()
    
        // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        prepareForReuse()
        posterImage.layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.posterImage.image = nil
    }
    
    // MARK: Setup Model for Cell
    func setupCell(article: Article) {
        updateUI(title: article.title,
                 author: article.author,
                 description: article.description,
                 poster: article.urlToImage,
                 source: article.source.name)
    }
    
    // MARK: Update UI
    func updateUI(title: String?,
                  author: String?,
                  description: String?,
                  poster: String?,
                  source: String?) {
        self.titleLabel.text = title
        self.authorLabel.text = (author ?? "")
        self.descriptionLabel.text = description ?? ""
        self.sourceLabel.text = (source ?? "")
        
        guard let posterImageURL = poster,
              let urlImage = URL(string: posterImageURL) else { return }
    
        self.posterImage.image = nil
        getImagePosterData(url: urlImage)
    }
    
    // MARK: Get Image from JSON
    func getImagePosterData(url: URL) {
        AF.request(url).responseJSON { (responseJSON) in
            guard let data = responseJSON.data else {
                self.posterImage.image = UIImage(named: "no image")
                print("Empty Data Image")
                return }
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.posterImage.image = image
                }
            }
        }
    }
    
}


