//
//  AccountPresenter.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/07.
//

import Combine
import UIKit

class AccountPresenter: AccountPresentation {
    private let vm: AccountViewModel
    private let interactor: AccountInteractor
    
    init(vm: AccountViewModel, interactor: AccountInteractor) {
        self.vm = vm
        self.interactor = interactor
    }
    
    func fetchAccount() {
        interactor.fetchUser(userId: vm.userId)
        interactor.fetchAvator(userId: vm.userId)
    }
    
    func showNameEdit() {
        vm.showNameEdit = true
    }
    
    func showDescriptionEdit() {
        vm.showDescriptionEdit = true
    }
}

extension AccountPresenter: AccountInteractorOutput {
    func onFetchUser(user: User) {
        vm.name = user.toNameLabelText()
        vm.age = user.toAgeLabelText()
        vm.gender = user.gender?.toLabel() ?? ""
        vm.genderColor = user.gender?.toColor() ?? .black
        vm.description = user.detail?.descriptionA ?? ""
    }
    
    func onFetchAvator(image: UIImage) {
        vm.avator = image
    }
    
    func onError(error: Error) {
        vm.onError(error: error)
    }
}
