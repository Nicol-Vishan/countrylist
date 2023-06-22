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
    
    var searching: Bool = false
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.searchController = searchController
        title = "Country List"
        setupTableView()
        setupSearchBar()
        loadData()
    }
    
    private func loadData() {
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
    
}


