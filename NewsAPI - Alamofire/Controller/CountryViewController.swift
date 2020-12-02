//
//  SortedViewController.swift
//  NewsAPI - Alamofire
//
//  Created by dream.one on 17.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.
//

import UIKit

class SortedViewController: UIViewController {

    // MARK: Public Properties
    let tableView : UITableView = {
       let tbv = UITableView()
        tbv.register(CountriesTableViewCell.self,
                     forCellReuseIdentifier: CountriesTableViewCell.cellID)
        tbv.tableFooterView = UIView()
        return tbv
    }()
    
    var countiesList = [Country]()
    var categoryList = [Category]()
    
    // MARK: Delegate
    weak var countryDelegate : CountryDelegate?
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        updateVC(isEditing)
    }
}


    // MARK: - Setup TableView
extension SortedViewController {

    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

    // MARK: - UITableViewDelegate
extension SortedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if isEditing {
            let country = countiesList[indexPath.row].id
            self.countryDelegate?.useCountry(country: country)
            self.navigationController?.popViewController(animated: true)
        } else {
            let category = categoryList[indexPath.row].id
            self.countryDelegate?.useCategoty(category: category)
            self.navigationController?.popViewController(animated: true)
        }
            
    }
    
}

    // MARK: -UITableViewDataSource
extension SortedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isEditing ? countiesList.count : categoryList.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CountriesTableViewCell.cellID,
            for: indexPath) as! CountriesTableViewCell
        cell.textLabel?.text = isEditing ? countiesList[indexPath.row].name : categoryList[indexPath.row].name
        return cell
    }
    
}

    

