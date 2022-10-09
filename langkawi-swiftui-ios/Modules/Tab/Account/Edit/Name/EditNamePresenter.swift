//
//  EditNamePresenter.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/08.
//

import Foundation

class EditNamePresenter: EditNamePresentation {
    var onUpdateComplete: () -> Void = {}
    
    let vm: EditNameViewModel
    private let interactor: EditNameUseCase
    
    init(vm: EditNameViewModel, interactor: EditNameUseCase) {
        self.vm = vm
        self.interactor = interactor
    }
    
    func fetchUser() {
        guard let userId = LoginManager.getLoginUserId() else {
            return
        }
        self.interactor.fetchUser(userId: userId)
    }
    
    func updateUser(
        firstName: String?,
        lastName: String?,
        age: Int?,
        gender: GenderType?,
        onComplete: @escaping () -> Void
    ) {
        self.onUpdateComplete = onComplete
        self.interactor.updateUser(
            userId: vm.userId,
            firstName: vm.firstName,
            lastName: vm.lastName,
            age: vm.age,
            gender: vm.gender
        )
    }
}

extension EditNamePresenter: EditNameInteractorOutput {
    func onFetchUser(user: User) {
        vm.userId = user.id
        vm.firstName = user.firstName ?? ""
        vm.lastName = user.lastName ?? ""
        vm.age = user.age ?? 0
        vm.gender = user.gender ?? .male
    }
    
    func onUpdateUser() {
        vm.isPresented = false
        self.onUpdateComplete()
    }
    
    func onError(error: Error) {
        vm.onError(error: error)
    }
}
