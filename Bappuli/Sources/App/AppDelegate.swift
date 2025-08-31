//
//  AppDelegate.swift
//  Bappuli
//
//  Created by 김동현 on 8/31/25.
//

import UIKit
import AVFoundation

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        
        do {
            // 🔊 앱이 "음악 재생 앱"처럼 동작하도록 오디오 세션 카테고리 설정
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            
            // 📌 세션을 활성화 (이게 있어야 백그라운드/화면 꺼짐 시에도 재생됨)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("오디오 세션 설정 실패: \(error.localizedDescription)")
        }
        
        return true
    }
}
