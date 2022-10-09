//
//  EditNameContract.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/08.
//

import Foundation

protocol EditNameUseCase: BaseUseCase {
    func fetchUser(userId: Int)
    func updateUser(userId: Int, firstName: String?, lastName: String?, age: Int?, gender: GenderType?)
}

protocol EditNameInteractorOutput: BaseInteractorOutput {
    func onFetchUser(user: User)
    func onUpdateUser()
}

protocol EditNamePresentation: BasePresentation {
    func fetchUser()
    
    func updateUser(
        firstName: String?,
        lastName: String?,
        age: Int?,
        gender: GenderType?,
        onComplete: @escaping () -> Void
    )
}
