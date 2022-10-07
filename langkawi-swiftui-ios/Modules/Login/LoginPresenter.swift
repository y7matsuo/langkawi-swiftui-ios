//
//  LoginPresenter.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/07.
//

import Foundation

class LoginPresenter: LoginPresentation {
    private let interactor: LoginInteractor
    private let vm: LoginViewModel
    
    init(interactor: LoginInteractor, vm: LoginViewModel) {
        self.interactor = interactor
        self.vm = vm
    }
    
    func doLogin(loginId: String, password: String) {
        interactor.doLogin(loginId: loginId, password: password)
    }
}

extension LoginPresenter: LoginInteractorOutput {
    func onLogin(response: LoginResponse) {
        LoginManager.storeToken(token: response.token)
        LoginManager.storeLoginUserId(userId: response.userId)
        vm.onLogin()
    }
    
    func onError(error: Error) {
        vm.onError(error: error)
    }
}
