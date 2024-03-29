//
//  CountryModel.swift
//  CountryList
//
//  Created by Nicol Vishan on 12/10/22.
//

import Foundation
import UIKit

protocol CountryViewModelProtocol {
    var countries: [Countries] { get set}
    var searchResult: [Countries] { get set}
    var error: Error? {get set}
    var service: ApiManager {get}
    func loadData() async
    func search(country: String) async
    var filteredcountryList: [Countries] {get set}
}

class CountryViewModel: CountryViewModelProtocol {
    var countries: [Countries] = []
    var observableCountries: Observable<[CountryTableCellViewModel]> = Observable(value: nil)
    var observableFilterCountries: Observable<[CountryTableCellViewModel]> = Observable(value: nil)
    var searchResult: [Countries] = []
    var service: ApiManager = ApiManager()
    var error: Error?
    var filteredcountryList: [Countries] = []
    var isSearching: Observable<Bool> = Observable(value: false)
    
   func loadData() async {
        let result = try? await service.loadCountryData()
        switch result {
        case .success(let countries):
            self.countries = countries
            self.mapData()
        case .failure(let error):
            self.error = error
        case .none:
            self.error = ApiError.errorFetchingData
            break
        }
    }

    func mapData() {
        self.observableCountries.value = self.countries.compactMap({CountryTableCellViewModel(country: $0) })
    }
    
    func search(country: String) async {
        guard !country.isEmpty else {
            self.isSearching.value = false
            self.observableFilterCountries.value = []
            await self.loadData()
            return
        }
        filteredcountryList = self.countries.compactMap{
                $0.region.localizedCaseInsensitiveContains(country) ? $0 : nil }
            self.isSearching.value = true
        self.observableFilterCountries.value = filteredcountryList.compactMap({CountryTableCellViewModel(country: $0)})
    }

    func numberOfRowInSection() -> Int {
        return isSearching.value ?? true ? self.filteredcountryList.count : self.countries.count
    }

    func getCountryDetails(indexPath: Int) -> CountryDetailViewModel {
        if isSearching.value ?? true {
            return CountryDetailViewModel(country: self.filteredcountryList[indexPath])
        } else {
            return CountryDetailViewModel(country: self.countries[indexPath])
        }
    }
}
