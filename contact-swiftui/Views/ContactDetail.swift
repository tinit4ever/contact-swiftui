//
//  ContactDetail.swift
//  contact-swiftui
//
//  Created by Nguyễn Trung Tín on 10/11/2023.
//

import SwiftUI

struct ContactDetail: View {
    @Environment(\.editMode) var editMode
    @StateObject var contactViewModel = ContactViewModel(baseFetcher: BaseFetcher())
    @State var contact: Contact
    
    var body: some View {
        
        NavigationSplitView {
            VStack(spacing: 5) {
                CircleImage(
                    image: Image("avatar", bundle: nil)
                        .resizable()
                )
                .padding()
                Text(contact.name)
                    .padding()
                    .font(.title)
                HStack(alignment: .center,spacing: 10) {
                    ActionButton(button: (
                        name: "message",
                        symbol: "message.fill")
                    )
                    
                    ActionButton(button: (
                        name: "phone",
                        symbol: "phone.fill")
                    )
                    
                    ActionButton(button: (
                        name: "video",
                        symbol: "video.fill")
                    )
                    
                    ActionButton(button: (
                        name: "mail",
                        symbol: "mail.fill")
                    )
                }
                .frame(maxWidth: .infinity)
                .padding()
                List {
                    Section("phone") {
                        Text(contact.phoneNumber)
                    }
                    Section("mail") {
                        Text(contact.mail)
                    }
                }
            }
//            .toolbar {
//                NavigationLink {
//                    ContactForm(contact: $contact)
//                } label: {
//                    EditButton()
//                }
//                
//            }
        } detail: {
            Text("Edit contact")
        }
    }
}

//#Preview {
//    let contact = Contact(name: "Tin", mail: "Tin@gmail.com", phoneNumber: "1134", isMain: true)
//    let contactViewModel = ContactViewModel(baseFetcher: BaseFetcher())
//    ContactDetail(contactViewModel: contactViewModel, contact: contact)
//}

struct ContactDetail_Previews: PreviewProvider {
    static var previews: some View {
        let contact = Contact(name: "Tin", mail: "Tin@gmail.com", phoneNumber: "1134", isMain: true)
        let contactViewModel = ContactViewModel(baseFetcher: BaseFetcher())
        ContactDetail(contactViewModel: contactViewModel, contact: contact)
    }
}

