//
//  ViewController.swift
//  CountryList
//
//  Created by Nicol Vishan on 12/10/22.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var countryTableView: UITableView!
    
    let viewModel: CountryViewModel = CountryViewModel()

    let searchController = UISearchController()
    
    var isSearching: Bool = false

    var cellDataSource: [Countries] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.searchController = searchController
        title = "Country List"
        setupTableView()
        setupSearchBar()
        bindViewModel()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isSearching {
            filtering(searchText: searchController.searchBar.text ?? "")
        } else {
            loadData()
        }
    }
    
    func loadData() {
        Task {
            await viewModel.loadData()
            reloadTableView()
        }
    }
    
    func filtering(searchText: String) {
        Task {
            viewModel.search(country: searchText)
        }
    }

    func bindViewModel() {
        viewModel.observableCountries.bind { [weak self] countries in
            guard let self = self, let countries = countries else {
                return
            }
            self.cellDataSource = countries
        }
        viewModel.observableFilterCountries.bind { [weak self] countries in
            guard let self = self, let countries = countries else {
                return
            }
            self.cellDataSource.removeAll()
            self.cellDataSource = countries
        }
        viewModel.isSearching.bind { [weak self] searching in
            guard let self = self, let searching = searching else {
                return
            }
            self.isSearching = searching
        }
    }
}


