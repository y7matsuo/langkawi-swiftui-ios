//
//  AccountInteractor.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/07.
//

import Combine

class AccountInteractor: AccountUseCase {
    private let userAPI: UserAPI
    private let imageAPI: ImageAPI
    unowned var output: AccountInteractorOutput?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(userAPI: UserAPI, imageAPI: ImageAPI) {
        self.userAPI = userAPI
        self.imageAPI = imageAPI
    }
    
    func fetchUser(userId: Int) {
        request(
            requester: { userAPI.user(userId: userId) },
            errorHandler: { [weak self] in self?.output?.onError(error: $0) }
        ) { [weak self] in
            self?.output?.onFetchUser(user: $0)
        }?.store(in: &cancellables)
    }
    
    func fetchAvator(userId: Int) {
        request(
            requester: { imageAPI.getUserDetailPictureA(userId: userId) },
            errorHandler: { [weak self] in self?.output?.onError(error: $0) }
        ) { [weak self] in
            self?.output?.onFetchAvator(image: $0)
        }?.store(in: &cancellables)
    }
}
