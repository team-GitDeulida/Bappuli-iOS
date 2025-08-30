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
                    WindowView(size: 220.scaled)
                    Spacer()
                }
                Spacer()
            }
            
            // MARK: - 테이블 배치
            VStack {
                Spacer()
                TableView(angle: -3,
                          lineWidth: 5)
                .padding(.bottom, 88.scaled)
            }
            .ignoresSafeArea()
            
            // MARK: - 밥풀이
            VStack {
                Spacer()
                GifRenderView(gifName: bappuli.gifName,
                              targetSize: CGSize(width: 200.scaled,
                                                 height: 200.scaled))
                .frame(width: 200.scaled,
                       height: 200.scaled)
                .padding(.bottom, 25.scaled)
            }
        }
    }
}

#Preview(traits: .landscapeRight) {
    ContentView()
}





