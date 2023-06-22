//
//  NetworkConstant.swift
//  CountryList
//
//  Created by Nicol Warnakulasooriya on 22/06/23.
//

import Foundation

class NetworkConstant {
    static let shared: NetworkConstant = NetworkConstant()

    private init() {

    }

    public var serverAddress: String {
        get {
            "https://restcountries.com/v3.1/all"
        }
    }

}
