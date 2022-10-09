//
//  AccountRouter.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/07.
//

import SwiftUI

class AccountRouter {
    
    static func assemble() -> some View {
        let interactor = AccountInteractor(userAPI: UserAPIImpl(), imageAPI: ImageAPIImpl())
        let vm = AccountViewModel()
        let presenter = AccountPresenter(vm: vm, interactor: interactor)
        interactor.output = presenter
        return AccountView(vm: vm, presenter: presenter)
    }
}
