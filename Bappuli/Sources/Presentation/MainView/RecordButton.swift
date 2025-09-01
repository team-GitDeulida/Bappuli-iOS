//
//  RecordButton.swift
//  Bappuli
//
//  Created by 김동현 on 8/31/25.
//

import SwiftUI

struct MusicNote: Identifiable {
    let id = UUID()
    var xOffset: CGFloat
    var yOffset: CGFloat = 0
}

struct RecordButton: View {
    @ObservedObject var viewModel: RecordViewModel
    var action: () -> Void?
    

    var body: some View {
        ImageButton(imageName: "record", size: 100, flipped: true) {
            action()
        }
        // MARK: - 레코드 버튼의 위치 추적기
        .background(                    /// background 안에 뷰를 넣으면 그 뷰는 뒤에 깔리면서 원래 뷰와 같은 크기를 가짐
            GeometryReader { geo in     /// Color.clear를 배경으로 깔아주고 그 위에 GrometryReader를 올려서 버튼 크기, 위치 파악
                Color
                    .clear
                    .onAppear {
                    // MARK: - 버튼이 화면 어디에 있는지 global 좌표계 기준 계산 후 recordPosition에 저장
                    // local 좌표 기준으로 계산
                    /// local: 자기 자신 좌표계 기준
                    /// global: 화면 전체 기준
                    /// named: 내가 정의한 좌표계 기준
                    let frame = geo.frame(in: .global)
                    viewModel.recordPosition = CGPoint(x: frame.midX, y: frame.minY)
                }
            }
        )
        .padding(.leading, 400)
    }
}
