//
//  ViewController.swift
//  NewsAPI - Alamofire
//
//  Created by dream.one on 10.11.2020.
//  Copyright © 2020 Yura Fomin. All rights reserved.


import UIKit
import SafariServices

class NewsViewController: UIViewController {

    // MARK: Private Properties
    private let tableView : UITableView = {
       let tbv = UITableView()
        tbv.register(NewsTableViewCell.self,
                     forCellReuseIdentifier: NewsTableViewCell.cellID)
        tbv.tableFooterView = UIView()
        return tbv
    }()
    
   private let refreshControl : UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.tintColor = .gray
        return refresh
    }()
    
    private var viewModel = NewsViewModel()
    private var country : String = "ru"
    private var category: String = "business"
    
    // MARK: Navigation Properties
    lazy var addFilterBtnItem = UIBarButtonItem(image: UIImage(named: "filtered"),
                                                style: .done,
                                                target: self,
                                                action: #selector(filterCategory))
    
    lazy var filterBtnItem = UIBarButtonItem(image: UIImage(named: "filter"),
                                             style: .done,
                                             target: self,
                                             action: #selector(filterCountry))
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController()
        setupTableView()
        loadNewsOne()
        setupRefreshControl()
    }


//    private func loadNews() {
//        viewModel.fetchNews { [weak self] in
//            DispatchQueue.main.async {
//                self?.tableView.reloadData()
//                self?.refreshControl.endRefreshing()
//            }
//        }
//    }
    
    // MARK: Fetch News for Country
    private func loadNewsOne() {
        viewModel.fetchCoutry(country: country) { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.refreshControl.endRefreshing()
            }
        }
    }
    // MARK: Fetch News for Category
    func loadNewsTwo() {
        viewModel.fetchCategory(categoty: category) { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.refreshControl.endRefreshing()
            }
        }
    }

    // MARK: Setup Target for RefreshControl
   private func setupRefreshControl() {
        refreshControl.addTarget(self,
                                 action: #selector(refreshData),
                                 for: .valueChanged)
    }
    
    // MARK: Selector for RefreshControl
    @objc func refreshData() {
        loadNewsOne()
    }
    
    // MARK: Selector Filter Category
    @objc func filterCategory() {
        let controller = SortedViewController()
        controller.countryDelegate = self
        controller.isEditing = false
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: Selector Filter Country
    @objc func filterCountry() {
        let controller = SortedViewController()
        controller.countryDelegate = self
        controller.isEditing = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

    // MARK: - Setup TableView and Navigation
extension NewsViewController {

   private func setupTableView() {
        view.addSubview(tableView)
        tableView.refreshControl = refreshControl
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
    
    private func navigationController() {
        self.navigationItem.title = "Новости"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        self.navigationItem.rightBarButtonItem = addFilterBtnItem
        self.navigationItem.leftBarButtonItem = filterBtnItem
    }
    
}

    // MARK: - UITableViewDelegate
extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let new = viewModel.news[indexPath.row]
        guard let url = new.url else { return }
        showWebView(url: url)
    }
    
}

    // MARK: -UITableViewDataSource
extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: NewsTableViewCell.cellID,
            for: indexPath) as! NewsTableViewCell
        
        let news = viewModel.cellForRowsAt(indexPath: indexPath)
        cell.setupCell(article: news)
        return cell
    }
    
}

    // MARK: SFSafariViewController
extension NewsViewController : SFSafariViewControllerDelegate {
    
    private func showWebView(url: String) {
        guard let url = URL(string: url) else { return }
        let webSafari = SFSafariViewController(url: url)
        webSafari.delegate = self
        present(webSafari, animated: true, completion: nil)
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}

    // MARK: Protocol CountryDelegate
extension NewsViewController : CountryDelegate {
    
    func useCountry(country: String) {
        self.country = country
        loadNewsOne()
    }
    
    func useCategoty(category: String) {
        self.category = category
        loadNewsTwo()
    }
}

