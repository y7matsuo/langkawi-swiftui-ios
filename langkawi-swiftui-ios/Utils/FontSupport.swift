//
//  FontSupport.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/06.
//

import SwiftUI

enum FontAwesomeType: String {
    case regular = "FontAwesome6Free-Regular"
    case solid = "FontAwesome6Free-Solid"
    case brands = "FontAwesome6Brands-Regular"
}

extension UIFont {
    
    static func fontAwesome(type: FontAwesomeType, size: CGFloat) -> UIFont? {
        return UIFont(name: type.rawValue, size: size)
    }
}

extension UILabel {
    
    static func fontAwesome(type: FontAwesomeType, name: String, color: UIColor, size: CGFloat) -> UILabel {
        let label = UILabel()
        label.font = UIFont.fontAwesome(type: type, size: size)
        label.text = name
        label.textColor = color
        label.bounds.size = label.intrinsicContentSize
        return label
    }
    
    func toImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0)
        defer { UIGraphicsEndImageContext() }
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        self.layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
