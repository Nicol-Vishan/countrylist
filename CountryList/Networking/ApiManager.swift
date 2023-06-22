//
//  NetworkService.swift
//  County List
//
//  Created by Nicol Vishan on 12/10/22.
//

import Foundation

enum ApiError: Error {
    case DataNotPresent
    case WrongURL
    case errorFetchingData
}

struct APIService {
    static var baseUrl = NetworkConstant.shared.serverAddress
}

class ApiManager {

    func loadCountryData() async throws -> Result<[Countries], Error> {
        
        guard let baseUrl = URL(string: APIService.baseUrl) else {
            return .failure(ApiError.WrongURL)
        }
        let (data,response) = try await URLSession.shared.data(from:baseUrl)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            return .failure(ApiError.DataNotPresent)
        }
        
        let decoder = JSONDecoder()
        let jsonData = try decoder.decode([Countries].self, from: data)
        return .success(jsonData)

    }
}
