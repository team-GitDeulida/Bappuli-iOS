//
//  WindowView.swift
//  Bappuli
//
//  Created by 김동현 on 8/30/25.
//

import SwiftUI

// MARK: - 기존 접근 방식
//struct WindowView: View {
//    var body: some View {
//        Image("window")
//            .resizable()
//            .background(Color.red)
//            .padding(-20) // 모든 방향에서 20씩 잘라내기
//            .frame(maxWidth: 250, maxHeight: 250)
//            .clipped()
//    }
//}

struct WindowView: View {
    let size: CGFloat
    
    var body: some View {
        Image("window")
            .resizable()                          // 이미지 크기 조절 가능하게
            .aspectRatio(contentMode: .fit)       // 원본 비율 유지 (잘리지 않음)
            // .background(Color.red)                // 배경 빨간색
            // .padding(-20)                         // -20만큼 잘라냄
            .scaleEffect(1.2)              // 확대
            .offset(x: 0, y: -10)          // 위치 보정
            .frame(width: size, height: size)     // size×size 고정 배치
            .clipped()                            // frame 밖 잘라냄
    }
}

#Preview {
    WindowView(size: 250)
}
