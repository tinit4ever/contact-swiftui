//
//  Contact.swift
//  Contact
//
//  Created by tinit on 30/10/2023.


import Foundation

struct Contact: Codable, Hashable {
    var name: String
    var mail: String
    var phoneNumber: String
    var isMain: Bool
    
    static let `default` = Contact(name: "Tin", mail: "Tin@gmail.com", phoneNumber: "1134", isMain: true)
}
