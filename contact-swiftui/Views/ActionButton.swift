//
//  ActionButton.swift
//  contact-swiftui
//
//  Created by Nguyễn Trung Tín on 10/11/2023.
//

import SwiftUI

struct ActionButton: View {
    var button: (name: String, symbol: String)
    
    var body: some View {
        Button(action: {
            print("Hello")
        }, label: {
            VStack {
                Image(systemName: button.1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                Text(button.0)
                    .font(.system(size: 14))
            }
            .padding(3)
        })
        .buttonStyle(BorderlessButtonStyle())
        .frame(maxWidth: .infinity)
        .background(Color.myButtonBackground)
        .clipShape(RoundedRectangle(cornerRadius: 7))
        .foregroundStyle(.blue)
    }
}

#Preview {
    ActionButton(button: ("message", "message.fill"))
}
