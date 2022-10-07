//
//  LoginInteractor.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/07.
//

import Combine

class LoginInteractor: LoginUseCase {
    private let loginAPI: LoginAPI
    unowned var output: LoginInteractorOutput?
    
    private var cancellable: AnyCancellable?
    
    init(loginAPI: LoginAPI) {
        self.loginAPI = loginAPI
    }
    
    func doLogin(loginId: String, password: String) {
        cancellable = request(
            requester: { self.loginAPI.login(email: loginId, password: password) },
            errorHandler: { [weak self] in self?.output?.onError(error: $0) }
        ) { [weak self] in
            self?.output?.onLogin(response: $0)
        }
    }
}
