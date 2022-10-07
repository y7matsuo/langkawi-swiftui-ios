//
//  LoginView.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/07.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var vm: LoginViewModel
    let presenter: LoginPresentation
    
    var body: some View {
        VStack {
            TextField(LabelDef.email, text: $vm.loginId).padding(.bottom, 20)
            SecureField(LabelDef.password, text: $vm.password).padding(.bottom, 20)
            ButtonStyles.Primary(LabelDef.login) {
                presenter.doLogin(loginId: vm.loginId, password: vm.password)
            }
        }
        .textFieldStyle(.roundedBorder)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .showAlert(isPresented: $vm.showAlert, content: vm.alertContent)
    }
}

struct LoginView_Previews: PreviewProvider {
    class LoginPresenter: LoginPresentation {
        private let vm: LoginViewModel
        
        init(vm: LoginViewModel) {
            self.vm = vm
        }
        
        func doLogin(loginId: String, password: String) {
            vm.onLogin()
        }
    }
    
    static var previews: some View {
        let vm = LoginViewModel(isPresented: PreviewSupport.isPresented)
        LoginView(vm: vm, presenter: LoginPresenter(vm: vm))
    }
}
