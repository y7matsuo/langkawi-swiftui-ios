//
//  langkawi_swiftui_iosApp.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/06.
//

import SwiftUI

@main
struct langkawi_swiftui_iosApp: App {
    init() {
        SwinjectManager.shared.initialize()
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
