//
//  PreviewSupport.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/07.
//

import SwiftUI
import Combine

class PreviewSupport {
    
    static var isPresented: Binding<Bool> {
        let subject = CurrentValueSubject<Bool, Never>(true)
        return Binding<Bool>(
            get: { subject.value },
            set: { subject.send($0) }
        )
    }
}
