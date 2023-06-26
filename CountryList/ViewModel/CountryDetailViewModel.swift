//
//  CountryDetailViewModel.swift
//  CountryList
//
//  Created by Nicol Warnakulasooriya on 26/06/23.
//

import Foundation

class CountryDetailViewModel {
    var country: Countries
    var countryName: String
    var countryRegion: String
    var subOrigin: String
    var capital: String
    var languages: String
    var official: String
    var countryFlag: String
    var countryCoatOfArms: String

    init(country: Countries) {
        self.country = country
        self.countryName = country.name.common
        self.countryRegion = country.region
        self.subOrigin = country.subregion ?? ""
        self.capital = country.capital?.first ?? ""
        self.languages = country.languages?.first?.value ?? ""
        self.official = country.name.official
        self.countryFlag = country.flags.png ?? ""
        self.countryCoatOfArms = country.coatOfArms.png ?? ""
    }
}
