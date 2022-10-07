//
//  ModalBaseViewModel.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/07.
//

import SwiftUI

class ModalBaseViewModel: BaseViewModel {
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        super.init()
    }
}
