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
        GeometryReader { proxy in
            
            // MARK: - 크기
            let screenWidth = proxy.size.width
            let windowSize  = screenWidth * 0.3 // 화면 가로의 30%
            
            ZStack() {
                // MARK: - 전체 배경
                Color.white
                    .ignoresSafeArea()
                
                // MARK: - 창문 배치
                VStack {
                    HStack {
                        WindowView(size: windowSize)
                        Spacer()
                    }
                    Spacer()
                }
                
                // MARK: - 테이블 배치
                VStack {
                    Spacer()
                    TableView(angle: -3,
                              lineWidth: 5)
                        .padding(.bottom, 90)
                }
                .ignoresSafeArea()
                
                // MARK: - 밥풀이
                VStack {
                    Spacer()
                    GifRenderView(gifName: bappuli.gifName,
                                  targetSize: CGSize(width: 200, height: 200))
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 25)
                }
            }
        }
    }
}

#Preview(traits: .landscapeRight) {
    ContentView()
}




