//
//  RecordViewModel.swift
//  Bappuli
//
//  Created by 김동현 on 8/31/25.
//

import SwiftUI

final class RecordViewModel: ObservableObject {
    @Published var notes: [MusicNote] = []          /// 떠다니는 음표 배열
    @Published var isPlaying: Bool = false          /// 재생 중인지 여부
    @Published var recordPosition: CGPoint = .zero  /// 레코드 버튼 위치(음표가 어디서부타 나올 지 기준점)
    
    // 0.8초마다 MusicNote를 만들어 notes 배열에 추가
    // x 좌표는 버튼 중앙 ±30, y는 항상 0 → “버튼 위”에서 시작
    // 2초 지나면 notes 배열에서 제거(화면에서 사라지도록)
    private func startNotes() {
        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            if !self.isPlaying {
                timer.invalidate()
                return
            }
            let newNote = MusicNote(
                xOffset: self.recordPosition.x + CGFloat.random(in: -30...30),
                yOffset: 0
            )
            self.notes.append(newNote)
             
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                guard let self = self else { return }
                self.notes.removeAll { $0.id == newNote.id }
            }
        }
    }
    
    func togglePlay() {
        isPlaying.toggle()
        if isPlaying {
            startNotes()
            AudioManager.shared.play()
        } else {
            AudioManager.shared.stop()
        }
    }
}

