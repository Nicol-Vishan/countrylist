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
        if searchController.isActive {
            return self.viewModel.filteredcountryList.count
        } else {
            return self.viewModel.countries.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryTableViewCell
        if searchController.isActive && searchController.searchBar.text != "" && viewModel.filteredcountryList.count > 0{
            cell.setupUI(tableView: tableView, cName: viewModel.filteredcountryList[indexPath.row].name.common, cFlag: viewModel.filteredcountryList[indexPath.row].flags.png ?? "")
        } else {
            cell.setupUI(tableView: tableView, cName: viewModel.countries[indexPath.row].name.common, cFlag: viewModel.countries[indexPath.row].flags.png ?? "")
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        if searchController.isActive{
            vc.countryDetail = viewModel.filteredcountryList[indexPath.row]
        }else{
            vc.countryDetail = viewModel.countries[indexPath.row]
        }
        navigationController?.pushViewController(vc, animated: true)
        searching = false
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
