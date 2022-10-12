//
//  ViewController.swift
//  CountryList
//
//  Created by Nicol Vishan on 12/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
   
    @IBOutlet weak var countryTableView: UITableView!

    let searchController = UISearchController()
    
    var countryList = [Countries]()
    var filteredCountryList = [Countries]()
    var apiManager = ApiManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        title = "Country List"
        countryTableView.delegate = self
        loadData()
        
    }
    
    func loadData() {
        apiManager.loadCountryData(url: APIService.baseUrl, completionHandler: { countryData in
            for countries in countryData {
                self.countryList.append(countries)
            }
            DispatchQueue.main.async {
                self.countryTableView.reloadData()
            }
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return self.filteredCountryList.count
        }else {
            return self.countryList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryTableViewCell
        
        if searchController.isActive{
            cell.countryName.text = filteredCountryList[indexPath.row].name?.official
            if let url = URL(string: (filteredCountryList[indexPath.row].flags?.png)!) {
                cell.countryFlag.loadImage(url: url)
            }
        } else {
            cell.countryName.text = countryList[indexPath.row].name?.official
            if let url = URL(string: (countryList[indexPath.row].flags?.png)!) {
                cell.countryFlag.loadImage(url: url)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.countryDetail = filteredCountryList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {return}
        filtering(searchText: searchText)
        DispatchQueue.main.async {
            self.countryTableView.reloadData()
        }
    }
    
    func filtering(searchText: String) {
        filteredCountryList = countryList.filter({ (countries: Countries) -> Bool in
            let regionMatch = countries.region?.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return regionMatch != nil
        })
    }
}
extension UIImageView {
    func loadImage(url:URL){
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}

