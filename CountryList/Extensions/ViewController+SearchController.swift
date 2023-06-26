//
//  ViewController+SearchController.swift
//  CountryList
//
//  Created by Nicol Warnakulasooriya on 22/06/23.
//

import Foundation
import UIKit

extension ViewController: UISearchBarDelegate {
    
    func setupSearchBar() {
        searchController.searchBar.delegate = self
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchText = searchController.searchBar.text else {return}
        if searchText == "" {
            viewModel.isSearching.value = false
            loadData()
        } else {
        filtering(searchText: searchText)
            reloadTableView()
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        loadData()
    }
}
