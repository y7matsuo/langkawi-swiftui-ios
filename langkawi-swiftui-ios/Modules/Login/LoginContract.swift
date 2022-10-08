//
//  LoginContract.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/07.
//

import SwiftUI

protocol LoginUseCase: BaseUseCase {
    func doLogin(loginId: String, password: String)
}

protocol LoginInteractorOutput: BaseInteractorOutput {
    func onLogin(response: LoginResponse)
}

protocol LoginPresentation: BasePresentation {
    func doLogin(loginId: String, password: String)
}
