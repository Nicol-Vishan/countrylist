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
        cell.setupCell(self.cellDataSource[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewModel = viewModel.getCountryDetails(indexPath: indexPath.row)
        guard let detailViewController = self.storyboard?.instantiateViewController(identifier: "DetailViewController", creator: { coder in
            return DetailViewController(coder: coder, viewModel: detailViewModel)
        }) else { return }
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
