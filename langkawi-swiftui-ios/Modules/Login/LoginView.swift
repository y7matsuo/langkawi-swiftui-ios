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
            TextField(LabelDef.email, text: $vm.loginId).padding(.bottom)
            SecureField(LabelDef.password, text: $vm.password).padding(.bottom)
            ButtonStyles.Primary(LabelDef.login) {
                presenter.doLogin(loginId: vm.loginId, password: vm.password)
            }
        }
        .textFieldStyle(.roundedBorder)
        .paddingHorizontal()
        .showAlert(isPresented: $vm.showAlert, content: vm.alertContent)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPreviewRouter.assemble()
    }
}
