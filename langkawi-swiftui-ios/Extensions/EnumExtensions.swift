//
//  EnumExtensions.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/07.
//

import SwiftUI

extension GenderType {
    func toLabel() -> String {
        switch self {
        case .male:
            return LabelDef.male
        case .female:
            return LabelDef.female
        }
    }
    
    func toColor() -> Color {
        switch self {
        case .male:
            return .blue
        case .female:
            return .red
        }
    }
}
