//
//  LoginRouter.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/07.
//

import SwiftUI

class LoginRouter {
    
    static func assemble(isPresented: Binding<Bool>) -> some View {
        let interactor = LoginInteractor(loginAPI: LoginAPIImpl())
        let vm = LoginViewModel(isPresented: isPresented)
        let presenter = LoginPresenter(interactor: interactor, vm: vm)
        let view = LoginView(vm: vm, presenter: presenter)
        interactor.output = presenter
        return view
    }
}
