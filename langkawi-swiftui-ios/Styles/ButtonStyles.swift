//
//  ButtonStyles.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/07.
//

import SwiftUI

class ButtonStyles {
    
    static func Primary(_ title: String, action: @escaping () -> Void) -> some View {
        Button(title, action: action)
        .font(Font.system(size: 20, weight: .bold))
        .foregroundColor(.black)
        .frame(width: 240, height: 50)
        .background(ColorDef.primary)
        .cornerRadius(25)
    }
}
