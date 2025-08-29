//
//  ContentView.swift
//  Bappuli
//
//  Created by 김동현 on 8/30/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ImageButton(imageName: "record",
                        size: 70,
                        flipped: true) {
                print("버튼 클릭됨")
            }
        }
    }
}

#Preview(traits: .landscapeRight) {
    ContentView()
}
