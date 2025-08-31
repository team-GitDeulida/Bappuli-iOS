//
//  NotesLayer.swift
//  Bappuli
//
//  Created by 김동현 on 8/31/25.
//

import SwiftUI

/*
 MARK: - Overlay로 항상 화면 위에 떠 있음
 - 시작 위치: recordPosition (버튼 위쪽 좌표)
 - 음표가 생기자마자 yOffset을 -200으로 바꿔 위로 날아가는 애니메이션 실행
 */
struct NotesLayer: View {
    @ObservedObject var viewModel: RecordViewModel

    var body: some View {
        ForEach(viewModel.notes) { note in
            Image(systemName: "music.note")
                .font(.system(size: 30))
                .foregroundColor(.black)
                // 🎯 버튼 위치에서 시작
                .position(x: note.xOffset - 60,
                          y: viewModel.recordPosition.y)
                // 🎯 yOffset은 0 → -200 애니메이션
                .offset(y: note.yOffset)
                .onAppear {
                    if let index = viewModel.notes.firstIndex(where: { $0.id == note.id }) {
                        withAnimation(.easeOut(duration: 3)) {
                            viewModel.notes[index].yOffset = -200
                        }
                    }
                }
        }
    }
}
