//
//  LoginPreviewRouter.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/08.
//

import SwiftUI

class LoginPreviewRouter {
    class LoginPresenter: LoginPresentation {
        private let vm: LoginViewModel
        
        init(vm: LoginViewModel) {
            self.vm = vm
        }
        
        func doLogin(loginId: String, password: String) {
            vm.onLogin()
        }
    }
    
    static func assemble() -> some View {
        let vm = LoginViewModel(isPresented: PreviewSupport.isPresented)
        return LoginView(vm: vm, presenter: LoginPresenter(vm: vm))
    }
}
