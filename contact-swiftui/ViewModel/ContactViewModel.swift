//
//  ContactViewModel.swift
//  contact-swiftui
//
//  Created by Nguyễn Trung Tín on 10/11/2023.
//

import Foundation
import Combine

class ContactViewModel: ObservableObject {
    @Published var sections: [[Contact]] = []
    private var cancellabels: Set<AnyCancellable> = []
    var baseFetcher: BaseFetcher?
    
    init(baseFetcher: BaseFetcher) {
        self.baseFetcher = baseFetcher
    }
    
    func loadContact() {
        BaseFetcher().getContact()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error \(error)")
                }
            } receiveValue: { [self] result in
                var contacts = result
                var mainContact: Contact?
                if let index = contacts.firstIndex(where: { $0.isMain } ) {
                    mainContact = contacts.remove(at: index)
                }
                
                let sortedContacts = contacts.sorted {
                    $0.name.lowercased() < $1.name.lowercased()
                }
                
                if let mainContact = mainContact {
                    self.sections.append([mainContact])
                }
                
                for contact in sortedContacts {
                    if let firstCharacter = contact.name.lowercased().first {
                        if let index = sections.firstIndex(where: {
                            $0.first?.name.lowercased().first == firstCharacter && $0.first?.isMain == false
                        }) {
                            sections[index].append(contact)
                        } else {
                            sections.append([contact])
                        }
                    }
                }
            }
            .store(in: &cancellabels)
    }
}

