//
//  BappuliApp.swift
//  Bappuli
//
//  Created by 김동현 on 8/30/25.
//

import SwiftUI

@main
struct BappuliApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .onAppear {
                    // let bounds = UIScreen.main.bounds
                    // DynamicSize.setScreenSize(bounds)
                }
        }
    }
}
