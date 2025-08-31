//
//  AudioManager.swift
//  Bappuli
//
//  Created by 김동현 on 8/31/25.
//

import AVFoundation

final class AudioManager {
    static let shared = AudioManager()
    private var audioPlayer: AVAudioPlayer?   /// 음악 플레이어
    private init() {
        prepare(fileName: "sleepless", fileType: "mp3")
    }
    
    /// 오디오 플레이어 초기화
    /// - Parameters:
    ///   - fileName: 파일 이름
    ///   - fileType: 파일 타입
    private func prepare(fileName: String, fileType: String) {
        if let path = Bundle.main.path(forResource: fileName,
                                       ofType: fileType) {
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.numberOfLoops = -1 // 무한 반복
                audioPlayer?.prepareToPlay()    // 메모리에 미리 로드
            } catch {
                print("오디오 초기화 실패: \(error.localizedDescription)")
            }
        }
    }
    
    func play() {
        if audioPlayer?.isPlaying == false {
            audioPlayer?.play()
        }
    }
    
    func stop() {
        audioPlayer?.stop()
    }
}
