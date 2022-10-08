//
//  LoginViewModel.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/07.
//

import SwiftUI

class LoginViewModel: ModalBaseViewModel {
    @Published var loginComplete: Bool = false
    @Published var loginId: String = "jerold@adams.co"
    @Published var password: String = "12345"
    
    func onLogin() {
        loginComplete = true
        isPresented = false
    }
}
