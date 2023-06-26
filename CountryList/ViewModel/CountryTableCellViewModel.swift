//
//  CountryTableCellViewModel.swift
//  CountryList
//
//  Created by Nicol Warnakulasooriya on 26/06/23.
//

import Foundation

class CountryTableCellViewModel {
    var countryName: String
    var countryImgUrl: String

    init(country: Countries) {
        self.countryName =  country.name.common
        self.countryImgUrl = country.flags.png ?? ""
    }
}
