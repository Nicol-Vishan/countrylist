//
//  NetworkService.swift
//  County List
//
//  Created by Nicol Vishan on 12/10/22.
//

import Foundation

struct APIService {
    static var baseUrl = "https://restcountries.com/v3.1/all"
}

class ApiManager {
    
    func loadCountryData(url: String, completionHandler: @escaping(_ result: [Countries])-> Void) {
        
        guard let baseUrl = URL(string: url) else {return}
        let session = URLSession.shared
        session.dataTask(with: baseUrl) { data, response, error in
            if let err = error {
                print(err)
            }
            if let res = response {
                print(res)
            }
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Countries].self, from: data)
                print(jsonData)
                completionHandler(jsonData)
            } catch let jsonErr {
                print(jsonErr)
            }
        }.resume()
    }
}
