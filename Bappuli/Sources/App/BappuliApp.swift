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
    /*
    init() {
        for family in UIFont.familyNames {
            print("📂 Family: \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("    🔹 \(name)")
            }
        }
    }
     */
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
