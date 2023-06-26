//
//  ViewController+TableView.swift
//  CountryList
//
//  Created by Nicol Warnakulasooriya on 22/06/23.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate,UITableViewDataSource{

    func setupTableView() {
        countryTableView.dataSource = self
        countryTableView.delegate = self
    }

    func reloadTableView() {
        DispatchQueue.main.async {
            self.countryTableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !cellDataSource.isEmpty else {
            reloadTableView()
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryTableViewCell
        if isSearching {
            cell.setupUI(tableView: tableView, cName: self.cellDataSource[indexPath.row].name.common, cFlag: self.cellDataSource[indexPath.row].flags.png ?? "")
        } else {
            cell.setupUI(tableView: tableView, cName: self.cellDataSource[indexPath.row].name.common, cFlag: self.cellDataSource[indexPath.row].flags.png ?? "")
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        if isSearching {
            vc.countryDetail = viewModel.filteredcountryList[indexPath.row]
        }else{
            vc.countryDetail = viewModel.countries[indexPath.row]
        }
        navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
