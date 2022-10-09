//
//  EditNameInteractor.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/08.
//

import Combine

class EditNameInteractor: EditNameUseCase {
    private let userAPI: UserAPI
    unowned var output: EditNameInteractorOutput?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(userAPI: UserAPI) {
        self.userAPI = userAPI
    }
    
    func fetchUser(userId: Int) {
        request(
            requester: { self.userAPI.user(userId: userId)},
            errorHandler: { [weak self] in self?.output?.onError(error: $0) }
        ) { [weak self] in
            self?.output?.onFetchUser(user: $0)
        }?.store(in: &cancellables)
    }
    
    func updateUser(userId: Int, firstName: String?, lastName: String?, age: Int?, gender: GenderType?) {
        request(
            requester: {
                self.userAPI.updateUser(
                    userId: userId,
                    firstName: firstName,
                    lastName: lastName,
                    age: age,
                    gender: gender
                )
            },
            errorHandler: { [weak self] in self?.output?.onError(error: $0) }
        ) { [weak self] _ in
            self?.output?.onUpdateUser()
        }?.store(in: &cancellables)
    }
    
    
}

