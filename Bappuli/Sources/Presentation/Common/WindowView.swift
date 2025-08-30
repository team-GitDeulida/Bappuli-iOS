//
//  WindowView.swift
//  Bappuli
//
//  Created by 김동현 on 8/30/25.
//

import SwiftUI

struct WindowView: View {
    var body: some View {
        Image("window")
            .resizable()
            // .background(Color.red)
            .padding(-20) // 모든 방향에서 20씩 잘라내기
            .frame(maxWidth: 250, maxHeight: 250)
            .clipped()
    }
}

#Preview {
    WindowView()
}
