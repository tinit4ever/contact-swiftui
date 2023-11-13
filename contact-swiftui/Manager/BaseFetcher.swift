//
//  BaseFetcher.swift
//  Contact
//
//  Created by tinit on 30/10/2023.
//

import Foundation
import Combine

struct APIPath {
    static let getContact: String = "/get-contact"
}

class BaseFetcher {
    func getContact() -> AnyPublisher<[Contact], Error> {
        return APICaller.shared.requestAPI(url: APIPath.getContact, responseType: [Contact].self)
    }
}
