//
//  CountryModel.swift
//  CountryList
//
//  Created by Nicol Vishan on 12/10/22.
//

import Foundation
import UIKit

protocol CountryViewModelProtocol {
    var countries: [Countries] { get set }
    var searchResult: [Countries] { get set}
    var error: Error? {get set}
    var service: ApiManager {get}
    func loadData() async
    func search(country: String)
    var filteredcountryList: [Countries] {get set}
}

class CountryViewModel: CountryViewModelProtocol {
    var countries: [Countries] = []
    var searchResult: [Countries] = []
    var service: ApiManager = ApiManager()
    var error: Error?
    var filteredcountryList: [Countries] = []
    
    func loadData() async {
        let result = try? await service.loadCountryData()
        switch result {
        case .success(let countries):
            self.countries = countries
        case .failure(let error):
            self.error = error
        case .none:
            self.error = ApiError.errorFetchingData
            break
        }
    }
    
    func search(country: String) {
        filteredcountryList = countries.filter({ (countries: Countries) -> Bool in
            let regionMatch = countries.region.range(of: country, options: NSString.CompareOptions.caseInsensitive)
            return regionMatch != nil
        })
    }

    func numberOfRowInSection(isSearchControllerActive: Bool) -> Int {
        return isSearchControllerActive ? self.filteredcountryList.count : self.countries.count
    }
}
extension UIImageView {
    
    func designFlag() {
        layer.masksToBounds = true
        layer.cornerRadius = 10
    }
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
