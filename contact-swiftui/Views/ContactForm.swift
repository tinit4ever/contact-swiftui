//
//  ContactForm.swift
//  contact-swiftui
//
//  Created by Nguyễn Trung Tín on 12/11/2023.
//

import SwiftUI

struct ContactForm: View {
    @Binding var contact: Contact
    
    var body: some View {
        List {
            Section("Name") {
                TextField("Name", text: $contact.name)
            }
            Section("Phone Number") {
                TextField("Phone Number", text: $contact.phoneNumber)
            }
            Section("Mail") {
                TextField("Mail", text: $contact.mail)
            }
        }
    }
}

#Preview {
    ContactForm(contact: .constant(.default))
}
