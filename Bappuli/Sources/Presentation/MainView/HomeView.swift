//
//  ContentView.swift
//  Bappuli
//
//  Created by 김동현 on 8/30/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var recordViewModel = RecordViewModel()
    @State private var bappuli = Bappuli(state: .working)

    var body: some View {
        ZStack {
            // MARK: - 배경
            Color.white.ignoresSafeArea()
            
            // MARK: - 창문
            VStack {
                HStack {
                    WindowView(size: 240)
                    Spacer()
                }
                Spacer()
            }
            
            // MARK: - 책상
            VStack {
                Spacer()
                TableView(angle: -3, lineWidth: 5)
                    .padding(.bottom, 88)
            }
            .ignoresSafeArea()
            
            // MARK: - 커피
            VStack {
                Spacer()
                ImageButton(imageName: "coffee", size: 70, flipped: false) {
                    // TODO: 커피 버튼 동작
                }
            }
            .padding(.trailing, 250)
            
            // MARK: - 레코드 버튼
            VStack {
                Spacer()
                RecordButton(viewModel: recordViewModel)
            }
            
            // MARK: - 밥풀이
            VStack {
                Spacer()
                GifRenderView(gifName: bappuli.gifName,
                              targetSize: CGSize(width: 200, height: 200))
                .frame(width: 200, height: 200)
                .padding(.bottom, 25)
            }
        }
        .overlay {
            NotesLayer(viewModel: recordViewModel)
        }
    }
}

// MARK: - 프리뷰
#Preview(traits: .landscapeRight) {
    HomeView()
}




