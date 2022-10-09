//
//  ModalBaseViewModel.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/07.
//

import SwiftUI

class PresentedViewModel: BaseViewModel {
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        super.init()
    }
}

class PresenterViewModel: BaseViewModel {
    @Published var isPresented: Bool = false
    
    func sinkPresented(action: @escaping () -> Void) {
        $isPresented.dropFirst().sink {
            guard $0 == false else {
                return
            }
            action()
        }.store(in: &cancellables)
    }
    
    func sinkLoginAndPresented(action: @escaping () -> Void) {
        sinkLogin(action: action)
        sinkPresented(action: action)
    }
}
