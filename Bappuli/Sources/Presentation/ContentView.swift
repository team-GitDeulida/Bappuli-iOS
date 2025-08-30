//
//  ContentView.swift
//  Bappuli
//
//  Created by 김동현 on 8/30/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            // MARK: - 전체 배경
            Color.white
                .ignoresSafeArea()
            
            // MARK: - 테이블 배치
            VStack {
                Spacer()
                TableView()
                    .ignoresSafeArea()
                    .padding(.bottom, 50)
            }
            
            // MARK: - 창문 배치
            WindowView()
        }
    }
}

#Preview(traits: .landscapeRight) {
    ContentView()
}
