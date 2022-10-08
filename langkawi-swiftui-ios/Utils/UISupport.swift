//
//  UISupport.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/06.
//

import SwiftUI

func ContentViewWithNavigation(title: String, content: () -> some View) -> some View {
    VStack(spacing: 0) {
        Rectangle().fill(.black).frame(height: 0.5)
        content()
        Spacer()
    }
    .navigationBarTitle(title, displayMode: .inline)
}
