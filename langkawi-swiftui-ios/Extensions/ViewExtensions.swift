//
//  ViewExtensions.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/07.
//

import SwiftUI

extension View {
    
    func showAlert(isPresented: Binding<Bool>, content: AlertContent?) -> some View {
        alert(isPresented: isPresented) {
            Alert(title: Text(content?.title ?? ""), message: Text(content?.message ?? ""))
        }
    }
    
    func showLogin(isPresented: Binding<Bool>) -> some View {
        fullScreenCover(isPresented: isPresented) {
            LoginRouter.assemble(isPresented: isPresented)
        }
    }
    
    func paddingHorizontal(_ length: CGFloat? = nil) -> some View {
        padding(.leading, length).padding(.trailing, length)
    }
    
    func configureCommonDialog(vm: BaseViewModel) -> some View {
        let isAlertPresented = Binding(
            get: { vm.showAlert },
            set: { value, _ in vm.showAlert = value }
        )
        let isLoginPresented = Binding(
            get: { vm.showLogin },
            set: { value, _ in vm.showLogin = value }
        )
        return showAlert(isPresented: isAlertPresented, content: vm.alertContent)
            .showLogin(isPresented: isLoginPresented)
    }
}
