//
//  ContentView.swift
//  contact-swiftui
//
//  Created by Nguyễn Trung Tín on 10/11/2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var contactViewModel = ContactViewModel(baseFetcher: BaseFetcher())
    @State var didLoad = false
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(contactViewModel.sections.indices, id: \.self) { index in
                    Section(header: Text(String(index == 0 ? " " : contactViewModel.sections[index].first?.name.first ?? " "))) {
                        ForEach(contactViewModel.sections[index], id: \.self) { contact in
                            NavigationLink {
                                ContactDetail(contact: contact)
                            } label: {
                                Text(contact.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Contact")
            .onAppear() {
                if !didLoad {
                    contactViewModel.loadContact()
                    didLoad = true
                }
            }
        } detail: {
            Text("Select a Contact")
        }
    }
}


#Preview {
    ContentView()
}
