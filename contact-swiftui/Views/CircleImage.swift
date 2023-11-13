//
//  CircleImage.swift
//  contact-swiftui
//
//  Created by Nguyễn Trung Tín on 10/11/2023.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(.circle)
            .overlay {
                Circle().stroke(.white, lineWidth: 3)
            }
            .shadow(radius: 7)
            .frame(width: 100, height: 100)
    }
}

#Preview {
    CircleImage(image: Image("avatar"))
}
