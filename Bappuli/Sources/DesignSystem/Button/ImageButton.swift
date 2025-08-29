//
//  ImageButton.swift
//  Bappuli
//
//  Created by 김동현 on 8/30/25.
//

import SwiftUI

struct ImageButton: View {
    
    let imageName: String
    let size: CGFloat
    let flipped: Bool
    let action: () -> Void
    
    init(imageName: String,
         size: CGFloat = 40,
         flipped: Bool = false,
         action: @escaping () -> Void = {}
    ) {
        self.imageName = imageName
        self.size = size
        self.flipped = flipped
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
                .padding(8)
                .scaleEffect(x: flipped ? -1 : 1,
                             y: 1)
        }
    }
}

#Preview {
    ImageButton(imageName: "record",
                size: 50,
                flipped: true) {
        print("버튼 클릭됨")
    }
}
