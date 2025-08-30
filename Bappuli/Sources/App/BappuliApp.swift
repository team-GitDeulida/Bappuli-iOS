//
//  BappuliApp.swift
//  Bappuli
//
//  Created by 김동현 on 8/30/25.
//

import SwiftUI

@main
struct BappuliApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    let bounds = UIScreen.main.bounds
                    DynamicSize.setScreenSize(bounds)
                }
        }
    }
}
