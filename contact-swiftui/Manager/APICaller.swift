//
//  APICaller.swift
//  Contact
//
//  Created by tinit on 30/10/2023.
//

import Foundation
import Combine

struct Constants {
    static let baseURL = "https://f10d6019-5422-4471-93c8-0955f4daaeaa.mock.pstmn.io"
}

enum APIError: Error {
    case failedToGetData
}

// APICaller with Combine
class APICaller {
    static let shared = APICaller()
    
    private init() {}
    
    func requestAPI<T: Codable>(url: String, responseType: T.Type) -> AnyPublisher<T, Error> {
        guard let url = URL(string: Constants.baseURL + url) else {
            return Fail(error: APIError.failedToGetData).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .retry(3)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
