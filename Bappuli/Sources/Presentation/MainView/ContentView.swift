//
//  ContentView.swift
//  Bappuli
//
//  Created by 김동현 on 8/30/25.
//

import SwiftUI

struct ContentView: View {
    @State private var bappuli = Bappuli(state: .working)
    
    var body: some View {
        ZStack() {
            // MARK: - 전체 배경
            Color.white
                .ignoresSafeArea()
            
            // MARK: - 창문 배치
            VStack {
                HStack {
                    WindowView()
                    Spacer()
                }
                Spacer()
            }
            
            // MARK: - 테이블 배치
            VStack {
                Spacer()
                TableView()
                    .padding(.bottom, 90)
            }
            .ignoresSafeArea()
            
            // MARK: - 밥풀이
            VStack {
                Spacer()
                GifRenderView(gifName: bappuli.gifName,
                              targetSize: CGSize(width: 80, height: 80))
                .frame(maxWidth: 200, maxHeight: 200)
                .padding(.bottom, 25)
            }
        }
    }
}

#Preview(traits: .landscapeRight) {
    ContentView()
}
