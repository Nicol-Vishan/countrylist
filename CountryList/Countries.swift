//
//  Countries.swift
//  County List
//
//  Created by Nicol Vishan on 12/10/22.
//

import Foundation

struct Countries: Codable {
    var name: Name?
    var currencies: ISK?
    var capital: [String]?
    var region: String?
    var subregion: String?
    var languages: Languages?
    var flag: String?
    var population: Int
    var timezones: [String]?
    var continents: [String]?
    var flags: Flags?
    var coatOfArms: CoatOfArms?
}

struct Name: Codable {
    var common: String?
    var official: String?
}

struct ISK: Codable {
    var name: String?
    var symbol: String?
}

struct Languages: Codable {
    var isl: String?
}

struct Flags: Codable {
    var png: String?
    var svg: String?
}

struct CoatOfArms: Codable {
    var png: String?
    var svg: String?
}


