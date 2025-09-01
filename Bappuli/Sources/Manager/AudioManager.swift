//
//  AudioManager.swift
//  Bappuli
//
//  Created by 김동현 on 8/31/25.
//

import AVFoundation

final class AudioManager {
    static let shared = AudioManager()
    private var players: [String: AVAudioPlayer] = [:]  // 곡이름 → 플레이어
    private var currentPlayer: AVAudioPlayer?
    private init() {
        prepareAllMusics()
    }
    
    // 앱 실행 시 모든 mp3 파일을 준비
    private func prepareAllMusics() {
        // 번들에 들어있는 mp3 파일 불러오기
        if let paths = Bundle.main.paths(forResourcesOfType: "mp3", inDirectory: nil) as [String]? {
            for path in paths {
                let url = URL(fileURLWithPath: path)
                let fileName = url.deletingPathExtension().lastPathComponent
                do {
                    let player = try AVAudioPlayer(contentsOf: url)
                    player.numberOfLoops = -1
                    player.prepareToPlay()
                    players[fileName] = player   // ✅ 캐싱
                    print("🎵 준비 완료: \(fileName)")
                } catch {
                    print("❌ 준비 실패: \(fileName) - \(error.localizedDescription)")
                }
            }
        }
    }
    
    // MARK: - 특정 파일 재생
    func play(fileName: String, fileType: String = "mp3") {
        stop() // 기존 곡 정지
        if let player = players[fileName] {
            currentPlayer = player
            player.play()
        } else {
            print("❌ 준비되지 않은 곡: \(fileName)")
        }
    }
    
    func stop() {
        currentPlayer?.stop()
    }
}
