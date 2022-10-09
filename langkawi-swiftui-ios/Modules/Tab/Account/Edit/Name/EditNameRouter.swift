//
//  EditNameRouter.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/08.
//

import SwiftUI

class EditNameRouter {
    
    static func assemble(isPresented: Binding<Bool>) -> some View {
        let interactor = EditNameInteractor(userAPI: UserAPIImpl())
        let vm = EditNameViewModel(isPresented: isPresented)
        let presenter = EditNamePresenter(vm: vm, interactor: interactor)
        interactor.output = presenter
        return EditNameView(vm: vm, presenter: presenter)
    }
}
